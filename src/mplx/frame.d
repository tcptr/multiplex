module mplx.frame;

import thino;
public import mplx.common;
import mplx.background;
import mplx.controller;
import mplx.graph;
import std.random;
import std.array;

immutable {
  float FOV = 90;
  float CameraFar = 4850.0;
  float CameraZ = 155.0;
  Vec4 White = Vec4(1,1,1,1);
  Vec4 Silver = Vec4(0.6,0.6,0.6,1);
  Vec4 Black = Vec4(0,0,0,0.9);
  Vec4 Blue = Vec4(0.3,0.3,5,0);
  Vec4 Sky = Vec4(0.4,0.9,1.0,1);
  Vec4 Luna = Vec4(0.4,0.6,0.9,1);

  string[] ScreenResolutions =
      ["auto", "1024x576", "1280x720", "1360x768", "1920x1080"];
}

enum Theme {
  Square,
  Star,
  Terminal,
  History,
}

class AudioManager {
  private:
  Source _bgm;
  string _bgmName;
  float _bgmGain;
  float _seGain;
  Source[string] _channel;
  int _regression;

  static immutable string[string] BGM, SE;
  static this() {
    BGM = [
      "title": "resources/title.ogg",
      "pulse0": "resources/pulse0.ogg",
      "pulse1": "resources/pulse1.ogg",
      "pulse2": "resources/pulse2.ogg",
    ];

    SE = [
      "select": "resources/select.wav",
      "cancel": "resources/cancel.wav",
      "move": "resources/move.wav",
      "tick": "resources/tick.wav",
      "bomb": "resources/bomb.wav",
      "shot": "resources/shot.wav",
      "cancel": "resources/cancel.wav",
      "collapse": "resources/collapse.wav",
      "crash": "resources/crash.wav",
      "crashGate": "resources/crashGate.wav",
      "crashShuriken": "resources/crashShuriken.wav",
      "damage": "resources/damage.wav",
      "enemySphere": "resources/enemySphere.wav",
      "enemyGear": "resources/enemyGear.wav",
      "enemyTurtle": "resources/enemyTurtle.wav",
      "enemyMissile": "resources/enemyMissile.wav",
      "enemyShuriken": "resources/enemyShuriken.wav",
      "enemyGate": "resources/enemyGate.wav",
      "enemyConnect": "resources/enemyConnect.wav",
      "hit": "resources/hit.wav",
      "reborn": "resources/reborn.wav",
      "clear": "resources/clear.wav",
    ];
  }

  public:
  @property {
    mixin(AttrReader("bgmGain", "seGain"));

    void bgmGain(int k) {
      float v = k * 0.1;
      _bgmGain = v;
      if (_bgm) _bgm.gain = v;
    }

    void seGain(int k) {
      float v = k * 0.1;
      _seGain = v;
    }
  }

  this() {
    foreach (k, name; SE) Sound().preloadWav(name);
    _channel = [
      "crash": null,
      "crashShuriken": null,
      "move": null,
      "hit": null,
      "shot": null,
    ];
    _regression = 0;
  }

  void playSE(string name) {
    if (_seGain == 0) return;
    auto src = Sound().source(SE[name]);
    auto current = name in _channel;
    if (current) {
      if (*current) current.gain(0);
      *current = src;
    }

    src.gain =  _seGain * pow((60 - _regression) / 60.0, 2.0);
    src.play();

    if (name == "bomb" || name == "damage") _regression = 40;
  }

  void playBGM(string name) {
    void callback() {
      if (_bgmGain == 0) return;
      _bgm = Sound().source(BGM[name]).gain(_bgmGain).loop(true);
      _bgm.play();
    }

    if (!_bgm || _bgm.finished) {
      // 終了済み or 未再生なら即座に再生開始
      _bgmName = name;
      callback();
    } else if (_bgmName != name) {
      _bgmName = name;
      _bgm.onFinished(&callback).fadeOut();
    }
  }

  void stopBGM(bool fade = true) {
    if (_bgm && !_bgm.finished) {
      _bgmName = null;
      if (fade) _bgm.fadeOut();
      else _bgm.stop();
    }
  }

  void update() {
    if (_regression > 0) {
      --_regression;
      if (_bgm)
        _bgm.gain = _bgmGain * pow((300 - _regression) / 300.0, 1.5);
    }
    Sound().update();
  }
}

class Frame {
  Window _window;
  alias _window this;

  private:
  Config _config;
  AudioManager _audio;
  GameController _controller;
  TextureRenderer _textureRenderer;
  EntityRenderer _entityRenderer;
  Background _background;
  Label _label;
  GlowEffect _glow;
  SplashRenderer _splash;
  Font _font;

