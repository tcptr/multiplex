module thino.math;

public import std.math;
import std.range : iota, array;
import std.array : replace;
import std.algorithm : find, map, reduce;

/**
 * T[N]の静的配列のラッパーです。
 */
struct VectorD(uint N, T) {
  private T[N] _data;

  /**
   * 全ての値をvで初期化します。
   */
  this(in T v) {
    _data[] = v;
  }

  /**
   * lsで初期化します。
   */
  this(in T[] ls ...) {
    assert(ls.length == N);
    _data[] = ls[];
  }

  /**
   * 配列に対する基本的な演算を行います。
   *
   * スライス演算子無しの式は自身と同じ型のVectorDを取ります。
   * スライスでの演算はT[]あるいはT型の要素を取ります。
   * opBinaryではそれらの組み合わせを取ります。
   *
   * opには["+", "-", "*", "/"]が対応しています。
   */
  ref inout(T) opIndex(size_t i) inout {
    return _data[i];
  }

  /// ditto
  T[N] opSlice() const {
    return _data;
  }

  /// ditto
  const(T)[] opSlice(size_t i, size_t j) const {
    return _data[i..j];
  }

  /// ditto
  void opAssign(in typeof(this) v) {
    _data[] = v._data[];
  }

  /// ditto
  void opOpAssign(string op)(in typeof(this) v) {
    mixin("_data[] " ~ op ~ "= v._data[];");
  }

  /// ditto
  void opSliceAssign(S : T)(in S v) {
    _data[] = v;
  }

  /// ditto
  void opSliceAssign(S : T)(in S v, size_t i, size_t j) {
    _data[i..j] = v;
  }

  /// ditto
  void opSliceAssign(S : T[])(in S v) {
    _data[] = v[];
  }

  /// ditto
  void opSliceAssign(S : T[])(in S v, size_t i, size_t j) {
    _data[i..j] = v[];
  }

  /// ditto
  void opSliceOpAssign(string op, S : T)(in S v) {
    mixin("_data[] " ~ op ~ "= v;");
  }

  /// ditto
  void opSliceOpAssign(string op, S : T)(in S v, size_t i, size_t j) {
    mixin("_data[i..j] " ~ op ~ "= v;");
  }

  /// ditto
  void opSliceOpAssign(string op, S : T[])(in S v) {
    mixin("_data[] " ~ op ~ "= v[];");
  }

  /// ditto
  void opSliceOpAssign(string op, S : T[])(in S v, size_t i, size_t j) {
    mixin("_data[i..j] " ~ op ~ "= v[];");
  }

  /// ditto
  typeof(this) opBinary(string op, S : T)(in S v) const if (op != "~") {
    mixin("T[N] ls = _data[] " ~ op ~ " v;");
    return typeof(this)(ls);
  }

  /// ditto
  typeof(this) opBinary(string op, S : T[])(in S v) const if (op != "~") {
    mixin("T[N] ls = _data[] " ~ op ~ " v[];");
    return typeof(this)(ls);
  }

  /// ditto
  typeof(this) opBinary(string op, S : VectorD!(N,T))(in S v) const if (op != "~") {
    mixin("T[N] ls = _data[] " ~ op ~ " v._data[];");
    return typeof(this)(ls);
  }

  /// ditto
  typeof(this) opBinaryRight(string op, S : T)(in S v) const if (op != "~") {
    mixin("T[N] ls = v " ~ op ~ " _data[];");
    return typeof(this)(ls);
  }

  /// ditto
  typeof(this) opBinaryRight(string op, S : T[])(in S v) const if (op != "~") {
    mixin("T[N] ls = v[] " ~ op ~ " _data[];");
    return typeof(this)(ls);
  }

  /**
   * 一つ値が増えたVectorDを生成します。
   * ---
   * Vec2(1, 2) ~ 3 == Vec3(1, 2, 3)
   * ---
   */
  VectorD!(N+1,T) opBinary(string op)(in T v) const if (op == "~") {
    return VectorD!(N+1,T)(_data ~ v);
  }

