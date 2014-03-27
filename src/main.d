module main;

import thino;
import thino.opengl;
import mplx.frame;
import mplx.top;
import std.stdio;
import std.string : split;
import std.conv : to;

void main(string[] args) {
  try {
    Thino();
    debug Debugger.fontLocation = "resource/font.ukst";

    Config config;
    bool fullscreen;
    string resolution;
    Vector2!int size;
    FixedAspectRatioWindow window;
    Frame frame;

    config = new Config("config/global");

    config.setDefault("fullscreen", false);
    config.setDefault("screen resolution", "auto");

    fullscreen = config.get!bool("fullscreen");
    resolution = config.get!string("screen resolution");

    if (resolution == "auto") {
      size = fullscreen ? getDesktopSize() : Vector2!int(1200, 675);
    } else {
      auto s = resolution.split("x");
      size = Vector2!int(to!int(s[0]), to!int(s[1]));
    }

    window = new FixedAspectRatioWindow(
        size.x, size.y,
        fullscreen ? WindowMode.Fullscreen : WindowMode.Windowed);

    window.title = "multiplex";
    window.aspectRatio = Vector2!int(16,9);
    window.cursor = true;

    capability!"BLEND"(true);
    capability!"LINE_SMOOTH"(true);
    glPolygonOffset(1, 0.5);

    frame = new Frame(window, config);
    Scene.execute(new TopScene(frame));

  } catch (Exception e) {
    writeln(e.msg);
  }
}

