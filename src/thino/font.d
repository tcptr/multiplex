module thino.font;

import thino.graph;
import thino.math;
import std.stdio;
import std.conv : text;
import std.utf : stride, toUTF32;
import std.exception : assumeUnique;
import std.traits : isSomeString;

private alias immutable(ubyte)[] Stroke;
private struct Character {
  IBO!ushort ibo;
  float width;
}

/**
 * KST32Bというフォントがあります。これは独自形式のストロークフォントで、
 * 30x32の格子点を繋ぐ線によってフォントを表現しています。
 * 品質はFreeTypeなどには劣りますが、非常に軽量です。
 * このクラスではKSTフォントをUnicode向けに少し改変したフォントを描画します。
 * ---
 * font = Font.load("font/32b.ukst");
 * ...
 * font.drawString(pvmMatrix, color, "Hello, World!");
 * ---
 */
class Font {
  alias ShaderProgram!(
      "attribute vec2 lattice",
      "uniform mat4 offset",
      "uniform mat4 scale",
      "uniform mat4 pvmMatrix",
      "uniform vec4 color") FontProgram;

  private:
  Character[dchar] _chars;

  static FontProgram.Adapter _program;
  static Font[string] _instance;

  this(string filename) {
    auto fh = File(filename, "rb");
    foreach (ubyte[] buf; fh.lines()) {
      size_t len = stride(cast(char[])buf, 0);
      dchar c = toUTF32(cast(char[])buf[0..len])[0];

      Stroke d = assumeUnique(buf[len..$]);
      _chars[c] = Character(strokeIBO(d), strokeWidth(d));
    }

    if (_program is null)
      _program = FontProgram.createAdapter(vShader, fShader);

    float[] ls = new float[](30*32*2);
    foreach (int i; 0..30*32) {
      ls[2*i]   = i%30;
      ls[2*i+1] = i/30;
    }
    _program.lattice.bindData(ls);

    _instance[filename] = this;
  }

  public:
  /**
   * filenameのuKSTフォントを読み込み、インスタンスを初期化して返します。
   * 既に読み込んでいる場合は単にインスタンスを返します。
   */
  static Font load(string filename) {
    auto p = filename in _instance;
    return p ? *p : new Font(filename);
  }

  /**
   * strを描画します。pvmMatrixを基準に、(base.x, base.y, 0)を最初の文字の左上とし、
   * x, y軸に正の方向に描画されます。
   */
  void drawString(T)(Mat4 pvmMatrix,
      Vec2 base, float size, Vec4 color, T str) if (isSomeString!T) {
    Vec3 t = Vec3(base.x + 0.5, base.y + 0.3, 0);

    blendFunc(BlendMode.Normal);
    _program.use();
    _program.uniform!"pvmMatrix"(pvmMatrix);
    _program.uniform!"scale"(Mat4.scale(Vec3(size, size, 1)));
    _program.uniform!"color"(color);

    foreach (dchar c; str) {
      switch (c) {
      case '\n':
        t.x = base.x + 0.5;
        t.y = t.y + 32*size;
        break;
      case ' ':
        t.x = t.x + 12*size;
        break;
      case '　':
        t.x = t.x + 24*size;
        break;
      default:
        auto p = c in _chars;
        if (!p) break;

        _program.uniform!"offset"(Mat4.translate(t));
        p.ibo.drawElements(DrawMode.Lines);
        t.x = t.x + (p.width + 4)*size;
      }
    }
  }

  /**
   * ---
   * drawString(a[0], a[1], a[2], a[3], text(a[4..$]));
   * ---
   * と同等です。
   */
  void drawText(A...)(A a) {
    drawString(a[0], a[1], a[2], a[3], text(a[4..$]));
  }

  /**
   * sizeが1.0のとき、textの描画に必要な領域の大きさを返します。
   */
  Vec2 stringSize(T)(T str) if (isSomeString!T) {
    float max = 0, tx = 0, ty = 0;
    bool ln = true;

    foreach (dchar c; str) {
      switch (c) {
      case '\n':
        if (max < tx) max = tx;
        tx = 0;
        if (ln) ty += 32;
        ln = true;
        break;
      case ' ':
        tx += 11;
        break;
      case '　':
        tx += 22;
        break;
      default:
        auto p = c in _chars;
        if (!p) break;
        tx += p.width + 4;
        if (ln) {
          ty += 32;
          ln = false;
        }
      }
    }

    return Vec2(max < tx ? tx : max, ty);
  }

  private:
  enum vShader = q{
    attribute vec2 lattice;
    uniform mat4 offset;
    uniform mat4 scale;
    uniform mat4 pvmMatrix;

    void main() {
      gl_Position = pvmMatrix *
          offset * scale * vec4(lattice, 0.0, 1.0);
    }
  };

  enum fShader = q{
    uniform vec4 color;

    void main() {
      gl_FragColor = color;
    }
  };
}

private IBO!ushort strokeIBO(Stroke data) {
  ushort x0, y0, x1, y1;
  size_t i = 0;
  ushort[] v;

  foreach (ubyte c; data) {
    switch (c) {
    // move x 0-29
    case 0x21: .. case 0x26:
    case 0x28: .. case 0x3F:
      x1 = x0 = cast(ushort)((c < 0x27) ? c - 0x21 : c - 0x22);
      break;
    // draw x 0-29
    case 0x40: .. case 0x5B:
    case 0x5E: .. case 0x5F:
      x0 = x1;
      x1 = cast(ushort)((c < 0x5C) ? c - 0x40 : c - 0x42);
      v ~= cast(ushort)(x0 + y0*30);
      v ~= cast(ushort)(x1 + y1*30);
      x0 = x1; y0 = y1;
      break;
    // next x
    case 0x60: .. case 0x7D:
      x0 = x1;
      x1 = cast(ushort)(c - 0x60);
      break;
    // move y
    case 0x7E:
    case 0xA1: .. case 0xBF:
      y0 = y1 = cast(ushort)((c == 0x7E) ? 31 : 0xBF - c);
      break;
    // draw y
    case 0xC0: .. case 0xDF:
      y0 = y1;
      y1 = cast(ushort)(0xDF - c);
      v ~= cast(ushort)(x0 + y0*30);
      v ~= cast(ushort)(x1 + y1*30);
      x0 = x1; y0 = y1;
      break;
    case 0x0A:
      break;
    default:
      throw new Exception(text("invalid stroke data: ", c));
    }
  }
  return new IBO!ushort(v);
}

private float strokeWidth(Stroke data) {
  float m = 0, k;
  foreach (ubyte c; data) {
    switch (c) {
    case 0x21: .. case 0x26:
    case 0x28: .. case 0x3F:
      k = (c < 0x27) ? c - 0x21 : c - 0x22;
      break;
    case 0x40: .. case 0x5B:
    case 0x5E: .. case 0x5F:
      k = (c < 0x5C) ? c - 0x40 : c - 0x42;
      break;
    case 0x60: .. case 0x7D:
      k = c - 0x60;
      break;
    default:
      k = 0;
    }
    if (k > m) m = k;
  }
  return m;
}

