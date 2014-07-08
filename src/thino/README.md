thino
=====

multiplexの製作にあたって作成したライブラリです。dmd 2.064で書かれています。  
OpenGL/OpenALの薄いラッパーといくつかのユーティリティを備えています。  
経験が足りない状態で、自分が必要な機能を適宜加えて行く方針で作っていたため、  
いくつかの設計上の問題があります。(特にgraph, debugger, math)  
汎用性に乏しいものとなっており、使用はおすすめしません。

## 機能

* 状態遷移の管理
* ウィンドウの作成
* wavファイルの再生
* 簡易的な設定ファイルの管理
* 簡易的なデバッグのための変数操作
* いくつかのポストエフェクト
* KSTフォントを多少改変したフォントの描画
* OpenGLによるレンダリングパイプラインの簡略化
* マウス/キーボード/ジョイスティックの状態取得
* 簡易的なベクトルと行列のデータ型

## Note

thinoはsubmoduleとして追加して静的リンクして使用することを想定しています。  
ビルドには、デフォルトではGLFW, OpenGL, OpenALが必要になります。  
コンパイラにversionを与えることで使用可能な機能(と使用するライブラリ)が変化します。

* `NoSound` - OpenAL/サウンド関連の機能を無効にします。
* `StbVorbis` - stb\_vorbis.cによるoggファイルのストリーミング再生を有効にします。
* `StbImage` - stb\_image.cを使用して画像からのテクスチャ読み込みを有効にします。
* `GLEW` - OpenGLのAPIの取得にGLEWを使用します。
* `VAO` - ShaderProgram.HandlerにVertex Array Objectを使用します。

Linuxではオブジェクトファイルを直接リンクできます:
```
LIBS = -L-lglfw -L-lGL -L-lopenal
```

OSXではOpenALなどは-frameworkで渡します:
```
LIBS = -L-lglfw -L-framework -LOpenGL -L-framework -LOpenAL
```

Windowsではlibファイルの用意が必要です。以下の方法で作成したlibで動作確認しています:
* `GLFW` - support/dのdefファイルからの生成
* `OpenGL` - GLFWのsupport/dのdefファイルからの生成
* `OpenAL` - dllからimplibで生成
* `GLEW` - 配布されているlibをcoffimplibで変換

## フォントについて

計量なストロークフォントである[KST32B](http://www.vector.co.jp/soft/data/writing/se119277.html)を使用しています。  
[translate.d](./tools/translate.d)を用いてUnicode向けの変換を行ったファイルを用います。

