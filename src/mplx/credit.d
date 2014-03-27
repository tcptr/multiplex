module mplx.credit;

import std.process;
import thino;
import mplx.frame;
import mplx.menu;

immutable Credit = `
            ←  credit  →

* tcptr
  game design
  program
  graphic
  http://tcptr.github.io/

* AttaQ
  BGM
  sound effect
  https://twitter.com/AttaQjp

* Kawaz community
  http://www.kawaz.org/

* inspired by
  Geometry Wars : Retro Evolved
`;

class CreditScene : FrameScene {
  this(Frame f) {
    super(f);
  }

  private:
  float[12] _vertex;
  EventID _eventID;
  ButtonGroup _bg;

  void resize(int w, int h) {
    _vertex[] = [
      460.5,h+10,0, 850.5,h+10,0,
      850.5,-10,0, 460.5,-10,0
    ];
  }

  void quit() {
    import mplx.top;
    nextScene(new TopScene(frame));
  }

  protected:
  override void init() {
    _eventID = frame.addResizeCallback(&resize);
    resize(frame.size.x, frame.size.y);

    _bg = new ButtonGroup(frame, frame.font, 0.5, frame.baseColor);
    _bg.push(&quit, [
      new ButtonLine(_bg, Vec2(320, 360), Vec2(120, 25),
        "back", &quit),

      new ButtonLine(_bg, Vec2(810, 360), Vec2(25, 25),
        "→", { browse("http://www.kawaz.org/"); }),
      new ButtonLine(_bg, Vec2(810, 290), Vec2(25, 25),
        "→", { browse("https://twitter.com/AttaQjp/"); }),
      new ButtonLine(_bg, Vec2(810, 167), Vec2(25, 25),
        "→", { browse("http://tcptr.github.io/"); }),
    ]);
  }

  override void fini() {
    frame.removeResizeCallback(_eventID);
  }

  override void move() {
    _bg.move(frame);

    frame.camera =  frame.camera*0.97 + Vec2(100,10)*0.03;
  }

  override void draw() {
    blendFunc(BlendMode.Normal);
    lineWidth(1.0);

    Primitive().drawQuad(frame.fixedMatrix, Black, _vertex);
    Primitive().draw(frame.fixedMatrix, frame.baseColor,
        _vertex, DrawMode.LineLoop);
    frame.font.drawText(frame.fixedMatrix,
        Vec2(490, 0), 0.75, frame.baseColor, Credit);

    _bg.draw(frame.fixedMatrix);
  }
}

