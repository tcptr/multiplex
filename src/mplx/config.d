module mplx.config;

import thino;
import std.process;
import mplx.frame;
import mplx.menu;
import mplx.controller;
import std.conv : to;
import std.range : iota, chain;
import std.array : array, empty;
import std.algorithm : filter, find;

// TODO : だいぶ辛い. 次回はGUIを分離か自動配置
private immutable {
  float StickR = 60;
  float[] ConfigFrame = [30.5,30.5,0, 700.5,30.5,0,700.5,420.5,0, 30.5,420.5,0];
  float[] MoveFrame =
      [240,170,0, 240+StickR*2,170,0, 240+StickR*2,170+StickR*2,0, 240,170+StickR*2,0];
  float[] ShotFrame =
      [460,170,0, 460+StickR*2,170,0, 460+StickR*2,170+StickR*2,0, 460,170+StickR*2,0];

  Vec2 MoveCenter = Vec2(MoveFrame[0] + StickR, MoveFrame[1] + StickR);
  Vec2 ShotCenter = Vec2(ShotFrame[0] + StickR, ShotFrame[1] + StickR);

  Vec2 ButtonSize = Vec2(120, 25);
  Vec2 MButtonSize = Vec2(50, 20);
  Vec2 RButtonSize = Vec2(20, 20);
  Vec2 SliderSize = Vec2(20, 15);
  Vec2 InfoPos = Vec2(180, 375);
}

class ConfigScene : FrameScene {
  this(Frame f) {
    super(f);
  }

  private:
  ButtonGroup _bg;

  string _message;
  int _count;

  void notice(string t = "ジョイスティックを接続してください") {
    _message = t;
    _count = 180;
  }

  const(T) get(T)(string key) const {
    if (frame.controller.config.has(key)) {
      return frame.controller.config.get!T(key);
    } else {
      return frame.config.get!T(key);
    }
  }

  void set(T)(string key, in T v) {
    if (frame.controller.config.has(key)) {
      frame.controller.config.set(key, v);
      frame.controller.reload();
    } else {
      frame.config.set(key, v);
    }
  }

  Button[] stickButtons(string prefix, Vec2 pos) {
    Button axisButton(string name, Vec2 pos) {
      return new ButtonLine(_bg, pos, MButtonSize, name, {
        Vec2 pos = InfoPos +
            Vec2(SliderSize.x*(2+Joystick.numButtons(frame.controller.id)), 0);
        int size = Joystick.numAxes(frame.controller.id);

        if (size == 0) {
          notice();
        } else {
          notice("対応させる軸を選んでください");
          _bg.pushSelector(&_bg.pop, pos, SliderSize, iota(size).array(),
              (int k) { set(name, k); }, get!int(name));
        }
      });
    }

    Button reverseButton(string name, Vec2 pos) {
      bool current = get!bool(name);
      Button btn;

      string view() {
        return current ? "R" : "";
      }

      btn = new ButtonLine(_bg, pos, RButtonSize, view(), {
        current = !current;
        set(name, current);
        btn.text = view();
      });
      return btn;
    }

    return [
      axisButton(prefix ~ " y",
          pos + Vec2(StickR - MButtonSize.x/2, 0)),
      reverseButton( prefix ~ " y reverse",
          pos + Vec2(StickR + MButtonSize.x/2, 0)),
      axisButton(prefix ~ " x",
          pos + Vec2(StickR*2, MButtonSize.y/2 + StickR)),
      reverseButton(prefix ~ " x reverse",
          pos + Vec2(StickR*2 + MButtonSize.x, MButtonSize.y/2 + StickR)),
    ];
  }

  Button button(string name, Vec2 pos, void delegate() f) {
    return new ButtonLine(_bg, pos, ButtonSize, name, f);
  }

