module thino.core;

import opengl.glfw;
import thino.opengl;
import thino.window;
import thino.datatype : Singleton;
import std.exception : enforce;
import std.array;

/**
 * ゲーム全体を管理するクラスです。現時点ではGLFWの初期化にとどまります。
 * GLFWに関連するクラス(graph, windowなど)を使用する場合、最初に初期化する必要があります。
 * $(J Singleton)です。
 * ---
 * // GLFWを初期化、ゲームを開始
 * Thino();
 * ---
 */
class Thino {
  mixin Singleton;

  private:
  this() {
    enforce(glfwInit() == GL_TRUE, "glfwInit() failed");
  }

  ~this() {
    glfwTerminate();
  }

  public:
  /**
   * glfwWaitEvents()を呼び出し、何らかのイベントを受け取るまで待機します。
   */
  void waitEvents() {
    glfwWaitEvents();
  }
}

/**
 * GLFW_nameへのエイリアスになります。
 */
template GLFW(string name) {
  mixin("alias GLFW_" ~ name ~ " GLFW;");
}

/**
 * 状態遷移を管理するクラスです。必ずしも使用する必要はありません。
 * ユーザはSceneを継承したクラスを作成し、$(J run)メソッドをオーバーライドします。
 * Scene.$(J execute)メソッドに任意のSceneを渡すことで処理を開始します。
 * ---
 * int[] ls;
 * class TestScene2 : Scene {
 *   override void run() {
 *     ls ~= 5;
 *   }
 * }
 * class TestScene : Scene {
 *   override void run() {
 *     ls ~= 3;
 *     nextScene(new TestScene2);
 *   }
 * }
 * Scene.execute(new TestScene);
 * ---
 */
abstract class Scene {
  private Scene _next;

  this() {}

  /**
   * シーンのメインとなる処理を行います。Scene.$(J execute)によって呼ばれます。
   */
  abstract void run();

  /**
   * 次のシーンとしてsceneを予約します。
   * nextSceneが呼ばれずにシーンを終えた場合には状態遷移の処理を終了します。
   */
  void nextScene(Scene s) {
    _next = s;
  }

  /**
   * 状態遷移の処理を開始します。
   */
  static void execute(Scene scene) {
    while (scene) {
      scene.run();
      scene = scene._next;
    }
  }
}

unittest {
  int[] ls;
  class TestScene2 : Scene {
    override void run() {
      ls ~= 5;
    }
  }
  class TestScene : Scene {
    override void run() {
      ls ~= 3;
      nextScene(new TestScene2);
    }
  }
  Scene.execute(new TestScene);
  assert(ls == [3,5]);
}

/**
 * 時間を計測し、FPSの安定化、及び描画のスキップを管理するクラスです。
 * $(J Window)が内部で保持しており、通常は直接触ることはありません。
 */
class FPSCounter {
  private:
  immutable double _interval;
  double _beforeTime, _fpsTime;
  int _current, _before;
  int _currentSkip, _beforeSkip;
  bool _skip;

  public:
  @property const {
    /**
     * 計測された現在のFPSを返します。1秒単位で更新されます。
     */
    int FPS() {
      return _before;
    }

    /**
     * 直近の一秒で描画がスキップされたフレーム数を返します。
     */
    int skipped() {
      return _beforeSkip;
    }

    /**
     * ゲームの処理に時間がかかっているなどの理由で、
     * 描画をスキップする予定のフレームでtrueを返します。
     * $(J Window)が内部で使用します。
     */
    bool skipDraw() {
      return _skip;
    }
  }

  /**
   * FPSを設定して初期化します。
   */
  this(double fps) {
    glfwSwapInterval(1);
    _interval = 1.0/fps;
    glFinish();
    glfwSwapBuffers();
    _beforeTime = _fpsTime = glfwGetTime();
  }

  /**
   * windowのバッファをswapし、必要ならばsleepなどの処理を行います。
   */
  void syncSwap(in Window window) {
    ++_current;
    _beforeTime += _interval;

    if (_skip) {
      _skip = false;
      ++_currentSkip;
    } else {
      glFinish();
      glfwSwapBuffers();

      double delay = _beforeTime - glfwGetTime();

      // 遅れが大きい場合は_beforeTimeを早める
      while (delay < -_interval*2) {
        delay += _interval;
        _beforeTime += _interval;
      }

      if (delay < -_interval) _skip = true;
      else if (delay > 0) glfwSleep(delay);
    }

    if (glfwGetTime() - _fpsTime > 1.0) {
      _before = _current;
      _beforeSkip = _currentSkip;
      _current = _currentSkip = 0;
      _fpsTime += 1.0;
    }
  }
}