  /// ditto
  VectorD!(N+1,T) opBinaryRight(string op)(in T v) const if (op == "~") {
    return VectorD!(N+1,T)(v ~ _data);
  }

  private mixin template attr(string n, string i) {
    mixin(q{
      ref inout(T) #n#() inout {
        return _data[#i#];
      }
    }.replace("#n#", n).replace("#i#", i));
  }

  private mixin template attrs(string n, string i) {
    mixin(q{
      VectorD!(#i#, T) #n#() const {
        return VectorD!(#i#, T)(_data[0..#i#]);
      }

      void #n#(in VectorD!(#i#, T) v) {
        _data[0..#i#] = v._data[];
      }
    }.replace("#n#", n).replace("#i#", i));
  }

  @property {
    static if (N == 0) {
      /**
       * Nに応じてアクセサが定義されます。
       * ---
       * {N >= 1} x, r, s が [0] に
       * {N >= 2} y, g, t が [1] に / xy, st が [0..2] に
       * {N >= 3} z, b, p が [2] に / xyz, rgb が [0..3] に
       * {N >= 4} w, a, q が [3] に
       * ---
       */
      VectorD!(3, T) xyz() const { return typeof(return).init; }
      /// ditto
      void xyz(in VectorD!(3, T) v) {}
    }

    static if (N >= 1) {
      mixin attr!("x", "0");
      mixin attr!("r", "0");
      mixin attr!("s", "0");
    }
    static if (N >= 2) {
      mixin attr!("y", "1");
      mixin attr!("g", "1");
      mixin attr!("t", "1");
      mixin attrs!("xy", "2");
      mixin attrs!("st", "2");
    }
    static if (N >= 3) {
      mixin attr!("z", "2");
      mixin attr!("b", "2");
      mixin attr!("p", "2");
      mixin attrs!("xyz", "3");
      mixin attrs!("rgb", "3");
    }
    static if (N >= 4) {
      mixin attr!("w", "3");
      mixin attr!("a", "3");
      mixin attr!("q", "3");
    }
  }

  /**
   * ベクトルの長さを計算して返します。
   */
  @property float length() const {
    return sqrt(cast(float)_data[0..N].map!q{ a^^2 }().reduce!"a+b"());
  }

  /**
   * TからSへのキャストを行った新しいVectorDを返します。
   * VectorDは暗黙的な型変換を行いません。
   */
  @property VectorD!(N, S) castTo(S)() const {
    static if (is(T == S)) {
      return this;
    } else {
      S[N] ls;
      foreach (i, v; _data) ls[i] = cast(S)v;
      return VectorD!(N, S)(ls);
    }
  }

  /**
   * 正規化したベクトルを返します。
   */
  @property VectorD!(N, float) normal() const {
    return this.castTo!float / length;
  }
}

unittest {
  auto foo = Vector3!int(1,2,3);
  assert(foo[0] == 1);
  assert(foo[] == [1,2,3]);
  assert(foo[1..3] == [2,3]);
  assert((0 ~ foo ~ 4)[] == [0,1,2,3,4]);
  assert(foo.xy[] == [1,2]);
  assert(foo.z == 3);

  assert(Vec2(3,4).length == 5);
  assert(Vector2!int(3,4).castTo!float == Vec2(3,4));
  assert(Vec2(0,2).normal == Vec2(0,1));

  foo = Vector3!int(0,1,2);
  foo += Vector3!int(2,1,0);
  assert(foo[] == [2,2,2]);

  foo[] = 0;
  foo[0..2] = 1;
  assert(foo[] == [1,1,0]);
  foo[] = [0,1,2];
  foo[0..2] = [4,3];
  assert(foo[] == [4,3,2]);

  foo[] -= 1;
  foo[0..2] -= 1;
  assert(foo[] == [2,1,1]);
  foo[] += [1,2,2];
  foo[1..3] += [1,2];
  assert(foo[] == [3,4,5]);

  assert((foo + 1)[] == [4,5,6]);
  assert((foo + [2,1,0])[] == [5,5,5]);
  assert((foo + Vector3!int(3,2,1))[] == [6,6,6]);
  assert((3 - foo)[] == [0,-1,-2]);
  assert(([2,1,0] - foo)[] == [-1,-3,-5]);
}

/// よく使用する型へのaliasです。
alias Vector2(T) = VectorD!(2, T);
/// ditto
alias Vector3(T) = VectorD!(3, T);
/// ditto
alias Vector4(T) = VectorD!(4, T);
/// ditto
alias Vector2!float Vec2;
/// ditto
alias Vector3!float Vec3;
/// ditto
alias Vector4!float Vec4;

/**
 * 4x4の行列型です。内部ではfloat[16]の静的配列として保持しています。
 * Note: Mat4はOpenGLに合わせて行列を列オーダーで扱います。
 */
struct Mat4 {
  private static float[16] _tmp;
  private float[16] _data;

