module mplx.background;

import thino;
import mplx.frame;
import mplx.graph;
import mplx.model;
import std.random;

// TODO CPU処理が多いので軽量化が要る

class Background {
  alias ShaderProgram!(
      "attribute vec3 position",
      "attribute vec2 texCoord",
      "uniform sampler2D texture",
      "uniform int line",
      "uniform vec4 color",
      "uniform mat4 pvMatrix",
      "uniform mat4 mMatrix") Program;

  enum Mode {
    None,
    Top,
    Spin,
    Radiatus,
    Flow,
    Fear,
  }
  enum BasicModes = [Mode.Spin, Mode.Radiatus, Mode.Flow];

  private:
  struct Box {
    int len;
    Vec3 pos;
  }

  Program.Adapter _program;
  const Model[5] _model;

  Texture _wrapper;
  Mode _mode;
  Mat4 _baseMatrix;
  int _count;

  Pool!Box _boxes;

  float _alpha = 1.0;
  void delegate() _fadeOutCallback;

  public:
  @property {
    mixin(AttrReader("mode", "wrapper"));
    mixin(AttrWriter("wrapper"));

    void mode(Mode m) {
      _mode = m;
      initMode();
    }
  }

  this() {
    _program = Program.createAdapter(
        "shaders/background.vrt", "shaders/background.frg");

    _model = backgroundModel(_program.position, _program.texCoord);
  }

  void fadeOut(void delegate() callback) {
    _fadeOutCallback = callback;
  }

  void move(Frame frame) {
    if (_fadeOutCallback) {
      _alpha -= 0.03;
      if (_alpha <= 0.0) {
        _fadeOutCallback();
        _fadeOutCallback = null;
      }
    } else if (_alpha < 1.0) {
      _alpha += 0.03;
    }

    ++_count;
    switch (mode) {
    case Mode.Radiatus:
      foreach (ref v; _boxes) {
        v.pos.z += 0.2;
        if (v.pos.z > CameraZ) v.pos.z = -555;
      }
      break;

    case Mode.Flow:
      foreach (ref v; _boxes) {
        v.pos.x += 0.2;
        if (v.pos.x > 400) v.pos.x -= 800;
      }
      break;

    default:
    }
  }

  void draw(Frame frame) {
    immutable Size = Vec2(800, 500);
    immutable float[] WrapperPos =
        [-Size.x, -Size.y, -150, Size.x, -Size.y, -150,
         Size.x, Size.y, -150, -Size.x, Size.y, -150];

    void drawBox(size_t len) {
      _program.uniform!"line"(0);
      capability!"POLYGON_OFFSET_FILL"(true);
      _model[len].face.drawElements(DrawMode.Triangles);
      capability!"POLYGON_OFFSET_FILL"(false);

      _program.uniform!"line"(1);
      _model[len].line.drawElements(DrawMode.Lines);
    }

    blendFunc(BlendMode.Normal);
    if (_wrapper) {
      Primitive().drawTextureQuad(
          frame.pvMatrix, frame.baseColor.rgb ~ _alpha,
          _wrapper, WrapperPos);
    }

    capability!"DEPTH_TEST"(true);
    capability!"CULL_FACE"(true);
    _program.use();
    _program.uniform!"texture"(0);
    _program.uniform!"color"(frame.baseColor*_alpha);
    _program.uniform!"pvMatrix"(frame.pvMatrix);
    lineWidth(1.3);

    frame.textureRenderer.texture.bind({
      final switch (mode) {
      case Mode.None:
        break;

      case Mode.Top:
        foreach (i, ref v; _boxes) {
          int a = v.len >> 8, b = v.len & 0xFF;

          Mat4 base = _baseMatrix.dotRotate(PI*2*i/_boxes.length + _count*0.002, Vec3(0,0,1));

          foreach (z; [0, -50]) {
            _program.uniform!"mMatrix"(base.dotTranslate(Vec3(80, 0, z)));
            drawBox(a);

            _program.uniform!"mMatrix"(base.dotTranslate(Vec3(80+(a+2)*8, 0, z)));
            drawBox(b);

            _program.uniform!"mMatrix"(base.dotTranslate(Vec3(80+(a+b+4)*8, 0, z)));
            drawBox(_model.length - a - 1);

            _program.uniform!"mMatrix"(base.dotTranslate(Vec3(80+(b+_model.length+5)*8, 0, z)));
            drawBox(_model.length - b - 1);
          }
        }
        break;

      case Mode.Spin:
        foreach (i, ref v; _boxes) {
          Mat4 base = _baseMatrix
              .dotRotate(_count*0.002 + PI*i/8, Vec3(0,0,1))
              .dotRotate(-0.8, Vec3(0,1,0))
              .dotRotate(-_count*0.016, Vec3(1,0,0));

          foreach (n; 0..4) {
            _program.uniform!"mMatrix"(
                base.dotTranslate(Vec3(50 + n*(16+v.len*8),0,0)));
            drawBox(v.len);
          }
        }
        break;

      case Mode.Radiatus:
        foreach (ref v; _boxes) {
          _program.uniform!"mMatrix"(_baseMatrix
              .dotRotate(v.pos.z/150.0, Vec3(0,0,1))
              .dotTranslate(v.pos)
              .dotRotate(-v.pos.z/50.0, Vec3(0,0,1))
              .dotRotate(PI/2, Vec3(0,1,0)));
          drawBox(v.len);
        }
        break;

      case Mode.Flow:
        foreach (i, ref v; _boxes) {
          _program.uniform!"mMatrix"(
              _baseMatrix.dotTranslate(v.pos).dotRotate(i/20.0, Vec3(1,0,0)));
          drawBox(v.len);
        }
        break;

      case Mode.Fear:
        Mat4[] bases = new Mat4[](_model.length);
        foreach (i, ref v; bases)
          v = Mat4.rotate(-PI/2, Vec3(0,1,0)).dotRotate(i*PI/2, Vec3(1,0,0));

        foreach (ref v; _boxes) {
          _program.uniform!"mMatrix"(
              _baseMatrix.dotTranslate(v.pos) * bases[v.len]);
          _program.uniform!"color"(frame.baseColor.rgb ~ _alpha);
          drawBox(v.len);
        }

        break;
      }
    });

    capability!"DEPTH_TEST"(false);
    capability!"CULL_FACE"(false);
  }

