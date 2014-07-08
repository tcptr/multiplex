module thino.window;

import opengl.glfw;
import thino.core;
import thino.math;
import thino.graph;
import thino.opengl;
debug import thino.debugger;

import std.traits;
import std.numeric : gcd;
import std.array : empty, replace;
import std.conv : to;
import std.exception : enforce;
import std.string : toStringz;

/**
 * ウィンドウの状態を表します。
 */
enum WindowMode {
  /// ウィンドウ。
  Windowed = GLFW_WINDOW,
  /// フルスクリーン。
  Fullscreen = GLFW_FULLSCREEN,
  /// 閉じられている。
  Closed
}

/**
 * デスクトップのサイズを取得します。
 */
Vector2!int getDesktopSize() {
  GLFWvidmode p;
  glfwGetDesktopMode(&p);
  return Vector2!int(p.Width, p.Height);
}

/**
 * キー/マウスボタンの状態を表します。
 */
alias int Action;
alias Press = GLFW_PRESS;
alias Release = GLFW_RELEASE;

/**
 * それぞれ、キー、マウスボタンの種類を表します。
 * それぞれ、GLFW_KEY_XXX, GLFW_MOUSE_BUTTON_XXXに対応します。
 */
alias int KeyID;
alias int MouseButtonID;

/// ditto
template KeyNamed(string s) {
  mixin("alias GLFW_KEY_" ~ s ~ " KeyNamed;");
}

// upward compatibility
alias GLFW_KEY_ESCAPE = GLFW_KEY_ESC;

/// ditto
template MouseButtonNamed(string s) {
  mixin("alias GLFW_MOUSE_BUTTON_" ~ s ~ " MouseButtonNamed;");
}

/**
 * コールバックの識別子を表します。
 */
alias uint EventID;

private struct Event(T) {
  EventID id;
  T fun;
}

private mixin template callbackGen(string name, string type) {
  mixin(q{
    private alias Event!(void delegate(} ~ type ~ q{)) ##Event;
    private ##Event[] _ls##;

    extern(System) private static
      void callback##(ParameterTypeTuple!(typeof(##Event.fun)) args) {
      if (_instance)
        foreach (v; _instance._ls##) v.fun(args);
    }

    /**
     * glfwSet##Callbackに対応するコールバックを登録します。
     * 一つのイベントに複数のコールバックが登録されている場合、
     * コールバックは登録された順番に呼ばれます。
     */
    EventID add##Callback(typeof(##Event.fun) f) {
      EventID id = ++_uniqueID;
      if (_ls##.empty)
        glfwSet##Callback(&callback##);
      _ls## ~= ##Event(id, f);
      return id;
    }

    /**
     * コールバックの登録を解除します。指定したidが登録されていない場合は無視します。
     */
    void remove##Callback(EventID id) {
      size_t hit = -1;
      foreach (i, v; _ls##) {
        if (v.id == id) hit = i;
      }
      assert(hit != -1, "undefined event " ~ to!string(id));

      _ls## = _ls##[0..hit] ~ _ls##[hit+1..$];
      if (_ls##.empty)
        glfwSet##Callback(null);
    }
  }.replace("##", name));
}

/**
 * ウィンドウを扱うクラスです。GLFW 2.7では必要のないクラスですが、
 * GLFW 3.0でマルチウィンドウに対応するために用意しています。
 * See_Also: $(J FixedAspectRatioWindow), $(J RenderTarget)
 * ---
 * auto window = new Window(640, 480, WindowMode.Windowed);
 * 
 * while (window.loop()) {
 *   ...
 *   window.rendering({
 *     clearBuffer(BufferMask.All);
 *     ...
 *   });
 * }
 * ---
 */
class Window : RenderTarget {
  private:
  static Window _instance; // GLFW 2.x
  static EventID _uniqueID;

  FPSCounter _counter;
  Vector2!int _windowSize;