  this(in float[] ls ...) {
    assert(ls.length == 16);
    _data[] = ls[];
  }

  /**
   * 保持している静的配列の[i]を取得します。
   */
  ref inout(float) opIndex(size_t i) inout {
    return _data[i];
  }

  /**
   * 保持している静的配列を返します。
   */
  float[16] opSlice() const {
    return _data;
  }

  private static Mat4 fromRange(Range)(Range ls) {
    Mat4 result;
    size_t i;
    foreach (v; ls) {
      if (i > 15) break;
      result[i++] = v;
    }
    assert(i == 16);
    return result;
  }

  /**
   * 自身とsの乗算結果を返します。
   */
  Mat4 opBinary(string s)(in Mat4 v) const if (s == "*") {
    float f(size_t a, size_t b) {
      return iota(4).map!(i => v[4*a + i] * _data[4*i + b])().reduce!("a+b")();
    }
    return Mat4.fromRange( iota(16).map!(i => f(i/4, i%4))() );
  }

  /// ditto
  ref Mat4 opOpAssign(string s)(in Mat4 v) if (s == "*") {
    _tmp[] = _data[];
    float f(size_t a, size_t b) {
      return iota(4).map!(i => v[4*a + i] * _tmp[4*i + b])().reduce!("a+b")();
    }
    foreach (size_t i; 0..16)
      _data[i] = f(i/4, i%4);
    return this;
  }

  /**
   * 行と列を入れ替えたMat4を生成して返します。
   */
  Mat4 transpose() const {
    return Mat4.fromRange( iota(16).map!(i => _data[4*(i%4) + i/4])() );
  }

  /**
   * 自身の逆行列を生成して返します。
   */
  Mat4 inverse() const {
    float a = _data[0],  b = _data[1],  c = _data[2],  d = _data[3],
      e = _data[4],  f = _data[5],  g = _data[6],  h = _data[7],
      i = _data[8],  j = _data[9],  k = _data[10], l = _data[11],
      m = _data[12], n = _data[13], o = _data[14], p = _data[15],
      q = a * f - b * e, r = a * g - c * e,
      s = a * h - d * e, t = b * g - c * f,
      u = b * h - d * f, v = c * h - d * g,
      w = i * n - j * m, x = i * o - k * m,
      y = i * p - l * m, z = j * o - k * n,
      A = j * p - l * n, B = k * p - l * o,
      ivd = 1 / (q * B - r * A + s * z + t * y - u * x + v * w);
    return Mat4(
      ( f * B - g * A + h * z) * ivd,
      (-b * B + c * A - d * z) * ivd,
      ( n * v - o * u + p * t) * ivd,
      (-j * v + k * u - l * t) * ivd,
      (-e * B + g * y - h * x) * ivd,
      ( a * B - c * y + d * x) * ivd,
      (-m * v + o * s - p * r) * ivd,
      ( i * v - k * s + l * r) * ivd,
      ( e * A - f * y + h * w) * ivd,
      (-a * A + b * y - d * w) * ivd,
      ( m * u - n * s + p * q) * ivd,
      (-i * u + j * s - l * q) * ivd,
      (-e * z + f * x - g * w) * ivd,
      ( a * z - b * x + c * w) * ivd,
      (-m * t + n * r - o * q) * ivd,
      ( i * t - j * r + k * q) * ivd
    );
  }

