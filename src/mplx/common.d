module mplx.common;

import thino;
import std.array : replace;

string AttrReader(string[] args ...) {
  string buf;
  foreach (arg; args) {
    buf ~= q{
      @property inout(typeof(_##)) ##() inout {
        return _##;
      }
    }.replace("##", arg);
  }
  return buf;
}

string AttrWriter(string[] args ...) {
  string buf;
  foreach (arg; args) {
    buf ~= q{
      @property void ##(typeof(_##) v) {
        _## = v;
      }
    }.replace("##", arg);
  }
  return buf;
}

float radianTo(Vec2 a, Vec2 b) {
  return atan2(b.y - a.y, b.x - a.x);
}

string commaSeparate(T)(T num) {
  string digits = to!string(num);
  string result;
  foreach (i, d; digits) {
    if (i && (digits.length - i)%3 == 0) result ~= ',';
    result ~= d;
  }
  return result;
}

T mix(T)(in T a, in T b, float rate) {
  return a*(1-rate) + b*rate;
}

float linearInOut(float min, float max, float duration, float k) {
  if (k < min || k > max) return 0;
  if (k-min < duration) return (k-min)/duration;
  if (max-k < duration) return (max-k)/duration;
  return 1;
}

float storeRad(float from, float to = 0) {
  if (to - from > PI) from += PI*2;
  if (from - to > PI) from -= PI*2;
  return from;
}

float closeRad(float from, float to, float speed) {
  from = storeRad(from, to);

  if (from + speed < to) from += speed;
  else if (from - speed > to) from -= speed;
  else from = to;

  return from;
}

