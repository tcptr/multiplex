module opengl.glfw3;
/*************************************************************************
 * GLFW - An OpenGL library
 * API version: 3.0
 * WWW:         http://www.glfw.org/
 *------------------------------------------------------------------------
 * Copyright (c) 2002-2006 Marcus Geelnard
 * Copyright (c) 2006-2010 Camilla Berglund <elmindreda@elmindreda.org>
 *
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software
 *    in a product, an acknowledgment in the product documentation would
 *    be appreciated but is not required.
 *
 * 2. Altered source versions must be plainly marked as such, and must not
 *    be misrepresented as being the original software.
 *
 * 3. This notice may not be removed or altered from any source
 *    distribution.
 *
 *************************************************************************/

/*************************************************************************
 * GLFW API tokens
 *************************************************************************/

enum GLFW_VERSION_MAJOR    = 3;
enum GLFW_VERSION_MINOR    = 0;
enum GLFW_VERSION_REVISION = 1;

enum GLFW_RELEASE          = 0;
enum GLFW_PRESS            = 1;
enum GLFW_REPEAT           = 2;

enum GLFW_KEY_UNKNOWN          = -1;
enum GLFW_KEY_SPACE            = 32;
enum GLFW_KEY_APOSTROPHE       = 39;
enum GLFW_KEY_COMMA            = 44;
enum GLFW_KEY_MINUS            = 45;
enum GLFW_KEY_PERIOD           = 46;
enum GLFW_KEY_SLASH            = 47;
enum GLFW_KEY_0                = 48;
enum GLFW_KEY_1                = 49;
enum GLFW_KEY_2                = 50;
enum GLFW_KEY_3                = 51;
enum GLFW_KEY_4                = 52;
enum GLFW_KEY_5                = 53;
enum GLFW_KEY_6                = 54;
enum GLFW_KEY_7                = 55;
enum GLFW_KEY_8                = 56;
enum GLFW_KEY_9                = 57;
enum GLFW_KEY_SEMICOLON        = 59;
enum GLFW_KEY_EQUAL            = 61;
enum GLFW_KEY_A                = 65;
enum GLFW_KEY_B                = 66;
enum GLFW_KEY_C                = 67;
enum GLFW_KEY_D                = 68;
enum GLFW_KEY_E                = 69;
enum GLFW_KEY_F                = 70;
enum GLFW_KEY_G                = 71;
enum GLFW_KEY_H                = 72;
enum GLFW_KEY_I                = 73;
enum GLFW_KEY_J                = 74;
enum GLFW_KEY_K                = 75;
enum GLFW_KEY_L                = 76;
enum GLFW_KEY_M                = 77;
enum GLFW_KEY_N                = 78;
enum GLFW_KEY_O                = 79;
enum GLFW_KEY_P                = 80;
enum GLFW_KEY_Q                = 81;
enum GLFW_KEY_R                = 82;
enum GLFW_KEY_S                = 83;
enum GLFW_KEY_T                = 84;
enum GLFW_KEY_U                = 85;
enum GLFW_KEY_V                = 86;
enum GLFW_KEY_W                = 87;
enum GLFW_KEY_X                = 88;
enum GLFW_KEY_Y                = 89;
enum GLFW_KEY_Z                = 90;
enum GLFW_KEY_LEFT_BRACKET     = 91;
enum GLFW_KEY_BACKSLASH        = 92;
enum GLFW_KEY_RIGHT_BRACKET    = 93;
enum GLFW_KEY_GRAVE_ACCENT     = 96;
enum GLFW_KEY_WORLD_1          = 161;
enum GLFW_KEY_WORLD_2          = 162;

