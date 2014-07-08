module thino.effect;

import thino.window;
import thino.graph;
import thino.math;
import std.algorithm : swap;
import std.conv : to;
import std.array : replace;

/**
 * ポストエフェクトに使用するProgram.$(J Adapter), $(J IBO), $(J Framebuffer)を用意します。
 * FBにはフレームバッファの数を指定します。
 */
mixin template PostEffect(Program, size_t FB) {
  protected:
  static Program.Adapter _effect;
  Framebuffer[FB] _buf;

  void delegate() _resizeCallback;

  /**
   * sizeまたはwindow.sizeとdepth, stencilでフレームバッファを用意し、
   * プログラムが初期化されていなければ初期化します。
   * windowが与えられた場合、windowのサイズが変更された場合にそれに追随するようにコールバックをセットします。
   */
  void init(string vShader, string fShader,
      Window window, Attach depth, Attach stencil) {
    init(vShader, fShader, window.size, depth, stencil);

    window.addResizeCallback((int w, int h){
      this.size = Vector2!int(w, h);
    });
  }

  /// ditto
  void init(string vShader, string fShader,
      Vector2!int size, Attach depth, Attach stencil) {
    if (!_effect.program) {
      _effect = Program.createAdapter(vShader, fShader);

      _effect.position.bindData([-1,-1, 1,-1, 1,1, -1,1]);
      _effect.texCoord.bindData([0,0, 1,0, 1,1, 0,1]);
    }

    foreach (ref v; _buf)
      v = new Framebuffer(size, Attach.Texture, depth, stencil);
    initTexture();
  }

  void initTexture() {
    foreach (ref v; _buf)
      v.colorTexture.repeat = Texture.ClampToEdge;
  }

  void fill() {
    Primitive().rectIBO.drawElements(DrawMode.Triangles);
  }

  void assumeResize() {
    if (_resizeCallback) {
      _resizeCallback();
      _resizeCallback = null;
    }
  }

  public:
  /**
   * フレームバッファのリサイズを行います。
   */
  @property void size(Vector2!int s) {
    _resizeCallback = {
      foreach (ref v; _buf) v.size = s;
      initTexture();
    };
  }
}

/**
  * ブラーエフェクトを行うクラスです。$(J PostEffect)をmixinしています。
  * ---
  * auto blur = new BlurEffect(window, 5);
  * ...
  * blur.effect({ ... });
  * ---
  */
class BlurEffect {
  alias ShaderProgram!(
      "attribute vec2 position",
      "attribute vec2 texCoord",
      "uniform sampler2D texture",
      "uniform int type",
      "uniform float[] weight") Program;

  mixin PostEffect!(Program, 2);

  private size_t _len;
  protected float[] _weight;

  /**
   * size, depth, stencil, lenでシェーダを初期化し、eRange, powerでブラーの係数をセットします。
   */
  this(T)(T size, size_t len, float eRange = 100, float power = 1.0,
      Attach depth = Attach.Renderbuffer, Attach stencil = Attach.None) {
    _len = len;
    setGaussianWeight(eRange, power);
    init(vShader, fShader, size, depth, stencil);
    foreach (ref v; _buf)
      v.isClear = true;
  }

  /**
   * ブラーの係数を変更します。
   */
  void setGaussianWeight(float eRange, float power) {
    _weight = new float[](_len);
    float t = 0.0;
    float d = eRange^^2 / 100;
    foreach (i; 0.._len) {
      float r = 1.0 + 2.0*i;
      float w = exp(-0.5 * r^^2 / d);
      _weight[i] = w;
      if (i > 0) w *= 2.0;
      t += w;
    }
    foreach (ref v; _weight) v /= t / power;
  }

