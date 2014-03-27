module mplx.menu;

import thino;
import mplx.frame;
import std.array : empty, back, popBack;
import std.conv : to;

class ButtonGroup {
  private:
  Font _font;
  float _fontSize;
  Vec4 _globalColor;

  int _count;

  Button[][] _list;
  void delegate()[] _cancel;
  int[] _focus;

  @property {
    ref inout(Button[]) _buttons() inout { return _list.back; }
    ref inout(int) _point() inout { return _focus.back; }
  }

  static BoolCount _mouse;
  static Vector2!int _beforeMousePos;

  int matchButtonBy(bool delegate(float) f) {
    Vec2 sub;
    float len = float.max;
    int match = -1;

    foreach (int i, v; _buttons) {
      if (v == _buttons[_point]) continue;
      sub = v.pos + v.size/2 - _buttons[_point].pos - _buttons[_point].size/2;
      if (!f(atan2(-sub.y, sub.x))) continue;

      float l = sub.length;
      if (l < len) {
        len = l;
        match = i;
      }
    }

    return match;
  }

  public:
  @property bool focused() const {
    return !_list.empty && 0 <= _point && _point < _buttons.length;
  }

  void moveFocus(int k, Frame frame = null) {
    assert(!_list.empty);
    if (k < 0 || _buttons.length <= k)
      k = 0;
    _point = k;
    _count = 0;
    if (frame) frame.audio.playSE("move");
  }

  this(Frame frame, Font font, float fontSize, Vec4 globalColor) {
    _beforeMousePos = frame.getMousePos();
    _font = font;
    _fontSize = fontSize;
    _globalColor = globalColor;
  }

  void push(void delegate() cancel, Button[] ls, int focus = 0) {
    if (ls.empty) return;
    _list ~= ls;
    _focus ~= 0;
    _cancel ~= cancel;
    moveFocus(focus);
  }

  void pushSelector(T)(void delegate() cancel, Vec2 base, Vec2 size,
      in T[] ls, void delegate(T) f, int focus = 0) {
    Button[] buttons;
    foreach (i, v; ls)
      buttons ~= new Button(this, base + Vec2(size.x*i, 0), size,
          to!string(v), pushSelectorCallback(f, cancel, v));

    push(cancel, buttons, focus);
  }

  private void delegate() pushSelectorCallback(T)(
      void delegate(T) f, void delegate() cancel, in T v) {
    return { f(v); cancel(); };
  }

  void pop() {
    if (!_list.empty) {
      _list.popBack();
      _focus.popBack();
      _cancel.popBack();
    }
  }

  void drawString(Mat4 mat, Vec2 pos, Vec4 c, string text) {
    _font.drawString(mat, pos, _fontSize, c, text);
  }

  Vec2 stringSize(string text) {
    return _font.stringSize(text) * _fontSize;
  }

  void move(Frame frame, Vector2!int pos = Vector2!int(0)) {
    if (_list.empty) return;

    ++_count;

    // mouse focus
    auto mousePos = frame.getMousePos();
    if (mousePos != _beforeMousePos) {
      _beforeMousePos = mousePos;
      mousePos -= pos;
      bool hit = false;
      foreach (int i, v; _buttons) {
        if (v.pos.x < mousePos.x && mousePos.x < v.pos.x + v.size.x &&
            v.pos.y < mousePos.y && mousePos.y < v.pos.y + v.size.y) {
          if (i != _point)
            moveFocus(i, frame);
          hit = true;
          break;
        }
      }

      if (!hit && _count != 1) _point = -1;
    }

    _mouse.update(frame.getMouseButtonNamed!"LEFT"() == Press);

    // key focus
    if (focused) {
      if (frame.controller.left) {
        int k = matchButtonBy(v => v > PI*3/4 || v < -PI*3/4);
        if (k != -1) moveFocus(k, frame);

      } else if (frame.controller.up) {
        int k = matchButtonBy(v => PI*3/4 >= v && v >= PI/4);
        if (k != -1) moveFocus(k, frame);

      } else if (frame.controller.down) {
        int k = matchButtonBy(v => -PI*3/4 <= v && v <= -PI/4);
        if (k != -1) moveFocus(k, frame);

      } else if (frame.controller.right) {
        int k = matchButtonBy(v => -PI/4 < v && v < PI/4);
        if (k != -1) moveFocus(k, frame);

      } else if (frame.controller.cancel) {
        frame.audio.playSE("cancel");
        _cancel.back()();

      } else if (frame.controller.pause && _count != 1) {
        _point = -1;

      } else if ((_mouse.on || frame.controller.select) &&
                 _buttons[_point].press) {
        frame.audio.playSE("select");
        _buttons[_point].press()();

      }
    } else if (frame.controller.left || frame.controller.up ||
          frame.controller.right || frame.controller.down) {
      moveFocus(0, frame);
    }
  }

