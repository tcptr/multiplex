/**
 * サウンド関連の操作はこのモジュールで完結しています。
 * 比較的独立していて、グラフィック関連の機能を使用せず単独で使用することも可能です。
 */
module thino.sound;

version (NoSound) {} else {

import thino.openal;
import thino.datatype : Pool, Singleton;
version (StbVorbis) {
  import stb.vorbis;
  import std.string : toStringz;
}
import std.stdio : File, SEEK_CUR;
import std.path : extension;
import std.conv : to, text;
import std.exception : enforce;
import std.array : back, popBack, empty;

private struct WaveInfo {
  ALsizei size, frequency;
  ALenum format;
  ubyte[] data;
}

private alias ALuint Buffer;

/**
 * ソースの生成/再利用を管理するクラスです。$(J Singleton)です。
 * ---
 * Sound().source("hoge.wav").gain(0.8).play();
 * ...
 * while (true) {
 *   ...
 *   Sound().update();
 * }
 * ---
 */
class Sound {
  invariant() {
    auto e = alGetError();
    assert(e == AL_NO_ERROR, alGetString(e).to!string());
  }

  mixin Singleton;

  private:
  ALCdevice* _device;
  ALCcontext* _context;
  Pool!Source _currentSources;
  ALuint[] _usableSources;
  Source delegate(ALuint, string)[string] _loader;

  this() {
    enforce(_device = alcOpenDevice(null),
        "alcOpenDevice() failed");
    enforce(_context = alcCreateContext(_device, null),
        "alcCreateContext() failed");
    enforce(alcMakeContextCurrent(_context) == ALC_TRUE,
        "alcMakeContextCurrent() failed");

    alDistanceModel(AL_NONE);

    addFileSupport(".wav", &wavSource);
    version (StbVorbis) addFileSupport(".ogg", &oggSource);
  }

  ~this() {
    alcMakeContextCurrent(null);
    alcDestroyContext(_context);

    auto ls = _buffers.values;
    alDeleteBuffers(cast(uint)ls.length, cast(ALuint*)(ls.ptr));

    alcCloseDevice(_device);
  }

  ALuint popUsableSource() {
    ALuint source;
    if (_usableSources.empty) {
      alGenSources(1, &source);
    } else {
      source = _usableSources.back;
      _usableSources.popBack();
    }
    return source;
  }

  public:
  /**
   * filenameを必要であれば読み込み、$(J Source)を生成して返します。
   * デフォルトではwavファイルをサポートしています。
   * version=StbVorbisではstb_vorbis.cによるoggのストリーミングをサポートします。
   */
  Source source(string filename) {
    auto f = extension(filename) in _loader;
    enforce(f, text("unsupported file extension '", extension(filename), "'"));

    ALuint s = popUsableSource();
    Source source = (*f)(s, filename);

    if (source) _currentSources.insert(source);
    else _usableSources ~= s;
    return source;
  }

  void addFileSupport(string ext, Source delegate(ALuint, string) f) {
    _loader[ext] = f;
  }

  /**
   * 再生中の$(J Source)を走査し、ストリーミングの更新、再生済みソースの回収を行います。
   * 定期的に呼ぶ必要があります。
   */
  void update() {
    _currentSources.removeIf((ref v) {
      v.update();

      if (v.finished) {
        if (v._callback) v._callback();
        _usableSources ~= v._source;
        return true;
      }
      return false;
    });
  }

  /**
   * 全体の音量を設定します。デフォルトは1.0です。
   */
  void globalGain(float v) {
    alListenerf(AL_GAIN, v);
  }

  /**
   * リスナーの位置をposに設定します。
   */
  void listenerPos(float[3] pos) {
    alListenerfv(AL_POSITION, pos.ptr);
  }

  /**
   * 再生中の全ての$(J Source)に対してそれぞれの処理を実行します。
   */
  void stopAll() {
    foreach (ref v; _currentSources) v.stop();
  }

  /// ditto
  void pauseAll() {
    foreach (ref v; _currentSources) v.pause();
  }

  /// ditto
  void resumeAll() {
    foreach (ref v; _currentSources) v.resume();
  }

  // load WAV support -----------------
  private Buffer[string] _buffers;

  /**
   * wavでは短めの音源を扱うことを想定しており、
   * 一度読み込んだwavファイルはバッファとして保持されます。
   * 使用していないバッファを解放します。
   */
  void reduceBuffers() {
    foreach (key; _buffers.keys) {
      alDeleteBuffers(1, cast(ALuint*)(&_buffers[key]));
      if (alGetError() == AL_NO_ERROR)
        _buffers.remove(key);
    }
  }

  /**
   * 予めwavファイルfilenameを読み込んでおきます。
   * filenameの拡張子はwavである必要があります。
   */
  void preloadWav(string filename) {
    if (filename in _buffers) return;

    WaveInfo info = loadWavFile(filename);
    Buffer buf;
    alGenBuffers(1, &buf);
    alBufferData(buf, info.format,
        cast(void*)info.data, info.size, info.frequency);
    _buffers[filename] = buf;
  }

  private Source wavSource(ALuint source, string filename) {
    preloadWav(filename);
    Buffer* buf = filename in _buffers;

    if (buf) {
      alSourcei(source, AL_BUFFER, *buf);
      return new Source(source);
    }

    return null;
  }

  // load OGG support -----------------
  version (StbVorbis) {
    private Source oggSource(ALuint source, string filename) {
      return new OggStreamSource(source, filename);
    }
  }
}

// from http://www.dunsanyinteractive.com/blogs/oliver/?p=72
private WaveInfo loadWavFile(string filename) {
  static struct RiffHeader {
    char[4] id;
    int size;
    char[4] format;
  }

  static struct SubChunkHeader {
    char[4] id;
    int size;
  }

  static struct FormatChunk {
    short audioFormat;
    short numChannels;
    int sampleRate;
    int byteRate;
    short blockAlign;
    short bitsPerSample;
  }

  auto fh = File(filename, "rb");

  T readBy(T)() {
    T[1] ret;
    fh.rawRead(ret);
    return ret[0];
  }

  auto riffHeader = readBy!RiffHeader;
  enforce(
      riffHeader.id == "RIFF" && riffHeader.format == "WAVE",
      "invalid RIFF or WAVE header: " ~ filename);

  FormatChunk format;
  ubyte[] data;

  while (fh.tell < 8 + riffHeader.size) {
    auto subChunkHeader = readBy!SubChunkHeader;

    switch (subChunkHeader.id) {
    case "fmt ":
      format = readBy!FormatChunk;
      // ignore extended data
      if (subChunkHeader.size > 16)
        fh.seek(subChunkHeader.size - 16, SEEK_CUR);
      break;

    case "data":
      data = new ubyte[](subChunkHeader.size);
      fh.rawRead(data);
      break;

    default:
      fh.seek(subChunkHeader.size, SEEK_CUR);
      break;
    }
  }

  ALenum alFormat = -1;
  if (format.numChannels == 1) {
    if (format.bitsPerSample == 8) alFormat = AL_FORMAT_MONO8;
    else if (format.bitsPerSample == 16) alFormat = AL_FORMAT_MONO16;

  } else if (format.numChannels == 2) {
    if (format.bitsPerSample == 8) alFormat = AL_FORMAT_STEREO8;
    else if (format.bitsPerSample == 16) alFormat = AL_FORMAT_STEREO16;
  }

  enforce(alFormat != -1, "invalid wave format: " ~ filename);
  enforce(!data.empty, "empty data: " ~ filename);

  return WaveInfo(
      cast(ALsizei)data.length,
      format.sampleRate,
      alFormat,
      data);
}

/**
 * OpenALのソースのラッパーです。$(J Sound)クラスによって生成されます。
 * 多くのメソッドはthisを返すため、メソッドチェインで扱うことができます。
 * Note:
 *   $(J Sound)クラスではOpenALのソースを再利用しています。
 *   AL_GAINに限り停止時に1.0にリセットされますが、その他の属性の変更は
 *   新たに割り当てたソースに残っています。ユーザは$(J pos)や$(J relative)を変更して
 *   使う場合、新たなSourceに関しても明示的に設定する必要があります。
 */
class Source {
  protected:
  ALuint _source;
  void delegate() _callback;
  bool _finished = true, _fadeOut;

  this(ALuint v) {
    _source = v;
    _finished = false;
  }

  @property ALint state() {
    ALint s;
    alGetSourcei(_source, AL_SOURCE_STATE, &s);
    return s;
  }

  protected void update() {
    if (_finished) return;

    if (_fadeOut) {
      float g;
      alGetSourcef(_source, AL_GAIN, &g);
      g -= 0.01;

      if (g < 0) stop();
      else alSourcef(_source, AL_GAIN, g);
    }

    if (state == AL_STOPPED) {
      alSourcei(_source, AL_BUFFER, AL_NONE);
      _finished = true;
    }
  }

  public:
  /**
   * 再生を開始します。
   */
  Source play() {
    if (_finished) return this;
    alSourcePlay(_source);
    return this;
  }

  /**
   * 再生を停止します。$(J Sound)().$(J update)()が呼ばれ次第Sourceは回収され、finishedはtrueになります。
   */
  Source stop() {
    if (_finished) return this;
    alSourceStop(_source);
    alSourcef(_source, AL_GAIN, 1.0);
    return this;
  }

  /**
   * 再生を一時停止します。
   */
  Source pause() {
    if (_finished) return this;
    alSourcePause(_source);
    return this;
  }

  /**
   * 一時停止していたファイルの再生を再開します。
   */
  Source resume() {
    if (_finished) return this;
    if (state == AL_PAUSED)
      alSourcePlay(_source);
    return this;
  }

  /**
   * フェードアウトを開始します。フェードアウトが開始すると、
   * $(J Sound)().$(J update)()がおよそ100回呼ばれるあたりで停止します。
   */
  Source fadeOut() {
    _fadeOut = true;
    return this;
  }

  @property {
    /**
     * 再生が終了しているかを返します。
     * メソッドstopをコールした直後はこの値はtrueにはなりません。
     * $(J Sound)クラスによって回収されることでtrueになります。
     */
    bool finished() const {
      return _finished;
    }

    /**
     * 再生が終了した際に呼ばれるコールバックを設定します。
     * 既に設定されていた場合は新たなものがセットされます。
     */
    Source onFinished(void delegate() f) {
      _callback = f;
      return this;
    }

    /**
     * 音源の位置をposに設定します。
     */
    Source pos(float[3] pos) {
      if (_finished) return this;
      alSourcefv(_source, AL_POSITION, pos.ptr);
      return this;
    }

    /**
     * 音源の位置がリスナーからの相対的な位置かを指定します。デフォルトはfalseです。
     */
    Source relative(bool r) {
      if (_finished) return this;
      alSourcei(_source, AL_SOURCE_RELATIVE,
          r ? AL_TRUE : AL_FALSE);
      return this;
    }

    /**
     * ループ再生するかを指定します。この値をtrueにした場合、
     * Sourceは明示的に停止しない限りループ再生を続けます。
     */
    Source loop(bool r) {
      if (_finished) return this;
      alSourcei(_source, AL_LOOPING,
          r ? AL_TRUE : AL_FALSE);
      return this;
    }

    /**
     * 現在の音源の音量を取得/セットします。デフォルトは1.0です。
     */
    float gain() const {
      if (_finished) return 0.0;
      float v;
      alGetSourcef(_source, AL_GAIN, &v);
      return v;
    }

    /// ditto
    Source gain(float v) {
      if (_finished) return this;
      alSourcef(_source, AL_GAIN, v);
      return this;
    }
  }
}

version (StbVorbis) {

  private immutable NumBuffers = 3;
  private immutable BufferSize = 4096*8;

  private class OggStreamSource : Source {
    private:
    Buffer _buffers[NumBuffers];
    bool _loop;
    bool _playing;

    stb_vorbis* _stream;
    stb_vorbis_info _info;
    ALenum _format;
    size_t _total;

    this(ALuint v, string filename) {
      super(v);
      alGenBuffers(NumBuffers, _buffers.ptr);
      _stream = stb_vorbis_open_filename(
          cast(char*)toStringz(filename), null, null);
      enforce(_stream, "stb_vorbis_open_filename failed: " ~ filename);

      _info = stb_vorbis_get_info(_stream);
      _format = (_info.channels == 2) ? AL_FORMAT_STEREO16
                                    : AL_FORMAT_MONO16;
      _total = stb_vorbis_stream_length_in_samples(_stream) * _info.channels;

      enforce(insertChunk(_buffers[0]), "insertChunk: empty data");

      foreach (buf; _buffers[1..$])
        if (!insertChunk(buf)) break;
    }

    ~this() {
      alDeleteBuffers(NumBuffers, _buffers.ptr);
      stb_vorbis_close(_stream);
    }

    private bool insertChunk(ALuint buffer) {
      ALshort pcm[BufferSize];
      int size;

      while (size < BufferSize) {
        int loaded = stb_vorbis_get_samples_short_interleaved(
            _stream, _info.channels, pcm.ptr + size, BufferSize - size);

        if (loaded <= 0) break;
        size += loaded * _info.channels;
      }
      if (size == 0) return false;

      alBufferData(buffer, _format, pcm.ptr,
          size * cast(uint)ALshort.sizeof, _info.sample_rate);
      alSourceQueueBuffers(_source, 1, &buffer);

      _total -= size;
      return true;
    }

    public:
    override void update() {
      if (_finished) return;

      ALint processed;
      alGetSourcei(_source, AL_BUFFERS_PROCESSED, &processed);
      bool inserted;

      while (processed--) {
        ALuint buffer;
        alSourceUnqueueBuffers(_source, 1, &buffer);
        inserted = insertChunk(buffer);

        if (!inserted && _loop) {
          stb_vorbis_seek_start(_stream);
          _total =
              stb_vorbis_stream_length_in_samples(_stream) * _info.channels;
          inserted = insertChunk(buffer);
        }
      }

      if (state == AL_STOPPED) {
        if (_playing && inserted) alSourcePlay(_source);
        else _playing = false;
      }

      super.update();
    }

    override Source loop(bool r) {
      _loop = r;
      return this;
    }

    override Source play() {
      if (_finished) return this;
      _playing = true;
      return super.play();
    }

    override Source stop() {
      if (_finished) return this;
      _playing = false;
      return super.stop();
    }
  }
}

}/* version NoSound */

