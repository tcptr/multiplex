module mplx.enemy;

import thino;
import mplx.frame;
import mplx.stage;
import mplx.graph;
import mplx.model;
import mplx.player;
import std.typetuple;
import std.typecons;
import std.algorithm : min;
import std.random;

private immutable {
  float ShotSize = 2;
  float PlayerSize = 2;
  float EnemyRepulse = 4;
  float BornCount = 45;
  float MinLength = 30;
  float SphereSpeed = 0.55;
  float SphereSize = 17;
  float SphereInertia = 0.93;
  Vec4 SphereColor = Vec4(0.3, 0.8, 0.7, 1.0);
  int SphereScore = 10;
  float GearSpeed = 0.19;
  float GearAccel = 0.00022;
  float GearInertia = 0.8;
  float GearSize = 17;
  Vec4 GearColor = Vec4(0.2, 0.7, 1.0, 1.0);
  int GearScore = 15;
  float TurtleSpeed = 0.229;
  float TurtleInertia = 0.9;
  float TurtleEvade = 10;
  float TurtleEvadeLength = 80;
  float TurtleSize = 16;
  Vec4 TurtleColor = Vec4(0.2, 0.8, 0.2, 1.0);
  int TurtleScore = 20;
  float MissileSpeed = 3.25;
  int MissileSpinCount = 90;
  float MissileSpinRad = PI/MissileSpinCount;
  float MissileSpinAccel = 2*MissileSpeed/MissileSpinCount;
  float MissileSpinLength = MissileSpinAccel * MissileSpinCount^^2 / 8;
  float MissileSize = 17;
  float MissileInertia = 0.93;
  Vec4 MissileColor = Vec4(1.0, 0.4, 0.2, 1.0);
  int MissileScore = 50;
  float ShurikenSpeed = 0.075;
  float ShurikenSpeed2 = 0.093;
  float ShurikenInertia = 0.97;
  float ShurikenSize = 17;
  float ShurikenSize2 = 15;
  Vec4 ShurikenColor = Vec4(0.7, 0.3, 0.8, 1.0);
  Vec4 ShurikenColor2 = Vec4(0.9, 0.3, 0.5, 1.0);
  int ShurikenScore = 30;
  float ConnectSize = 15;
  float ConnectSpeed = 3.1;
  Vec4 ConnectColor = Vec4(0.7, 0.7, 1.0, 1.0);
  int ConnectScore = 200;
  float CubeSize = 13;
  float CubeSpeed = 0.03;
  float CubeInertia = 0.9;
  Vec4 CubeColor = Vec4(0.5, 0.5, 1.0, 1.0);
  int CubeScore = 0;
  int CubeSpan = 125;
  float GateSize = 21;
  float GateInertia = 0.85;
  float GateRange = 140;
  Vec4 GateColor = Vec4(1.0, 0.3, 0.3, 1.0);
  int GateScore = 100;
}

void repulse(T)(ref T a, T[] ls, float lim) {
  lim ^^= 2;
  Vec2 sub;
  float len;

  foreach (ref b; ls) {
    if (b.count < BornCount) continue;
    sub = a.pos - b.pos;
    len = sub.x^^2 + sub.y^^2;

    if (len < MinLength) len = MinLength;
    if (len < lim) {
      sub[] /= len*2;
      a.vec += sub;
      b.vec -= sub;
    }
  }
}

class EnemyManager {
  private:
  EnemySphere _sphere;
  EnemyGear _gear;
  EnemyTurtle _turtle;
  EnemyMissile _missile;
  EnemyShuriken _shuriken;
  EnemyConnect _connect;
  EnemyCube _cube;
  EnemyGate _gate;

  alias _enemys = TypeTuple!(
      _sphere, _gear, _turtle, _missile, _shuriken, _connect, _cube, _gate);

  public:
  mixin(AttrReader(
      "sphere", "gear", "turtle", "missile", "shuriken", "connect", "cube", "gate"));

  this(Frame frame) {
    foreach (ref e; _enemys)
      e = new typeof(e)(frame);
  }

