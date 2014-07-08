module thino.datatype;

/**
 * シングルトンを作成するテンプレートです。
 * ---
 * class S {
 *   mixin Singleton;
 *   ...
 * }
 * ...
 * auto s = S(); // or S.getInstance()
 * ---
 */
mixin template Singleton() {
  /**
   * mixinされた元の型を表します。
   */
  alias typeof(this) Self;

  /**
   * シングルトンのインスタンス。
   */
  static Self singleton;

  /**
   * シングルトンが初期化されていなければ初期化して返します。
   */
  static Self opCall() {
    return getInstance();
  }

  /// ditto
  static Self getInstance() {
    if (!singleton) singleton = new Self;
    return singleton;
  }

  static ~this() {
    destroy(singleton);
  }
}

/**
 * T型の要素を保持するコンテナです。
 * ---
 * Pool!int pool;
 * pool.insert(4);
 * pool.insert(5);
 * pool.insert(6);
 * assert(pool.length == 3);
 * pool.removeIf((ref v) => v%2 == 0);
 * assert(ls[] == [5]);
 * ---
 * 以下のような方法で追加/削除を行います。
 * ---
 * a b c d e . . .
 * a e c d . . . . // bを消去: 末尾の要素eで置き換える
 * a e c d f . . . // fを追加: 末尾に追加
 * ---
 * 追加/削除がO(1)で行えますが、データのコピーが発生します。
 * データの順番は保持されませんが、メモリ空間に連続して配置されます。
 * また領域が足りる限りメモリの再確保が発生しません。
 */
struct Pool(T) {
  T[] _payload;
  size_t _length;

  @property {
    /**
     * 要素数が0かどうかを返します。
     */
    bool empty() const {
      return _length == 0;
    }

    /**
     * 要素数を取得/セットします。
     */
    size_t length() const {
      return _length;
    }

    /// ditto
    void length(size_t v) {
      _length = v;
      if (_payload.length < _length)
        _payload.length = _length;
    }
  }

  /**
   * lsで初期化します。
   */
  this(T[] ls) {
    _payload = ls;
    _length = _payload.length;
  }

  /**
   * 長さlで初期化します。
   */
  this(size_t l) {
    _payload.length = l;
    _length = 0;
  }

  /**
   * それぞれの要素にcondを適用します。
   * condがtrueを返した要素を破壊的に取り除きます。
   * 取り除いた要素数を返します。
   */
  size_t removeIf(bool delegate(ref T) cond) {
    size_t k = 0;
    for (size_t i = 0; i < _length; i++) {
      if (cond(_payload[i])) {
        _payload[i--] = _payload[--_length];
        ++k;
      }
    }
    return k;
  }

  /**
   * それぞれの要素にcondを適用します。
   * condがtrueを返したとき、その要素を破壊的に取り除きtrueを返します。
   */
  bool removeFirst(bool delegate(ref T) cond) {
    foreach (i; 0.._length) {
      if (cond(_payload[i])) {
        _payload[i] = _payload[--_length];
        return true;
      }
    }

    return false;
  }

  /**
   * 保持している配列のスライスを返します。
   */
  T[] opSlice() {
    return _payload[0.._length];
  }

  /**
   * vを要素として追加します。必要ならば領域の再確保が行われます。
   */
  void insert(T v) {
    if (_payload.length < ++_length)
      _payload.length = _length;
    _payload[_length-1] = v;
  }
}

unittest {
  import std.algorithm;

  Pool!int ls;
  assert(ls.empty);

  ls.insert(4);
  ls.insert(5);
  ls.insert(6);
  assert(ls.length == 3);

  foreach (ref v; ls) ++v;
  assert(reduce!"a+b"(ls) == 18);

  size_t removedLength = ls.removeIf((ref v) => v%2 == 1);
  assert(removedLength == 2);

  assert(ls[] == [6]);

  bool removed = ls.removeFirst((ref v) => v%2 == 0);
  assert(removed);
}

/**
 * ポインタ、特に[x, y, z, x, y, z ...]のような配置のポインタを扱う構造体です。
 * 要素へのアクセスは列単位になり、範囲外アクセスは検出されます。
 * thino.graphの$(J BufferObject).$(J Map)はRectangularPointerのインスタンスへのaliasで、
 * $(J BufferObject)のT, Nが対応しています。
 * Note:
 *   Nが1のときは単に範囲外アクセスの検出を行うポインタのインターフェイスを取ります。
 * ---
 * // 位置をpos, 速度をvecで表したパーティクルをセットする例
 * struct Unit { Vec3 pos, vec; }
 * Unit[] list;
 * ...
 * VBO!(float, 3) foo; // 実際にはShaderProgram.AttributeBinderが自動で生成する
 * ...
 * foo.setLength(list.length * 2);
 * foo.modifyMapBuffer((RectangularPointer!(float, 3) p) {
 *   size_t i;
 *   foreach (val; list) {
 *     p[i++] = val.pos[];
 *     p[i++] = (val.pos + val.vec)[];
 *   }
 * });
 * ---
 */
