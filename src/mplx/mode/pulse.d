module mplx.mode.pulse;

import thino;
import mplx.frame;
import mplx.stage;
import mplx.background;
import std.conv;
import std.random;

enum PulseRule = Rule(
    Mode.Pulse,
    true,
    3, 3,
    0, 0,
    5,
    Vec2(640, 400),
    (Stage stage, Frame frame) => new EnemyEmitterPulse(stage, frame),
    (Frame frame, int level) {
      int rank = min(level / 5, 2);
      frame.audio.playBGM(text("pulse", rank));
      frame.theme = cast(Theme)rank;

      if (level == 0) {
        frame.background.mode = Background.Mode.None;
      } else if (level < 10) {
        frame.background.mode = randomSample(Background.BasicModes, 1).front;
      } else {
        frame.background.mode = Background.Mode.Fear;
      }
    });


class EnemyEmitterPulse : EnemyEmitter {
  private:
  Stage stage;
  Frame frame;
  int _level, _subLevel;
  void delegate() _state;

  public:
  this(Stage stage, Frame frame) {
    this.stage = stage;
    this.frame = frame;
  }

  override void clear() {
    _state = stateClear();
  }

  override void setLevel(int level) {
    _level = level;
    _subLevel = 0;
    _state = null;
  }

  override void emit() {
    if (!_state) initState();
    _state();
  }

  private:
  void clearSubLevel() {
    ++_subLevel;
    _state = null;
  }

  void initState() {
    switch (_subLevel) {
    case 0:
      _state = stateWait(120);
      break;

    case 1: case 3: case 5:
      _state = stateRandom();
      break;

    case 2: case 4:
      double r = stage.rand();
      _state =
          (r < 0.28) ? stateCorner() :
          (r < 0.56) ? stateWall() :
          (r < 0.84) ? stateBoost() : stateSurround();
      break;

    default:
      stage.levelUp();
    }
  }

  void delegate() stateWait(int count) {
    int i;

    return {
      if (++i > count) clearSubLevel();
    };
  }

  void delegate() stateClear() {
    return {};
  }

  void delegate() stateRandom() {
    int step =
        (_level <  5) ? 72 - _level*10 :
        (_level <  7) ? 21 :
        (_level < 10) ? 17 :
        (_level < 12) ? 16 :
        (_level < 14) ? 15 :
        (_level < 17) ? 14 : 13;
    int limit =
        (_subLevel == 5) ? 900 :
        (_level < 4) ? 500 : 400;
    int num =
        (_level <  2) ? 3 :
        (_level <  3) ? 4 :
        (_level <  5) ? 5 :
        (_level <  7) ? 6 :
        (_level < 23) ? 5 : 6;
    int c;

    return {
      ++c;

      if (c > limit) {
        clearSubLevel();
        return;
      }

      if (c == 840 || c == 780 || c == 720 || c == 660 || c == 600)
        frame.audio.playSE("tick");

      if (c % step != 0) return;

      double r = stage.rand();

      // 低確率で壁からMissileの壁発生
      if (r < _level * 0.0025) {
        int k = stage.rand(4);
        foreach (d; stage.wall(k))
          stage.addMissile(d.pos, d.direction);
      }

      foreach (_; 0..num) {
        Vec2 pos = stage.randPos();
        r = stage.rand();

        if (r < 0.16) stage.addSphere(pos);
        else if (r < 0.47) stage.addGear(pos);
        else if (r < 0.67) stage.addTurtle(pos);
        else if (r < 0.79) stage.addShuriken(pos);
        else if (r < 0.986) stage.addMissile(pos);
        else if (r < 0.993) stage.addGate(pos);
        else stage.addConnect(pos);
      }
    };
  }