  void move(Stage stage, Frame frame) {
    foreach (e; _enemys) {
      if (stage.player.state != Player.State.Normal) return;
      e.move(stage, frame);
    }
  }

  void draw(Stage stage, Frame frame) {
    foreach (e; _enemys)
      e.draw(stage, frame);
  }

  void stageClear(Stage stage, Frame frame) {
    foreach (e; _enemys)
      e.stageClear(stage, frame);
  }

  void playerDead(Stage stage, Frame frame) {
    foreach (e; _enemys)
      e.playerDead(stage, frame);
  }

  void bomb(Stage stage, Frame frame, float len) {
    foreach (e; _enemys)
      e.bomb(stage, frame, len);
  }

  void gateClose(Stage stage, Frame frame, Vec2 pos) {
    foreach (e; _enemys)
      e.gateClose(stage, frame, pos);
  }

  int gravity(Stage stage, Frame frame, Vec2 pos, float power) {
    Vec2 vec = pos - stage.player.pos;
    stage.player.pos += vec * (2.0*power / (vec.x^^2 + vec.y^^2));

    int count;
    count += sphere.gravity(stage, frame, pos, power*0.6);
    count += gear.gravity(stage, frame, pos, power);
    count += turtle.gravity(stage, frame, pos, power*0.8);
    count += missile.gravity(stage, frame, pos, power);
    count += shuriken.gravity(stage, frame, pos, power*0.6);
    count += cube.gravity(stage, frame, pos, power*0.8);
    return count;
  }
}

interface Enemy {
  void move(Stage, Frame);
  void draw(Stage, Frame);
  void stageClear(Stage, Frame);
  void playerDead(Stage, Frame);
  void bomb(Stage, Frame, float);
  void gateClose(Stage, Frame, Vec2);
  int gravity(Stage stage, Frame frame, Vec2 pos, float power);
}

mixin template EnemyDefault(Unit) {
  private:
  EntityRenderer.Binder _binder;
  Pool!Unit _list;

  public:
  bool crashByShots(Stage stage, Frame frame, float size) {
    size_t hit = _list.removeIf((ref v) {
      if (v.count < BornCount) return false;

      if (stage.player.shots.removeFirst(
          (ref s) => (s.pos - v.pos).length < size + ShotSize)) {
        stage.particle.add(v.pos ~ 0, Color, 35, 5);
        stage.field.flashEffect(v.pos, frame.mainColor.rgb);
        stage.addScore(Score, v.pos, Color);
        return true;
      }
      return false;
    });
    return hit != 0;
  }

  // override void move(Stage, Frame);
  // override void draw(Stage, Frame);

  override void stageClear(Stage stage, Frame frame) {
    foreach (ref v; _list) {
      stage.particle.add(v.pos ~ 0, Color, 5, 9);
      stage.field.flashEffect(v.pos, frame.mainColor.rgb);
      stage.addScore(Score / 5, v.pos, Color);
    }

    _list.length = 0;
  }

  override void playerDead(Stage stage, Frame frame) {
    _list.length = 0;
  }

  override void bomb(Stage stage, Frame frame, float len) {
    _list.removeIf((ref v) {
      float l = (v.pos - stage.player.pos).length;
      if (len - 30 < l && l < len) {
        stage.particle.add(v.pos ~ 0, Color, 15, 3);
        stage.field.flashEffect(v.pos, frame.mainColor.rgb);
        return true;
      }
      return false;
    });
  }

  override void gateClose(Stage stage, Frame frame, Vec2 pos) {
    static if (!is(typeof(this) == EnemyGate)) {
      _list.removeIf((ref v) {
        if ((v.pos - pos).length < GateRange) {
          stage.particle.add(v.pos ~ 0, GateColor, 15, 4,
              pos.radianTo(v.pos), PI/3);
          stage.addScore(Score * 5, v.pos, GateColor);
          return true;
        }
        return false;
      });
    }
  }

  override int gravity(Stage stage, Frame frame, Vec2 pos, float power) {
    size_t hit = _list.removeIf((ref v){
      if (v.count < BornCount) return false;
      Vec2 vec = pos - v.pos;
      float len = vec.x^^2 + vec.y^^2;
      if (len < 600) {
        stage.particle.add(v.pos ~ 0, GateColor, 20, 5);
        return true;
      }
      v.vec += vec * (power / len);
      return false;
    });
    return cast(int)hit;
  }
}

