module thino.joystick;

import opengl.glfw;
import thino.opengl;
import thino.math;
import std.array : array;
import std.algorithm : map;

/**
 * ジョイスティックの識別子を表します。
 */
alias int JoystickID;

/**
 * ジョイスティックの入力を受け取るクラスです。
 */
class Joystick {
  private:
  static float[] _tmpAxis;
  static ubyte[] _tmpButton;

  @disable this() {}

  public:
  /**
   * ジョイスティックの識別子のリストです。
   * 通常は接続されたジョイスティックはlist[0]から割り当てられます。
   */
  static immutable list = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
  // Joystick.list[i] corresponds GLFW_JOYSTICK_(i+1)

  /**
   * 指定したidのジョイスティックが使用可能かを調べます。
   */
  static bool canUse(JoystickID id) {
    return glfwGetJoystickParam(id, GLFW_PRESENT) == GL_TRUE;
  }

  /**
   * 指定したidのジョイスティックの使用可能な軸/ボタンの数を調べます。
   */
  static int numAxes(JoystickID id) {
    return glfwGetJoystickParam(id, GLFW_AXES);
  }

  /// ditto
  static int numButtons(JoystickID id) {
    return glfwGetJoystickParam(id, GLFW_BUTTONS);
  }

  /**
   * idのジョイスティックのk番目の軸の値を返します。kは0 originです。値は[-1.0, 1.0]の範囲で返されます。
   *
   * 指定したジョイスティック/軸が使用可能でない場合、0.0を返します。
   */
  static float axis(JoystickID id, int k) {
    assert(0 <= k);
    if (_tmpAxis.length < k+1) _tmpAxis.length = k+1;
    glfwGetJoystickPos(id, _tmpAxis.ptr, k+1);
    return _tmpAxis[k];
  }

  /**
   * idのジョイスティックの使用可能な軸全ての値を返します。
   */
  static const(float)[] axes(JoystickID id) {
    int k = numAxes(id);
    if (_tmpAxis.length < k) _tmpAxis.length = k;
    glfwGetJoystickPos(id, _tmpAxis.ptr, k);
    return _tmpAxis[0..k];
  }

  /**
   * idのジョイスティックのk番目のボタンが押されているかを返します。kは0 originです。
   *
   * 指定したジョイスティック/ボタンが使用可能でない場合、falseを返します。
   */
  static bool button(JoystickID id, int k) {
    assert(0 <= k);
    if (_tmpButton.length < k+1) _tmpButton.length = k+1;
    glfwGetJoystickButtons(id, _tmpButton.ptr, k+1);
    return _tmpButton[k] == GLFW_PRESS;
  }

  /**
   * idのジョイスティックの使用可能なボタン全てについて押されているかを返します。
   */
  static const(bool)[] buttons(JoystickID id) {
    int k = numButtons(id);
    if (_tmpButton.length < k) _tmpButton.length = k;
    glfwGetJoystickButtons(id, _tmpButton.ptr, k);
    return _tmpButton[0..k].map!(x => x == GLFW_PRESS)().array();
  }

  /**
   * 多くのゲームパッドに付いている3Dスティックは、機種によって斜め入力の最大値が著しく異なります。
   * このクラスは、二軸によってなされる角度を64個に分割し、それぞれの角度における最大値を記憶することで、
   * かなり正確な二軸による角度と入力の強さを取得できます。
   * ---
   * auto stick = new Joystick.Stick(Joystick.list[0], 0, 1, 0.3);
   * stick.threshold = 0.3;
   * auto info = stick.get();
   * writeln(info.rad, " .. ", info.len);
   * ---
   */
  static class Stick {
    private:
    JoystickID _joystick;
    int _xaxis, _yaxis;
    bool _xreverse, _yreverse;
    float _threshold;
    float[64] _correct;

    public:
    /**
     * スティックの状態を表現します。
     */
    static struct Info {
      /// 角度。
      float rad;
      /// 強さ。[0.0, 1.0]の範囲で表現されます。
      float len;
    }

    /**
     * スティックの遊び値を取得/セットします。
     * 遊び値を下回る入力は全て0.0とみなされます。
     * デフォルトは0.1で、[0.0, 1.0]の範囲で指定します。
     *
     * Note: get().lenが0.0でないとき必ずthresholdを上回るわけではありません。
     */
    @property float threshold() const {
      return _threshold;
    }

    /// ditto
    @property void threshold(float t) {
      _threshold = t;
    }

    /**
     * 軸を設定し直します。rには反転するかを渡します。
     * 補正のための最大値の情報は初期化されます。
     */
    void setX(int x, bool r) {
      _xaxis = x;
      _xreverse = r;
      _correct[] = 2.0;
    }

    /// ditto
    void setY(int y, bool r) {
      _yaxis = y;
      _yreverse = r;
      _correct[] = 2.0;
    }

    /**
     * 指定したidのジョイスティックの軸x, yでスティックを設定します。
     *
     * デフォルトではright, upが正ですが、
     * 機種によってはleftやdownが正になっているものも存在します。
     * そのようなケースでxrやyrにtrueを渡すことで値を反転して扱うようになります。
     */
    this(JoystickID i, int x, int y, bool xr = false, bool yr = false) {
      _joystick = i;
      _xaxis = x;
      _yaxis = y;
      _xreverse = xr;
      _yreverse = yr;
      _threshold = 0.1;
      _correct[] = 2.0;
    }

    /**
     * スティックの状態を取得します。同時に、内部では最大値の情報を更新しています。
     */
    Info get() {
      float x = axis(_joystick, _xaxis);
      float y = axis(_joystick, _yaxis);
      if (_xreverse) x = -x;
      if (_yreverse) y = -y;
      float rad = atan2(y, x);
      size_t c = cast(size_t)(lrint((rad + PI) / (PI*2/_correct.length)) % _correct.length);

      float base = sqrt(x^^2 + y^^2);
      float len = base * _correct[c];

      if (len > 1) {
        len = 1;
        _correct[c] = 1 / base;
      }

      if (len < _threshold) len = 0;
      len ^^= 2.0;
      return Info(rad, len);
    }
  }
}