struct RectangularPointer(T, size_t N) {
  private T* _pointer;
  private size_t _length;

  /**
   * ポインタと長さを渡して初期化します。
   * このlが$(J BufferObject)のインスタンスのlengthと対応します。
   */
  this(T* p, size_t l) {
    _pointer = p;
    _length = l;
  }

  /**
   * 行の長さを返します。
   * すなわち、ポインタは(N * length)個の要素の保持を想定しています。
   */
  @property size_t length() const {
    return _length;
  }

  static if (N != 1) {
    /// i番目の列の要素を取得/セットします。
    const(T)[] opIndex(size_t i) const {
      assert(i < _length);
      return _pointer[N*i .. N*i + N];
    }

    /// ditto
    void opIndexAssign(in T[] v, size_t i) {
      assert(i < _length);
      assert(v.length == N);
      _pointer[N*i .. N*i + N] = v[];
    }

    /// i..j番目の列の要素を取得/セットします。
    const(T)[] opSlice(size_t i, size_t j) const {
      assert(i <= j && j <= _length);
      return _pointer[N*i .. N*j];
    }

    /// ditto
    void opSliceAssign(in T[] v, size_t i, size_t j) {
      assert(i <= j && j <= _length);
      assert(v.length == (j-i)*N);
      _pointer[N*i .. N*j] = v[];
    }

    /// ditto
    void opSliceAssign(in T[N][] v, size_t i, size_t j) {
      assert(i <= j && j <= _length);
      assert(v.length == (j-i));
      foreach (k; i..j) _pointer[N*k .. N*k + N] = v[k-i][];
    }
  } else {
    /// i番目の要素を取得/セットします。
    T opIndex(size_t i) const {
      assert(i < _length);
      return _pointer[i];
    }

    /// ditto
    void opIndexAssign(in T v, size_t i) {
      assert(i < _length);
      _pointer[i] = v;
    }

    /// i..j番目の要素を取得/セットします。
    const(T)[] opSlice(size_t i, size_t j) const {
      assert(i <= j && j <= _length);
      return _pointer[i..j];
    }

    /// ditto
    void opSliceAssign(in T[] v, size_t i, size_t j) {
      assert(i <= j && j <= _length);
      assert(v.length == j-i);
      _pointer[i..j] = v[];
    }
  }
}

unittest {
  import std.stdio;
  int[] data = [1,2,3,4,5,6,7,8,9];
  auto ptr = RectangularPointer!(int, 3)(data.ptr, 3);
  assert(ptr.length == 3);
  assert(ptr[0] == [1,2,3]);
  assert(ptr[0..2] == [1,2,3,4,5,6]);
  ptr[0] = [0, 1, 2];
  ptr[1..3] = [3,4,5,6,7,8];
  assert(data == [0,1,2,3,4,5,6,7,8]);

  ptr[1..3] = [[4,5,6], [3,2,1]];
  assert(data == [0,1,2,4,5,6,3,2,1]);

  auto ptr2 = RectangularPointer!(int, 1)(data.ptr, 9);
  assert(ptr2[4] == 5);
  assert(ptr2[0..3] == [0,1,2]);
  ptr2[0] = 10;
  ptr2[1..4] = [11,12,13];
  assert(data == [10,11,12,13,5,6,3,2,1]);
}

/**
 * 連続してtrueである回数をカウントします。
 * ---
 * BoolCount zKey;
 * ...
 * zKey.update(window.getKey('Z'));
 * if (zKey.on) { .. }
 * ---
 */
struct BoolCount {
  int count;

  /**
   * 内部のカウンタを、tがtrueならばインクリメントし、tがfalseならば0にします。
   */
  void update(bool t) {
    if (t) ++count;
    else count = 0;
  }

  /**
   * 内部のカウンタが1または21, 25, 29, 33...のときtrueを返します。
   */
  @property bool on() const {
    return count == 1 || (count > 20 && count%4 == 1);
  }
}

unittest {
  BoolCount t;
  t.update(true);
  assert(t.on);
  t.update(true);
  assert(!t.on);
  t.update(false);
  t.update(true);
  assert(t.on);
}

