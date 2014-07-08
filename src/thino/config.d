module thino.config;

import std.stdio;
import std.string : split, chomp;
import std.conv : to;
import std.path : dirName;
import std.file : exists, mkdirRecurse;

/**
 * 簡易的な設定ファイルを扱うクラスです。
 * Note:
 *   keyには半角英数字のみの使用を推奨します。
 * ---
 * auto cfg = new Config("fooConfig");
 * cfg.set("foo", 123);
 * cfg.save();
 * ..
 * int foo = cfg.get!int("foo");
 * ---
 */
class Config {
  private:
  immutable string _filename;
  string[string] _options;

  public:
  /**
   * filenameを読み込みます。読み込めないときは空の設定で初期化します。
   */
  this(string filename) {
    _filename = filename;

    string dir = dirName(filename);
    if (!exists(dir)) mkdirRecurse(dir);

    try {
      auto fh = File(_filename, "r");
      foreach (string buf; fh.lines()) {
        auto data = buf.chomp().split("=");
        if (data.length != 2) continue;
        _options[data[0]] = data[1];
      }
    } catch (Exception o) {}
  }

  /**
   * 設定を保存します。ファイルに書き込めないときは例外が投げられます。
   */
  void save() {
    auto f = File(_filename, "w");
    foreach (k, v; _options)
      f.writeln(k, "=", v);
  }

  /**
   * keyが存在するかを返します。
   */
  bool has(string key) const {
    return (key in _options) != null;
  }

  /**
   * keyの設定をT型に変換して返します。keyが存在しなければT.initを返します。
   * Note:
   *   T型への変換はstd.conv.toを用います。
   */
  T get(T = string)(string key) const {
    auto p = key in _options;
    return p ? to!T(*p) : T.init;
  }

  /**
   * keyにvをセットします。
   * Note:
   *   vはstd.conv.toを用いてstringに変換されます。
   */
  void set(T)(string key, T v) {
    _options[key] = to!string(v);
  }

  /**
   * keyが存在しなければ、vをセットします。
   * Note:
   *   vはstd.conv.toを用いてstringに変換されます。
   */
  void setDefault(T)(string key, T v) {
    if (!has(key))
      _options[key] = to!string(v);
  }
}

