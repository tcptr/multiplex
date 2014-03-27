module mplx.stage;

import thino;
import mplx.frame;
import mplx.background;
import mplx.menu;
import mplx.particle;
import mplx.scoreeffect;
import mplx.field;
import mplx.player;
import mplx.enemy;
import mplx.controller;
import std.random;
import std.range;

enum Mode : int {
  None  = 0,
  Pulse = 1,
}

string mode2name(Mode m) {
  return ["none", "pulse"][m];
}

struct Rule {
  Mode mode;
  bool canShot;
  int defaultPlayerLife;
  int defaultPlayerBomb;
  int levelBreakBonusLife;
  int levelBreakBonusBomb;
  int levelBreak;
  Vec2 fieldSize;
  EnemyEmitter function(Stage, Frame) emitterFactory;
  void function(Frame, int) themeReflector;
}

struct PosDirection {
  Vec2 pos;
  float direction;
}

abstract class EnemyEmitter {
  abstract void clear();
  abstract void setLevel(int level);
  abstract void emit();
}

class Stage : FrameScene {
  private:
  enum PauseFrame = [0,150,0, 250,150,0, 250,0,0, 0,0,0];
  enum EnemyEmitRange = 160f;

  immutable uint _seed;
  immutable int _beginLevel;

  Input _input;
  Mt19937 _randomGen;

  Rule _rule;
  Particle _particle;
  Field _field;
  Player _player;
  ScoreEffect _scoreEffect;
  EnemyManager _enemy;
  EnemyEmitter _emitter;
  ButtonGroup _pauseBg;

  bool _gameover;
  int _level;
  int _score;

  bool _sphere, _gear, _turtle, _missile, _shuriken, _gate, _connect;
  string _result;

  public:
  mixin(AttrReader(
      "rule", "particle", "field", "player", "enemy", "input", "gameover"));

  this(Frame f, Input input, uint seed, int beginLevel, Rule rule) {
    _input = input;
    _seed = seed;
    _randomGen.seed(seed);

    _rule = rule;
    _beginLevel = beginLevel;

    super(f);
  }

  void quit() {
    import mplx.top;
    nextScene(new TopScene(frame));
  }

  override void init() {
    _particle = new Particle;
    _field = new Field(frame, _rule.fieldSize);
    _player = new Player(
        frame, _rule.canShot, _rule.defaultPlayerLife, _rule.defaultPlayerBomb);
    _enemy = new EnemyManager(frame);
    _emitter = _rule.emitterFactory(this, frame);
    _scoreEffect = new ScoreEffect(frame);

    setLevel(_beginLevel);

    enum ButtonSize = Vec2(75, 25);
    _pauseBg = new ButtonGroup(frame, frame.font, 0.5, Luna);
    _pauseBg.push({}, [
      new Button(_pauseBg, Vec2(160, 70), ButtonSize, "resume", {
        pause = false;
        Sound().resumeAll();
      }, Button.Align.Right),
      new Button(_pauseBg, Vec2(160, 100), ButtonSize, "exit", {
        pause = false;
        Sound().stopAll();
        splashLock(&quit);
      }, Button.Align.Right),
    ]);
  }

  override void move() {
    if (_gameover) {
      if (frame.controller.select) {
        splashLock(&quit);
      }

    } else {
      if (frame.controller.pause) {
        pause = !pause;
        _pauseBg.moveFocus(0);

        if (pause) {
          Sound().pauseAll();
        } else {
          Sound().resumeAll();
        }

        frame.audio.playSE("select");
      }

      if (pause) {
        _pauseBg.move(frame, frame.size/2 - Vector2!int(125));
        return;
      }

      if (_player.state == Player.State.Normal) {
        _sphere = _gear = _turtle = _missile = _shuriken = _gate = _connect = false;
        _emitter.emit();

        if (_sphere) frame.audio.playSE("enemySphere");
        if (_gear) frame.audio.playSE("enemyGear");
        if (_turtle) frame.audio.playSE("enemyTurtle");
        if (_missile) frame.audio.playSE("enemyMissile");
        if (_shuriken) frame.audio.playSE("enemyShuriken");
        if (_gate) frame.audio.playSE("enemyGate");
        if (_connect) frame.audio.playSE("enemyConnect");
      }

      _input.update(frame);
    }

    _field.update();

    _particle.move(this, frame);
    _player.move(this, frame);
    _enemy.move(this, frame);
    _scoreEffect.move(this, frame);

    frame.camera = _player.pos*0.6;
  }

  override void draw() {
    if (splashLocked) return;

    _field.draw(this, frame);

    clearBuffer(BufferMask.Depth);
    frame.entityRenderer.attach(frame, {
      _enemy.draw(this, frame);
      _player.draw(this, frame);
    });

    _particle.draw(this, frame);
    _scoreEffect.draw(this, frame);
  }

