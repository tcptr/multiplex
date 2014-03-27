uniform sampler2D texture;
uniform vec4 color;
uniform int line;
varying vec2 vTexCoord;

void main() {
  vec3 c = color.rgb;
  if (line == 0) {
    c *= texture2D(texture, vTexCoord).rgb;
  }
  gl_FragColor = vec4(c, color.a);
}
