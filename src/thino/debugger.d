/**
 * デバッグ用ユーティリティです。左上にデバッグ用文字列を表示します。
 * 加えて、関数を登録することができます。F3キーを押して選択することで関数を実行します。
 * ---
 * debug Debugger.fontLocation = ...;
 * debug Debugger().add(() => "Debugger");
 * debug Debugger().add(() => text("FPS ", window.FPS));
 * debug Debugger().addVar("FooPower", &power);
 * ---
 * TODO:
 *   作り直す
 */
module thino.debugger;

debug:

import opengl.glfw;
import thino.window;
import thino.graph;
import thino.font;
import thino.math;
public import std.stdio;
public import std.conv : to, text;

class Debugger {
  private:
  struct Var {
    string delegate() text;
    void delegate() r, l;
  }

  struct Step {
    string name;
    double time;
  }

  Font _font;
  Var[] _targets;
  Step[] _steps;
  bool _focus;
  int _pressCount, _selected;
  static string _filename = "font/32b.ukst";

  this() {
    try {
      _font = Font.load(_filename);
    } catch (Exception o) {
      _font = null;
    }
  }

  public:
  @property static ref string fontLocation() {
    return _filename;
  }

  static Debugger opCall() {
    static Debugger debugger;
    if (!debugger) debugger = new Debugger;
    return debugger;
  }

  void clear() {
    _targets.length = 0;
    _focus = false;
  }

  void clearSteps() {
    _steps.length = 0;
  }

  void step(string name) {
    _steps ~= Step(name, glfwGetTime());
  }

  void add(string delegate() t,
      void delegate() r = null, void delegate() l = null) {
    _targets ~= Var(t, r, l);
  }

  void addVar(T)(string name, T* v, T step = 1) {
    _targets ~= Var(() => text(name, *v), { *v += step; }, { *v -= step; });
  }

  void run(in Window window) {
    if (!_font) return;

    bool f3    = window.getKeyNamed!"F3"() == Press,
         down  = window.getKeyNamed!"DOWN"() == Press,
         up    = window.getKeyNamed!"UP"() == Press,
         enter = window.getKeyNamed!"ENTER"() == Press,
         right = window.getKeyNamed!"RIGHT"() == Press,
         left  = window.getKeyNamed!"LEFT"() == Press;

    if (f3 || down || up || enter || left || right) {
      ++_pressCount;
      if (_pressCount == 1 || (_pressCount > 15 && _pressCount%3 == 1)) {
        if (f3) {
          if (_targets.length) {
            _focus = !_focus;
            _selected = 0;
          }
        } else if (up) {
          --_selected;
          if (_selected < 0)
            _selected = cast(int)_targets.length - 1;
        } else if (down) {
          ++_selected;
          if (_selected == _targets.length)
            _selected = 0;
        } else if (_targets[_selected].r && !_targets[_selected].l && enter ||
                   _targets[_selected].r && _targets[_selected].l && right) {
          _targets[_selected].r();
        } else if (_targets[_selected].r && _targets[_selected].l && left) {
          _targets[_selected].l();
        }
      }
    } else {
      _pressCount = 0;
    }

    capability!"DEPTH_TEST"(false);
    capability!"STENCIL_TEST"(false);
    lineWidth(1.0);

    foreach (int i, v; _targets) {
      auto t = v.text();
      if (_focus && i == _selected)
        t = "*" ~ t;

      _font.drawString(window.fixedMatrix,
          Vec2(12, i*13+12), 0.4, Vec3(0.0) ~ 1.0, t);
      _font.drawString(window.fixedMatrix,
          Vec2(10, i*13+10), 0.4, Vec3(1.0) ~ 1.0, t);
    }

    if (_steps.empty) return;

    step(null);
    double all = _steps[$-1].time - _steps[0].time;
    foreach (i, v; _steps[0..$-1]) {
      string t = text(v.name, ":", to!int((_steps[i+1].time-v.time)*100/all), "%");
      _font.drawString(window.fixedMatrix,
          Vec2(11, (i+_targets.length+1)*13 + 11), 0.4, Vec3(0.0) ~ 1.0, t);
      _font.drawString(window.fixedMatrix,
          Vec2(10, (i+_targets.length+1)*13 + 10), 0.4, Vec3(1.0) ~ 1.0, t);
    }
    clearSteps();
  }
}

