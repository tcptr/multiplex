module mplx.scoreeffect;

import thino;
import mplx.frame;
import mplx.stage;

class ScoreEffect {
  private:
  string[int] _texts;

  struct Label {
    string text;
    Vec3 pos;
    int count;
    Vec4 color;
  }

  Pool!Label _label;

  public:
  this(Frame frame) {
  }

  void addLabel(int score, Vec2 pos, Vec4 color) {
    auto t = score in _texts;
    if (t is null) {
      auto str = "+" ~ commaSeparate(score);
      _texts[score] = str;
      t = &str;
    }

    _label.insert(Label(*t, pos ~ 0, 0, color));
  }

  void move(Stage stage, Frame frame) {
    foreach (ref v; _label) {
      ++v.count;
      v.pos.z = v.count^^2 * 0.035;
      v.color.a *= 0.99;
    }

    _label.removeIf((ref v) => v.count > 80);
  }

  void draw(Stage stage, Frame frame) {
    blendFunc(BlendMode.Addition);
    lineWidth(1.2);

    foreach (v; _label) {
      frame.font.drawString(
          frame.pvMatrix.dotTranslate(v.pos).dotScale(Vec3(0.3, -0.3, 1)),
          Vec2(0), 1, v.color, v.text);
    }
  }
}

