module mplx.model;

import thino;
import std.conv;
import std.array;
import std.range;
import std.algorithm;

// FIXME なぜ手で書いた...

struct Model {
  IBO!ubyte face, line;
}

private float[3] vec(float a, float b, float c) {
  return [a,b,c];
}

private float[2] tx(float a, float b) {
  return [a,b];
}

private ubyte[6] quad(int a, int b, int c, int d) {
  ubyte e = 0xFF & a, f = 0xFF & b, g = 0xFF & c, h = 0xFF & d;
  return [e,f,g,g,h,e];
}

private ubyte[8] quadLine(int a, int b, int c, int d) {
  ubyte e = 0xFF & a, f = 0xFF & b, g = 0xFF & c, h = 0xFF & d;
  return [e,f,f,g,g,h,h,e];
}

immutable(float)[] circleLine() {
  return reduce!"a~b"(cast(immutable(float)[])[],
      iota(64).map!(i => vec(cos(i*PI/32), sin(i*PI/32), 0))());
}

Model playerModel(VBO!(float, 3) pos, VBO!(float, 2) tex) {
  pos.bindData([
    10,0,0,
    -2,5,0, -2,0,-5, -2,-5,0, -2,0,5,
    -8,0,0,
  ]);
  tex.bindData([
    0.1,0.1,
    0.1,0.9, 0.5,0.9, 0.5,0.9, 0.9,0.9,
    0.1,0.1,
  ]);

  return Model(
    new IBO!ubyte([0,2,1,0,3,2,0,4,3,0,1,4,5,1,2,5,2,3,5,3,4,5,4,1]),
    new IBO!ubyte([0,1,0,2,0,3,0,4,5,1,5,2,5,3,5,4])
  );
}

Model[5] backgroundModel(VBO!(float, 3) pos, VBO!(float, 2) tex) {
  pos.setLength(6 * 6, BufferType.Static);
  tex.setLength(6 * 6, BufferType.Static);

  pos.modifyMapBuffer((pos.Map p){
    float[18] face = [0,-4,4, 0,4,4, 0,4,-4, 0,-4,-4, 0,4,-4, 0,-4,-4];
    foreach (i; 0..6) {
      p[6*i..6*i + 6] = face;
      face[0] = face[3] = face[6] = face[9] = face[12] = face[15] =
          face[0] + 8;
    }
  });

  tex.modifyMapBuffer((tex.Map p){
    p[0..6] = [0,0, 1,0, 0,0, 1,0, 1,1, 0,1];
    foreach (i; 1..6)
      p[6*i..6*i + 6] =
          [0,1, 1,1, 0,1, 1,1, 1,1-0.5, 0,1-0.5];
  });

  Model[5] result;
  ubyte[36] tmp;

  foreach (i; 0..5) {
    int t = 6 * (i+1);
    tmp[0..6] = quad(0,1,4,5)[];
    tmp[6..12]  = quad(1, 0, t, t+1)[];
    tmp[12..18] = quad(2, 1, t+1, t+2)[];
    tmp[18..24] = quad(3, 2, t+2, t+3)[];
    tmp[24..30] = quad(0, 3, t+3, t)[];
    tmp[30..36] = quad(t+5, t+4, t+1, t)[];
    result[i].face = new IBO!ubyte(tmp);

    tmp[0..8] = quadLine(0,1,2,3)[];
    tmp[8..16] = quadLine(t,t+1,t+2,t+3)[];
    tmp[16..24] = [0,0xFF& t, 1,0xFF& (t+1), 2,0xFF& (t+2), 3,0xFF& (t+3)];
    result[i].line = new IBO!ubyte(tmp[0..24]);
  }

  return result;
}