enum GLFW_KEY_ESCAPE           = 256;
enum GLFW_KEY_ENTER            = 257;
enum GLFW_KEY_TAB              = 258;
enum GLFW_KEY_BACKSPACE        = 259;
enum GLFW_KEY_INSERT           = 260;
enum GLFW_KEY_DELETE           = 261;
enum GLFW_KEY_RIGHT            = 262;
enum GLFW_KEY_LEFT             = 263;
enum GLFW_KEY_DOWN             = 264;
enum GLFW_KEY_UP               = 265;
enum GLFW_KEY_PAGE_UP          = 266;
enum GLFW_KEY_PAGE_DOWN        = 267;
enum GLFW_KEY_HOME             = 268;
enum GLFW_KEY_END              = 269;
enum GLFW_KEY_CAPS_LOCK        = 280;
enum GLFW_KEY_SCROLL_LOCK      = 281;
enum GLFW_KEY_NUM_LOCK         = 282;
enum GLFW_KEY_PRINT_SCREEN     = 283;
enum GLFW_KEY_PAUSE            = 284;
enum GLFW_KEY_F1               = 290;
enum GLFW_KEY_F2               = 291;
enum GLFW_KEY_F3               = 292;
enum GLFW_KEY_F4               = 293;
enum GLFW_KEY_F5               = 294;
enum GLFW_KEY_F6               = 295;
enum GLFW_KEY_F7               = 296;
enum GLFW_KEY_F8               = 297;
enum GLFW_KEY_F9               = 298;
enum GLFW_KEY_F10              = 299;
enum GLFW_KEY_F11              = 300;
enum GLFW_KEY_F12              = 301;
enum GLFW_KEY_F13              = 302;
enum GLFW_KEY_F14              = 303;
enum GLFW_KEY_F15              = 304;
enum GLFW_KEY_F16              = 305;
enum GLFW_KEY_F17              = 306;
enum GLFW_KEY_F18              = 307;
enum GLFW_KEY_F19              = 308;
enum GLFW_KEY_F20              = 309;
enum GLFW_KEY_F21              = 310;
enum GLFW_KEY_F22              = 311;
enum GLFW_KEY_F23              = 312;
enum GLFW_KEY_F24              = 313;
enum GLFW_KEY_F25              = 314;
enum GLFW_KEY_KP_0             = 320;
enum GLFW_KEY_KP_1             = 321;
enum GLFW_KEY_KP_2             = 322;
enum GLFW_KEY_KP_3             = 323;
enum GLFW_KEY_KP_4             = 324;
enum GLFW_KEY_KP_5             = 325;
enum GLFW_KEY_KP_6             = 326;
enum GLFW_KEY_KP_7             = 327;
enum GLFW_KEY_KP_8             = 328;
enum GLFW_KEY_KP_9             = 329;
enum GLFW_KEY_KP_DECIMAL       = 330;
enum GLFW_KEY_KP_DIVIDE        = 331;
enum GLFW_KEY_KP_MULTIPLY      = 332;
enum GLFW_KEY_KP_SUBTRACT      = 333;
enum GLFW_KEY_KP_ADD           = 334;
enum GLFW_KEY_KP_ENTER         = 335;
enum GLFW_KEY_KP_EQUAL         = 336;
enum GLFW_KEY_LEFT_SHIFT       = 340;
enum GLFW_KEY_LEFT_CONTROL     = 341;
enum GLFW_KEY_LEFT_ALT         = 342;
enum GLFW_KEY_LEFT_SUPER       = 343;
enum GLFW_KEY_RIGHT_SHIFT      = 344;
enum GLFW_KEY_RIGHT_CONTROL    = 345;
enum GLFW_KEY_RIGHT_ALT        = 346;
enum GLFW_KEY_RIGHT_SUPER      = 347;
enum GLFW_KEY_MENU             = 348;
enum GLFW_KEY_LAST             = GLFW_KEY_MENU;


enum GLFW_MOD_SHIFT         = 0x0001;
enum GLFW_MOD_CONTROL       = 0x0002;
enum GLFW_MOD_ALT           = 0x0004;
enum GLFW_MOD_SUPER         = 0x0008;

enum GLFW_MOUSE_BUTTON_1       = 0;
enum GLFW_MOUSE_BUTTON_2       = 1;
enum GLFW_MOUSE_BUTTON_3       = 2;
enum GLFW_MOUSE_BUTTON_4       = 3;
enum GLFW_MOUSE_BUTTON_5       = 4;
enum GLFW_MOUSE_BUTTON_6       = 5;
enum GLFW_MOUSE_BUTTON_7       = 6;
enum GLFW_MOUSE_BUTTON_8       = 7;
enum GLFW_MOUSE_BUTTON_LAST    = GLFW_MOUSE_BUTTON_8;
enum GLFW_MOUSE_BUTTON_LEFT    = GLFW_MOUSE_BUTTON_1;
enum GLFW_MOUSE_BUTTON_RIGHT   = GLFW_MOUSE_BUTTON_2;
enum GLFW_MOUSE_BUTTON_MIDDLE  = GLFW_MOUSE_BUTTON_3;