class EnemySphere : Enemy {
  mixin EnemyDefault!Unit;

  private:
  enum Score = SphereScore;
  enum Color = SphereColor;

  struct Unit {
    Vec2 pos;
    float rad, spin, rotate = 0;
    int count = 0;
    Vec2 vec = Vec2(0);
  }
  Model _model;

  public:
  this(Frame frame) {
    _binder = frame.entityRenderer.createBinder();
    _model = enemySphereModel(_binder.position, _binder.texCoord);
  }

  void add(Stage stage, Vec2 pos) {
    _list.insert(Unit(pos, stage.rand(-PI, PI), stage.rand(-0.01, 0.01)));
  }

  override void move(Stage stage, Frame frame) {
    foreach (ref v; _list) {
      if (++v.count < BornCount) {
        if (v.count % 8 == 3)
          stage.field.circleEffect(v.pos, SphereColor, 35 - 0.5*v.count);
        continue;
      }

      if (abs(v.pos.x) < stage.field.size.x*0.4 &&
          abs(v.pos.y) < stage.field.size.y*0.4) {
        v.spin += stage.rand(-0.002, 0.002);
        v.rad += v.spin;
        v.spin *= 0.99;
      } else {
        float rad = v.pos.radianTo(Vec2(0)) - v.rad;
        v.rad += (-PI < rad && rad < 0) ? -0.01 : 0.01;
        v.spin *= 0.97;
      }

      v.pos += Vec2(cos(v.rad), sin(v.rad)) * SphereSpeed;
      v.rotate += 0.01;

      v.pos += v.vec;
      v.vec[] *= SphereInertia;

      stage.field.clamp(v.pos);

      if ((stage.player.pos - v.pos).length < SphereSize + PlayerSize) {
        stage.playerHit();
        return;
      }
    }

    if (crashByShots(stage, frame, SphereSize))
      frame.audio.playSE("crash");
  }

  override void draw(Stage stage, Frame frame) {
    Vec4 color = stage.player.mixDamage(SphereColor);
    _binder.use();
    frame.entityRenderer.uniform!"color"(color);
    foreach (ref v; _list) {
      Mat4 t = Mat4.translate(v.pos ~ 0);
      if (v.count < BornCount) t.assignDotScale(Vec3(v.count/BornCount));

      frame.entityRenderer.uniform!"mMatrix"(
          t.dotRotate(v.rotate, Vec3(cos(v.rad+PI/2), sin(v.rad+PI/2), 0)));
      frame.entityRenderer.drawModel(_model);
    }
  }
}

class EnemyGear : Enemy {
  mixin EnemyDefault!Unit;

  private:
  enum Score = GearScore;
  enum Color = SphereColor;

  struct Unit {
    Vec2 pos, vec = Vec2(0);
    int count = 0;
  }
  Model _model;

  public:
  this(Frame frame) {
    _binder = frame.entityRenderer.createBinder();
    _model = enemyGearModel(_binder.position, _binder.texCoord);
  }

  void add(Stage stage, Vec2 pos) {
    _list.insert(Unit(pos));
  }

  override void move(Stage stage, Frame frame) {
    foreach (i, ref v; _list) {
      if (++v.count < BornCount) {
        if (v.count % 8 == 3)
          stage.field.circleEffect(v.pos, GearColor, 35 - 0.5*v.count);
        continue;
      }

      v.pos += v.vec;
      float rad = v.pos.radianTo(stage.player.pos);
      v.vec += Vec2(cos(rad), sin(rad)) * (GearSpeed + GearAccel*v.count);
      v.vec[] *= GearInertia;

      repulse(v, _list[][i+1..$], GearSize + EnemyRepulse);

      auto flags = stage.field.clamp(v.pos);
      if (flags.vertical) v.vec.y = 0;
      if (flags.horizontal) v.vec.x = 0;

      if ((stage.player.pos - v.pos).length < GearSize + PlayerSize) {
        stage.playerHit();
        return;
      }
    }

    if (crashByShots(stage, frame, GearSize))
      frame.audio.playSE("crash");
  }