  void draw(Mat4 matrix) {
    if (_list.empty) return;

    blendFunc(BlendMode.Normal);
    lineWidth(1.0);
    foreach (ls; _list[0..$-1])
      foreach (v; ls)
        v.draw(matrix, Vec4(1.0, 1.0, 1.0, 0.3), false);

    foreach (i, v; _buttons)
      v.draw(matrix, _globalColor, i == _point);
  }
}

class Button {
  enum Align {
    Left,
    Center,
    Right,
  }

  private:
  ButtonGroup _group;
  Vec2 _pos, _size, _base;
  string _text;
  Align _align;

  protected float[] _vertex;

  void delegate() _press;

  public:
  @property {
    mixin(AttrReader("pos", "size", "base"));

    void delegate() press() const {
      return _press;
    }

    void press(void delegate() f) {
      _press = f;
    }

    string text() const {
      return _text;
    }

    void text(string t) {
      _text = t;

      _base = (_size - _group.stringSize(t))/2;
      _base = Vec2(lrint(_base.x), lrint(_base.y));

      final switch (_align) {
      case Align.Left:
        _base.x = 4;
        break;
      case Align.Center:
        break;
      case Align.Right:
        _base.x = _base.x * 2 - 4;
        break;
      }
    }
  }

  this(ButtonGroup g, Vec2 p, Vec2 s,
      string t = "", void delegate() f = null, Align a = Align.Center) {
    _group = g;
    _pos = p;
    _size = s;
    _align = a;
    text = t;
    _press = f;
  }

  void draw(Mat4 matrix, Vec4 color, bool focus) {
    if (_vertex.empty) {
      float px = _pos.x, py = _pos.y, sx = _size.x, sy = _size.y;
      _vertex = [px, py, 0, px+sx, py, 0, px+sx, py+sy, 0, px, py+sy, 0];
    }

    Primitive().drawQuad(matrix,
        focus ? color.rgb*0.15 ~ 0.9 : Black, _vertex);

    _group.drawString(matrix, _pos+_base, color, text);
    if (focus)
      Primitive().draw(matrix, color, _vertex, DrawMode.LineLoop);
  }
}

class ButtonLine : Button {
  this(ButtonGroup g, Vec2 p, Vec2 s,
      string t = "", void delegate() f = null, Align a = Align.Center) {
    super(g, p, s, t, f, a);
  }

  override void draw(Mat4 matrix, Vec4 color, bool focus) {
    super.draw(matrix, color, focus);
    if (!focus)
      Primitive().draw(matrix, color, _vertex, DrawMode.LineLoop);
  }
}

class ButtonHexagon : Button {
  static IBO!ubyte ibo, iboLine;

  this(ButtonGroup g, Vec2 p, Vec2 s,
      string t = "", void delegate() f = null, Align a = Align.Center) {
    super(g, p, s, t, f, a);

    if (!ibo)
      ibo = new IBO!ubyte([0,2,1,0,3,2,0,4,3,0,5,4]);

    if (!iboLine)
      iboLine = new IBO!ubyte([0,1,2,3,4,5]);

    _vertex = [
      _pos.x + _size.x/2, _pos.y, 0,
      _pos.x + _size.x, _pos.y + _size.y/4, 0,
      _pos.x + _size.x, _pos.y + _size.y*3/4, 0,
      _pos.x + _size.x/2, _pos.y + _size.y, 0,
      _pos.x, _pos.y + _size.y*3/4, 0,
      _pos.x, _pos.y + _size.y/4, 0,
    ];
  }

  override void draw(Mat4 matrix, Vec4 color, bool focus) {
    Primitive().drawElements(matrix,
        focus ? color.rgb*0.15 ~ (0.7 + 0.2 * cos(PI*_group._count/30.0))
              : Black,
        _vertex, ibo, DrawMode.Triangles);

    Primitive().drawElements(matrix, color,
        _vertex, iboLine, DrawMode.LineLoop);

    _group.drawString(matrix, _pos+_base, color, text);
  }
}

