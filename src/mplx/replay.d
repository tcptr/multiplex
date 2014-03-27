module mplx.replay;

import thino;
import mplx.frame;
import mplx.menu;
import mplx.background;
import mplx.controller;
import mplx.stage;
import std.stdio, std.file, std.path;
import std.range;
import std.datetime;
import std.conv;
import zlib = std.zlib;

// リプレイのフォーマット
// long : timestamp
// Mode : mode
// int  : level
// int  : score
// uint : seed
// uint : data length
// .... : input data

immutable string ReplayDir = "replay";

struct ReplayInfo {
  string filename;
  int score;
  int level;
  Mode mode;
  long timestamp;

  T opCast(T)() const if (is(T == bool)) {
    return mode != Mode.None;
  }

  int opCmp(ref const ReplayInfo b) const {
    // reverse
    return b.score - score;
  }
}

struct ReplayDetail {
  Mode mode;
  int level;
  uint seed;
  byte[5][] data;
}

struct ReplayReader {
  private:
  string _filename;
  File _fh;

  public:
  this(string filename) {
    _filename = filename;
    _fh = File(filename, "rb");
  }

  T read(T)() {
    T[1] tmp;
    _fh.rawRead(tmp);
    return tmp[0];
  }

  ReplayInfo getReplayInfo() {
    ReplayInfo result;

    try {
      result.filename = _filename;
      result.timestamp = read!long;
      result.mode = read!Mode;
      result.level = read!int;
      result.score = read!int;

    } catch (Exception e) {
      result.mode = Mode.None;
    }

    return result;
  }

  ReplayDetail getReplayDetail() {
    ReplayDetail result;

    try {
      read!long;                     // timestamp (skip)
      result.mode = read!Mode; // mode
      result.level = read!int;       // level
      read!int;                      // score (skip)
      result.seed = read!uint;       // seed

      uint len = read!uint;

      void[] compressed = new void[len];
      _fh.rawRead(compressed);

      result.data = cast(byte[5][])zlib.uncompress(compressed);

    } catch (Exception e) {
      result.mode = Mode.None;
    }

    return result;
  }
}

void saveBasicReplay(Mode mode, int score, int level, uint seed, in byte[5][] data) {
  if (!exists(ReplayDir))
    mkdirRecurse(ReplayDir);

  long timestamp = Clock.currStdTime();
  const(void)[] compressed = zlib.compress(data, 9);

  auto fh = File(buildPath(ReplayDir, to!string(timestamp)), "wb");
  fh.rawWrite([timestamp]);
  fh.rawWrite([cast(int)mode]);
  fh.rawWrite([level]);
  fh.rawWrite([score]);
  fh.rawWrite([seed]);
  fh.rawWrite([cast(uint)compressed.length]);
  fh.rawWrite(compressed);
}

class ReplayScene : FrameScene {
  this(Frame f) {
    super(f);
  }

  private:
  ReplayInfo[][Mode] _info;
  string _mode;
  ButtonGroup _bg;

  // メニューのフォーカス位置用情報
  struct MenuInfo {
    int upPos, downPos, mainPos;
  }

  MenuInfo pushRanking(Mode key, int offset) {
    MenuInfo result;

    ReplayInfo[] replays = _info[key];
    Button[] buttons;

    buttons ~= new ButtonLine(_bg, Vec2(180, 220), Vec2(50, 50), "*", {
      _bg.pop();
    });

    if (offset > 0) {
      result.upPos = cast(int)buttons.length;
      buttons ~= new ButtonLine(_bg, Vec2(180, 190), Vec2(50, 30), "↑", {
        _bg.pop();
        offset -= 10;
        if (offset < 0) offset = 0;
        int upPos = pushRanking(key, offset).upPos;
        _bg.moveFocus(upPos);
      });
    }


    if (replays.length - offset > 10) {
      result.downPos = cast(int)buttons.length;
      buttons ~= new ButtonLine(_bg, Vec2(180, 270), Vec2(50, 30), "↓", {
        _bg.pop();
        offset += 10;
        if (offset >= replays.length - 10) offset = cast(int)replays.length - 10;
        int downPos = pushRanking(key, offset).downPos;
        _bg.moveFocus(downPos);
      });
    }

    if (offset < replays.length) {
      result.mainPos = cast(int)buttons.length;

      int k = offset;
      Vec2 pos = Vec2(245, 60);
      foreach (info; replays[offset..$].take(10)) {
        buttons ~= rankingButton(k+1, info, pos);
        ++k;
        pos += Vec2(0, 40);
      }
    }

    _bg.push({ _bg.pop(); }, buttons);
    return result;
  }

  void quit() {
    splashLock({
      import mplx.top;
      nextScene(new TopScene(frame));
    });
  }

  Button rankingButton(int rank, ReplayInfo info, Vec2 pos) {
    enum sep = "                                   ";

    string t = text(" * ", rank, " - ", commaSeparate(info.score));

    t ~= sep[0..35-t.length];
    t ~=  SysTime(info.timestamp).toString()[0..$-8];

    return new ButtonLine(_bg, pos, Vec2(525, 40),
        t, { runReplay(info); }, Button.Align.Left);
  }

  void runReplay(ReplayInfo info) {
    auto detail = ReplayReader(info.filename).getReplayDetail();
    Input input = new ReplayInput(detail.data);

    final switch (detail.mode) {
    case Mode.None:
      // TODO 何か出す
      break;

    case Mode.Pulse:
      frame.audio.stopBGM(false);
      splashLock({
        import mplx.mode.pulse;
        nextScene(new Stage(frame, input, detail.seed, detail.level, PulseRule));
      });
      break;
    }
  }

  protected:
  override void init() {
    if (!exists(ReplayDir))
      mkdirRecurse(ReplayDir);

    frame.camera = Vec2(0);
    frame.theme = Theme.History;
    frame.background.mode = Background.Mode.Flow;

    _bg = new ButtonGroup(frame, frame.font, 0.75, Silver);
    _bg.push(&quit, [
      new ButtonLine(_bg, Vec2(90, 90), Vec2(80, 80), "pulse", {
        int mainPos = pushRanking(Mode.Pulse, 0).mainPos;
        _bg.moveFocus(mainPos);
      }),
      new ButtonLine(_bg, Vec2(90, 170), Vec2(80, 80),
          "*", &quit),
    ]);

    _info[Mode.Pulse] = [];

    foreach (string filename; dirEntries(ReplayDir, SpanMode.shallow)) {
      auto data = ReplayReader(filename).getReplayInfo();
      if (!data) continue;
      _info[data.mode] ~= data;
    }

    foreach (ref v; _info) v.sort;
  }

  override void fini() {
  }

  override void move() {
    _bg.move(frame);
  }

  override void draw() {
    if (splashLocked) return;
    _bg.draw(frame.fixedMatrix);
  }
}