  override void draw(Stage stage, Frame frame) {
    Vec4 color = stage.player.mixDamage(GearColor);
    _binder.use();
    frame.entityRenderer.uniform!"color"(color);
    foreach (ref v; _list) {
      Mat4 t = Mat4.translate(v.pos ~ 0);
      if (v.count < BornCount) t.assignDotScale(Vec3(v.count/BornCount));
      else t.assignDotRotate((v.count-BornCount)*0.025, Vec3(0,0,1));

      frame.entityRenderer.uniform!"mMatrix"(t);
      frame.entityRenderer.drawModel(_model);
    }
  }
}

class EnemyTurtle : Enemy {
  mixin EnemyDefault!Unit;

  private:
  enum Score = TurtleScore;
  enum Color = TurtleColor;

  struct Unit {
    Vec2 pos, vec = Vec2(0);
    float rad = 0, spin = 0;
    int count = 0;
  }
  Model _model;

  public:
  this(Frame frame) {
    _binder = frame.entityRenderer.createBinder();
    _model = enemyTurtleModel(_binder.position, _binder.texCoord);
  }

  void add(Stage stage, Vec2 pos) {
    _list.insert(Unit(pos));
  }

  override void move(Stage stage, Frame frame) {
    Vec2 sub;
    float from_rad, rad, len;

    foreach (i, ref v; _list) {
      if (++v.count < BornCount) {
        if (v.count % 8 == 3)
          stage.field.circleEffect(v.pos, TurtleColor, 35 - 0.5*v.count);
        continue;
      }

      from_rad = v.pos.radianTo(stage.player.pos);

      v.pos += v.vec;
      rad = v.pos.radianTo(stage.player.pos);
      v.vec += Vec2(cos(rad), sin(rad)) * TurtleSpeed;
      v.vec[] *= TurtleInertia;

      rad = storeRad(rad - from_rad);

      v.spin += rad*0.3;
      v.spin *= 0.98;
      v.rad += v.spin;

      repulse(v, _list[][i+1..$], TurtleSize + EnemyRepulse);

      auto flags = stage.field.clamp(v.pos);
      if (flags.vertical) v.vec.y = 0;
      if (flags.horizontal) v.vec.x = 0;

      if ((stage.player.pos - v.pos).length < TurtleSize + PlayerSize) {
        stage.playerHit();
        return;
      }

      foreach (ref s; stage.player.shots) {
        sub = v.pos - s.pos;
        len = sub.x^^2 + sub.y^^2;

        if (len < TurtleEvadeLength^^2) {
          rad = storeRad(s.rad - Vec2(0).radianTo(sub));

          v.vec += sub * (TurtleEvade/len * (PI-abs(rad))/PI);
        }
      }
    }

    if (crashByShots(stage, frame, TurtleSize))
      frame.audio.playSE("crash");
  }

  override void draw(Stage stage, Frame frame) {
    Vec4 color = stage.player.mixDamage(TurtleColor);
    _binder.use();
    frame.entityRenderer.uniform!"color"(color);
    foreach (ref v; _list) {
      Mat4 t = Mat4.translate(v.pos ~ 0);
      if (v.count < BornCount) t.assignDotScale(Vec3(v.count/BornCount));
      else t.assignDotRotate(v.rad, Vec3(0,0,1));

      frame.entityRenderer.uniform!"mMatrix"(t);
      frame.entityRenderer.drawModel(_model);
    }
  }
}

class EnemyMissile : Enemy {
  mixin EnemyDefault!Unit;

  private:
  enum Score = MissileScore;
  enum Color = MissileColor;

  struct Unit {
    Vec2 pos;
    float rad;
    int count = 0, spin = 0;
    Vec2 vec = Vec2(0);
  }
  Model _model;

  public:
  this(Frame frame) {
    _binder = frame.entityRenderer.createBinder();
    _model = enemyMissileModel(_binder.position, _binder.texCoord);
  }