  /**
   * 単位行列を返します。
   */
  static Mat4 identity() {
    return Mat4(
      1, 0, 0, 0,
      0, 1, 0, 0,
      0, 0, 1, 0,
      0, 0, 0, 1
    );
  }

  /**
   * vecでスケールするモデル変換行列を返します。
   */
  static Mat4 scale(Vec3 vec) {
    return Mat4(
      vec.x, 0, 0, 0,
      0, vec.y, 0, 0,
      0, 0, vec.z, 0,
      0, 0, 0, 1
    );
  }

  Mat4 dotScale(Vec3 vec) const {
    return Mat4(
      _data[0]  * vec[0], _data[1]  * vec[0],
      _data[2]  * vec[0], _data[3]  * vec[0],
      _data[4]  * vec[1], _data[5]  * vec[1],
      _data[6]  * vec[1], _data[7]  * vec[1],
      _data[8]  * vec[2], _data[9]  * vec[2],
      _data[10] * vec[2], _data[11] * vec[2],
      _data[12], _data[13], _data[14], _data[15]
    );
  }

  ref Mat4 assignDotScale(Vec3 vec) {
    _data[0..4] *= vec[0];
    _data[4..8] *= vec[1];
    _data[8..12] *= vec[2];
    return this;
  }

  /**
   * vecで移動するモデル変換行列を返します。
   */
  static Mat4 translate(Vec3 vec) {
    return Mat4(
      1.0, 0, 0, 0,
      0, 1, 0, 0,
      0, 0, 1, 0,
      vec.x, vec.y, vec.z, 1
    );
  }

  Mat4 dotTranslate(Vec3 vec) const {
    return Mat4(
      _data[0], _data[1], _data[2], _data[3],
      _data[4], _data[5], _data[6], _data[7],
      _data[8], _data[9], _data[10], _data[11],
      _data[0] * vec[0] + _data[4] * vec[1] + _data[8]  * vec[2] + _data[12],
      _data[1] * vec[0] + _data[5] * vec[1] + _data[9]  * vec[2] + _data[13],
      _data[2] * vec[0] + _data[6] * vec[1] + _data[10] * vec[2] + _data[14],
      _data[3] * vec[0] + _data[7] * vec[1] + _data[11] * vec[2] + _data[15]
    );
  };

  ref Mat4 assignDotTranslate(Vec3 vec) {
    _data[12..16] += _data[0..4] * vec[0] +
                    _data[4..8] * vec[1] +
                    _data[8..12] * vec[2];
    return this;
  }

  /**
   * axisを正規化したベクトルの表す軸でradだけ回転するモデル変換行列を返します。
   */
  static Mat4 rotate(float rad, Vec3 axis) {
    Vec3 a = axis.normal();
    float x = a.x, y = a.y, z = a.z;
    float c = cos(rad), s = sin(rad), f = 1-c;

    return Mat4(
      x*x*f + c,   x*y*f + z*s, x*z*f - y*s, 0,
      y*x*f - z*s, y*y*f + c,   y*z*f + x*s, 0,
      x*z*f + y*s, y*z*f - x*s, z*z*f + c,   0,
      0, 0, 0, 1
    );
  }

