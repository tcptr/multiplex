module mplx.player;

import thino;
import mplx.frame;
import mplx.stage;
import mplx.graph;
import mplx.model;
import std.random;

private struct Tail {
  Vec2 pos = Vec2(0);
  Vec2 vec = Vec2(0);
}

struct Shot {
  Vec2 pos, vec;
  float rad;
}

class Player {
  private:

  enum State {
    Normal,
    Damage,
    Reborn,
  }

  enum DamageCount = 110;
  enum RebornCount = 80;

  Tail[] _tails;
  EntityRenderer.Binder _binder;
  Model _model;

  State _state = State.Reborn;
  Vec2 _pos = Vec2(0);
  Vec2 _vec = Vec2(0);
  float _rad = PI/2*3;
  int _count;
  int _life;
  bool _canShot;
  Pool!Shot _shots;
  int _shotDelay;
  int _bomb;
  int _bombDelay;

  public:
  mixin(AttrReader("pos", "state", "shots", "life", "bomb"));
  mixin(AttrWriter("pos", "state"));

  this(Frame frame, bool canShot, int life, int bomb) {
    _binder = frame.entityRenderer.createBinder();
    _model = playerModel(_binder.position, _binder.texCoord);
    _tails = new Tail[20];

    _canShot = canShot;
    _life = life;
    _bomb = bomb;
  }

  void move(Stage stage, Frame frame) {
    ++_count;

    final switch (_state) {
    case State.Normal:
      if (!stage.gameover)
        movePlayer(stage, frame);
      break;

    case State.Damage:
      if (_count == DamageCount) {
        stage.enemy.playerDead(stage, frame);
        if (stage.gameover) {
          _state = State.Normal;
        } else {
          _state = State.Reborn;
          frame.audio.playSE("reborn");
        }
        _count = 0;
      }
      break;

    case State.Reborn:
      float len = 15+(1.0 - cast(float)_count/DamageCount)^^6*400;
      stage.field.circleEffect(_pos, frame.mainColor, len);

      if (_count < DamageCount/2) {
        foreach (_; 0..40) {
          float r = uniform(-PI, PI);
          stage.particle.add(
              (_pos + Vec2(cos(r), sin(r))*len) ~ 0, frame.mainColor, 1, 8, r-PI, PI/4);
        }
      }

      if (_count == DamageCount) {
        _vec = Vec2(0);
        _state = State.Normal;
      }
      break;
    }

    moveShot(stage, frame);
  }

  void addShot(Stage stage, Frame frame, float rad) {
    _shotDelay = 9;

    foreach (float t; [-0.9, 0, 0.9]) {
      float r = rad + t*0.1;
      _shots.insert(Shot(_pos, Vec2(cos(r), sin(r))*10, r));
    }
    frame.audio.playSE("shot");
  }

  private void movePlayer(Stage stage, Frame frame) {
    auto move = stage.input.move;

    if (move.len > 0.1)
      _rad = closeRad(_rad, move.rad, move.len/8);

    _vec += Vec2(cos(move.rad), sin(move.rad)) * (move.len * 0.55);
    _pos += _vec;
    _vec[] *= 0.8;

    auto flags = stage.field.clamp(_pos);
    if (flags.vertical) _vec.y = 0;
    if (flags.horizontal) _vec.x = 0;

    if (_shotDelay > 0) {
      --_shotDelay;
    } else {
      auto shot = stage.input.shot;
      if (shot.len > 0.4 && _canShot) addShot(stage, frame, shot.rad);
    }

    foreach (ref v; _tails) {
      float len = (_pos - v.pos).length;

      float r = v.pos.radianTo(_pos) + uniform(-0.2, 0.2);
      v.vec += Vec2(cos(r), sin(r)) * 0.5;

      v.pos += v.vec;
      stage.field.lineEffect(v.pos, v.pos - v.vec, Sky.rgb ~ 0.4);
      v.vec[] *= 0.96;

      flags = stage.field.clamp(v.pos);
      if (flags.vertical) v.vec.y = -v.vec.y;
      if (flags.horizontal) v.vec.x = -v.vec.x;
    }

    if (_bombDelay > 0) {
      --_bombDelay;

    } else if (stage.input.trigger && _bomb > 0) {
      --_bomb;
      frame.audio.playSE("bomb");
      _bombDelay = 30;
    }

    if (_bombDelay > 0) {
      float len = (32-_bombDelay)*15;
      stage.enemy.bomb(stage, frame, len);
      stage.particle.affect((ref v) {
        Vec2 dir = v.pos.xy - _pos;
        dir = Vec2(-dir.y, dir.x);
        v.vec.xy = v.vec.xy + dir * (100 / (dir.length^^2));
        v.color.a += 0.008;
      });

      if (_bombDelay%2 == 1)
        stage.field.circleEffect(pos, frame.mainColor, len);

      if (_bombDelay == 18)
        stage.beginSplash(60);
    }
  }