  public:
  @property {
    /**
     * ウィンドウのタイトルを設定します。
     */
    void title(string s) {
      glfwSetWindowTitle(toStringz(s));
    }

    /**
     * 保持しているFPSCounterから現在のFPS, 描画スキップされた回数を返します。
     * See_Also: $(J FPSCounter)
     */
    int FPS() const {
      return _counter.FPS;
    }

    /// ditto
    int skipped() const {
      return _counter.skipped;
    }

    /**
     * ウィンドウのサイズを取得/変更します。
     */
    override Vector2!int size() const {
      // @@@ COMPILER BUG @@@
      // 同名のpropertyをオーバーライドするともう片方が見えなくなる
      return super.size;
    }

    /// ditto
    override void size(Vector2!int v) {
      setSizeImpl(v);
      glfwSetWindowSize(v.x, v.y);
    }

    /**
     * ウィンドウの左上から描画範囲の左上への相対座標を返します。
     * このクラスにおいては、常にVector2!int(0, 0)を返します。
     * See_Also: $(J FixedAspectRatioWindow)
     */
    Vector2!int offset() const {
      return Vector2!int(0, 0);
    }

    /**
     * カーソルを表示するか設定します。
     * カーソルが表示されていないとき、getMousePosの座標は際限なく変化します。
     */
    void cursor(bool t) {
      (t ? &glfwEnable : &glfwDisable)(GLFW_MOUSE_CURSOR);
    }
  }

  /**
   * widthとheightと$(J WindowMode)に基づいてウィンドウを開き、OpenGL拡張を取得します。
   * hintsにはglfwOpenWindowHintの情報をtarget, hint, target, hint...の形式で与えます。
   */
  this(int width, int height, WindowMode m, int[] hints ...) {
    assert(!_instance, "GLFW 2.7 does not support multi-window");
    assert(hints.length%2 == 0, "invalid hints");

    _instance = this;

    foreach (t; 0..hints.length/2)
      glfwOpenWindowHint(hints[t*2], hints[t*2 + 1]);

    enforce(
        glfwOpenWindow(width, height, 8, 8, 8, 8, 8, 8, m) == GL_TRUE,
        "glfwOpenWindow() failed");

    void windowResize(int w, int h) {
      setSizeImpl(Vector2!int(w, h));
    }

    addWindowSizeCallback(&windowResize);

    loadExtensions();

    _counter = new FPSCounter(60.0);
    windowResize(width, height);
  }

  protected void setSizeImpl(Vector2!int v) {
    super.size = v;
  }

  /**
   * ウィンドウに描画します。fに描画処理を渡します。
   * $(J FPSCounter)に従って処理に時間がかかっているときは描画をスキップします。
   */
  override void rendering(void delegate() f) {
    if (_counter.skipDraw) {
      debug Debugger().clearSteps();
      return;
    }

    glBindFramebuffer(GL_FRAMEBUFFER, 0);
    glViewport(this.offset.x, this.offset.y, _size.x, _size.y);
    glClearColor(_clearColor.r, _clearColor.g, _clearColor.b, _clearColor.a);
    clearBuffer(BufferMask.All);
    f();
    debug Debugger().run(this);
  }

  /**
   * 画面のスワップとFPS調整のための待機などを行います。
   * このメソッドがfalseを返したとき、ウィンドウは閉じられようとしているため、
   * ゲームを終了する必要があります。
   */
  bool loop() {
    _counter.syncSwap(this);

    return glfwGetWindowParam(GLFW_OPENED) == GL_TRUE;
  }

  /**
   * ウィンドウを閉じます。GLFW2.7においてはウィンドウは一つしか生成できないため、
   * 特に必要とする場面はありません。また呼ぶ必要もありません。
   */
  void close() {
    _instance = null;
    glfwCloseWindow();
  }

  /**
   * キー/マウスボタンの状態を取得します。
   * ---
   * window.getKeyNamed!"ESC"() == Press
   * window.getKey('A') == Press
   * window.getMouseButtonNamed!"LEFT"() == Release
   * ---
   */
  Action getKeyNamed(string s)() const {
    return getKey(KeyNamed!s);
  }

  /// ditto
  Action getKey(KeyID id) const {
    return glfwGetKey(id);
  }

  /// ditto
  Action getMouseButtonNamed(string s)() const {
    return getMouseButton(MouseButtonNamed!s);
  }

  Action getMouseButton(MouseButtonID id) const {
    return glfwGetMouseButton(id);
  }

  /**
   * 描画範囲の左上からのマウスカーソルの位置(x, y)を取得します。
   */
  Vector2!int getMousePos() const {
    int x, y;
    glfwGetMousePos(&x, &y);
    return Vector2!int(x, y) - this.offset;
  }

