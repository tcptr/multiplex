module mplx.graph;

import thino;
import mplx.frame;
import mplx.model;
import std.algorithm : swap;
import std.random;

class SplashEffect {
  alias ShaderProgram!(
      "attribute vec2 position",
      "attribute vec2 texCoord",
      "uniform sampler2D texture",
      "uniform int type",
      "uniform vec2 center",
      "uniform float power",
      "uniform float[] weight") Program;

  mixin PostEffect!(Program, 2);

  private static immutable float[] Weight =
      [0.19, 0.17, 0.15, 0.13, 0.11, 0.09, 0.07, 0.05, 0.03, 0.01];

  public:
  this(T)(T size,
      Attach depth = Attach.Renderbuffer, Attach stencil = Attach.None) {
    init(vShader, fShader, size, depth, stencil);
    foreach (ref v; _buf) {
      v.isClear = true;
      v.clearColor = Vec3(0) ~ 1;
    }
  }

  @property inout(Texture) texture() inout {
    return _buf[0].colorTexture;
  }

  void rendering(void delegate() f) {
    assumeResize();
    _buf[0].rendering(f);
  }

  void draw(float alpha = 1.0) {
    _effect.use();
    _effect.uniform!"texture"(0);
    _effect.uniform!"type"(0);
    _effect.uniform!"power"(alpha);
    _buf[0].colorTexture.bind(&fill);
  }

  void update(Vec2 center = Vec2(0.5, 0.5), float power = 15.0) {
    _effect.use();
    _effect.uniform!"texture"(0);
    _effect.uniform!"type"(1);
    _effect.uniform!"center"(center);
    _effect.uniform!"power"(power);
    _effect.uniform!"weight"(Weight);

    _buf[1].rendering({
      _buf[0].colorTexture.bind(&fill);
    });
    swap(_buf[0], _buf[1]);
  }

  private:
  enum vShader = q{
    attribute vec2 position;
    attribute vec2 texCoord;
    varying vec2 vTexCoord;

    void main() {
      gl_Position = vec4(position, 0.0, 1.0);
      vTexCoord = texCoord;
    }
  };

  enum fShader = q{
    uniform sampler2D texture;
    varying vec2 vTexCoord;
    uniform int type;
    uniform vec2 center;
    uniform float weight[10];
    uniform float power;

    void main() {
      if (type == 0) {
        gl_FragColor = texture2D(texture, vTexCoord) * power;
      } else if (type == 1) {
        vec2 t = vTexCoord / gl_FragCoord.xy;
        vec2 dir = center - vTexCoord;
        dir *= t * power;

        vec3 dest = vec3(0.);
        int i;
        for (i=0; i<10; ++i) {
          dest += texture2D(texture, vTexCoord + dir * float(i-2)).rgb * weight[i];
        }

        gl_FragColor = vec4(dest, 1.);
      }
    }
  };
}

class SplashRenderer {
  private:
  SplashEffect _splash;
  int _count;
  float _begin;

  public:
  this() {
    _splash = new SplashEffect(Vector2!int(400, 400));
    _count = 0;
  }

  void move(Frame frame) {
    if (_count == 0) return;

    --_count;
    Vec2 p = frame.camera*0.4 / Vec2(240, 150) + Vec2(0.5, 0.5);
    _splash.update(p, _count/_begin*10);
  }

  void draw(Frame frame) {
    if (_count == 0) return;

    blendFunc(BlendMode.Addition);
    _splash.draw(_count/_begin*1.4);
  }

  void beginSplash(void delegate() f, int count) {
    _count = count;
    _begin = count;
    _splash.rendering(f);
  }
}

class EntityRenderer {
  alias ShaderProgram!(
      "attribute vec3 position",
      "attribute vec2 texCoord",
      "uniform sampler2D texture",
      "uniform int line",
      "uniform vec4 color",
      "uniform mat4 pvMatrix",
      "uniform mat4 mMatrix") Program;

  alias Program.AttributeBinder Binder;

  Program program;
  alias program this;