  /**
   * fの描画結果にブラーフィルタを実行します。
   */
  void effect(void delegate() f) {
    assumeResize();
    _buf[0].rendering(f);

    _effect.use();
    _effect.uniform!"weight"(_weight);
    _effect.uniform!"texture"(0);

    _buf[1].rendering({
      _buf[0].colorTexture.bind({
        _effect.uniform!"type"(1);
        fill();
      });
    });

    _buf[1].colorTexture.bind({
      capability!"DEPTH_TEST"(false);
      _effect.uniform!"type"(2);
      fill();
    });
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

  @property string fShader() const {
    return q{
      varying vec2 vTexCoord;
      uniform sampler2D texture;
      uniform int type;
      uniform float weight[##];

      void main() {
        vec2 t = vTexCoord / gl_FragCoord.xy;
        vec3 d = texture2D(texture, vTexCoord).rgb;

        int i;
        if (type == 1) {
          d *= weight[0];
          for(i=1; i<##; i++) {
            d += texture2D(texture, vTexCoord + vec2(-float(i), 0.0) * t).rgb * weight[i];
            d += texture2D(texture, vTexCoord + vec2(float(i), 0.0) * t).rgb * weight[i];
          }
        } else if (type == 2) {
          d *= weight[0];
          for(i=1; i<##; i++) {
            d += texture2D(texture, vTexCoord + vec2(0.0, -float(i)) * t).rgb * weight[i];
            d += texture2D(texture, vTexCoord + vec2(0.0, float(i)) * t).rgb * weight[i];
          }
        }
        gl_FragColor = vec4(d.rgb, 1.0);
      }
    }.replace("##", to!string(_len));
  }
}

/**
 * グローフィルタを行うクラスです。$(J BlurEffect)を継承して作られており、インターフェイスは完全に同一です。
 */
class GlowEffect : BlurEffect {
  this(T...)(T args) { super(args); }

  override void effect(void delegate() f) {
    assumeResize();
    _buf[0].rendering(f);

    _effect.use();
    _effect.uniform!"weight"(_weight);
    _effect.uniform!"texture"(0);

    _buf[0].colorTexture.bind({
      _effect.uniform!"type"(0);
      fill();

      _buf[1].rendering({
        _effect.uniform!"type"(1);
        fill();
      });
    });

    blendFunc(BlendMode.Addition);

    _buf[1].colorTexture.bind({
      capability!"DEPTH_TEST"(false);
      _effect.uniform!"type"(2);
      fill();
    });
  }
}

/**
 * 前回の描画結果を保持することで残像を表現します。$(J PostEffect)をmixinしています。
 */
class AfterimageEffect {
  alias ShaderProgram!(
      "attribute vec2 position",
      "attribute vec2 texCoord",
      "uniform float rate",
      "uniform sampler2D texture") Program;

  mixin PostEffect!(Program, 2);

  /**
   * size, depth, stencilでシェーダを初期化します。
   */
  this(T)(T size,
      Attach depth = Attach.Renderbuffer, Attach stencil = Attach.None) {
    init(vShader, fShader, size, depth, stencil);

    foreach (ref v; _buf)
      v.isClear = true;

    _buf[1].rendering({});
  }

  /**
   * 描画結果を保持しているフレームバッファに割り当てられたテクスチャを返します。
   */
  @property inout(Texture) texture() inout {
    return _buf[1].colorTexture;
  }

  /**
   * 保持している描画結果をテクスチャに使用してを現在のバッファ上に描画します。
   */
  void draw() {
    capability!"DEPTH_TEST"(false);
    _effect.use();
    _effect.uniform!"texture"(0);
    _effect.uniform!"rate"(1.0);
    _buf[1].colorTexture.bind(&fill);
  }

  /**
   * 前回の描画結果の上にfの描画結果を重ねます。rateには前回の描画結果にかけあわせる減衰率を渡します。
   */
  void rendering(void delegate() f, float rate = 0.9) {
    assumeResize();

    _buf[0].rendering({
      if (rate != 0) {
        _effect.use();
        _effect.uniform!"texture"(0);
        _effect.uniform!"rate"(rate);
        _buf[1].colorTexture.bind(&fill);
      }

      f();
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
    uniform float rate;
    uniform sampler2D texture;
    varying vec2 vTexCoord;

    void main() {
      gl_FragColor = vec4(
          texture2D(texture, vTexCoord).rgb * rate - vec3(0.005), 1.0);
    }
  };
}