  Mat4 dotRotate(float rad, Vec3 axis) const {
    if (rad == 0) return this;
    Vec3 a = axis.normal();
    float d = sin(rad), e = cos(rad), f = 1-e,
        g = _data[0],  h = _data[1], i = _data[2],  j = _data[3],
        k = _data[4],  l = _data[5], m = _data[6],  n = _data[7],
        o = _data[8],  p = _data[9], q = _data[10], r = _data[11],
        s = a.x * a.x * f + e,
        t = a.y * a.x * f + a.z * d,
        u = a.z * a.x * f - a.y * d,
        v = a.x * a.y * f - a.z * d,
        w = a.y * a.y * f + e,
        x = a.z * a.y * f + a.x * d,
        y = a.x * a.z * f + a.y * d,
        z = a.y * a.z * f - a.x * d,
        b = a.z * a.z * f + e;

    return Mat4(
      g * s + k * t + o * u,
      h * s + l * t + p * u,
      i * s + m * t + q * u,
      j * s + n * t + r * u,
      g * v + k * w + o * x,
      h * v + l * w + p * x,
      i * v + m * w + q * x,
      j * v + n * w + r * x,
      g * y + k * z + o * b,
      h * y + l * z + p * b,
      i * y + m * z + q * b,
      j * y + n * z + r * b,
      _data[12], _data[13], _data[14], _data[15]
    );
  }

  ref Mat4 assignDotRotate(float rad, Vec3 axis) {
    if (rad == 0) return this;
    Vec3 a = axis.normal();
    _tmp[0..12] = _data[0..12];
    float d = sin(rad), e = cos(rad), f = 1-e,
        s = a.x * a.x * f + e,
        t = a.y * a.x * f + a.z * d,
        u = a.z * a.x * f - a.y * d,
        v = a.x * a.y * f - a.z * d,
        w = a.y * a.y * f + e,
        x = a.z * a.y * f + a.x * d,
        y = a.x * a.z * f + a.y * d,
        z = a.y * a.z * f - a.x * d,
        b = a.z * a.z * f + e;

    _data[0..4] = _tmp[0..4] * s + _tmp[4..8] * t + _tmp[8..12] * u;
    _data[4..8] = _tmp[0..4] * v + _tmp[4..8] * w + _tmp[8..12] * x;
    _data[8..12] = _tmp[0..4] * y + _tmp[4..8] * z + _tmp[8..12] * b;
    return this;
  }

  /**
   * eyeからcenterをupを画面上として見るビュー行列を返します。
   */
  static Mat4 lookAt(Vec3 eye, Vec3 center, Vec3 up) {
    if(eye.x == center.x && eye.y == center.y && eye.z == center.z)
      return Mat4.identity();

    Vec3 z = (eye - center).normal();

    Vec3 x = Vec3(up.y * z.z - up.z * z.y,
        up.z * z.x - up.x * z.z, up.x * z.y - up.y * z.x);
    if (x.length != 0) x = x.normal();

    Vec3 y = Vec3(z.y * x.z - z.z * x.y,
        z.z * x.x - z.x * x.z, z.x * x.y - z.y * x.x);
    if (y.length != 0) y = y.normal();

    return Mat4(
        x.x, y.x, z.x, 0,
        x.y, y.y, z.y, 0,
        x.z, y.z, z.z, 0,
        -(x.x * eye.x + x.y * eye.y + x.z * eye.z),
        -(y.x * eye.x + y.y * eye.y + y.z * eye.z),
        -(z.x * eye.x + z.y * eye.y + z.z * eye.z),
        1
    );
  };

  /**
   * 平行投影するプロジェクション行列を返します。
   */
  static Mat4 ortho(float left, float right,
      float bottom, float top, float near, float far) {
    float rl = right - left, tb = top - bottom, fn = far - near;
    return Mat4(
        2/rl, 0, 0, 0,
        0, 2/tb, 0, 0,
        0, 0, -2/fn, 0,
        -(right+left)/rl, -(top+bottom)/tb, -(far+near)/fn, 1
    );
  }