Model enemySphereModel(VBO!(float, 3) pos, VBO!(float, 2) tex) {
  immutable int K = 16;
  immutable float R = PI*2/K;
  immutable float Len = 10;
  auto xy = iota(K).map!(i => vec(cos(i*R)*Len, sin(i*R)*Len, 0))();
  auto xz = iota(K).map!(i => vec(cos(i*R)*Len, 0, sin(i*R)*Len))();
  auto yz = iota(K).map!(i => vec(0, cos(i*R)*Len, sin(i*R)*Len))();
  pos.bindData([
      0,0,Len,
      Len,0,0, 0,-Len,0, -Len,0,0, 0,Len,0,
      0,0,-Len
  ]~ reduce!"a~b"(cast(float[])[], chain(xy, xz, yz)));
  tex.bindData(cast(float[12])[
    0.1,0.1,
    0.1,0.9, 0.5,0.9, 0.5,0.9, 0.9,0.9,
    0.1,0.1,
  ] ~ repeat(0F, 16*3*2).array());

  auto ixy = iota(K*2).map!(i => 6 + K*0 + ((i+1)/2)%K)();
  auto ixz = iota(K*2).map!(i => 6 + K*1 + ((i+1)/2)%K)();
  auto iyz = iota(K*2).map!(i => 6 + K*2 + ((i+1)/2)%K)();

  return Model(
    new IBO!ubyte([0,2,1,0,3,2,0,4,3,0,1,4,5,1,2,5,2,3,5,3,4,5,4,1]),
    new IBO!ubyte(
        chain([1,2,2,3,3,4,4,1,0,1,0,2,0,3,0,4,5,1,5,2,5,3,5,4], ixy, ixz, iyz)
        .map!"cast(ubyte)a"().array())
  );
}

Model enemyGearModel(VBO!(float, 3) pos, VBO!(float, 2) tex) {
  immutable int K = 16;
  immutable float R = PI*2/K;

  auto pvec = appender!(float[])();
  foreach (r; [9, 11]) foreach (i; 0..K)
      pvec.put([cos(i*R)*r, sin(i*R)*r, 1]);
  foreach (r; [10, 12]) foreach (i; 0..K)
      pvec.put([cos(i*R)*r, sin(i*R)*r, -1]);
  pvec.put([0, 0, -2]);

  auto tvec = appender!(float[])();
  foreach (k; [2.0, 1.3, 1.3, 0.8]) foreach (i; 0..K)
      tvec.put([cos(i*R)/k + 0.5, sin(i*R)/k + 0.5]);
  tvec.put([0.5, 0.5]);

  pos.bindData(pvec.data);
  tex.bindData(tvec.data);

  auto fi = appender!(ubyte[])();
  foreach (i; 0..K/2) fi.put(quad(2*i+1, 2*i, 2*i+K, 2*i+K+1)[]);
  foreach (i; 0..K) fi.put(cast(ubyte[])[4*K, i, i+1]);

  auto li = appender!(ubyte[])();
  foreach (i; 0..K) li.put(cast(ubyte[])[i, i+K, i+2*K, i+3*K]);
  foreach (i; 0..K) li.put(cast(ubyte[])(
      (i % 2 == 1) ? [i, (i+1)%K, i + 2*K, (i+1)%K + 2*K]
                   : [i+K, (i+1)%K + K, i + 3*K, (i+1)%K + 3*K] ));
  foreach (i; 0..K) li.put(cast(ubyte[])[i, i+2*K, i+K, i+3*K]);

  return Model(new IBO!ubyte(fi.data), new IBO!ubyte(li.data));
}

Model enemyTurtleModel(VBO!(float, 3) pos, VBO!(float, 2) tex) {
  immutable int K = 18, K2 = 6;
  immutable float R = PI*2/K, R2 = PI*2/K2;

  auto pvec = appender!(float[])();
  foreach (i; 0..K) pvec.put([cos(i*R)*3, sin(i*R)*3, -1]);
  foreach (i; 0..K) pvec.put([cos(i*R)*9, sin(i*R)*9, 1]);
  foreach (i; 0..K2) pvec.put([cos(i*R2)*11, sin(i*R2)*11, 2]);

  auto tvec = appender!(float[])();
  foreach (i; 0..K) tvec.put([0.3, cast(float)i/K]);
  foreach (i; 0..K) tvec.put([0.7, cast(float)i/K]);
  foreach (i; 0..K2) pvec.put([1.0, cast(float)i/K2]);

  pos.bindData(pvec.data);
  tex.bindData(tvec.data);

  auto fi = appender!(ubyte[])();
  foreach (i; 0..K) fi.put(quad(i, i + K, (i+1)%K + K, (i+1)%K)[]);
  foreach (i; 0..K2)
    fi.put(cast(ubyte[])[i + 2*K, (i*K/K2 - 1 + K)%K + K, (i*K/K2 + 1)%K + K]);

  auto li = appender!(ubyte[])();
  foreach (i; 0..K) li.put(cast(ubyte[])[i, (i+1)%K, i+K, (i+1)%K+K]);
  foreach (i; 0..K2)
    li.put(cast(ubyte[])[i + 2*K, (i*K/K2 + 1)%K + K,
                         i + 2*K, (i*K/K2 - 1+ K)%K + K]);

  return Model(new IBO!ubyte(fi.data), new IBO!ubyte(li.data));
}

