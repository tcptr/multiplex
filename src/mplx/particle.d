module mplx.particle;

import thino;
import mplx.frame;
import mplx.stage;
import std.random;

class Particle {
  struct Dot {
    Vec3 pos, vec, acc;
    Vec4 color;
    bool child;
  }

  private:
  alias ShaderProgram!(
      "attribute vec3 position",
      "attribute vec4 color",
      "uniform mat4 pvmMatrix") Program;

  Program.Adapter _program;
  RingBuffer!Dot _dots;

  enum ParticleMax = 30000;

  public:
  this() {
    _dots = RingBuffer!Dot(ParticleMax);

    _program = Program.createAdapter(
        "shaders/particle.vrt", "shaders/particle.frg");
    _program.position.setLength(ParticleMax * 2);
    _program.color.setLength(ParticleMax * 2);
  }

  void add(Vec3 pos, Vec4 color, size_t num,
      float power, float way = 0, float range = PI, bool child = false) {
    Dot tmp = Dot(pos, Vec3(0), Vec3(0), color, child);

    foreach (_; 0..num) {
      float r1 = way + uniform(-range, range);
      float r2 = uniform(0, PI/2);
      Vec3 vec = Vec3(cos(r1)*cos(r2), sin(r1)*cos(r2), sin(r2));
      Vec3 acc = Vec3(uniform(-1f, 1), uniform(-1f, 1), uniform(-1f, 1f));
      tmp.vec = vec * power * uniform(0.7, 1.0);
      tmp.acc = acc * 0.008 * power;
      _dots.insertBack(tmp);
    }
  }

  void affect(void delegate(ref Dot) f) {
    foreach (ref v; _dots) f(v);
  }

  void move(Stage stage, Frame frame) {
    foreach (ref v; _dots) {
      v.vec[] *= 0.94;
      v.pos += v.vec;
      v.vec += v.acc;
      v.color.a -= 0.008;

      if (!v.child && v.color.a > 0.5 && uniform(0f, 1f) < 0.003) {
        add(v.pos, v.color.rgb ~ (v.color.a + 0.3), 4, 1, 0, PI, true);
        v.child = true;
      }
    }

    _dots.removeWhile(v => v.color.a < 0);
  }

  void draw(Stage stage, Frame frame) {
    if (_dots.empty) return;

    _program.position.modifyMapBuffer((p) {
      size_t i;
      foreach (v; _dots) {
        p[i++] = v.pos[];
        p[i++] = (v.pos + v.vec*5)[];
      }
    });

    _program.color.modifyMapBuffer((p) {
      size_t i;
      foreach (v; _dots) {
        p[i++] = v.color[];
        p[i++] = v.color[];
      }
    });

    blendFunc(BlendMode.Addition);
    lineWidth(1.5);

    _program.use();
    _program.uniform!"pvmMatrix"(frame.pvMatrix);

    import thino.opengl;
    glDrawArrays(DrawMode.Lines, 0, cast(int)_dots.length*2);
  }
}