  /**
   * 透視投影するプロジェクション行列を返します。
   */
  static Mat4 perspective(
      float fovy, float aspect, float near, float far) {
    float t = near * tan(fovy * PI / 360),
         r = t * aspect, a = r*2, b = t*2, c = far - near;
    return Mat4(
        near*2/a, 0, 0, 0,
        0, near*2/b, 0, 0,
        0, 0, -(far+near)/c, -1,
        0, 0, -(far*near*2)/c, 0
    );
  }
}

unittest {
  import std.range : zip;

  bool nearly(in float[] a, in float[] b) {
    foreach (v; zip(a,b))
      if (v[0] - v[1] > 0.01) return false;
    return true;
  }
  auto mat = Mat4.identity();
  assert(mat[5] == 1);
  assert(mat[] == [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]);

  assert(mat.dotScale(Vec3(2,3,4))[] == [2,0,0,0,0,3,0,0,0,0,4,0,0,0,0,1]);
  mat = mat * Mat4.scale(Vec3(2,3,4));
  assert(mat[] == [2,0,0,0,0,3,0,0,0,0,4,0,0,0,0,1]);

  assert(mat.dotTranslate(Vec3(5,6,7))[] == [2,0,0,0,0,3,0,0,0,0,4,0,10,18,28,1]);
  mat *= Mat4.translate(Vec3(5,6,7));
  assert(mat[] == [2,0,0,0,0,3,0,0,0,0,4,0,10,18,28,1]);

  assert(nearly(mat.dotRotate(PI*0.5, Vec3(2,3,4))[], [0.275,2.849,-1.124,0,-1.071,0.931,3.140,0,1.665,
        0.127,2.206,0,10,18,28,1]));
  mat = mat * mat.rotate(PI*0.5, Vec3(2,3,4));
  assert(nearly(mat[], [0.275,2.849,-1.124,0,-1.071,0.931,3.140,0,1.665,
        0.127,2.206,0,10,18,28,1]));

  auto mat2 = Mat4.lookAt(Vec3(1,2,3), Vec3(4,5,6), Vec3(0,1,0));
  assert(nearly(mat2[], [-0.707,-0.408,-0.577,0,0,0.816,-0.577,0,
      0.707,-0.408,-0.577,0,-1.414,0,3.464,1]));
  mat2 = mat2.inverse();
  assert(nearly(mat2[], [-0.707,0,0.707,0,-0.408,0.816,-0.408,0,-0.577,
      -0.577,-0.577,0,1,2,3,1]));

  auto mat3 = Mat4.perspective(30, 0.8, 30, 60);
  assert(nearly(mat3[], [4.665,0,0,0,0,3.732,0,0,0,
      0,-3,-1,0,0,-120,0]));
  mat3 = mat3.transpose();
  assert(nearly(mat3[], [4.665,0,0,0,0,3.732,0,0,0,
      0,-3,-120,0,0,-1,0]));

  assert(nearly((mat3 * mat2)[], [-3.29,0,-2.12,-84.852,-1.904,3.047,
      1.224,48.989,-2.693,-2.154,1.732,69.282,4.665,7.464,-10,-360]));

  mat3 = Mat4.ortho(-20, 20, -20, 20, 0, 10);
  assert(nearly(mat3[], [0.050, 0, 0, 0, 0, 0.050, 0, 0,
      0, 0, -0.0200, 0, 0, 0, -1, 1]));

  mat2 = mat3.dotScale(Vec3(1,2,3));
  mat3.assignDotScale(Vec3(1,2,3));
  assert(mat2[] == mat3[]);

  mat2 = mat3.dotTranslate(Vec3(1,2,3));
  mat3.assignDotTranslate(Vec3(1,2,3));
  assert(mat2[] == mat3[]);

  mat2 = mat3.dotRotate(2, Vec3(1,2,3));
  mat3.assignDotRotate(2, Vec3(1,2,3));
  assert(mat2[] == mat3[]);
}