  void add(Stage stage, Vec2 pos) {
    _list.insert(Unit(pos, PI/2*stage.rand(4)));
  }

  void add(Stage stage, Vec2 pos, float direction, int count = 0) {
    _list.insert(Unit(pos, direction, count));
  }

  override void move(Stage stage, Frame frame) {
    foreach (i, ref v; _list) {
      if (++v.count < BornCount) {
        if (v.count % 8 == 3)
          stage.field.circleEffect(v.pos, MissileColor, 35 - 0.5*v.count);
        continue;
      }

      Vec2 before_pos = v.pos;
      Vec2 vec = Vec2(cos(v.rad), sin(v.rad));
      float rate = min((v.count-BornCount)/(MissileSpinCount/2.0), 1);

      if (v.spin > 0) {
        --v.spin;
        v.pos += vec * ((MissileSpeed - MissileSpinAccel*v.spin) * rate);
      } else {
        v.pos += vec * (MissileSpeed * rate);

        // test for U-turn
        vec = v.pos + vec * MissileSpinLength;
        if (stage.field.clamp(vec)) {
          v.rad += PI;
          v.spin = MissileSpinCount;
        }
      }

      v.pos += v.vec;
      v.vec[] *= MissileInertia;

      stage.field.lineEffect(before_pos, v.pos, MissileColor);

      stage.field.clamp(v.pos);

      if ((stage.player.pos - v.pos).length < MissileSize + PlayerSize) {
        stage.playerHit();
        return;
      }
    }

    if (crashByShots(stage, frame, MissileSize))
      frame.audio.playSE("crash");
  }

  override void draw(Stage stage, Frame frame) {
    Vec4 color = stage.player.mixDamage(MissileColor);
    capability!"CULL_FACE"(false);
    _binder.use();
    frame.entityRenderer.uniform!"color"(color);
    foreach (ref v; _list) {
      Mat4 t = Mat4.translate(v.pos ~ 0)
          .dotRotate(v.rad - v.spin*MissileSpinRad, Vec3(0,0,1));

      if (v.count < BornCount) t.assignDotScale(Vec3(v.count/BornCount));
      else t.assignDotRotate((v.count-BornCount)*0.04, Vec3(1,0,0));

      frame.entityRenderer.uniform!"mMatrix"(t);
      frame.entityRenderer.drawModel(_model);
    }
    capability!"CULL_FACE"(true);
  }
}

class EnemyShuriken : Enemy {
  mixin EnemyDefault!Unit;

  private:
  enum Score = ShurikenScore;
  enum Color = ShurikenColor;

  struct Unit {
    Vec2 pos;
    int life = 4;
    Vec2 vec = Vec2(0);
    int count = 0;
  }
  Model[2] _model;

  EntityRenderer.Binder _binder2;

  public:
  this(Frame frame) {
    _binder = frame.entityRenderer.createBinder();
    _binder2 = frame.entityRenderer.createBinder();
    _model[0] = enemyShurikenModel(_binder.position, _binder.texCoord);
    _model[1] = enemyShurikenModel2(_binder2.position, _binder2.texCoord);
  }

  void add(Stage stage, Vec2 pos) {
    _list.insert(Unit(pos));
  }

  void addCore(Stage stage, Vec2 pos) {
    float rad = stage.rand(-PI, PI);
    float spd = stage.rand(0.1, 0.9);
    _list.insert(
        Unit(pos, -3, Vec2(cos(rad), sin(rad))*spd, cast(int)BornCount));
  }