enum GLFW_JOYSTICK_1           = 0;
enum GLFW_JOYSTICK_2           = 1;
enum GLFW_JOYSTICK_3           = 2;
enum GLFW_JOYSTICK_4           = 3;
enum GLFW_JOYSTICK_5           = 4;
enum GLFW_JOYSTICK_6           = 5;
enum GLFW_JOYSTICK_7           = 6;
enum GLFW_JOYSTICK_8           = 7;
enum GLFW_JOYSTICK_9           = 8;
enum GLFW_JOYSTICK_10          = 9;
enum GLFW_JOYSTICK_11          = 10;
enum GLFW_JOYSTICK_12          = 11;
enum GLFW_JOYSTICK_13          = 12;
enum GLFW_JOYSTICK_14          = 13;
enum GLFW_JOYSTICK_15          = 14;
enum GLFW_JOYSTICK_16          = 15;
enum GLFW_JOYSTICK_LAST        = GLFW_JOYSTICK_16;

enum GLFW_NOT_INITIALIZED      = 0x00010001;
enum GLFW_NO_CURRENT_CONTEXT   = 0x00010002;
enum GLFW_INVALID_ENUM         = 0x00010003;
enum GLFW_INVALID_VALUE        = 0x00010004;
enum GLFW_OUT_OF_MEMORY        = 0x00010005;
enum GLFW_API_UNAVAILABLE      = 0x00010006;
enum GLFW_VERSION_UNAVAILABLE  = 0x00010007;
enum GLFW_PLATFORM_ERROR       = 0x00010008;
enum GLFW_FORMAT_UNAVAILABLE   = 0x00010009;

enum GLFW_FOCUSED              = 0x00020001;
enum GLFW_ICONIFIED            = 0x00020002;
enum GLFW_RESIZABLE            = 0x00020003;
enum GLFW_VISIBLE              = 0x00020004;
enum GLFW_DECORATED            = 0x00020005;

enum GLFW_RED_BITS             = 0x00021001;
enum GLFW_GREEN_BITS           = 0x00021002;
enum GLFW_BLUE_BITS            = 0x00021003;
enum GLFW_ALPHA_BITS           = 0x00021004;
enum GLFW_DEPTH_BITS           = 0x00021005;
enum GLFW_STENCIL_BITS         = 0x00021006;
enum GLFW_ACCUM_RED_BITS       = 0x00021007;
enum GLFW_ACCUM_GREEN_BITS     = 0x00021008;
enum GLFW_ACCUM_BLUE_BITS      = 0x00021009;
enum GLFW_ACCUM_ALPHA_BITS     = 0x0002100A;
enum GLFW_AUX_BUFFERS          = 0x0002100B;
enum GLFW_STEREO               = 0x0002100C;
enum GLFW_SAMPLES              = 0x0002100D;
enum GLFW_SRGB_CAPABLE         = 0x0002100E;
enum GLFW_REFRESH_RATE         = 0x0002100F;

enum GLFW_CLIENT_API            = 0x00022001;
enum GLFW_CONTEXT_VERSION_MAJOR = 0x00022002;
enum GLFW_CONTEXT_VERSION_MINOR = 0x00022003;
enum GLFW_CONTEXT_REVISION      = 0x00022004;
enum GLFW_CONTEXT_ROBUSTNESS    = 0x00022005;
enum GLFW_OPENGL_FORWARD_COMPAT = 0x00022006;
enum GLFW_OPENGL_DEBUG_CONTEXT  = 0x00022007;
enum GLFW_OPENGL_PROFILE        = 0x00022008;

enum GLFW_OPENGL_API           = 0x00030001;
enum GLFW_OPENGL_ES_API        = 0x00030002;

