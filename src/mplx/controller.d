module mplx.controller;

import thino;
import mplx.frame;
import std.conv : text;
import std.array;
import std.bitmanip;

// [buttonNum] : JoystickのbuttonNumで判定
// [axisNum, min, max]: JoystickのaxisNumのmin..maxを押下と判定
alias int[] ButtonInfo;

bool buttonPressed(JoystickID id, in ButtonInfo attr) {
  if (attr.length == 1) {
    return Joystick.button(id, attr[0]);

  } else if (attr.length == 3) {
    float v = Joystick.axis(id, attr[0]) * 100;
    return attr[1] < v && v < attr[2];

  } else {
    // TODO : 設定ファイルの破損をまともに伝える
    throw new Exception("invalid arguments: attr");
  }
}

class GameController {
  private:
  static struct Bind {
    ButtonInfo select, cancel, pause, trigger;
    Joystick.Stick move, shot;
  }

  static struct State {
    Joystick.Stick.Info move, shot;

    union {
      byte buttons;
      mixin(bitfields!(
        bool, "select", 1,
        bool, "cancel", 1,
        bool, "pause",  1,
        uint, "", 5));
    }

    bool trigger;

    union {
      byte arrows;
      mixin(bitfields!(
        bool, "left", 1,
        bool, "right", 1,
        bool, "up",  1,
        bool, "down", 1,
        uint, "", 4));
    }
  }

  bool _canUse;
  JoystickID _id;
  Config _config;
  Bind _bind;
  State _state;
  BoolCount _button, _arrow;

  public:
  @property {
    mixin(AttrReader("id", "canUse", "config", "state"));
    alias state this;

    void id(JoystickID i) {
      if (_canUse && i == _id) return;
      _id = i;

      if (_canUse && _config) _config.save();
      _config = new Config(text("config/joystick", _id));
      _canUse = Joystick.canUse(_id);

      registerDefaultConfigs();
      reload();
    }
  }

  this(JoystickID id) {
    this.id = id;
  }

  void registerDefaultConfigs() {
    ButtonInfo[4] buttons;
    int[4] indices;
    bool[4] reverses;

    // Xbox 360 Controller defaults
    version (Windows) {
      buttons = [[0], [1], [7], [2, 60, 101]];
      indices = [0, 1, 4, 3];
      reverses = [false, false, false, true];

    } else version (OSX) {
      buttons = [[11], [12], [4], [4, 60, 101]];
      indices = [0, 1, 2, 3];
      reverses = [false, false, false, false];

    } else { // version (linux)
      buttons = [[0], [1], [7], [2, -30, 101]];
      indices = [0, 1, 3, 4];
      reverses = [false, true, false, true];
    }

    _config.setDefault("select", buttons[0]);
    _config.setDefault("cancel", buttons[1]);
    _config.setDefault("pause", buttons[2]);
    _config.setDefault("trigger", buttons[3]);
    _config.setDefault("move x", indices[0]);
    _config.setDefault("move y", indices[1]);
    _config.setDefault("shot x", indices[2]);
    _config.setDefault("shot y", indices[3]);
    _config.setDefault("move x reverse", reverses[0]);
    _config.setDefault("move y reverse", reverses[1]);
    _config.setDefault("shot x reverse", reverses[2]);
    _config.setDefault("shot y reverse", reverses[3]);
  }

  void reload() {
    _bind.select = _config.get!ButtonInfo("select");
    _bind.cancel = _config.get!ButtonInfo("cancel");
    _bind.pause = _config.get!ButtonInfo("pause");
    _bind.trigger = _config.get!ButtonInfo("trigger");

    _bind.move = new Joystick.Stick(_id,
        _config.get!int("move x"),
        _config.get!int("move y"),
        _config.get!bool("move x reverse"),
        _config.get!bool("move y reverse"));

    _bind.shot = new Joystick.Stick(_id,
        _config.get!int("shot x"),
        _config.get!int("shot y"),
        _config.get!bool("shot x reverse"),
        _config.get!bool("shot y reverse"));

    _button.count = _arrow.count = 1;

    _state.move = Joystick.Stick.Info(0, 0);
    _state.shot = Joystick.Stick.Info(0, 0);
    _state.trigger = false;
  }

  void update(Frame frame) {
    with (_state) {
      select = frame.getKey('Z') == Press;
      cancel = frame.getKey('X') == Press;
      pause = frame.getKeyNamed!"ESCAPE"() == Press;
      trigger = false;

      left = frame.getKeyNamed!"LEFT"() == Press;
      right = frame.getKeyNamed!"RIGHT"() == Press;
      up = frame.getKeyNamed!"UP"() == Press;
      down = frame.getKeyNamed!"DOWN"() == Press;

      if (_canUse) {
        select = select || buttonPressed(_id, _bind.select);
        cancel = cancel || buttonPressed(_id, _bind.cancel);
        pause = pause || buttonPressed(_id, _bind.pause);
        trigger = buttonPressed(_id, _bind.trigger);

        move = _bind.move.get();
        shot = _bind.shot.get();

        // map move stick to arrow button
        if (move.len > 0.5) {
          if (move.rad > PI_4*3 || move.rad < -PI_4*3) left = true;
          else if (move.rad > PI_4) up = true;
          else if (move.rad < -PI_4) down = true;
          else right = true;
        }
      }
    }

    _button.update(cast(bool)_state.buttons);
    _arrow.update(cast(bool)_state.arrows);

    if (!_button.on) _state.buttons = 0;
    if (!_arrow.on) _state.arrows = 0;
  }
}

class Input {
  struct Info {
    float rad, len;
  }

  protected Info _move, _shot;
  protected bool _trigger;

  mixin(AttrReader("move", "shot", "trigger"));

  abstract void update(Frame);

  void assignByteData(byte[5] data) {
    _move.rad = data[0] * PI / 128;
    _move.len = cast(ubyte)(data[1]) / 255.0;
    _shot.rad = data[2] * PI / 128;
    _shot.len = cast(ubyte)(data[3]) / 255.0;
    _trigger  = cast(bool)(data[4] & 0b00000001);
  }
}

class ControllerInput : Input {
  private GameController _controller;

  this(GameController controller) {
    _controller = controller;
  }

  override void update(Frame frame) {
    byte[5] state;
    _controller.update(frame);

    auto tmp = _controller.move;
    state[0] = cast(byte)(tmp.rad * 127 / PI);
    state[1] = cast(byte)(tmp.len * 255);

    tmp = _controller.shot;
    state[2] = cast(byte)(tmp.rad * 127 / PI);
    state[3] = cast(byte)(tmp.len * 255);

    if (_controller.trigger) state[4] |= 0b00000001;

    assignByteData(state);
  }
}

class LoggerInput : ControllerInput {
  private Appender!(byte[5][]) _app;

  this(T...)(T args) {
    super(args);
  }

  const(byte[5])[] data() const {
    return _app.data;
  }

  override void assignByteData(byte[5] data) {
    super.assignByteData(data);
    _app.put(data);
  }
}

class ReplayInput : Input {
  byte[5][] _data;

  this(byte[5][] d) {
    _data = d;
  }

  override void update(Frame frame) {
    byte[5] state;
    if (!_data.empty) {
      state = _data.front;
      _data.popFront();
    }
    assignByteData(state);
  }
}