  override void move(Stage stage, Frame frame) {
    foreach (i, ref v; _list) {
      if (++v.count < BornCount) {
        if (v.count % 8 == 3)
          stage.field.circleEffect(v.pos, ShurikenColor, 35 - 0.5*v.count);
        continue;
      }

      float speed = ShurikenSpeed * (v.life-1) / 3.0
                    + ShurikenSpeed2 * (4-v.life) / 3.0;
      float size = ShurikenSize * (v.life-1) / 3.0
                 + ShurikenSize2 * (4-v.life) / 3.0;

      v.pos += v.vec;
      float rad = v.pos.radianTo(stage.player.pos);
      v.vec += Vec2(cos(rad), sin(rad)) * speed;
      v.vec[] *= ShurikenInertia;

      repulse(v, _list[][i+1..$], ShurikenSize + EnemyRepulse);

      auto flags = stage.field.clamp(v.pos);
      if (flags.vertical) v.vec.y = -v.vec.y;
      if (flags.horizontal) v.vec.x = -v.vec.x;

      if ((stage.player.pos - v.pos).length < size + PlayerSize) {
        stage.playerHit();
        return;
      }
    }

    bool damage, kill;

    _list.removeIf((ref v) {
      bool hit = stage.player.shots.removeIf((ref shot) {
        if (v.life != 0 && (shot.pos - v.pos).length < ShurikenSize + ShotSize) {
          if (--v.life < 0) v.life = 0;
          v.vec = v.vec*0.5 + shot.vec*0.25;
          return true;
        }
        return false;
      }) != 0;

      if (v.life == 0) {
        kill = true;
        stage.field.flashEffect(v.pos + Vec2(10,7), frame.mainColor.rgb);
        stage.field.flashEffect(v.pos + Vec2(7,-10), frame.mainColor.rgb);
        stage.field.flashEffect(v.pos + Vec2(-10,-7), frame.mainColor.rgb);
        stage.field.flashEffect(v.pos + Vec2(-7,10), frame.mainColor.rgb);
        stage.particle.add(v.pos ~ 0, Color, 25, 6);
        stage.addScore(Score, v.pos, Color);
        return true;
      }

      if (hit) {
        damage = true;
        stage.particle.add(v.pos ~ 0, Color, 5, 3);
        stage.field.flashEffect(v.pos, frame.mainColor.rgb);
      }

      if (v.life < 0)
        stage.field.circleEffect(v.pos, frame.baseColor, 2);

      return false;
    });

    if (damage)
      frame.audio.playSE("crash");

    if (kill)
      frame.audio.playSE("crashShuriken");
  }

  override void draw(Stage stage, Frame frame) {
    foreach (ref v; _list) {
      Mat4 t = Mat4.translate(v.pos ~ 0);
      if (v.count < BornCount) t.assignDotScale(Vec3(v.count/BornCount));
      else t.assignDotRotate((BornCount-v.count)*(6-v.life)*0.05, Vec3(0,0,1));

      Vec4 color = ShurikenColor * (v.life/4.0) +
                   ShurikenColor2 * ((4-v.life)/4.0);
      color = stage.player.mixDamage(color);
      frame.entityRenderer.uniform!"color"(color);
      _binder.use();
      frame.entityRenderer.uniform!"mMatrix"(t);
      frame.entityRenderer.drawModel(_model[0]);

      if (v.life > 1) {
        _binder2.use();
        frame.entityRenderer.drawModel(_model[1]);
        foreach (i; 2..v.life) {
          frame.entityRenderer.uniform!"mMatrix"(
              t.dotRotate((i-1)*PI*2/3, Vec3(0,0,1)));
          frame.entityRenderer.drawModel(_model[1]);
        }
      }
    }
  }
}

class EnemyConnect : Enemy {
  mixin EnemyDefault!Unit;

  private:
  enum Score = ConnectScore;
  enum Color = ConnectColor;

  struct Unit {
    Vec2 pos;
    float rad;
    int count = 0;
    Vec2 vec = Vec2(0);
  }
  Model _model;

  public:
  this(Frame frame) {
    _binder = frame.entityRenderer.createBinder();
    _model = enemyConnectModel(_binder.position, _binder.texCoord);
  }

  void add(Stage stage, Vec2 pos) {
    _list.insert(Unit(pos, stage.rand(-PI, PI)));
  }

  void add(Stage stage, Vec2 pos, float direction) {
    _list.insert(Unit(pos, direction));
  }