  override void drawWrap() {
    if (_gameover) {
      if (splashLocked) return;

      lineWidth(1.0);
      frame.font.drawString(frame.fixedMatrix,
          Vec2(frame.size.x/2-270, frame.size.y/2-140),
          1.0, frame.baseColor, _result);
      return;
    }

    string keys = text(mode2name(_rule.mode), "\nscore\nlife\nbomb");
    string values = text(
        _level, "\n", commaSeparate(_score), "\n",
        repeat('*', _player.life), "\n",
        repeat('*', _player.bomb), "\n");

    frame.font.drawString(frame.fixedMatrix,
        Vec2(50, 10), 0.75, frame.baseColor, keys);
    frame.font.drawString(frame.fixedMatrix,
        Vec2(120, 10), 0.75, frame.baseColor, values);

    if (pause) {
      blendFunc(BlendMode.Normal);
      Mat4 t = frame.fixedMatrix
          .dotTranslate(Vec3(frame.size.x/2-125, frame.size.y/2-125, 0));
      Primitive().drawQuad(t, Black, PauseFrame);
      Primitive().draw(t, Luna, PauseFrame, DrawMode.LineLoop);
      _pauseBg.draw(t);
      frame.font.drawString(t, Vec2(20), 1.0, Luna, "pause");
    }
  }

  override void fini() {
  }

  void addScore(int t, Vec2 pos, Vec4 color) {
    if (t == 0) return;
    int score = t * ((_level + 1) ^^ 2);
    _score += score;
    _scoreEffect.addLabel(score, pos + Vec2(-25, 15), color);
  }

  void playerHit() {
    _gameover = player.damage(this, frame);

    if (_gameover) {
      frame.audio.stopBGM();

      LoggerInput log = cast(LoggerInput)_input;

      if (log) {
        import mplx.replay;
        saveBasicReplay(_rule.mode, _score, _beginLevel, _seed, log.data);
      }

      string modeName = mode2name(_rule.mode);

      _result = text(
          modeName, " ", _level, "\n"
          "score ", commaSeparate(_score), "\n");

      if (cast(ControllerInput)_input) {
        int level = frame.config.get!int(modeName);
        if (_level / 5 > level) {
          frame.config.set(modeName, _level / 5);
          frame.config.save();
          _result ~= text(
              "congratulations! ", modeName, " ", (_level / 5) * 5, " has unlocked");
        }
      }
    }
  }

  void levelUp() {
    _emitter.clear();
    _enemy.stageClear(this, frame);

    frame.audio.playSE("clear");

    frame.background.fadeOut({
      setLevel(_level + 1);

      if (_level % _rule.levelBreak == 0) {
        _player.levelBreakBonus(
            _rule.levelBreakBonusLife, _rule.levelBreakBonusBomb);
      }
    });
  }

  void setLevel(int level) {
    _level = level;
    _rule.themeReflector(frame, _level);
    _emitter.setLevel(level);
    frame.label.fade(text(mode2name(_rule.mode), " ", _level));
  }

  double rand(double a, double b) {
    return uniform(a, b, _randomGen);
  }

  int rand(int a) {
    return uniform(0, a, _randomGen);
  }

  double rand() {
    return uniform(0.0, 1.0, _randomGen);
  }

  Vec2 randPos() {
    Vec2 pos;
    do {
      pos = Vec2(rand(-field.size.x, field.size.x),
                 rand(-field.size.y, field.size.y)) / 2;
    } while ((pos - player.pos).length < EnemyEmitRange);
    return pos;
  }

  auto surround(Vec2 base, int num, int col, float min, float max) {
    int row = num / col;
    float step = (max - min) / ((col == 1) ? 2 : col - 1);
    float shift = PI / row;

    return (int delegate(ref PosDirection) dg) {
      int result;
      PosDirection arg;

      foreach (int i; 0..num) {
        float r = PI*2 / row * (i%row);
        float len = min + step * (i/row);
        if ((i/row)%2 == 1) r += shift;

        Vec2 pos = base + Vec2(cos(r), sin(r)) * len;
        field.clamp(pos);

        arg.pos = pos;
        arg.direction = r;
        result = dg(arg);
        if (result) break;
      }

      return result;
    };
  }

  // 0=left, 1=top, 2=right, 3=bottom
  auto wall(int k) {
    float direction = k*PI/2;
    Vec2 base = field.size / Vec2(k == 2 ? 2 : -2, k == 3 ? 2 : -2);
    Vec2 span = k % 2 ? Vec2(field.tileStep.x, 0) : Vec2(0, field.tileStep.y);
    float count = k % 2 ? field.tileCount.x : field.tileCount.y;

    return (int delegate(ref PosDirection) dg) {
      int result;
      PosDirection arg;
      arg.direction = direction;

      foreach (s; 0..count) {
        arg.pos = base + span*s;
        result = dg(arg);
        if (result) break;
      }

      return result;
    };
  }

  void addSphere(T...)(T args) {
    _sphere = true;
    _enemy.sphere.add(this, args);
  }

  void addGear(T...)(T args) {
    _gear = true;
    _enemy.gear.add(this, args);
  }

  void addTurtle(T...)(T args) {
    _turtle = true;
    _enemy.turtle.add(this, args);
  }

  void addMissile(T...)(T args) {
    _missile = true;
    _enemy.missile.add(this, args);
  }

  void addShuriken(T...)(T args) {
    _shuriken = true;
    _enemy.shuriken.add(this, args);
  }

  void addGate(T...)(T args) {
    _gate = true;
    _enemy.gate.add(this, args);
  }

  void addConnect(T...)(T args) {
    _connect = true;
    _enemy.connect.add(this, args);
  }
}