  Button buttonButton(string name, Vec2 pos) {
    return new ButtonLine(_bg, pos, ButtonSize, name ~ " button", {
      Vec2 pos = InfoPos;

      int numButtons = Joystick.numButtons(frame.controller.id),
          numAxes = Joystick.numAxes(frame.controller.id);

      if (numButtons == 0 && numAxes == 0) {
        notice();
        return;
      }

      notice("対応させるボタンを選んでください。");

      auto current = get!ButtonInfo(name);

      auto buttons = iota(numButtons).map!((int k) {
        pos += Vec2(SliderSize.x, 0);
        return new Button(_bg, pos, SliderSize, to!string(k), {
          set!ButtonInfo(name, [k]);
          _bg.pop();
        });
      });

      auto axes = iota(numAxes).map!((int k) {
        pos += Vec2(SliderSize.x, 0);
        Vec2 _pos = pos + Vec2(SliderSize.x, 0);

        Button buttonGen(int a, int b, Vec2 pos, Vec2 size) {
          return new ButtonLine(_bg, pos, size, "", {
            set!ButtonInfo(name, [k, a, b]);
            _bg.pop();
            _bg.pop();
          });
        }

        return new Button(_bg, _pos, SliderSize, to!string(k), {
          _bg.push(&_bg.pop, [
            buttonGen(-101,   30, _pos + Vec2(-20+SliderSize.x/2,-70), Vec2(15, 40)),
            buttonGen(  60,  101, _pos + Vec2(-20+SliderSize.x/2,-30), Vec2(15, 20)),
            buttonGen(-101,  -60, _pos + Vec2(5+SliderSize.x/2,-70), Vec2(15, 20)),
            buttonGen( -30,  101, _pos + Vec2(5+SliderSize.x/2,-50), Vec2(15, 40)),
          ]);
        });
      });

      int currentPos = (current.length == 1 ? 0 : numButtons) + current[0];
      _bg.push(&_bg.pop, chain(buttons, axes).array(), currentPos);
    });
  }

  void quit() {
    import mplx.top;
    nextScene(new TopScene(frame));
  }

  protected:
  override void init() {
    _bg = new ButtonGroup(frame, frame.font, 0.5, frame.baseColor);

    _bg.push(&quit, [
      button("volume", Vec2(50, 50), {
        _bg.push(&_bg.pop, [

          button("BGM", Vec2(180, 50), {
            _bg.pushSelector(
                &_bg.pop, Vec2(310, 50), SliderSize, iota(11).array(), (int v) {
              frame.config.set("bgm gain", v);
              frame.audio.bgmGain = v;
            }, get!int("bgm gain"));
          }),

          button("SoundEffect", Vec2(180, 75), {
            _bg.pushSelector(
                &_bg.pop, Vec2(310, 75), SliderSize, iota(11).array(), (int v) {
              frame.config.set("se gain", v);
              frame.audio.seGain = v;
            }, get!int("se gain"));
          }),

          button("...", Vec2(180, 100), &_bg.pop)

        ]);
      }),

      button("joystick", Vec2(50, 75), {
        auto targets = Joystick.list.filter!(Joystick.canUse);
        auto t = targets.find!(id => id == frame.controller.id);
        Vec2 base = Vec2(180, 75);

        if (t.empty) {
          notice();
          return;
        }

        _bg.pushSelector(&_bg.pop, base, SliderSize,
            targets.array(), (JoystickID id) {
          frame.config.set("joystick", id);
          frame.controller.id = id;
        }, t.front);
      }),

      button("glow strength", Vec2(50, 100), {
        _bg.pushSelector(
            &_bg.pop, Vec2(180, 100), SliderSize, iota(11).array(), (int v) {
          frame.config.set("glow", v);
          frame.glowStrength = v;
        }, get!int("glow"));
      }),

      button("screen resolution", Vec2(50, 125), {
        string current = get!string("screen resolution");
        int currentPos = 0;
        foreach (int i, v; ScreenResolutions) {
          if (v == current) {
            currentPos = i;
            break;
          }
        }

        _bg.pushSelector(
            &_bg.pop, Vec2(180, 125), Vec2(80, SliderSize.y), ScreenResolutions, (string v) {
          frame.config.set("screen resolution", v);
          notice("有効にするにはゲームを再起動する必要があります");
        }, currentPos);
      }),

      button("fullscreen", Vec2(50, 150), {
        _bg.pushSelector(
            &_bg.pop, Vec2(180, 150), Vec2(30, SliderSize.y), ["on", "off"], (string v) {
          frame.config.set("fullscreen", v == "on");
          notice("有効にするにはゲームを再起動する必要があります");
        }, get!bool("fullscreen") ? 0 : 1);
      }),

      button("back", Vec2(50, 325), &quit),

      buttonButton("select", Vec2(50, 200)),
      buttonButton("cancel", Vec2(50, 225)),
      buttonButton("pause", Vec2(50, 250)),
      buttonButton("trigger", Vec2(50, 275)),

      new ButtonLine(_bg, Vec2(660, 380), Vec2(35, 35),
        "?", { browse("http://tcptr.github.io/multiplex_config"); }),
    ] ~ stickButtons("move", Vec2(MoveFrame[0], MoveFrame[1] - MButtonSize.y))
      ~ stickButtons("shot", Vec2(ShotFrame[0], ShotFrame[1] - MButtonSize.y))
    );
  }

