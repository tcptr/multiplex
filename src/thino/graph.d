module thino.graph;

import opengl.glfw;
version (StbImage) import stb.image;
import thino.opengl;
import thino.math;
import thino.datatype;
import thino.window;
import std.algorithm : max, min;
import std.string : toStringz, split, inPattern;
import std.array : empty, replace;
import std.exception : enforce;
import std.file : read;
import std.conv : to;

/**
 * OpenGLのエラーを取得し、エラーがあれば例外を投げます。
 */
void enforceGL(lazy string msg = "") {
  auto e = glGetError();
  enforce(e == GL_NO_ERROR, msg ~ e.to!string());
}

private mixin template InvariantGL() {
  invariant() {
    auto e = glGetError();
    assert(e == GL_NO_ERROR, to!string(e));
  }
}

/**
 * GL_XXX_BUFFER_BITを表現します。
 */
enum BufferMask {
  ///
  Color = GL_COLOR_BUFFER_BIT,
  /// ditto
  Depth = GL_DEPTH_BUFFER_BIT,
  /// ditto
  Stencil = GL_STENCIL_BUFFER_BIT,
  /// ditto
  All = Color|Depth|Stencil
}

/**
 * 画面/フレームバッファをクリアします。
 * ---
 * clearBuffer(BufferMask.All);
 * ---
 * は
 * ---
 * glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT|GL_STENCIL_BUFFER_BIT);
 * ---
 * と同等です。
 */
void clearBuffer(BufferMask mask) {
  glClear(mask);
}

/**
 * 頂点の扱い方を指定します。
 * GL_XXXに対応します。
 */
enum DrawMode {
  ///
  Points = GL_POINTS,
  /// ditto
  Lines = GL_LINES,
  /// ditto
  LineLoop = GL_LINE_LOOP,
  /// ditto
  LineStrip = GL_LINE_STRIP,
  /// ditto
  Triangles = GL_TRIANGLES,
  /// ditto
  TriangleStrip = GL_TRIANGLE_STRIP,
  /// ditto
  TriangleFan = GL_TRIANGLE_FAN,
  /// ditto
  Quads = GL_QUADS // deperecated
}

/**
 * シェーダの種類を指定します。
 * See_Also: $(J Shader)
 */
enum ShaderType {
  /// 頂点シェーダ。
  Vertex   = GL_VERTEX_SHADER,
  /// フラグメントシェーダ。
  Fragment = GL_FRAGMENT_SHADER
}

/**
 * バッファの使用法を指定します。これはOpenGLに与えられる最適化のヒントで、
 * 実際には何の影響を及ぼさないかもしれません。GL_XXX_DRAWに対応します。
 */
enum BufferType {
  /// データは一度だけ変更され何度も使用されます。
  Static  = GL_STATIC_DRAW,
  /// データは何度も変更され何度も使用されます。
  Dynamic = GL_DYNAMIC_DRAW,
  /// データは一度だけ変更されいくらか使用されます。
  Stream  = GL_STREAM_DRAW
}

/**
 * 色合成の方法を指定します。
 */
enum BlendMode {
  /// {GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA}
  Normal,
  /// {GL_SRC_ALPHA, GL_ONE}
  Addition,
  /// {GL_ZERO, GL_SRC_COLOR}
  Multiply,
  /// {GL_ONE_MINUS_DST_COLOR, GL_ONE}
  Screen,
  /// {GL_ONE, GL_ZERO}
  Overwrite
}

/**
 * glBlendFuncへのユーティリティ関数です。
 */
void blendFunc(BlendMode type) {
  final switch(type) {
  case BlendMode.Normal:
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    break;
  case BlendMode.Addition:
    glBlendFunc(GL_SRC_ALPHA, GL_ONE);
    break;
  case BlendMode.Multiply:
    glBlendFunc(GL_ZERO, GL_SRC_COLOR);
    break;
  case BlendMode.Screen:
    glBlendFunc(GL_ONE_MINUS_DST_COLOR, GL_ONE);
    break;
  case BlendMode.Overwrite:
    glBlendFunc(GL_ONE, GL_ZERO);
    break;
  }
}

/**
 * glEnable/glDisableへのユーティリティ関数です。以下と同等です。
 * ---
 * (op ? &glEnable : &glDisable)(GL_name)
 * ---
 */
void capability(string name)(bool op) {
  mixin("(op ? &glEnable : &glDisable)(GL_" ~ name ~ ");");
}

/**
 * glLineWidthと同等。
 */
void lineWidth(float v) {
  glLineWidth(v);
}

private string shaderInfoLog(GLuint id, lazy string alternative = "") {
  int len, real_len;
  glGetShaderiv(id, GL_INFO_LOG_LENGTH, &len);
  if (len > 1) {
    char[] buf = new char[len];
    glGetShaderInfoLog(id, len, &real_len, &buf[0]);
    return buf[0..real_len-1].idup;
  }
  return alternative;
}

/**
 * 描画対象となるオブジェクトの基底クラスです。
 */
abstract class RenderTarget {
  protected:
  bool _isClear;
  Vec4 _clearColor = Vec4(0);
  Vector2!int _size;
  Mat4 _fixedMatrix;