enum GLFW_NO_ROBUSTNESS         =          0;
enum GLFW_NO_RESET_NOTIFICATION = 0x00031001;
enum GLFW_LOSE_CONTEXT_ON_RESET = 0x00031002;

enum GLFW_OPENGL_ANY_PROFILE    =          0;
enum GLFW_OPENGL_CORE_PROFILE   = 0x00032001;
enum GLFW_OPENGL_COMPAT_PROFILE = 0x00032002;

enum GLFW_CURSOR               = 0x00033001;
enum GLFW_STICKY_KEYS          = 0x00033002;
enum GLFW_STICKY_MOUSE_BUTTONS = 0x00033003;

enum GLFW_CURSOR_NORMAL        = 0x00034001;
enum GLFW_CURSOR_HIDDEN        = 0x00034002;
enum GLFW_CURSOR_DISABLED      = 0x00034003;

enum GLFW_CONNECTED            = 0x00040001;
enum GLFW_DISCONNECTED         = 0x00040002;

/*************************************************************************
 * GLFW API types
 *************************************************************************/

extern (System):

alias void function() GLFWglproc;
alias void function(int,const(char)*) GLFWerrorfun;
alias void function(GLFWwindow*,int,int) GLFWwindowposfun;
alias void function(GLFWwindow*,int,int) GLFWwindowsizefun;
alias void function(GLFWwindow*) GLFWwindowclosefun;
alias void function(GLFWwindow*) GLFWwindowrefreshfun;
alias void function(GLFWwindow*,int) GLFWwindowfocusfun;
alias void function(GLFWwindow*,int) GLFWwindowiconifyfun;
alias void function(GLFWwindow*,int,int) GLFWframebuffersizefun;
alias void function(GLFWwindow*,int,int,int) GLFWmousebuttonfun;

alias void function (GLFWwindow*,double,double) GLFWcursorposfun;
alias void function (GLFWwindow*,int) GLFWcursorenterfun;
alias void function (GLFWwindow*,double,double) GLFWscrollfun;
alias void function (GLFWwindow*,int,int,int,int) GLFWkeyfun;
alias void function (GLFWwindow*,uint) GLFWcharfun;
alias void function (GLFWmonitor*,int) GLFWmonitorfun;

struct GLFWwindow;
struct GLFWmonitor;

struct GLFWvidmode {
  int width;
  int height;
  int redBits;
  int greenBits;
  int blueBits;
  int refreshRate;
}

struct GLFWgammaramp {
  ushort* red;
  ushort* green;
  ushort* blue;
  uint size;
}

/*************************************************************************
 * GLFW API functions
 *************************************************************************/

