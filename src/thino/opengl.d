/**
 * OpenGLの宣言をpublic importします。
 * OpenGLのAPIを直接扱いたいときに使用します。
 */
module thino.opengl;

version (GLEW) {
  public import opengl.glew;

  import std.exception : enforce;

  void loadExtensions() {
    glewExperimental = GL_TRUE;
    enforce(glewInit() == GLEW_OK, "glewInit() failed");
    glGetError();
  }
} else {
  public import opengl.gl;
  public import opengl.glext;

  import opengl.glfw;
  import std.string : toUpper, toStringz;
  import std.array : split, replace;
  import std.exception : enforce;

  /**
   * mixinして使用する、GLFWによるAPI取得のコードを生成します。
   *
   * thino.opengl内で以下のように使用されています。通常は使用しません。
   * version=GLEWでは定義されません。
   * ---
   * mixin(glfwLoaderGen("loadExtensions", [
   *   "GL_ARB_vertex_shader",
   *   "GL_ARB_shading_language_100",
   *   ...
   * ],[
   *   "glBindAttribLocation", "glGetAttribLocation",
   *   "glCreateProgram", "glAttachShader", "glLinkProgram",
   *   ...
   * ]));
   * ---
   */
  string glfwLoaderGen(string loaderName, string[] needExt, string[] funcs) {
    string declaration = "";
    string loader = "";

    foreach (ext; needExt) {
      loader ~= q{
        enforce(glfwExtensionSupported("##".toStringz()),
            "## was not supported");
      }.replace("##", ext);
    }

    foreach (name; funcs) {
      string proc = "PFN" ~ name.toUpper() ~ "PROC";

      declaration ~= proc ~ " " ~ name ~ ";";
      loader ~= q{
        #name# = cast(#proc#)glfwGetProcAddress("#name#".toStringz());
        enforce(#name#, "function #name# was not found");
      }.replace("#proc#", proc).replace("#name#", name);
    }

    return declaration ~ "void " ~ loaderName ~ "(){" ~ loader ~ "}";
  }

  /**
   * OpenGLのAPIを取得します。Windowが自動で呼び出します。
   *
   * デフォルトでは、GLFWのAPIによってthino.grpahで使用している最低限のAPIを取得します。
   * version=GLEWではglewInitを呼び出します。
   */
  void loadExtensions() {
    loadExtensionsBase();
    version (UseVAO) {
      loadExtensionsVAO();
    }
  }

  mixin(glfwLoaderGen("loadExtensionsBase", [
    "GL_ARB_vertex_shader",
    "GL_ARB_shading_language_100",
    "GL_ARB_shader_objects",
    "GL_ARB_vertex_program",
    "GL_ARB_vertex_buffer_object",
    "GL_ARB_framebuffer_object",
    "GL_ARB_multitexture",
  ], [
    "glBindAttribLocation", "glGetAttribLocation",
    "glCreateProgram", "glAttachShader", "glLinkProgram",
      "glGetProgramiv", "glDeleteProgram", "glUseProgram",
      "glGetUniformLocation", "glGetShaderiv", "glGetShaderInfoLog",
      "glCreateShader", "glDeleteShader", "glShaderSource", "glCompileShader",
      "glUniformMatrix4fv", "glUniform1f", "glUniform2f", "glUniform3f",
      "glUniform4f", "glUniform1i", "glUniform1fv",
    "glVertexAttribPointer", "glEnableVertexAttribArray",
    "glGenBuffers", "glDeleteBuffers", "glBindBuffer", "glBufferData",
      "glBufferSubData", "glMapBuffer", "glUnmapBuffer",
    "glGenRenderbuffers", "glDeleteRenderbuffers", "glBindRenderbuffer",
      "glRenderbufferStorage", "glGenFramebuffers", "glFramebufferTexture2D",
      "glDeleteFramebuffers", "glBindFramebuffer", "glFramebufferRenderbuffer",
    "glActiveTexture",
  ]));

  version (UseVAO) {
    mixin(glfwLoaderGen("loadExtensionsVAO", [
      "GL_ARB_vertex_array_object",
    ], [
      "glGenVertexArrays", "glBindVertexArray", "glDeleteVertexArrays",
    ]));
  }
}