  public:
  @property {
    /**
     * 画面の消去に使う色を取得/セットします。
     * 初期値はVec4(0, 0, 0, 0)です。
     * Note:
     *   実際にはrendering開始時にglClearColorに指定するのみです。
     */
    Vec4 clearColor() const {
      return _clearColor;
    }

    /// ditto
    void clearColor(Vec4 v) {
      _clearColor = v;
    }

    /**
     * rendering開始時に自動でglClearを呼び出すか指定します。
     */
    bool isClear() const {
      return _isClear;
    }

    /// ditto
    void isClear(bool v) {
      _isClear = v;
    }

    /**
     * 描画領域の実サイズを取得/セットします。
     */
    Vector2!int size() const {
      return _size;
    }

    /// ditto
    void size(Vector2!int v) {
      _size = v;
      _fixedMatrix = Mat4.ortho(0, v.x, v.y, 0, -1, 1);
    }

    /**
     * 左上を(0,0), 右下を(size.x, size.y)とした正射影の行列を返します。
     */
    Mat4 fixedMatrix() const {
      return _fixedMatrix;
    }

    /**
     * size.x / size.yを返します。
     */
    float aspect() const {
      return _size.x / cast(float)(_size.y);
    }
  }

  /**
   * 描画対象を自分にセットして与えられたデリゲートを呼び出します。
   */
  abstract void rendering(void delegate());
}

/**
 * HSVで色を表現します。
 */
struct HSV {
  /// 3要素。
  int H;
  /// ditto
  float S, V;

  /**
   * RGB色空間へ変換します。
   */
  Vec3 toRGB() {
    int Hi = (H/60)%6;
    float f = (H%360)/60.0 - Hi;
    float p = V*(1 - S), q = V*(1 - f*S), t = V*(1 - (1 - f)*S);

    float r, g, b;
    switch (Hi) {
      case 0: r = V; g = t; b = p; break;
      case 1: r = q; g = V; b = p; break;
      case 2: r = p; g = V; b = t; break;
      case 3: r = p; g = q; b = V; break;
      case 4: r = t; g = p; b = V; break;
      case 5: r = V; g = p; b = q; break;
      default: r = g = b = V;
    }
    return Vec3(r, g, b);
  }

  /**
   * RGBで表された色からHSVを計算します。
   */
  static HSV fromRGB(Vec3 data) {
    float max = max(data.r, data.g, data.b),
          min = min(data.r, data.g, data.b);

    int H;
    float S = 0, V;

    if (max != min) {
      H = to!int(
          (max == data.r) ? 60 * (data.g - data.b) / (max - min) :
          (max == data.g) ? 60 * (data.b - data.r) / (max - min) + 120 :
                            60 * (data.r - data.g) / (max - min) + 240);
      if (H < 0) H += 360;
    }

    if (max != 0)
      S = (max - min) / max;
    V = max;

    return HSV(H, S, V);
  }
}

/**
 * OpenGLのテクスチャのラッパーです。
 * ---
 * auto tex = new Texture("sample.tga");
 * tex.bind({ ... });
 * ---
 */
class Texture {
  mixin InvariantGL;

  /**
   * GLFWでのtgaの読み込みに使用するオプションです。
   */
  enum OriginDownLeft = 0;
  /// ditto
  enum OriginUpLeft   = GLFW_ORIGIN_UL_BIT;
  /// ditto
  enum BuildMipmaps   = GLFW_BUILD_MIPMAPS_BIT;
  /// ditto
  enum AlphaMap       = GLFW_ALPHA_MAP_BIT;

  /**
   * テクスチャのリピートの方法指定に使用するオプションです。
   */
  enum Repeat = GL_REPEAT;
  /// ditto
  enum MirroredRepeat = GL_MIRRORED_REPEAT;
  /// ditto
  enum ClampToEdge = GL_CLAMP_TO_EDGE;

  private:
  GLuint _id;
  static GLenum _prevUnit = GL_TEXTURE0;
  Vector2!int _size;

  public:
  @property {
    /**
     * テクスチャのサイズを取得します。
     */
    Vector2!int size() const {
      return _size;
    }
  }

  this() {
    glGenTextures(1, &_id);
    enforceGL("glGenTextures() failed: ");
  }

  /**
   * テクチャを作成し、sizeで2Dテクスチャを設定します。
   * $(J Framebuffer)がこれを使用しています。
   */
  this(Vector2!int size) {
    this();
    _size = size;
    on();
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, size.x, size.y,
        0, GL_RGBA, GL_UNSIGNED_BYTE, null);
    enforceGL("glTexImage2D() failed: ");
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    off();
  }

  /**
   * filenameを読み込んで2Dテクスチャを作成、設定します。
   * 画像の読み込みにはglfwLloadTexture2Dをそのまま使用します。
   * この関数はtga形式にのみ対応しています。
   * Note:
   *   GLFW 3.0でこの関数は消去されるようなので、
   *   将来的に対応形式などが変わる可能性があります。
   * version=StbImageではstb_image.cを使用します。
   */
  this(string filename, int flags = OriginDownLeft) {
    this();
    on();

    version (StbImage) {
      int width, height, bpp;

      ubyte* pixels = stbi_load(filename.toStringz(), &width, &height, &bpp, 4);
      enforce(pixels, "cannot load image: " ~ filename);

      _size = Vector2!int(width, height);

      glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
      glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height,
          0, GL_RGBA, GL_UNSIGNED_BYTE, pixels);
      stbi_image_free(pixels);
    } else {
      GLFWimage img;
      enforce(glfwReadImage(filename.toStringz(), &img, flags) == GL_TRUE,
          "cannot load image: " ~ filename);
      scope (exit) glfwFreeImage(&img);

      _size = Vector2!int(img.Width, img.Height);

      glfwLoadTextureImage2D(&img, flags);
    }

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    off();
  }

  ~this() {
    glDeleteTextures(1, &_id);
  }

  /**
   * テクスチャをどのように繰り返すか指定します。
   */
  @property void repeat(GLenum k) {
    on();
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, k);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, k);
    off();
  }

  /**
   * テクスチャをunitにバインドしてfを呼び出します。その後バインドを解除します。
   */
  void bind(void delegate() f, GLenum unit = GL_TEXTURE0) const {
    on(unit);
    f();
    off();
  }

  private void on(GLenum unit = GL_TEXTURE0) const {
    if (unit != _prevUnit) {
      _prevUnit = unit;
      glActiveTexture(unit);
    }
    glBindTexture(GL_TEXTURE_2D, _id);
  }

  private static void off() {
    glBindTexture(GL_TEXTURE_2D, 0);
  }
}