  this() {
    auto vtx = new Shader(ShaderType.Vertex, "shaders/entity.vrt");
    auto frg = new Shader(ShaderType.Fragment, "shaders/entity.frg");
    program = new Program(vtx, frg);
  }

  // color, line, mMatrix, mMatrix2
  void attach(Frame frame, void delegate() f) {
    blendFunc(BlendMode.Normal);
    lineWidth(1.1);
    program.use();
    program.uniform!"texture"(0);
    program.uniform!"pvMatrix"(frame.pvMatrix);
    capability!"DEPTH_TEST"(true);
    capability!"CULL_FACE"(true);
    frame.textureRenderer.texture.bind(f);
    capability!"DEPTH_TEST"(false);
    capability!"CULL_FACE"(false);
  }

  Binder createBinder() {
    return program.new AttributeBinder;
  }

  void drawModel(Model model) {
    program.uniform!"line"(0);
    capability!"POLYGON_OFFSET_FILL"(true);
    model.face.drawElements(DrawMode.Triangles);
    capability!"POLYGON_OFFSET_FILL"(false);

    program.uniform!"line"(1);
    model.line.drawElements(DrawMode.Lines);
  }
}

class TextureRenderer {
  private:
  struct Flash {
    Vec2 pos, vec;
    int time = 0;
  }
  Pool!Flash _flash;

  struct Wall {
    float lpos, rpos, lvelocity, rvelocity;
  }
  Pool!Wall _wall;

  static immutable Size = Vector2!int(150, 300);
  immutable Mat4 _matrix;

  AfterimageEffect _effect;
  float[48] _tmp;

  public:
  @property Texture texture() {
    return _effect.texture;
  }

  this() {
    _effect = new AfterimageEffect(Size, Attach.None);
    _matrix = Mat4.ortho(0, Size.x, Size.y, 0, -1, 1);
    _effect.texture.repeat = Texture.MirroredRepeat;
    _effect.rendering({}, 0); // swap buf
    _effect.texture.repeat = Texture.MirroredRepeat;
  }

  void update() {
    add();
    move();
    draw();
  }

  private:
  void add() {
    if (uniform(0.0, 1.0) < 0.06) {
      int s = uniform(0, 2);
      _flash.insert(Flash(Vec2(uniform(0.0, Size.x), s*Size.y),
          Vec2(0, (1 - s*2)*uniform(6.0, 10.0))));
    }

    if (uniform(0.0, 1.0) < 0.005) {
      int s = uniform(0, 2);
      _wall.insert(Wall(s*Size.y, s*Size.y,
          (1 - 2*s)*uniform(1.5, 4.0), (1 - 2*s)*uniform(1.5, 4.0)));
    }
  }

  void move() {
    // flash
    foreach (ref v; _flash) {
      if (v.pos.x < 0) v.pos.x = Size.x;
      if (v.pos.x > Size.x) v.pos.x = 0;
      if (v.time > 0 && --v.time == 0) {
        v.vec = Vec2(0, (uniform(0,2)*2 - 1)*uniform(5.0, 9.0));
      } else if (v.time == 0 && uniform(0.0, 1.0) < 0.03) {
        v.time = uniform(15,30);
        v.vec = Vec2(uniform(-3.0, 3.0), uniform(-3.0, 3.0));
      }

      v.pos += v.vec;
    }
    _flash.removeIf((ref v) =>
        v.pos.y < -10 || Size.y + 10 < v.pos.y);

    // wall
    foreach (ref v; _wall) {
      v.lpos += v.lvelocity;
      v.rpos += v.rvelocity;
    }
    _wall.removeIf((ref v) =>
        v.lpos < 0 && v.rpos < 0 || Size.y < v.lpos && Size.y < v.rpos);
  }