  private void moveShot(Stage stage, Frame frame) {
    _shots.removeIf((ref v) {
      stage.field.lineEffect(v.pos, v.pos + v.vec, Sky);
      v.pos += v.vec;

      if (stage.field.clamp(v.pos)) {
        stage.particle.add(
            v.pos ~ 0, frame.mainColor, 6, 1.5, v.rad - PI, PI/4);
        return true;
      }
      return false;
    });
  }

  void draw(Stage stage, Frame frame) {
    if (stage.gameover) return;

    Vec4 color = mixDamage(White);
    Mat4 base = Mat4.translate(_pos ~ 0).dotRotate(_rad, Vec3(0,0,1));

    _binder.use();
    frame.entityRenderer.uniform!"color"(color);

    Mat4[4] mats = [
      Mat4.rotate(_count*0.01, Vec3(1,0,0)),
      Mat4.rotate(_count*0.04, Vec3(1,0,0))
          .dotTranslate(Vec3(-6, 6, 0)).dotScale(Vec3(0.5, 0.4, 0.4)),
      Mat4.rotate(_count*0.04 + PI*2/3, Vec3(1,0,0))
          .dotTranslate(Vec3(-6, 6, 0)).dotScale(Vec3(0.5, 0.4, 0.4)),
      Mat4.rotate(_count*0.04 + PI*4/3, Vec3(1,0,0))
          .dotTranslate(Vec3(-6, 6, 0)).dotScale(Vec3(0.5, 0.4, 0.4)),
    ];

    if (_state == State.Reborn)
      foreach (ref v; mats)
        v.assignDotScale(Vec3(cast(float)_count/RebornCount));

    foreach (m; mats) {
      frame.entityRenderer.uniform!"mMatrix"(base * m);
      frame.entityRenderer.drawModel(_model);
    }

    frame.entityRenderer.uniform!"color"(Sky);
    frame.entityRenderer.uniform!"mMatrix"(base *
        Mat4.rotate(_count*0.05, Vec3(1,0,0)).dotScale(Vec3(1.1, 0.6, 0.6)));
    foreach (v; _shots) {
      frame.entityRenderer.uniform!"mMatrix"(
          Mat4.translate(v.pos ~ 0).dotRotate(v.rad, Vec3(0,0,1)));

      frame.entityRenderer.drawModel(_model);
    }
  }

  Vec4 mixDamage(Vec4 color) {
    if (_state != State.Damage) return color;
    return mix(color, Blue, cast(float)_count/DamageCount);
  }

  bool damage(Stage stage, Frame frame) {
    Vec4 color = Blue.rgb ~ 1;
    _state = State.Damage;
    _count = 0;
    stage.particle.add(_pos ~ 0, color, 800, 10);

    foreach (int r; [130, 160, 190]) {
      stage.field.circleEffect(_pos, color, r);
      foreach (i; 0..32) {
        stage.field.flashEffect(
            _pos + Vec2(cos(i*PI/16), sin(i*PI/16))*r, color.rgb);
      }
    }

    frame.audio.playSE("damage");

    return (--_life == 0);
  }

  void levelBreakBonus(int life, int bomb) {
    _life += life;
    _bomb += bomb;
  }
}

