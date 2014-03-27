module mplx.field;

import thino;
import mplx.frame;
import mplx.stage;
import mplx.model;
import std.random;
import std.bitmanip;
import std.typecons;

struct DirectionFlags {
  union {
    mixin(bitfields!(
        bool, "up", 1,
        bool, "down", 1,
        bool, "left", 1,
        bool, "right", 1,
        uint, "", 4));
    mixin(bitfields!(
        int, "vertical", 2,
        int, "horizontal", 2,
        uint, "", 4));
    ubyte enable;
  }

  T opCast(T)() const if (is(T == bool)) {
    return cast(bool)enable;
  }
}

class Field {
  private:
  alias ShaderProgram!(
      "attribute vec2 position",
      "attribute vec4 color",
      "uniform mat4 pvmMatrix") Program;

  struct Line {
    Vec2 from, to;
    Vec4 color;
  }

  struct Flash {
    Vec2 pos;
    int direction;
    Vec4 color;
    int slide = 0, count = 0;
  }

  struct Circle {
    Vec2 pos;
    Vec4 color;
    float len;
    int count;
  }

  struct Square {
    Vec2 pos, vec;
    Vec4 color;
    int count;
  }

  enum Directions = [Vec2(-4, 0), Vec2(4, 0), Vec2(0, 4), Vec2(0, -4)];
  enum CirclePos = circleLine();
  enum TileSpan = 20f;

  immutable Vec2 _size;
  immutable float[] _wallPos;
  immutable Mat4 _matrix;
  immutable Vector2!int _tileCount;
  immutable Vec2 _tileStep;

  Pool!Line _line;
  Pool!Flash _flash;
  Pool!Circle _circle;
  Pool!Square _square;

  AfterimageEffect _effect;
  Program.Adapter _program;

  Vec3 squareColor(int k) {
    return HSV(cast(int)(300 + sin(k/10.0) * 40), 0.9, 0.5).toRGB;
  }

  Tuple!(Vec2, Vec2) linePoint(Vec2 pos, int k) {
    Vec2 from, to;
    enum S = 2.5;

    version (all) {
      // つながらないパターン
      if (k == 0 || k == 2) {
        from = pos + Vec2(-S, S);
        to   = pos + Vec2(S, S);
        if (k == 0) {
          from -= Vec2(0, S*2);
          to -= Vec2(0, S*2);
        }
      } else {
        from = pos + Vec2(S, S);
        to   = pos + Vec2(S, -S);
        if (k == 1) {
          from -= Vec2(S*2, 0);
          to -= Vec2(S*2, 0);
        }
      }
    } else {
      // ちゃんとつながるパターン
      if (k == 0 || k == 2) {
        from = pos + Vec2(-S, 0);
        to   = pos + Vec2(S, 0);
        if (k == 0) {
          from += Vec2(0, S) - v.vec;
          to += Vec2(0, S);
        } else {
          from += Vec2(0, -S);
          to += Vec2(0, -S) - v.vec;
        }
      } else {
        from = pos + Vec2(0, S);
        to   = pos + Vec2(0, -S);
        if (k == 1) {
          from += Vec2(S, 0) - v.vec;
          to += Vec2(S, 0);
        } else {
          from += Vec2(-S, 0);
          to += Vec2(-S, 0) - v.vec;
        }
      }
    }

    return tuple(from, to);
  }

  public:
  mixin(AttrReader("size", "tileCount", "tileStep"));

  this(Frame frame, Vec2 fieldSize) {
    _size = fieldSize;

    _wallPos = [
        -_size.x/2, -_size.y/2, 0, _size.x/2, -_size.y/2, 0,
        _size.x/2, _size.y/2, 0, -_size.x/2, _size.y/2, 0];

    _matrix = Mat4.ortho(-_size.x/2, _size.x/2, -_size.y/2, _size.y/2, -1, 1);

    _tileCount = Vec2(_size.x / TileSpan + 1, _size.y / TileSpan + 1).castTo!int;

    _tileStep = Vec2(
        TileSpan + (_size.x % TileSpan) / (_tileCount.x-1),
        TileSpan + (_size.y % TileSpan) / (_tileCount.y-1));

    _program = Program.createAdapter(
        "shaders/field.vrt", "shaders/field.frg");

    _effect = new AfterimageEffect(frame, Attach.None);
  }

  void flashEffect(Vec2 p, Vec3 c) {
    Vec4 color = c ~ 1.4;
    _flash.insert(Flash(p, 0, color));
    _flash.insert(Flash(p, 1, color));
    _flash.insert(Flash(p, 2, color));
    _flash.insert(Flash(p, 3, color));
  }

  void circleEffect(Vec2 p, Vec4 color, float len, int count = 0) {
    _circle.insert(Circle(p, color, len, count+1));
  }

  void lineEffect(Vec2 from, Vec2 to, Vec4 color) {
    _line.insert(Line(from, to, color));
  }