Model enemyMissileModel(VBO!(float, 3) pos, VBO!(float, 2) tex) {
  auto f = (float t) =>
    (float x, float rad, float len) => [x, cos(rad+t)*len, sin(rad+t)*len];
  immutable float T = PI/6;

  auto pvec = appender!(float[])();
  auto tvec = appender!(float[])();

  foreach (p; [f(0), f(PI)]) {
    // 0-5, 6-11, 12-17, 18-23
    foreach (i; [-2, 0, 2, 4])
      foreach (j; 0..6) pvec.put(p(i, T*j, 6.0));
    // 24-27, 28-30
    pvec.put(p(-12, T*0, 6.0));
    pvec.put(p(-10, T*1, 6.0));
    pvec.put(p(-8, T*2, 6.0));
    pvec.put(p(-6, T*3, 6.0));
    pvec.put(p(12, T*5, 1));
    pvec.put(p(12, T*4, 1));
    pvec.put(p(12, T*3, 1));

    // 0-5, 6-11, 12-17, 18-23
    foreach (i; [0.4, 0.5, 0.5, 0.6])
      foreach (j; 0..6) tvec.put([i, j*0.2]);
    // 24-27, 28-30
    tvec.put([0.0, 0.0]);
    tvec.put([0.1, 0.2]);
    tvec.put([0.2, 0.4]);
    tvec.put([0.3, 0.6]);
    tvec.put([1.0, 1.0]);
    tvec.put([1.0, 0.8]);
    tvec.put([1.0, 0.6]);
  }

  pos.bindData(pvec.data);
  tex.bindData(tvec.data);

  auto fi = appender!(ubyte[])();
  auto li = appender!(ubyte[])();

  foreach (p; [0, 31]) {
    foreach (i; [0, 12])
      foreach (j; 0..5) fi.put(quad(p+i+j, p+i+j+1, p+i+j+7, p+i+j+6)[]);
    fi.put(quad(p,p+24,p+25,p+1)[]);
    fi.put(quad(p+2,p+26,p+27,p+3)[]);
    fi.put(quad(p+23,p+28,p+29,p+22)[]);
    fi.put(quad(p+22,p+29,p+30,p+21)[]);

    foreach (i; [6, 12])
      foreach (j; 0..5) li.put(cast(ubyte[])[p+i+j, p+i+j+1]);

    int[] ls = [6,24,24,25,25,1, 1,2, 2,26,26,27,27,3, 3,4, 4,5, 5,11,
        17,23, 23,28, 28,29, 29,30, 30,21, 21,20, 20,19, 19,18, 18,12];
    ls[] += p;
    li.put(to!(ubyte[])(ls));
  }

  return Model(new IBO!ubyte(fi.data), new IBO!ubyte(li.data));
}

Model enemyShurikenModel(VBO!(float, 3) pos, VBO!(float, 2) tex) {
  immutable float R = PI*2/3;
  auto pvec = appender!(float[])();
  foreach (i; 0..3) pvec.put([cos(i*R)*6, sin(i*R)*6, 2]);
  foreach (i; 0..3) pvec.put([cos(i*R+R/2)*7, sin(i*R+R/2)*7, -1]);

  auto tvec = appender!(float[])();
  foreach (i; 0..3) tvec.put([cos(i*R)/2 + 0.5, sin(i*R)/2 + 0.5]);
  foreach (i; 0..3) tvec.put([cos(i*R) + 0.5, sin(i*R) + 0.5]);

  pos.bindData(pvec.data);
  tex.bindData(tvec.data);

  return Model(
      new IBO!ubyte([0,1,2,0,3,1,1,4,2,2,5,0,4,1,3,5,2,4,3,0,5]),
      new IBO!ubyte([0,1,1,2,2,0,0,3,1,3,1,4,2,4,2,5,0,5,3,4,4,5,5,3]));
}