  override void move(Stage stage, Frame frame) {
    foreach (i, ref v; _list) {
      Vec2 vec = Vec2(cos(v.rad), sin(v.rad));

      if (++v.count < BornCount) {
        if (v.count % 4 == 3)
          stage.field.circleEffect(v.pos, ConnectColor, 120 - 2.1*v.count);
        continue;
      }

      if (v.count > BornCount + 10 && v.count % 4 == 0)
        stage.enemy.cube.add(stage, v.pos, v.rad);

      v.pos += vec * ConnectSpeed * min((v.count-BornCount+1)/30.0, 1.0);

      auto flags = stage.field.clamp(v.pos);
      if (flags.horizontal) v.rad = PI - v.rad;
      if (flags.vertical) v.rad = -v.rad;

      if ((stage.player.pos - v.pos).length < ConnectSize + PlayerSize) {
        stage.playerHit();
        return;
      }
    }

    if (crashByShots(stage, frame, ConnectSize))
      frame.audio.playSE("crash");
  }

  override void draw(Stage stage, Frame frame) {
    Vec4 color = stage.player.mixDamage(ConnectColor);
    _binder.use();
    frame.entityRenderer.uniform!"color"(color);
    foreach (ref v; _list) {
      Mat4 t = Mat4.translate(v.pos ~ 0).dotRotate(v.rad, Vec3(0,0,1));

      if (v.count < BornCount) t.assignDotScale(Vec3(v.count/BornCount));

      frame.entityRenderer.uniform!"mMatrix"(t);
      frame.entityRenderer.drawModel(_model);
    }
  }
}

class EnemyCube : Enemy {
  mixin EnemyDefault!Unit;

  private:
  enum Score = CubeScore;
  enum Color = CubeColor;

  struct Unit {
    Vec2 pos;
    float rad;
    int count = cast(int)BornCount;
    Vec2 vec = Vec2(0);
  }
  Model _model;

  public:
  this(Frame frame) {
    _binder = frame.entityRenderer.createBinder();
    _model = enemyCubeModel(_binder.position, _binder.texCoord);
  }

  void add(Stage stage, Vec2 pos, float direction) {
    _list.insert(Unit(pos, direction));
  }

  override void move(Stage stage, Frame frame) {
    foreach (i, ref v; _list) {
      if (++v.count < BornCount) {
        if (v.count % 8 == 3)
          stage.field.circleEffect(v.pos, ConnectColor, 35 - 0.5*v.count);
        continue;
      }

      float rad = v.pos.radianTo(stage.player.pos);
      v.vec += Vec2(cos(rad), sin(rad)) * CubeSpeed;
      v.pos += v.vec;
      v.vec[] *= CubeInertia;

      stage.field.clamp(v.pos);

      if ((stage.player.pos - v.pos).length < CubeSize + PlayerSize) {
        stage.playerHit();
        return;
      }
    }

    _list.removeIf((ref v) => v.count >= CubeSpan);

    if (crashByShots(stage, frame, CubeSize))
      frame.audio.playSE("crash");
  }

  override void draw(Stage stage, Frame frame) {
    Vec4 color = stage.player.mixDamage(CubeColor);
    _binder.use();
    frame.entityRenderer.uniform!"color"(color);
    foreach (ref v; _list) {
      Mat4 t = Mat4.translate(v.pos ~ 0).dotRotate(v.rad, Vec3(0,0,1));

      if (v.count < 55) t.assignDotScale(Vec3((v.count-25)/30.0));
      else if (v.count > CubeSpan - 10) t.assignDotScale(Vec3((CubeSpan-v.count)/10.0));

      frame.entityRenderer.uniform!"mMatrix"(t);
      frame.entityRenderer.drawModel(_model);
    }
  }
}

class EnemyGate : Enemy {
  mixin EnemyDefault!Unit;

  private:
  enum Score = GateScore;
  enum Color = GateColor;

  struct Unit {
    Vec2 pos;
    int life = 20;
    int count = 0;
    int repulse = 0;
    Vec2 vec = Vec2(0);
    float spin = 0;
  }
  Model _model;

  public:
  this(Frame frame) {
    _binder = frame.entityRenderer.createBinder();
    _model = enemyGateModel(_binder.position, _binder.texCoord);
  }

  void add(Stage stage, Vec2 pos) {
    _list.insert(Unit(pos));
  }