/**
 * OpenGLのシェーダのラッパーです。$(J ShaderProgram)に渡します。
 * ---
 * auto vtx = new Shader(ShaderType.Vertex, "foo.vsh");
 * auto frg = new Shader(ShaderType.Fragment, "foo.fsh");
 * program = new FooProgram(vtx, frg);
 * ---
 */
class Shader {
  mixin InvariantGL;

  private GLuint _id;

  /**
   * シェーダを作成します。textがファイル名がプログラムの文字列か判断して読み込みます。
   * ファイル名かどうかの判断には単に改行文字が含まれるかで行われます。
   * See_Also: $(J ShaderType)
   */
  this(ShaderType type, string text) {
    _id = glCreateShader(type);
    if ('\n'.inPattern(text)) {
      setSource(text);
    } else {
      setSource(cast(string)read(text));
    }
  }

  ~this() {
    glDeleteShader(_id);
  }

  private void setSource(string buf) {
    auto fst = &buf[0];
    int len = cast(int)buf.length;
    glShaderSource(_id, 1, &fst, &len);
    glCompileShader(_id);

    int compiled;
    glGetShaderiv(_id, GL_COMPILE_STATUS, &compiled);
    enforce(compiled == GL_TRUE,
        shaderInfoLog(_id, "glCompileShader() failed"));
  }
}

/**
 * ---
 * alias ShaderProgram!(
 *     "attribute vec3 position",
 *     "attribute vec4 color",
 *     "uniform mat4 pvmMatrix") FooProgram;
 * ...
 * auto vtx = new Shader(ShaderType.Vertex, "foo.vsh");
 * auto frg = new Shader(ShaderType.Fragment, "foo.fsh");
 * auto program = new FooProgram(vtx, frg);
 * auto binder = program.new AttributeBinder;
 * 
 * binder.position.bindData(...);
 * binder.color.bindData(...);
 * ...
 * program.use();
 * program.uniform!"pvmMatrix"(Mat4....);
 * ...
 * binder.use();
 * binder.draw(DrawMode.Triangles);
 * ---
 * OpenGLのシェーダによるパイプライン処理のラッパーです。
 * locationsに与えられた情報を元に、各種uniform変数へのバインド関数や、
 * attribute変数をまとめて扱う$(J AttributeBinder)をネストクラスとして作成します。
 * 通常は例のようにaliasを付けて使用します。
 *
 * locationsの先頭にbool値を渡すことで、変数位置の取得を厳格に行うか指定できます。
 * このbool値がtrueのとき、locationsの変数が全て取得できていることを強制します(デフォルトの挙動)。
 * このbool値がfalseのとき、取得できない変数は無視されます。
 *
 */
class ShaderProgram(locations ...) {
  mixin InvariantGL;

  private GLuint _program;

  // for ddoc
  static if (locations.length == 0) {
    /**
     * attrib変数をまとめて扱うクラスです。version=VAOではOpenGLのVAOのラッパーとなります。
     * locationsに与えられた情報に基づいたVBOをメンバ変数として保持します。
     * 上のFooProgramの例では、以下をメンバ変数として保持します。
     * ---
     * VBO!(float, 3) position;
     * VBO!(float, 4) color;
     * ---
     * Note: 現在のところ複数のAttributeBinderでVBOを共有することはできません。
     */
    class AttributeBinder {
      /**
       * locationsに基づきVBOを作成します。
       */
      this() {}

      /**
       * $(J VBO)をバインドします。
       */
      void use() const {}

      /**
       * と同等です。ただし、lengthにはAttributeBinderが保持しているVBOのうち先頭のもののlengthを使用します。
       * 通常は、描画を実行する際にはこのメソッドか$(J IBO).drawElementsを呼び出すことになるでしょう。
       * ---
       * glDrawArrays(mode, 0, length);
       * ---
       */
      void draw(DrawMode mode) const {}
    }

  } else static if (locations.length && is(typeof(locations[0]) == bool)) {
    enum Strict = locations[0];
    mixin(locationHandlerGen(locations[1..$]));

  } else {
    enum Strict = true;
    mixin(locationHandlerGen(locations));
  }