  void draw() {
    size_t i;
    Vec4 color;

    void drawLine(float[6] ls) {
      _tmp[i..i+6] = ls[];
      i += 6;
      if (i == _tmp.length) {
        Primitive().draw(_matrix, color, _tmp, DrawMode.Lines);
        i = 0;
      }
    }

    void drawForce() {
      Primitive().draw(_matrix, color, _tmp[0..i], DrawMode.Lines);
      i = 0;
    }

    _effect.rendering({
      blendFunc(BlendMode.Normal);
      lineWidth(3.5);

      // flash
      color = White;
      foreach (ref v; _flash)
        drawLine([v.pos.x, v.pos.y, 0, v.pos.x-v.vec.x, v.pos.y-v.vec.y, 0]);
      drawForce();

      // wall
      color = White.rgb ~ 0.3;
      foreach (ref v; _wall)
        drawLine([-5, v.lpos, 0, Size.x+5, v.rpos, 0]);
      drawForce();
    }, 0.99);
  }
}

class Label {
  private:
  enum State {
    Hide,
    Show,
    Fade,
  }

  float[] _vertex;
  EventID _eventID;
  string _text;
  State _state;
  int _count;

  void resize(int w, int h) {
    _vertex[] = [
      -10, h-110.5, 0, w+10, h-110.5, 0,
      w+10, h-50.5, 0, -10, h-50.5, 0,
    ];
  }

  public:
  this(Window window) {
    _vertex = new float[3*4];
    _eventID = window.addResizeCallback(&resize);
    resize(window.size.x, window.size.y);
  }

  void unbind(Window window) {
    window.removeWindowSizeCallback(_eventID);
  }

  void show(string text) {
    _text = text;
    _state = State.Show;
  }

  void fade(string text) {
    _text = text;
    _state = State.Fade;
    _count = 0;
  }

  void hide() {
    _state = State.Hide;
  }

  void move(Frame frame) {
    if (_state == State.Fade) {
      ++_count;
      if (_count > 150) _state = State.Hide;
    }
  }

  void draw(Frame frame) {
    if (_state == State.Hide) return;

    float bg_alpha, alpha;
    if (_state == State.Fade) {
      bg_alpha = linearInOut(0, 150, 20, _count);
      alpha = linearInOut(0, 150, 50, _count);
    } else {
      bg_alpha = alpha = 1;
    }

    blendFunc(BlendMode.Normal);
    lineWidth(1.0);

    Primitive().drawQuad(frame.fixedMatrix, Black.rgb ~ bg_alpha, _vertex);
    Primitive().draw(frame.fixedMatrix, frame.baseColor.rgb ~ bg_alpha,
        _vertex, DrawMode.LineLoop);

    frame.font.drawString(frame.fixedMatrix,
        Vec2(frame.size.x-300, frame.size.y - 95),
        1, frame.baseColor.rgb*1.3 ~ alpha, _text);
  }
}

class HalfGlowEffect : GlowEffect {
  enum Sep = 2;
  this(T...)(T args) { super(args); }

  protected:
  Framebuffer _base;

  override void init(string vShader, string fShader,
      Vector2!int size, Attach depth, Attach stencil) {
    _base = new Framebuffer(size, Attach.Texture, depth, stencil);
    _base.isClear = true;
    super.init(vShader, fShader, size/Sep, depth, stencil);
  }

  override void initTexture() {
    _base.colorTexture.repeat = Texture.ClampToEdge;
    super.initTexture();
  }

  public:
  override @property void size(Vector2!int s) {
    super.size = s/Sep;
    void delegate() superCallback = _resizeCallback;
    _resizeCallback = {
      _base.size = s;
      superCallback();
    };
  }

  override void effect(void delegate() f) {
    assumeResize();
    _base.rendering(f);

    _effect.use();
    _effect.uniform!"weight"(_weight);
    _effect.uniform!"texture"(0);

    _base.colorTexture.bind({
      _effect.uniform!"type"(0);
      fill();

      _buf[0].rendering(&fill);
    });

    _buf[0].colorTexture.bind({
      _effect.uniform!"type"(1);

      _buf[1].rendering(&fill);
    });

    _buf[1].colorTexture.bind({
      _effect.uniform!"type"(2);

      _buf[0].rendering(&fill);
    });

    blendFunc(BlendMode.Addition);

    _buf[0].colorTexture.bind({
      _effect.uniform!"type"(0);
      fill();
    });
  }
}