  override void move(Stage stage, Frame frame) {
    foreach (i, ref v; _list) {
      if (++v.count < BornCount) {
        if (v.count % 4 == 3)
          stage.field.circleEffect(v.pos, GateColor, 120 - 2.1*v.count);
        continue;
      }

      v.spin += 0.002 * (v.repulse == 0 ? 5 : v.life*2);
      v.pos += v.vec;
      v.vec[] *= GateInertia;

      if (v.repulse > 0) {
        int k = 75 - v.life*2;
        if (v.count % k == 0) {
          k = (v.count % (3*k)) / k;
          stage.field.flashEffect(v.pos, GateColor.rgb);
          stage.field.circleEffect(v.pos,
              GateColor, 60 + 20*k);
        }
        if (v.repulse > 1) --v.repulse;
        v.life += stage.enemy.gravity(
            stage, frame, v.pos, 8+v.life*0.7-v.repulse*0.3);
      }

      repulse(v, _list[][i+1..$], GateSize + EnemyRepulse);

      stage.field.clamp(v.pos);

      if ((stage.player.pos - v.pos).length < GateSize + PlayerSize) {
        stage.playerHit();
        return;
      }
    }

    bool damage, kill;

    _list.removeIf((ref v) {
      if (v.life > 36) {
        foreach (int i; 0..30)
          stage.field.circleEffect(v.pos, GateColor, 22*i, 30+7*i);
        foreach (i; 0..32) {
          float rad = i*PI/16;
          Vec2 pos = v.pos + Vec2(cos(rad), sin(rad)) * (GateRange-20);
          stage.field.clamp(pos);
          stage.enemy.missile.add(stage, pos, rad);
        }

        foreach (i; 0..18)
          stage.enemy.shuriken.addCore(stage, v.pos);
        stage.particle.affect((ref x) {
          x.vec = (x.vec.xy + (x.pos.xy - v.pos).normal * 5) ~ x.vec.z;
        });
        stage.particle.add(v.pos ~ 0, GateColor, 100, 12);
        frame.audio.playSE("collapse");
        return true;
      }

      bool hit = stage.player.shots.removeIf((ref shot) {
        if (v.life != 0 && (shot.pos - v.pos).length < GateSize + ShotSize) {
          if (--v.life < 0) v.life = 0;
          v.vec += shot.vec*0.05;
          v.repulse += 15;
          if (v.repulse > 50) v.repulse = 50;
          return true;
        }
        return false;
      }) != 0;

      if (v.life == 0) {
        kill = true;
        foreach (i; 0..64) {
          float rad = i*PI/32;
          stage.field.flashEffect(v.pos +
              Vec2(cos(rad), sin(rad))*GateRange, GateColor.rgb);
        }

        foreach (int i; 0..10)
        stage.field.circleEffect(v.pos, GateColor, GateRange*(10-i)/10, i*5+1);
        stage.enemy.gateClose(stage, frame, v.pos);
        stage.particle.affect((ref x) {
          x.vec = (x.vec.xy + (x.pos.xy - v.pos).normal * 5) ~ x.vec.z;
        });
        stage.particle.add(v.pos ~ 0, GateColor, 100, 8);
        stage.addScore(Score, v.pos,GateColor);
        frame.audio.playSE("crashGate");
        return true;
      }

      if (hit) {
        damage = true;
        stage.particle.add(v.pos ~ 0, frame.mainColor, 10, 3);
        stage.field.flashEffect(v.pos, frame.mainColor.rgb);
        frame.audio.playSE("hit");
      }

      return false;
    });
  }

  override void draw(Stage stage, Frame frame) {
    Vec4 color = stage.player.mixDamage(GateColor);
    _binder.use();
    frame.entityRenderer.uniform!"color"(color);
    foreach (ref v; _list) {
      Mat4 t = Mat4.translate(v.pos ~ 0);

      if (v.count < BornCount)
        t.assignDotScale(Vec3(v.count/BornCount));

      foreach (i; 0..4) {
        frame.entityRenderer.uniform!"mMatrix"(
            t.dotRotate(PI*i/2 + v.spin, Vec3(0,0,1)));
        frame.entityRenderer.drawModel(_model);
      }
    }
  }
}

