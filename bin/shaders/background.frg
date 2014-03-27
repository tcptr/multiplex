uniform sampler2D texture;
uniform vec4 color;
uniform int line;
varying vec2 vTexCoord;
varying float vZ;

void main() {
  float a = color.a * clamp(1.0 + vZ*0.001, 0.0, 1.0);
  vec3 c = color.rgb;
  if (line == 0) {
    c *= texture2D(texture, vTexCoord).rgb;
    c *= 1.3;
  }
  gl_FragColor = vec4(c, a);
}