Model enemyShurikenModel2(VBO!(float, 3) pos, VBO!(float, 2) tex) {
  pos.bindData([7,0,3, 11,0,-1, 6,-4,1, 7,11,1]);
  tex.bindData([0.5,0.2, 1.0,0.2, 0.7,0.0, 0.7,0.6]);

  return Model(
      new IBO!ubyte([0,2,1,0,1,3,0,3,2]),
      new IBO!ubyte([0,1,0,2,1,2,0,3,1,3,2,3]));
}

Model enemyConnectModel(VBO!(float, 3) pos, VBO!(float, 2) tex) {
  pos.bindData([10,0,0, -10,6,0, -10,0,6, -10,-6,0, -10,0,-6]);
  tex.bindData([0.5,0.5, 0.8,0.2, 0.8,0.8, 0.2,0.8, 0.2,0.2]);

  return Model(
      new IBO!ubyte([0,1,2,0,2,3,0,3,4,0,4,1, 3,2,1,4,3,1]),
      new IBO!ubyte([0,1,0,2,0,3,0,4,1,2,2,3,3,4,4,1]));
}

Model enemyCubeModel(VBO!(float, 3) pos, VBO!(float, 2) tex) {
  pos.setLength(6 * 2, BufferType.Static);
  tex.setLength(6 * 2, BufferType.Static);

  pos.modifyMapBuffer((pos.Map p){
    float[18] face = [-5,-5,5, -5,5,5, -5,5,-5, -5,-5,-5, -5,5,-5, -5,-5,-5];
    p[0..6] = face;
    face[0] = face[3] = face[6] = face[9] = face[12] = face[15] =
        face[0] + 10;
    p[6..12] = face;
  });

  tex.modifyMapBuffer((tex.Map p){
    p[0..6] = [0,0, 1,0, 0,0, 1,0, 1,1, 0,1];
    p[6..12] = [0,1, 1,1, 0,1, 1,1, 1,0, 0,0];
  });

  Model result;
  ubyte[36] tmp;

  tmp[0..6] = quad(0,1,4,5)[];
  tmp[6..12]  = quad(1, 0, 6, 6+1)[];
  tmp[12..18] = quad(2, 1, 6+1, 6+2)[];
  tmp[18..24] = quad(3, 2, 6+2, 6+3)[];
  tmp[24..30] = quad(0, 3, 6+3, 6)[];
  tmp[30..36] = quad(6+5, 6+4, 6+1, 6)[];
  result.face = new IBO!ubyte(tmp);

  tmp[0..8] = quadLine(0,1,2,3)[];
  tmp[8..16] = quadLine(6,6+1,6+2,6+3)[];
  tmp[16..24] = [0,6, 1,7, 2,8, 3,9];
  result.line = new IBO!ubyte(tmp[0..24]);

  return result;
}

Model enemyGateModel(VBO!(float, 3) pos, VBO!(float, 2) tex) {
  auto pvec = appender!(float[])();
  // 0-4, 5-10
  foreach (i; 0..5) pvec.put([cos(PI*i/12)*4, sin(PI*i/12)*4, 3]);
  foreach (i; 0..5) pvec.put([cos(PI*i/12)*16, sin(PI*i/12)*16, -3]);

  auto tvec = appender!(float[])();
  foreach (i; 0..5) tvec.put([0.5, i*0.25]);
  foreach (i; 0..5) tvec.put([1.0, i*0.25]);

  pos.bindData(pvec.data);
  tex.bindData(tvec.data);

  Model result;
  ubyte[6*4] tmp;

  tmp[0..6] = quad(1,0,5,6)[];
  tmp[6..12] = quad(2,1,6,7)[];
  tmp[12..18] = quad(3,2,7,8)[];
  tmp[18..24] = quad(4,3,8,9)[];
  result.face = new IBO!ubyte(tmp);

  result.line = new IBO!ubyte([0,1,1,2,2,3,3,4,5,6,6,7,7,8,8,9,0,5,4,9]);

  return result;
}