  Theme _theme;
  Mat4 _projection;
  Mat4 _pvMatrix;
  Vec2 _camera;
  Vec4 _baseColor;
  HSV _baseHSV;
  float _glowStrength;

  Texture _squareWrapper, _starWrapper; // TODO まとめる

  public:
  @property {
    mixin(AttrReader(
        "config", "audio", "controller", "textureRenderer", "entityRenderer",
        "background", "label", "glow", "splash", "font",

        "theme", "projection", "pvMatrix", "camera", "baseColor",
        "glowStrength"));

    void theme(Theme theme) {
      final switch (theme) {
      case Theme.Square:
        _baseColor = Vec4(0.8, 0.3, 0.3, 1.0);
        _background.wrapper = _squareWrapper;
        break;
      case Theme.Star:
        _baseColor = Luna;
        _background.wrapper = _starWrapper;
        break;
      case Theme.Terminal:
        _baseColor = Vec4(0.3, 0.8, 0.5, 1.0);
        _background.wrapper = null;
        break;
      case Theme.History:
        _baseColor = Vec4(0.2, 0.2, 0.2, 1.0);
        _background.wrapper = null;
        break;
      }

      _baseHSV = HSV.fromRGB(_baseColor.rgb);
    }

    Vec4 mainColor() const {
      HSV hsv = _baseHSV;
      hsv.H += uniform(-30, 30);
      return hsv.toRGB ~ _baseColor.a;
    }

    void camera(Vec2 pos) {
      _camera = pos;
      _pvMatrix = projection * Mat4.lookAt(Vec3(camera.x,camera.y,CameraZ),
              Vec3(camera.x,camera.y,0), Vec3(0,1,0));
    }

    void glowStrength(float v) {
      v = 1.7 + v*0.05;
      _glowStrength = v;
      _glow.setGaussianWeight(40, v);
    }
  }

  this(Window w, Config c) {
    debug {
      Debugger().add(() => text("FPS ", w.FPS));
      Debugger().add(() => text("skipped ", w.skipped));
    }

    _window = w;
    _config = c;

    _config.setDefault("joystick", Joystick.list[0]);
    _config.setDefault("bgm gain", 10);
    _config.setDefault("se gain", 10);
    _config.setDefault("glow", 5);

    _textureRenderer = new TextureRenderer;
    _entityRenderer = new EntityRenderer;
    _background = new Background;
    _label = new Label(_window);
    _glow = new HalfGlowEffect(_window, 5);
    _splash = new SplashRenderer;
    _font = Font.load("resources/font.ukst");
    _audio = new AudioManager;

    _controller = new GameController(_config.get!JoystickID("joystick"));
    _audio.bgmGain = _config.get!int("bgm gain");
    _audio.seGain = _config.get!int("se gain");
    this.glowStrength = _config.get!int("glow");

    _projection = Mat4.perspective(FOV, _window.aspect, 0.1, CameraFar);
    this.camera = Vec2(0, 0);

    _squareWrapper = new Texture("resources/square.jpg");
    _starWrapper = new Texture("resources/star.jpg");

    _squareWrapper.repeat = Texture.MirroredRepeat;
    _starWrapper.repeat = Texture.MirroredRepeat;
  }
}

abstract class FrameScene : Scene {
  Frame frame;

  private:
  bool _exit, _moveLock, _pause;
  int _splash;

  public:
  @property {
    mixin(AttrReader("pause"));
    mixin(AttrWriter("pause"));

    bool splashLocked() const {
      return _moveLock && !_splash;
    }
  }

  this(Frame f) {
    frame = f;
  }

  void beginSplash(int count) {
    _splash = count;
  }

  void splashLock(void delegate() finished) {
    frame.background.fadeOut(finished);
    _moveLock = true;
    _splash = 100;
  }

  abstract protected {
    void init();
    void fini();
    void move();
    void draw();
  }

  protected void drawMain() {
    frame.background.draw(frame);
    draw();
    if (!_moveLock || _splash)
      frame.label.draw(frame);
  }

  protected void drawWrap() {
  }

  override void nextScene(Scene s) {
    super.nextScene(s);
    _exit = true;
  }

  override void run() {
    init();

    while (frame.loop() && !_exit) {
      frame.controller.update(frame);
      if (!_pause) {
        frame.audio.update();
        frame.textureRenderer.update();
        frame.background.move(frame);
        frame.label.move(frame);
        frame.splash.move(frame);
      }

      if (!_moveLock) move();

      if (_splash) frame.splash.beginSplash(&drawMain, _splash);
      frame.rendering({
        frame.glow.effect({
          if (!_splash) drawMain();
          frame.splash.draw(frame);
          drawWrap();
        });
      });

      _splash = 0;
    }

    if (_exit) fini();
  }
}