  void initMode() {
    _boxes.length = 0;
    _count = 0;
    int len = cast(int)_model.length;

    final switch (mode) {
    case Mode.None:
      break;

    case Mode.Top:
      _boxes.length = 36;
      foreach (ref v; _boxes)
        v.len = (uniform(0, len) << 8) + uniform(0, len);

      _baseMatrix = Mat4.rotate(PI*0.55, Vec3(0.7,0.5,0));
      break;

    case Mode.Spin:
      _boxes.length = 16;
      foreach (ref v; _boxes)
        v.len = uniform(0, len);

      _baseMatrix = Mat4.translate(Vec3(0, 0, -300)).dotScale(Vec3(4));
      break;

    case Mode.Radiatus:
      _boxes.length = 100;
      foreach (ref v; _boxes) {
        v.len = uniform(0, len);
        float r = uniform(30.0, 70.0), t = uniform(-PI, PI);
        v.pos = Vec3(cos(t)*r, sin(t)*r, uniform(-555.0, CameraZ));
      }

      _baseMatrix = Mat4.scale(Vec3(18,18,6));
      break;

    case Mode.Flow:
      _boxes.length = 130;
      foreach (ref v; _boxes) {
        v.len = len - 2;
        v.pos = Vec3(uniform(-400.0, 400.0), uniform(-70.0, 70.0),
              uniform(-50.0, 0));
      }

      _baseMatrix = Mat4.translate(
            Vec3(uniform(-100.0, 100.0), uniform(-100.0, 100.0), 0))
          .dotRotate(uniform(-PI, PI), Vec3(0,0,1))
          .dotRotate(uniform(-0.1, 0.1), Vec3(0,1,0))
          .dotScale(Vec3(5,8,8));
      break;

    case Mode.Fear:
      _boxes.length = 135;
      foreach (i, ref v; _boxes) {
        v.len = uniform(0, len);
        v.pos = Vec3((i%15)*8-56.0, (i/15)*8-32.0, uniform(0, 8.0)-85);
      }

      float r = uniform(-PI, PI);
      _baseMatrix = Mat4.rotate(uniform(PI/18,PI/9), Vec3(cos(r), sin(r), 0))
          .dotScale(Vec3(32,32,8));
          //.dotRotate(uniform(-PI/6, PI/6), Vec3(0,0,1))
      break;
    }
  }
}