  void squareEffect(Vec2 pos, Vec4 color, size_t num, float rad = 0, float range = PI) {
    foreach (_; 0..num) {
      float r = rad + uniform(-range, range);
      float spd = uniform(2.5, 4.5);
      _square.insert(Square(pos, Vec2(cos(r), sin(r)) * spd, color, 0));
    }
  }

  void splashSquare(Vec2 pos, float len) {
    foreach (ref v; _square) {
      if ((pos - v.pos).length < len) {
        float rad = pos.radianTo(v.pos);
        v.vec = Vec2(cos(rad), sin(rad)) * 6;
        v.pos = pos + Vec2(cos(rad), sin(rad)) * len;
        v.count %= 4;

        auto flags = clamp(v.pos);
        if (flags.vertical) v.vec.y = -v.vec.y;
        if (flags.horizontal) v.vec.x = -v.vec.x;
      }
    }
  }

  void update() {
    foreach (ref v; _flash) {
      if (v.count > 0) --v.count;
      if (v.count == 0 && uniform(0.0, 1.0) < 0.1) {
        v.slide = v.direction < 2 ? uniform(2,4) : uniform(0,2);
        v.count = uniform(1,6);
      }

      auto vec = Directions[v.count ? v.slide : v.direction];
      v.pos += vec;
      v.color.a -= 0.025;
    }

    foreach (ref v; _square) {
      v.pos += v.vec;
      auto pos = linePoint(v.pos, v.count%4);
      lineEffect(pos[0], pos[1], v.color);

      v.vec[] *= 0.96;

      auto flags = clamp(v.pos);
      if (flags.vertical) v.vec.y = -v.vec.y;
      if (flags.horizontal) v.vec.x = -v.vec.x;
    }

    _flash.removeIf((ref v) =>
        v.color.a < 0.0 ||
        v.pos.x < -_size.x/2 || v.pos.x > _size.x/2 ||
        v.pos.y < -_size.y/2 || v.pos.y > _size.y/2);

    _circle.removeIf((ref v) => --v.count < 0);
    _square.removeIf((ref v) => ++v.count > 100);

    // ----------------------

    _program.position.setLength(_flash.length * 2 + _line.length * 2);
    _program.color.setLength(_flash.length * 2 + _line.length * 2);

    _program.position.modifyMapBuffer((p) {
      size_t i;
      foreach (ref v; _flash) {
        p[i++] = v.pos[];
        p[i++] = (v.pos - Directions[v.count ? v.slide : v.direction])[];
      }
      foreach (ref v; _line) {
        p[i++] = v.from[];
        p[i++] = v.to[];
      }
    });

    _program.color.modifyMapBuffer((p) {
      size_t i;
      foreach (ref v; _flash) {
        p[i++] = v.color[];
        p[i++] = v.color[];
      }
      foreach (ref v; _line) {
        p[i++] = v.color[];
        p[i++] = v.color[];
      }
    });

    _effect.rendering({
      blendFunc(BlendMode.Normal);
      lineWidth(1.0);

      _program.use();
      _program.uniform!"pvmMatrix"(_matrix);
      _program.draw(DrawMode.Lines);

      Primitive().program.use();
      Primitive().program.pos.bindData(CirclePos, BufferType.Dynamic);
      foreach (ref v; _circle) {
        if (v.count == 0) {
          Primitive().program.uniform!"color"(v.color);
          Primitive().program.uniform!"pvmMatrix"(
              _matrix.dotTranslate(v.pos ~ 0).dotScale(Vec3(v.len)));
          Primitive().program.draw(DrawMode.LineLoop);
        }
      }
    }, 0.96);

    // ----------------------

    _line.length = 0;
  }

  DirectionFlags clamp(ref Vec2 pos) {
    DirectionFlags flag;
    if (pos.x < -_size.x/2) pos.x = -_size.x/2, flag.left = true;
    if (pos.x > _size.x/2) pos.x = _size.x/2, flag.right = true;
    if (pos.y < -_size.y/2) pos.y = -_size.y/2, flag.down = true;
    if (pos.y > _size.y/2) pos.y = _size.y/2, flag.up = true;

    return flag;
  }

  void draw(Stage stage, Frame frame) {
    blendFunc(BlendMode.Normal);
    Primitive().drawQuad(frame.pvMatrix, Black.rgb ~ 0.5, _wallPos);

    blendFunc(BlendMode.Addition);
    Primitive().drawTextureQuad(
        frame.pvMatrix, Vec4(1), _effect.texture, _wallPos);

    lineWidth(2.0);
    foreach (z; 0..6) {
      Primitive().draw(frame.pvMatrix.dotTranslate(Vec3(0,0,z*10)),
          frame.baseColor.rgb ~ 1-z/7.0, _wallPos, DrawMode.LineLoop);
    }
  }
}