  void delegate() stateCorner() {
    double r = stage.rand();

    int step = (r < 0.15) ? 30 : 10;
    int limit = 250 + _level*step*2;

    void delegate(Vec2) add =
        (r < 0.15) ? &stage.addShuriken!Vec2 :
        (r < 0.5) ? &stage.addTurtle!Vec2 : &stage.addGear!Vec2;
    int gearNum =
        (_level < 5) ? 0 :
        (_level < 10) ? 3 : 2+_level/5;
    int turtleNum =
        (_level < 5) ? 0 :
        (_level < 18) ? 2 : 3;
    int shurikenNum = (_level < 10) ? 0 : 1;

    int c;

    return {
      ++c;

      if (c > limit) {
        clearSubLevel();
        return;
      }

      if (c % step == 5) {
        Vec2 point = stage.field.size / 2;
        add(Vec2( point.x,  point.y));
        add(Vec2(-point.x,  point.y));
        add(Vec2(-point.x, -point.y));
        add(Vec2( point.x, -point.y));
      }

      if (c%30 == 0)
        foreach (_; 0..gearNum)
          stage.addGear(stage.randPos());

      if (c%30 == 10)
        foreach (_; 0..turtleNum)
          stage.addTurtle(stage.randPos());

      if (c%30 == 20)
        foreach (_; 0..shurikenNum)
          stage.addShuriken(stage.randPos());
    };
  }

  void delegate() stateWall() {
    int c;
    double r = stage.rand();

    if (r < 0.2) {
      int limit = 120 + (_level / 5) * 20;

      return {
        ++c;

        if (c > limit) {
          clearSubLevel();
          return;
        }

        if (c % 20 == 10 && c > 80) {
          int k = stage.rand(4);
          foreach (d; stage.wall(k))
            stage.addMissile(d.pos, d.direction);
        }
      };
    }

    void delegate(Vec2) add = (r < 0.6) ? &stage.addGear!Vec2 : &stage.addTurtle!Vec2;
    int limit = (_level < 10) ? 110 : 130;
    int[] walls = (_level < 5) ? [[0,2], [1,3]][stage.rand(2)] : [0,1,2,3];

    return {
      ++c;

      if (c > limit) {
        clearSubLevel();
        return;
      }

      if (c == 100 || c == 120) {
        foreach (k; walls) {
          foreach (d; stage.wall(k))
            add(d.pos);
        }
      }
    };
  }

  void delegate() stateBoost() {
    int step =
        (_level < 5) ? 20 :
        (_level < 8) ? 15 :
        (_level < 10) ? 10 : 8;
    int limit = step * (5+_level/2) + 80;
    int num = _level < 10 ? 10 : 6 + _level/2;
    int c;

    return {
      ++c;

      if (c > limit) {
        clearSubLevel();
        return;
      }

      if (c % step != 0 || c > limit - 80) return;

      double r = stage.rand();

      foreach (_; 0..num) {
        Vec2 pos = stage.randPos();
        r = stage.rand();

        if (r < 0.3) stage.addGear(pos);
        else if (r < 0.5) stage.addTurtle(pos);
        else if (r < 0.65) stage.addShuriken(pos);
        else stage.addMissile(pos);
      }
    };
  }

  void delegate() stateSurround() {
    int limit = 250 + (_level/5)*50;
    int c;
    double r = stage.rand();

    void delegate() add =
        (r < 0.25) ? {
      foreach (d; stage.surround(stage.player.pos, 64, 2, 160, 200))
        stage.addMissile(d.pos, d.direction - PI);
    } : (r < 0.35) ? {
      foreach (d; stage.surround(stage.player.pos, 90, 3, 160, 220))
        stage.addSphere(d.pos);
    } : (r < 0.65) ? {
      foreach (d; stage.surround(stage.player.pos, 64, 2, 160, 190))
        stage.addGear(d.pos);
    } : (r < 0.85) ? {
      foreach (d; stage.surround(stage.player.pos, 48, 2, 160, 190))
        stage.addTurtle(d.pos);
    } : {
      foreach (d; stage.surround(stage.player.pos, 45, 3, 160, 190))
        stage.addShuriken(d.pos);
    };

    return {
      ++c;

      if (c > limit) {
        clearSubLevel();
        return;
      }

      if (c % 40 != 5 || c/40 > _level/10) return;
      add();
    };
  }
}

