module mplx.top;

import thino;
import std.process;
import mplx.frame;
import mplx.background;
import mplx.controller;
import mplx.menu;
import std.random;

class TopScene : FrameScene {
  this(Frame f) {
    super(f);
  }

  private:
  ButtonGroup _bg;

  Button button(Vec2 pos, string text, void delegate() f = null) {
    return new ButtonHexagon(_bg, pos, Vec2(100, 100), text, f);
  }

  Input input() {
    // TODO: リプレイ保存のon/offあたり
    return new LoggerInput(frame.controller);
  }

  protected:
  override void init() {
    frame.theme = Theme.Star;
    frame.background.mode = Background.Mode.Top;
    frame.audio.playBGM("title");

    _bg = new ButtonGroup(frame, frame.font, 0.8, frame.baseColor);
    _bg.push({}, [
      button(Vec2(260, 40), "game", {
        import mplx.stage;
        import mplx.mode.pulse;

        Button[] buttons;
        int pulseLevel = frame.config.get!int(mode2name(PulseRule.mode));

        foreach (int k; 0..pulseLevel+1) {
          int level = (pulseLevel - k) * PulseRule.levelBreak;

          auto handler = (level => {
            frame.audio.stopBGM(false);
            splashLock({
              nextScene(new Stage(frame, input, unpredictableSeed, level, PulseRule));
            });
          })(level);

          buttons ~= button(
              Vec2(260 + 105*k, 170), text("pulse ", level), handler);
        }

        buttons ~= button(Vec2(205, 250), "...", &_bg.pop);
        buttons ~= button(Vec2(150, 330), "about", {
          browse("http://tcptr.github.io/multiplex_game");
        });
        _bg.push(&_bg.pop, buttons);
      }),
      button(Vec2(205, 120), "replay", {
        splashLock({
          import mplx.replay;
          nextScene(new ReplayScene(frame));
        });
      }),
      button(Vec2(150, 200), "config", {
        import mplx.config;
        nextScene(new ConfigScene(frame));
      }),
      button(Vec2(95, 280), "credit", {
        import mplx.credit;
        nextScene(new CreditScene(frame));
      }),
      button(Vec2(40, 360), "exit", {
        nextScene(null);
      }),
    ]);

    frame.label.show("multiplex");
  }

  override void fini() {
    frame.label.hide();
  }

  override void move() {
    _bg.move(frame);
    frame.camera = frame.camera*0.97;
  }

  override void draw() {
    if (splashLocked) return;
    _bg.draw(frame.fixedMatrix);
  }
}