/**
 * リングバッファの実装です。
 * ---
 * auto buf = RingBuffer!int(256);
 * buf.insertBack(1);
 * buf.insertBack(2);
 * buf.insertBack(4);
 * buf.insertBack(5);
 * buf.removeFront();
 * buf.removeWhile(i => i%2 == 0);
 * assert(buf.front == 5);
 * ---
 */
struct RingBuffer(T) {
  private:
  T[] _payload;
  bool _zero = true;
  size_t _begin, _end;

  public:
  /**
   * バッファの要素数が0であるか返します。
   */
  @property bool empty() const {
    return _zero;
  }

  /**
   * バッファの要素数が上限に達しているか返します。
   */
  @property bool max() const {
    return _begin == _end && !_zero;
  }

  /**
   * バッファの要素数を返します。
   */
  @property size_t length() const {
    if (max) return _payload.length;
    return (_end - _begin + _payload.length) % _payload.length;
  }

  /**
   * コンストラクタで指定したバッファの容量を返します。
   */
  @property size_t capacity() const {
    return _payload.length;
  }

  /**
   * バッファの容量を指定して初期化します。
   */
  this(size_t max) {
    _payload = new T[](max);
  }

  /**
   * バッファの末尾に要素を追加します。
   */
  void insertBack(in T v) {
    assert(!max, "RingBuffer.insertBack: max buffer");

    _payload[_end] = v;
    _end = (_end + 1) % _payload.length;
    _zero = false;
  }

  /**
   * バッファの先頭の要素を返します。
   */
  T front() {
    assert(!empty, "RingBuffer.removeFront: empty buffer");
    return _payload[_begin];
  }

  /**
   * バッファの先頭の要素を破壊的に取り除きます。
   * 既存のレンジは無保証になります。
   */
  void removeFront() {
    assert(!empty, "RingBuffer.removeFront: empty buffer");

    _begin = (_begin + 1) % _payload.length;
    if (_begin == _end) _zero = true;
  }

  /**
   * バッファの先頭から順にcondを適用していき、falseが返るまで要素を破壊的に取り除き続けます。
   * 既存のレンジは無保証になります。
   */
  void removeWhile(bool delegate(T) cond) {
    if (_zero) return;

    while (cond(_payload[_begin])) {
      _begin = (_begin + 1) % _payload.length;

      if (_begin == _end) {
        _zero = true;
        break;
      }
    }
  }

  /**
   * レンジの実装です。双方向レンジになっています。
   */
  struct Range {
    private:
    T[] _payload;
    bool _zero;
    size_t _begin, _end;

    public:
    /// 入力レンジのプリミティブ
    @property bool empty() const {
      return _zero;
    }

    /// ditto
    @property ref inout(T) front() inout {
      assert(!empty, "RingBuffer.Range.front: empty range");
      return _payload[_begin];
    }

    /// ditto
    void popFront() {
      assert(!empty, "RingBuffer.Range.popFront: empty range");
      _begin = (_begin + 1) % _payload.length;
      if (_begin == _end) _zero = true;
    }

    /// 前進レンジのプリミティブ
    Range save() {
      return Range(_payload, _zero, _begin, _end);
    }

    /// 双方向レンジのプリミティブ
    @property ref inout(T) back() inout {
      assert(!empty, "RingBuffer.Range.back: empty range");
      return _payload[(_end == 0) ? $-1 : _end-1];
    }

    /// ditto
    void popBack() {
      assert(!empty, "RingBuffer.Range.popBack: empty range");
      _end = (_end - 1 + _payload.length) % _payload.length;
      if (_begin == _end) _zero = true;
    }
  }

  /**
   * レンジを返します。
   */
  Range opSlice() {
    return Range(_payload, _zero, _begin, _end);
  }
}

unittest {
  import std.array;

  auto buf = RingBuffer!int(4);
  assert(buf.empty);
  assert(buf.capacity == 4);

  buf.insertBack(1);
  buf.insertBack(2);
  assert(buf.array == [1, 2]);
  assert(buf.length == 2);
  assert(!buf.empty);
  assert(!buf.max);

  buf.insertBack(4);
  buf.insertBack(5);
  assert(buf.max);

  assert(buf.front == 1);
  buf.removeFront();
  assert(buf.front == 2);

  buf.insertBack(6);
  buf.removeWhile(i => i%2 == 0);
  buf.insertBack(7);
  assert(buf.array == [5, 6, 7]);

  auto range = buf[];
  assert(range.front == 5);
  assert(range.back == 7);
  assert(!range.empty);

  auto saved = range.save();
  range.popFront();
  assert(range.array == [6, 7]);
  assert(saved.array == [5, 6, 7]);

  saved.popBack();
  assert(saved.array == [5, 6]);

  saved.popBack();
  saved.popBack();
  assert(saved.empty);
}