  override void fini() {
    frame.config.save();
    if (frame.controller.canUse) frame.controller.config.save();
  }

  override void move() {
    _bg.move(frame);
    if (_count > 0) --_count;

    frame.camera = frame.camera*0.97 + Vec2(-100,0)*0.03;
  }

  override void draw() {
    blendFunc(BlendMode.Normal);
    lineWidth(1.0);

    auto move = frame.controller.move;
    auto shot = frame.controller.shot;

    Primitive().drawQuad(frame.fixedMatrix, Black, ConfigFrame);
    Primitive().draw(frame.fixedMatrix, frame.baseColor, ConfigFrame, DrawMode.LineLoop);
    Primitive().draw(frame.fixedMatrix, frame.baseColor, MoveFrame, DrawMode.LineLoop);
    Primitive().draw(frame.fixedMatrix, frame.baseColor, ShotFrame, DrawMode.LineLoop);
    Primitive().draw(frame.fixedMatrix, frame.baseColor, [
      MoveCenter.x, MoveCenter.y, 0,
      MoveCenter.x + StickR*cos(move.rad)*move.len,
      MoveCenter.y - StickR*sin(move.rad)*move.len, 0,
      ShotCenter.x, ShotCenter.y, 0,
      ShotCenter.x + StickR*cos(shot.rad)*shot.len,
      ShotCenter.y - StickR*sin(shot.rad)*shot.len, 0,
    ], DrawMode.Lines);

    if (frame.controller.canUse) drawJoystick();
    _bg.draw(frame.fixedMatrix);

    if (_count > 0)
      frame.font.drawString(frame.fixedMatrix, Vec2(190, 310), 0.4,
          frame.baseColor.rgb ~ _count/120.0, _message);
  }

  void drawJoystick() {
    Vec2 pos = InfoPos - Vec2(0, 40);
    foreach (v; Joystick.buttons(frame.controller.id)) {
      pos += Vec2(SliderSize.x, 0);

      immutable float[] Vertex = [pos.x, pos.y, 0, pos.x+SliderSize.x, pos.y, 0,
           pos.x+SliderSize.x, pos.y+SliderSize.y, 0, pos.x, pos.y+SliderSize.y, 0];

      if (v)
        Primitive().drawQuad(frame.fixedMatrix, frame.baseColor, Vertex);
      Primitive().draw(frame.fixedMatrix, frame.baseColor, Vertex, DrawMode.LineLoop);
    }

    pos += Vec2(SliderSize.x, 0);

    foreach (v; Joystick.axes(frame.controller.id)) {
      pos += Vec2(SliderSize.x, 0);

      Primitive().drawRect(frame.fixedMatrix, frame.baseColor,
          pos + Vec2(SliderSize.x*0.2, v*20 - SliderSize.y*0.15),
              SliderSize*Vec2(0.6, 0.3));
    }

    auto ls = ["select", "cancel", "pause", "trigger"].map!(x => get!ButtonInfo(x));

    pos = Vec2(70 + ButtonSize.x, 175);

    foreach (v; ls) {
      pos += Vec2(0, ButtonSize.y);
      if (!buttonPressed(frame.controller.id, v)) continue;
      Primitive().drawRect(frame.fixedMatrix, frame.baseColor, pos, Vec2(10, ButtonSize.y));
    }
  }
}