int glfwInit();
void glfwTerminate();
void glfwGetVersion(int* major, int* minor, int* rev);
const(char)* glfwGetVersionString();
GLFWerrorfun glfwSetErrorCallback(GLFWerrorfun cbfun);
GLFWmonitor** glfwGetMonitors(int* count);
GLFWmonitor* glfwGetPrimaryMonitor();
void glfwGetMonitorPos(GLFWmonitor* monitor, int* xpos, int* ypos);
void glfwGetMonitorPhysicalSize(GLFWmonitor* monitor, int* width, int* height);
const(char)* glfwGetMonitorName(GLFWmonitor* monitor);
GLFWmonitorfun glfwSetMonitorCallback(GLFWmonitorfun cbfun);
const(GLFWvidmode)* glfwGetVideoModes(GLFWmonitor* monitor, int* count);
const(GLFWvidmode)* glfwGetVideoMode(GLFWmonitor* monitor);
void glfwSetGamma(GLFWmonitor* monitor, float gamma);
const(GLFWgammaramp)* glfwGetGammaRamp(GLFWmonitor* monitor);
void glfwSetGammaRamp(GLFWmonitor* monitor, const(GLFWgammaramp)* ramp);
void glfwDefaultWindowHints();
void glfwWindowHint(int target, int hint);
GLFWwindow* glfwCreateWindow(int width, int height, const(char)* title, GLFWmonitor* monitor, GLFWwindow* share);
void glfwDestroyWindow(GLFWwindow* window);
int glfwWindowShouldClose(GLFWwindow* window);
void glfwSetWindowShouldClose(GLFWwindow* window, int value);
void glfwSetWindowTitle(GLFWwindow* window, const(char)* title);
void glfwGetWindowPos(GLFWwindow* window, int* xpos, int* ypos);
void glfwSetWindowPos(GLFWwindow* window, int xpos, int ypos);
void glfwGetWindowSize(GLFWwindow* window, int* width, int* height);
void glfwSetWindowSize(GLFWwindow* window, int width, int height);
void glfwGetFramebufferSize(GLFWwindow* window, int* width, int* height);
void glfwIconifyWindow(GLFWwindow* window);
void glfwRestoreWindow(GLFWwindow* window);
void glfwShowWindow(GLFWwindow* window);
void glfwHideWindow(GLFWwindow* window);
GLFWmonitor* glfwGetWindowMonitor(GLFWwindow* window);
int glfwGetWindowAttrib(GLFWwindow* window, int attrib);
void glfwSetWindowUserPointer(GLFWwindow* window, void* pointer);
void* glfwGetWindowUserPointer(GLFWwindow* window);
GLFWwindowposfun glfwSetWindowPosCallback(GLFWwindow* window, GLFWwindowposfun cbfun);
GLFWwindowsizefun glfwSetWindowSizeCallback(GLFWwindow* window, GLFWwindowsizefun cbfun);
GLFWwindowclosefun glfwSetWindowCloseCallback(GLFWwindow* window, GLFWwindowclosefun cbfun);
GLFWwindowrefreshfun glfwSetWindowRefreshCallback(GLFWwindow* window, GLFWwindowrefreshfun cbfun);
GLFWwindowfocusfun glfwSetWindowFocusCallback(GLFWwindow* window, GLFWwindowfocusfun cbfun);
GLFWwindowiconifyfun glfwSetWindowIconifyCallback(GLFWwindow* window, GLFWwindowiconifyfun cbfun);
GLFWframebuffersizefun glfwSetFramebufferSizeCallback(GLFWwindow* window, GLFWframebuffersizefun cbfun);
void glfwPollEvents();
void glfwWaitEvents();
int glfwGetInputMode(GLFWwindow* window, int mode);
void glfwSetInputMode(GLFWwindow* window, int mode, int value);
int glfwGetKey(GLFWwindow* window, int key);
int glfwGetMouseButton(GLFWwindow* window, int button);
void glfwGetCursorPos(GLFWwindow* window, double* xpos, double* ypos);
void glfwSetCursorPos(GLFWwindow* window, double xpos, double ypos);
GLFWkeyfun glfwSetKeyCallback(GLFWwindow* window, GLFWkeyfun cbfun);
GLFWcharfun glfwSetCharCallback(GLFWwindow* window, GLFWcharfun cbfun);
GLFWmousebuttonfun glfwSetMouseButtonCallback(GLFWwindow* window, GLFWmousebuttonfun cbfun);
GLFWcursorposfun glfwSetCursorPosCallback(GLFWwindow* window, GLFWcursorposfun cbfun);
GLFWcursorenterfun glfwSetCursorEnterCallback(GLFWwindow* window, GLFWcursorenterfun cbfun);
GLFWscrollfun glfwSetScrollCallback(GLFWwindow* window, GLFWscrollfun cbfun);
int glfwJoystickPresent(int joy);
const(float)* glfwGetJoystickAxes(int joy, int* count);
const(ubyte)* glfwGetJoystickButtons(int joy, int* count);
const(char)* glfwGetJoystickName(int joy);
void glfwSetClipboardString(GLFWwindow* window, const(char)* string_);
const(char)* glfwGetClipboardString(GLFWwindow* window);
double glfwGetTime();
void glfwSetTime(double time);
void glfwMakeContextCurrent(GLFWwindow* window);
GLFWwindow* glfwGetCurrentContext();
void glfwSwapBuffers(GLFWwindow* window);
void glfwSwapInterval(int interval);
int glfwExtensionSupported(const(char)* extension);
GLFWglproc glfwGetProcAddress(const(char)* procname);