  // TODO: GLFW 3.0
  // private static Window[GLFWwindow] windows;

  // TODO: mixinに対してddocが反応しない
  /* ---
   * EventID id = window.addMousePosCallback((int x, int y) {
   *   particle.add(x, y);
   * });
   * ...
   * window.removeMousePosCallback(id);
   * ---
   */
  mixin callbackGen!("WindowSize", "int, int");
  mixin callbackGen!("MouseButton", "MouseButtonID, Action");
  mixin callbackGen!("MousePos", "int, int");
  mixin callbackGen!("MouseWheel", "int");
  mixin callbackGen!("Key", "KeyID, Action");

  private alias WindowSizeEvent ResizeEvent;

  EventID addResizeCallback(typeof(ResizeEvent.fun) f) {
    return addWindowSizeCallback(f);
  }

  void removeResizeCallback(EventID id) {
    removeWindowSizeCallback(id);
  }
}

/**
 * $(J Window)を継承したクラスで、描画する範囲のアスペクト比を保ちます。
 * ウィンドウサイズと_sizeが一致せず、_sizeが常にアスペクト比を保ちます。
 * TODO: superclassに統合, スイッチ可能に
 */
class FixedAspectRatioWindow : Window {
  private:
  Vector2!int _aspectRatio, _windowSize;
  int _resizeTimer;
  ResizeEvent[] _resizeCallbacks;

  public:
  @property {
    /**
     * アスペクト比を取得/設定します。デフォルトのアスペクト比は
     * ウィンドウの初期サイズから判断されます。
     */
    void aspectRatio(Vector2!int r) {
      _aspectRatio = r;
      _resizeTimer = 1;
    }

    /// ditto
    Vector2!int aspectRatio() const {
      return _aspectRatio;
    }

    override float aspect() const {
      return _aspectRatio.x / cast(float)(_aspectRatio.y);
    }

    /**
     * ウィンドウの左上から描画範囲の左上への相対座標を返します。
     */
    override Vector2!int offset() const {
      return Vector2!int(_windowSize.x - _size.x, _windowSize.y - _size.y)/2;
    }
  }

  override protected void setSizeImpl(Vector2!int v) {
    // ウィンドウサイズを記録し, 即座に_sizeの変更を行わない
    _windowSize = v;
    _resizeTimer = 10;
  }

  this(int width, int height, WindowMode m, int[] hints ...) {
    super(width, height, m, hints);
    super.setSizeImpl(Vector2!int(width, height));
    this.aspectRatio = _windowSize / gcd(width, height);
  }

  override bool loop() {
    if (_resizeTimer > 0 && --_resizeTimer == 0) {
      auto s = _windowSize;

      if (s.x*_aspectRatio.y < s.y*_aspectRatio.x) {
        s.x = (s.x / _aspectRatio.x) * _aspectRatio.x; // floor
        s.y = (s.x / _aspectRatio.x) * _aspectRatio.y;
      } else if (s.x*_aspectRatio.y > s.y*_aspectRatio.x) {
        s.y = (s.y / _aspectRatio.y) * _aspectRatio.y; // floor
        s.x = (s.y / _aspectRatio.y) * _aspectRatio.x;
      }
      if (s.x < _aspectRatio.x) s.x = _aspectRatio.x;
      if (s.y < _aspectRatio.y) s.y = _aspectRatio.y;

      super.setSizeImpl(s);
      foreach (v; _resizeCallbacks) v.fun(s.x, s.y);
    }

    return super.loop();
  }

  override void rendering(void delegate() f) {
    if (_resizeTimer > 0) return;
    super.rendering(f);
  }

  // TODO resizeの説明
  override EventID addResizeCallback(void delegate(int,int) f) {
    EventID id = ++_uniqueID;
    _resizeCallbacks ~= ResizeEvent(id, f);
    return id;
  }

  override void removeResizeCallback(EventID id) {
    size_t hit = -1;
    foreach (i, v; _resizeCallbacks) {
      if (v.id == id) hit = i;
    }
    assert(hit != -1, "undefined event " ~ to!string(id));

    _resizeCallbacks = _resizeCallbacks[0..hit] ~ _resizeCallbacks[hit+1..$];
  }
}