  private static string locationHandlerGen(string ls[] ...) {
    immutable all = q{
      #locationDeclaration
      #uniformBinder

      private void initLocation() {
        #locationInitializer
      }

      class AttributeBinder {
        #vboDeclaration

        this() {
          #vboInitializer
          enforceGL("AttributeBinder.this() failed: ");
        }

        ~this() {
          #vaoDestructor
        }

        void draw(DrawMode mode) const {
          glDrawArrays(mode, 0, cast(int)#first.length);
        }

        void use() const {
          #attribBinder
        }

        // glBindVertexArray(0);
      }
    };

    // #qualifier #name
    immutable locationDeclarationGen = q{
      private GLuint #qualifier_#name;
    };

    // #name #func
    immutable uniformBinderGen = q{
      void uniform(string s, T...)(T args) if (s == "#name") {
        static if (!Strict)
          if (uniform_#name == -1) return;
        #func(uniform_#name, args);
      }
    };

    // #name
    immutable locationInitializerGen_attrib = q{
      attrib_#name = glGetAttribLocation(_program, toStringz("#name"));
      static if (Strict)
        enforce(attrib_#name != -1, "glGetAttribLocation #name failed");
    };

    // #name
    immutable locationInitializerGen_uniform = q{
      uniform_#name = glGetUniformLocation(_program, toStringz("#name"));
      static if (Strict)
        enforce(uniform_#name != -1, "glGetUniformLocation #name failed");
    };

    // #name #type #size
    immutable vboDeclarationGen = q{
      VBO!(#type, #size) #name;
    };

    // #name #type #size
    immutable vboInitializerGen = q{
      #name = new VBO!(#type, #size);
    };

    // #name #size #enum
    immutable attribBinderGen = q{
      if (attrib_#name != -1) {
        #name.on();
        glVertexAttribPointer(attrib_#name, #size, #enum, GL_FALSE, 0, null);
        glEnableVertexAttribArray(attrib_#name);
      }
    };

    string
        locationDeclaration, // シェーダ変数の位置変数の宣言
        uniformBinder,       // uniform変数のバインド
        locationInitializer, // シェーダ変数への位置の取得
        vboDeclaration,      // VBO/VAOの宣言
        vboInitializer,      // VBO/VAOの初期化
        vaoDestructor,       // デストラクタでのVAOの解放
        attribBinder,        // VBOのバインド
        first;               // 先頭のVBO

    version (VAO) {
      vboDeclaration = "GLuint vao;";
      vaoDestructor = "glDeleteVertexArrays(1, &vao);";
    }

    immutable sizes = [
      "float": "1",
      "vec2": "2",
      "vec3": "3",
      "vec4": "4",
    ];

    immutable uniforms = [
      "mat4": "uniformMat4",
      "vec2": "uniformVec2",
      "vec3": "uniformVec3",
      "vec4": "uniformVec4",
      "sampler2D": "uniformInt",
      "int": "uniformInt",
      "float": "uniformFloat",
      "float[]": "uniformFloatArray",
    ];

    foreach (val; ls) {
      string[] d = val.split();

      switch (d[0]) {
      case "attribute":
        assert(d[1] in sizes, "undefined variable type: " ~ d[1]);
        if (first.empty) first = d[2];

        locationDeclaration ~= locationDeclarationGen
            .replace("#qualifier", "attrib").replace("#name", d[2]);

        locationInitializer ~= locationInitializerGen_attrib
            .replace("#name", d[2]);

        vboDeclaration ~= vboDeclarationGen
            .replace("#name", d[2])
            .replace("#type", "float").replace("#size", sizes[d[1]]);

        vboInitializer ~= vboInitializerGen
            .replace("#name", d[2])
            .replace("#type", "float").replace("#size", sizes[d[1]]);

        attribBinder ~= attribBinderGen
            .replace("#name", d[2])
            .replace("#size", sizes[d[1]]).replace("#enum", "GL_FLOAT");
        break;

      case "uniform":
        assert(d[1] in uniforms, "undefined variable type: " ~ d[1]);

        locationDeclaration ~= locationDeclarationGen
            .replace("#qualifier", "uniform").replace("#name", d[2]);

        locationInitializer ~= locationInitializerGen_uniform
            .replace("#name", d[2]);

        uniformBinder ~= uniformBinderGen
            .replace("#name", d[2]).replace("#func", uniforms[d[1]]);

        break;

      default:
        assert(0, "invalid variable quailifier type: " ~ d[0]);
      }
    }

    version (VAO) {
      vboInitializer ~= q{
        glGenVertexArrays(1, &vao);
        glBindVertexArray(vao);
        #attribBinder
        glBindVertexArray(0);
      }.replace("#attribBinder", attribBinder);

      attribBinder = "glBindVertexArray(vao);";
    }

    assert(!first.empty, "attribute variable not found");
    return all
        .replace("#locationDeclaration", locationDeclaration)
        .replace("#uniformBinder", uniformBinder)
        .replace("#locationInitializer", locationInitializer)
        .replace("#vboDeclaration", vboDeclaration)
        .replace("#vboInitializer", vboInitializer)
        .replace("#vaoDestructor", vaoDestructor)
        .replace("#attribBinder", attribBinder)
        .replace("#first", first);
  }

  /**
   * 二つのShaderを用いてシェーダプログラムを作成します。その後はlocationsに基づき、
   * glGetUniformLocation/glGetAttribLocationによって各種変数の位置を取得します。
   */
  this(Shader vtx, Shader frg) {
    _program = glCreateProgram();
    enforce(_program, "glCreateProgram() failed");

    glAttachShader(_program, vtx._id);
    glAttachShader(_program, frg._id);
    glLinkProgram(_program);

    int linked;
    glGetProgramiv(_program, GL_LINK_STATUS, &linked);
    enforce(linked == GL_TRUE,
        shaderInfoLog(_program, "glLinkProgram() failed"));

    initLocation();
  }

  ~this() {
    glDeleteProgram(_program);
  }

  /**
   * シェーダプログラムを使用します。
   */
  void use() const {
    glUseProgram(_program);
  }

  /**
   * glUseProgram(0);と同等で、旧式の固定パイプラインによる処理に切り替えます。
   * シェーダプログラムは通常解除する必要がないので、描画が終わった後に毎回これを呼ぶ必要はありません。
   */
  static void useFixedPipeline() {
    glUseProgram(0);
  }

  private alias typeof(this) Program;

  /**
   * locationsに基づきコンパイル時に生成される関数です。
   * uniform変数のvariableNameに値をセットします。
   * uniform変数の型はmat4, vec2, vec3, vec4, sampler2D, int, float, float[]をサポートしています。
   */
  void uniform(string variableName, T)(T v) if (0) {
  }

  /**
   * ---
   * alias ShaderProgram!(
   *     "attribute vec3 position",
   *     "attribute vec4 color",
   *     "uniform mat4 pvmMatrix") FooProgram;
   * ...
   * auto foo = FooProgram.createAdapter("foo.vsh", "foo.fsh");

   * foo.position.bindData(...);
   * foo.color.bindData(...);
   * ...
   * foo.use();
   * foo.uniform!"pvmMatrix"(...);
   * ...
   * foo.draw(DrawMode.Triangles);
   * ---
   * 上の例は、$(J ShaderProgram)と同じ操作をAdapterで書き直したものです。 このような、
   * 描画の際に単一の$(J AttributeBinder)のみを使用する場合に有用な構造体です。
   * ShaderProgramとそのAttributeBinderを一つ保持し、共通のインターフェイスを持ちます。
   */
  struct Adapter {
    /**
     * 保持している$(J ShaderProgram)と$(J AttributeBinder)です。
     * binderはalias thisされているため、どちらも構造体から直接アクセスできます。
     */
    Program program;
    /// ditto
    Program.AttributeBinder binder;

    alias binder this;

    /**
     * programとbinderを使用します。
     */
    void use() const {
      program.use();
      binder.use();
    }

    /**
     * 保持している$(J ShaderProgram)に委譲します。
     */
    void uniform(string s, T...)(T args) {
      program.uniform!s(args);
    }

    T opCast(T)() const if (is(T == bool)) {
      return program !is null;
    }
  }

  /**
   * vShaderからVertexシェーダを、fShaderからFragmentシェーダを生成し、
   * それらを用いてShaderProgramとそのAttributeBinderを一つ生成しAdapterとして返します。
   * See_Also: $(J Adapter)
   */
  static Adapter createAdapter(string vShader, string fShader) {
    auto vtx = new Shader(ShaderType.Vertex, vShader);
    auto frg = new Shader(ShaderType.Fragment, fShader);
    auto program = new Program(vtx, frg);
    auto binder = program.new AttributeBinder;

    return Adapter(program, binder);
  }
}

/**
 * OpenGLのバッファオブジェクトのラッパーです。
 * $(J VBO), $(J IBO)クラスにmixinされており、通常は直接使用しません。
 * BUFFERはバッファの種類を、Tはバッファが保持する値の型を、Nは一頂点あたりの情報数を表します。
 */
mixin template BufferObject(GLuint BUFFER, T, size_t N) {
  mixin InvariantGL;

  // T[N] * _current
  private:
  GLuint _object;
  size_t _reserved, _current;
  bool _initialized = false;

  public:
  /**
   * BufferObjectでは、バッファを[x, y, z, x, y, z ...]のような平坦な
   * 配列として扱います。そのような配列へのポインタを安全に扱う構造体です。
   * See_Also: $(J RectangularPointer)
   */
  alias RectangularPointer!(T, N) Map;

  /**
   * バッファを作成します。
   * dataとtypeが与えられていれば、bindDataを用いてセットします。
   */
  this() {
    glGenBuffers(1, &_object);
    enforceGL("glGenBuffers() failed: ");
  }

  /// ditto
  this(in T[] data, BufferType type = BufferType.Static) {
    this();
    bindData(data, type);
  }

  ~this() {
    glDeleteBuffers(1, &_object);
  }

  private void on() const {
    glBindBuffer(BUFFER, _object);
  }

  private static void off() {
    glBindBuffer(BUFFER, 0);
  }

  /**
   * 現在使用しているバッファ領域の頂点数を返します。
   * すなわち、実際に使用しているバッファのサイズはlength * N * T.sizeofとなります。
   */
  @property size_t length() const {
    return _current;
  }

  /**
   * lengthをlenとします。
   * バッファのサイズが足りないとき、typeに基づき新たにバッファ領域を確保します。
   * このとき、再確保の頻度を減らすためにいくらか余分に領域を確保します。
   * typeは再確保が必要なければ無視されます。
   * Note: 既存のバッファ領域のデータは保証されません。
   */
  void setLength(size_t len, BufferType type = BufferType.Dynamic) {
    _current = len;
    if (_reserved < _current || !_initialized) {
      do {
        _reserved += _reserved/2 + 1;
      } while (_reserved < _current);
      on();
      glBufferData(BUFFER,
          _reserved * N * T.sizeof, null, type);
      off();
      _initialized = true;
    }
  }

  /**
   * バッファ領域にdataをセットします。lengthはdata.length / Nとなります。
   * 現在のバッファのサイズに収まらない場合には、setLengthと同様に領域を確保します。
   * typeは再確保が必要なければ無視されます。
   */
  void bindData(in T[] data, BufferType type = BufferType.Static) {
    _current = data.length / N;
    on();
    if (_reserved < _current || !_initialized) {
      do {
        _reserved += _reserved/2 + 1;
      } while (_reserved < _current);
      glBufferData(BUFFER,
          _reserved * N * T.sizeof, null, type);
      _initialized = true;
    }
    subData(data, 0);
    off();
    enforceGL("BufferObject.bindData() failed: ");
  }

  private void subData(in T[] data, size_t begin) {
    glBufferSubData(BUFFER, begin * N * T.sizeof,
        data.length * T.sizeof, data.ptr);
  }

  /**
   * バッファをバインドし、バッファへの変更を行うデリゲートをfに渡して実行します。
   * その後バインドを解除します。
   * 渡されたデリゲートを呼び出すと, begin番目の頂点にあたる領域からdataをセットします。
   * TODO: バッファ領域に収まらないときの挙動
   */
  void modifySubData(void delegate(void delegate(in T[] data, size_t begin)) f) {
    assert(_initialized);
    on();
    f(&subData);
    off();
  }

  /**
   * バッファをバインドし、バッファ領域をメモリ空間にマップし、
   * fにそのRectangularPointerを与えて実行します。その後バインドを解除します。
   * See_Also: $(J RectangularPointer)
   */
  void modifyMapBuffer(void delegate(Map) f) {
    assert(_initialized);
    on();
    auto p = cast(T*)glMapBuffer(BUFFER, GL_WRITE_ONLY);
    enforceGL("glMapBuffer() failed: ");
    f(Map(p, _current));
    glUnmapBuffer(BUFFER);
    off();
  }
}

/**
 * OpenGLのVBOのラッパーです。現在は以下のようにmixinしているのみです。
 * $(J ShaderProgram).$(J AttributeBinder)によって自動的に生成されます。
 * ---
 * mixin BufferObject!(GL_ARRAY_BUFFER, T, N);
 * ---
 */
class VBO(T, size_t N) {
  mixin BufferObject!(GL_ARRAY_BUFFER, T, N);
}

/**
 * ---
 * ibo = new IBO!ubyte([0,1,2,2,3,0]);
 * ...
 * program.use();
 * ...
 * binder.use();
 * ibo.drawElements(DrawMode.Lines);
 * ---
 * OpenGLのIBOのラッパーです。$(J BufferObject)を以下のようにmixinしています。
 * ---
 * mixin BufferObject!(GL_ELEMENT_ARRAY_BUFFER, T, 1);
 * ---
 */
class IBO(T) {
  mixin BufferObject!(GL_ELEMENT_ARRAY_BUFFER, T, 1);

  /**
   * 自身の保持するデータとその長さに基づいて、 glDrawElementsをmodeで呼び出します。
   * 通常は、描画を実行する際にはこのメソッドかAttributeBinderのインスタンスのdrawを呼び出すことになるでしょう。
   */
  void drawElements(DrawMode mode) const {
    on();
    glDrawElements(mode, cast(int)_current, EnumByType!T, null);
    off();
  }

  private template EnumByType(T : ubyte) {
    enum EnumByType = GL_UNSIGNED_BYTE;
  }
  private template EnumByType(T : ushort) {
    enum EnumByType = GL_UNSIGNED_SHORT;
  }
  private template EnumByType(T : uint) {
    enum EnumByType = GL_UNSIGNED_INT;
  }
}

/**
 * プリミティブな描画を行うクラスです。$(J Singleton)です。
 * ---
 * Primitive().draw(window.fixedMatrix, Vec4(1, 1, 1, 1),
 *     [100,0,0, 0,100,0, -100,0,0, 0,-100,0], DrawMode.LineLoop);
 * ---
 */
class Primitive {
  mixin Singleton;
  mixin InvariantGL;

  // TODO プログラム一つに
  alias ShaderProgram!(
      "attribute vec3 pos",
      "uniform mat4 pvmMatrix",
      "uniform vec4 color") Program;

  alias ShaderProgram!(
      "attribute vec3 pos",
      "attribute vec2 texCoord",
      "uniform sampler2D texture",
      "uniform mat4 pvmMatrix",
      "uniform vec4 color") ProgramTex;

  private:
  Program.Adapter _program;
  ProgramTex.Adapter _programTex;
  IBO!ubyte _rectIBO;

  this() {
    _program = Program.createAdapter(vShader, fShader);
    _programTex = ProgramTex.createAdapter(vShaderTex, fShaderTex);
    _programTex.texCoord.bindData([0,0, 1,0, 1,1, 0,1]);
    _rectIBO = new IBO!ubyte([0,1,2, 2,3,0]);
  }

  public:
  @property {
    /**
     * 内部で使用している$(J ShaderProgram)のインスタンスを返します。
     */
    Program.Adapter program() {
      return _program;
    }

    /// ditto
    ProgramTex.Adapter programTex() {
      return _programTex;
    }

    /**
     * 内部で使用している四角形のためのIBOを返します。
     * ---
     * new IBO!ubyte([0,1,2, 2,3,0])
     * ---
     */
    IBO!ubyte rectIBO() {
      return _rectIBO;
    }
  }

  private void setup(Mat4 pvmMatrix, Vec4 color, in float[] pos) {
    _program.use();
    _program.uniform!"pvmMatrix"(pvmMatrix);
    _program.uniform!"color"(color);
    _program.pos.bindData(pos, BufferType.Dynamic);
  }

  private void setupTex(Mat4 pvmMatrix, Vec4 color, in float[] pos) {
    _programTex.use();
    _programTex.uniform!"pvmMatrix"(pvmMatrix);
    _programTex.uniform!"color"(color);
    _programTex.uniform!"texture"(0);
    _programTex.pos.bindData(pos, BufferType.Dynamic);
  }

  /**
   * 与えられた情報に基づきプリミティブな図形を描画します。
   * posは[x,y,z,x,y,z...]の配列です。
   */
  void draw(Mat4 pvmMatrix, Vec4 color, in float[] pos, DrawMode mode) {
    setup(pvmMatrix, color, pos);
    _program.draw(mode);
  }

  /**
   * drawと同様ですが、$(J AttributeBinder).drawではなくibo.drawElementsで描画を実行します。
   */
  void drawElements(T)(Mat4 pvmMatrix, Vec4 color,
      in float[] pos, in IBO!T ibo, DrawMode mode) {
    setup(pvmMatrix, color, pos);
    ibo.drawElements(mode);
  }

  /**
   * 四角形描画のためのショートカットです。頂点のインデックス[0,1,2, 2,3,0]でTrianglesで描画するのと同等です。
   */
  void drawQuad(Mat4 pvmMatrix, Vec4 color, in float[] pos) {
    setup(pvmMatrix, color, pos);
    _rectIBO.drawElements(DrawMode.Triangles);
  }

  /**
   * 矩形描画のためのショートカットです。左上をposとした大きさsizeの矩形を描画します。
   */
  void drawRect(Mat4 pvmMatrix, Vec4 color, Vec2 pos, Vec2 size) {
    setup(pvmMatrix, color, [pos.x, pos.y+size.y, 0, pos.x+size.x, pos.y+size.y, 0,
        pos.x+size.x, pos.y, 0, pos.x, pos.y, 0]);
    _rectIBO.drawElements(DrawMode.Triangles);
  }

  /**
   * drawQuadのテクスチャを貼る版です。順に、(0,1), (1,1), (1,0), (0,0)が割り当てられます。
   */
  void drawTextureQuad(Mat4 pvmMatrix, Vec4 color,
      in Texture texture, in float[] pos) {
    setupTex(pvmMatrix, color, pos);
    texture.bind({ _rectIBO.drawElements(DrawMode.Triangles); });
  }

  /**
   * drawRectのテクスチャを貼る版です。drawTextureQuadと同様にテクスチャが割り当てられます。
   * Note: テクスチャ座標はWindow.fixedMatrixに合わせた向きで割り当てられます。
   */
  void drawTextureRect(Mat4 pvmMatrix, Vec4 color,
      in Texture texture, Vec2 pos, Vec2 size) {
    setupTex(pvmMatrix, color, [pos.x, pos.y+size.y, 0, pos.x+size.x, pos.y+size.y, 0,
        pos.x+size.x, pos.y, 0, pos.x, pos.y, 0]);
    texture.bind({ _rectIBO.drawElements(DrawMode.Triangles); });
  }

  private:
  enum vShader = q{
    attribute vec3 pos;
    uniform mat4 pvmMatrix;

    void main() {
      gl_Position = pvmMatrix * vec4(pos, 1.0);
    }
  };

  enum fShader = q{
    uniform vec4 color;

    void main() {
      gl_FragColor = color;
    }
  };

  enum vShaderTex = q{
    attribute vec3 pos;
    attribute vec2 texCoord;
    varying vec2 vTexCoord;
    uniform mat4 pvmMatrix;

    void main() {
      gl_Position = pvmMatrix * vec4(pos, 1.0);
      vTexCoord = texCoord;
    }
  };

  enum fShaderTex = q{
    varying vec2 vTexCoord;
    uniform sampler2D texture;
    uniform vec4 color;

    void main() {
      gl_FragColor = texture2D(texture, vTexCoord) * color;
    }
  };
}

/**
 * $(J Framebuffer)に割り当てるバッファの種類を表します。
 */
enum Attach {
  /// テクスチャ。Framebufferから取得して使用することができます。
  Texture,
  /// レンダーバッファ。
  Renderbuffer,
  /// 何も割り当てない。
  None
}

private class Renderbuffer {
  mixin InvariantGL;

  private GLuint _renderbuffer;
  alias _renderbuffer this;

  this (Vector2!int size, GLenum target) {
    glGenRenderbuffers(1, &_renderbuffer);
    enforceGL("glGenRenderbuffers() failed: ");

    glBindRenderbuffer(GL_RENDERBUFFER, _renderbuffer);
    glRenderbufferStorage(GL_RENDERBUFFER, target, size.x, size.y);
    enforceGL("glRenderbufferStorage() failed: ");
    glBindRenderbuffer(GL_RENDERBUFFER, 0);
  }

  ~this() {
    glDeleteRenderbuffers(1, &_renderbuffer);
  }
}

/**
 * OpenGLのフレームバッファのラッパーです。
 * See_Also: $(J RenderTarget)
 */
class Framebuffer : RenderTarget {
  mixin InvariantGL;

  private:
  GLuint _framebuffer;

  static struct Storage {
    Attach attach;
    union {
      Texture texture;
      Renderbuffer renderbuffer;
    }

    this(Attach a, Vector2!int size, GLenum target) {
      attach = a;

      final switch (attach) {
      case Attach.Texture:
        texture = new Texture(size);
        break;

      case Attach.Renderbuffer:
        renderbuffer = new Renderbuffer(size, target);
        break;

      case Attach.None:
      }
    }

    void bind(GLenum target) {
      final switch (attach) {
      case Attach.Texture:
        glFramebufferTexture2D(GL_FRAMEBUFFER, target,
            GL_TEXTURE_2D, texture._id, 0);
        break;

      case Attach.Renderbuffer:
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, target,
            GL_RENDERBUFFER, renderbuffer);
        break;

      case Attach.None:
      }
    }

    inout(Texture) getTexture() inout {
      assert(attach == Attach.Texture, "texture is not attached");
      return texture;
    }
  }

  Storage _color, _depth, _stencil;

  public:
  @property {
    override Vector2!int size() const {
      return super.size;
    }

    override void size(Vector2!int v) {
      super.size = v;

      _color = Storage(_color.attach, _size, GL_RGBA4);
      _depth = Storage(_depth.attach, _size, GL_DEPTH_COMPONENT16);
      _stencil = Storage(_stencil.attach, _size, GL_STENCIL_INDEX8);

      rendering({
        _color.bind(GL_COLOR_ATTACHMENT0);
        _depth.bind(GL_DEPTH_ATTACHMENT);
        _stencil.bind(GL_STENCIL_ATTACHMENT);
      });
    }

    /**
     * それぞれの用途に使用されているテクスチャを返します。
     */
    inout(Texture) colorTexture() inout {
      return _color.getTexture();
    }

    /// ditto
    inout(Texture) depthTexture() inout {
      return _depth.getTexture();
    }

    /// ditto
    inout(Texture) stencilTexture() inout {
      return _stencil.getTexture();
    }
  }

  /**
   * フレームバッファを作成し、color, depth, stencilに従ってバッファを作成し割り当てます。
   */
  this(Vector2!int size, Attach color = Attach.Texture,
      Attach depth = Attach.Renderbuffer, Attach stencil = Attach.None) {
    glGenFramebuffers(1, &_framebuffer);
    _color.attach = color;
    _depth.attach = depth;
    _stencil.attach = stencil;

    this.size = size;
  }

  /// ditto
  this(Window window, Attach color = Attach.Texture,
      Attach depth = Attach.Renderbuffer, Attach stencil = Attach.None) {
    glGenFramebuffers(1, &_framebuffer);
    _color.attach = color;
    _depth.attach = depth;
    _stencil.attach = stencil;

    this.size = window.size;
    window.addResizeCallback((int x, int y){
      this.size = Vector2!int(x, y);
    });
  }

  ~this() {
    glDeleteFramebuffers(1, &_framebuffer);
  }

  override void rendering(void delegate() f) {
    GLint[4] viewport;
    GLuint fb;
    GLfloat[4] clear;

    glGetIntegerv(GL_VIEWPORT, viewport.ptr);
    glGetIntegerv(GL_DRAW_FRAMEBUFFER_BINDING, cast(GLint*)&fb);
    glGetFloatv(GL_COLOR_CLEAR_VALUE, clear.ptr);

    glBindFramebuffer(GL_FRAMEBUFFER, _framebuffer);
    glViewport(0, 0, _size.x, _size.y);
    glClearColor(_clearColor.r, _clearColor.g, _clearColor.b, _clearColor.a);
    if (_isClear) clearBuffer(BufferMask.All);
    f();

    glBindFramebuffer(GL_FRAMEBUFFER, fb);
    glViewport(viewport[0], viewport[1], viewport[2], viewport[3]);
    glClearColor(clear[0], clear[1], clear[2], clear[3]);
  }
}

private {
  void uniformMat4(GLuint location, Mat4 v) {
    glUniformMatrix4fv(location, 1, GL_FALSE, v[].ptr);
  }

  void uniformVec2(GLuint location, Vec2 v) {
    glUniform2f(location, v.x, v.y);
  }

  void uniformVec3(GLuint location, Vec3 v) {
    glUniform3f(location, v.x, v.y, v.z);
  }

  void uniformVec4(GLuint location, Vec4 v) {
    glUniform4f(location, v.r, v.g, v.b, v.a);
  }

  void uniformInt(GLuint location, GLint v) {
    glUniform1i(location, v);
  }

  void uniformFloat(GLuint location, GLfloat v) {
    glUniform1f(location, v);
  }

  void uniformFloatArray(GLuint location, in float[] ls) {
    glUniform1fv(location, cast(int)ls.length, ls.ptr);
  }
}

