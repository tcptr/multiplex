module openal.alc;

version = ALC_VERSION_0_1;

extern (C):

/** Opaque device handle */
struct ALCdevice_struct;
alias ALCdevice_struct ALCdevice;
/** Opaque context handle */
struct ALCcontext_struct;
alias ALCcontext_struct ALCcontext;

/** 8-bit boolean */
alias byte ALCboolean;

/** character */
alias char ALCchar;

/** signed 8-bit 2's complement integer */
alias byte ALCbyte;

/** unsigned 8-bit integer */
alias ubyte ALCubyte;

/** signed 16-bit 2's complement integer */
alias short ALCshort;

/** unsigned 16-bit integer */
alias ushort ALCushort;

/** signed 32-bit 2's complement integer */
alias int ALCint;

/** unsigned 32-bit integer */
alias uint ALCuint;

/** non-negative 32-bit binary integer size */
alias uint ALCsizei;

/** enumerated 32-bit value */
alias int ALCenum;

/** 32-bit IEEE754 floating-point */
alias float ALCfloat;

/** 64-bit IEEE754 floating-point */
alias double ALCdouble;

/** void type (for opaque pointers only) */
alias void ALCvoid;


/* Enumerant values begin at column 50. No tabs. */

/** Boolean False. */
enum ALC_FALSE = 0;
/** Boolean True. */
enum ALC_TRUE = 1;
/** Context attribute: <int> Hz. */
enum ALC_FREQUENCY = 0x1007;
/** Context attribute: <int> Hz. */
enum ALC_REFRESH = 0x1008;
/** Context attribute: AL_TRUE or AL_FALSE. */
enum ALC_SYNC = 0x1009;
/** Context attribute: <int> requested Mono (3D) Sources. */
enum ALC_MONO_SOURCES = 0x1010;
/** Context attribute: <int> requested Stereo Sources. */
enum ALC_STEREO_SOURCES = 0x1011;
/** No error. */
enum ALC_NO_ERROR = 0;
/** Invalid device handle. */
enum ALC_INVALID_DEVICE = 0xA001;
/** Invalid context handle. */
enum ALC_INVALID_CONTEXT = 0xA002;
/** Invalid enum parameter passed to an ALC call. */
enum ALC_INVALID_ENUM = 0xA003;
/** Invalid value parameter passed to an ALC call. */
enum ALC_INVALID_VALUE = 0xA004;
/** Out of memory. */
enum ALC_OUT_OF_MEMORY = 0xA005;

/** Runtime ALC version. */
enum ALC_MAJOR_VERSION = 0x1000;
enum ALC_MINOR_VERSION = 0x1001;
/** Context attribute list properties. */
enum ALC_ATTRIBUTES_SIZE = 0x1002;
enum ALC_ALL_ATTRIBUTES = 0x1003;
/** String for the default device specifier. */
enum ALC_DEFAULT_DEVICE_SPECIFIER = 0x1004;
/**
 * String for the given device's specifier.
 *
 * If device handle is NULL, it is instead a null-char separated list of
 * strings of known device specifiers (list ends with an empty string).
 */
enum ALC_DEVICE_SPECIFIER = 0x1005;
/** String for space-separated list of ALC extensions. */
enum ALC_EXTENSIONS = 0x1006;

/** Capture extension */
enum ALC_EXT_CAPTURE = 1;
/**
 * String for the given capture device's specifier.
 *
 * If device handle is NULL, it is instead a null-char separated list of
 * strings of known capture device specifiers (list ends with an empty string).
 */
enum ALC_CAPTURE_DEVICE_SPECIFIER = 0x310;
/** String for the default capture device specifier. */
enum ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER = 0x311;
/** Number of sample frames available for capture. */
enum ALC_CAPTURE_SAMPLES = 0x312;


/** Enumerate All extension */
enum ALC_ENUMERATE_ALL_EXT = 1;
/** String for the default extended device specifier. */
enum ALC_DEFAULT_ALL_DEVICES_SPECIFIER = 0x1012;
/**
 * String for the given extended device's specifier.
 *
 * If device handle is NULL, it is instead a null-char separated list of
 * strings of known extended device specifiers (list ends with an empty string).
 */
enum ALC_ALL_DEVICES_SPECIFIER = 0x1013;

/** Context management. */
ALCcontext * alcCreateContext(ALCdevice *device, ALCint *attrlist);
ALCboolean  alcMakeContextCurrent(ALCcontext *context);
void  alcProcessContext(ALCcontext *context);
void  alcSuspendContext(ALCcontext *context);
void  alcDestroyContext(ALCcontext *context);
ALCcontext * alcGetCurrentContext();
ALCdevice * alcGetContextsDevice(ALCcontext *context);

/** Device management. */
ALCdevice * alcOpenDevice(ALCchar *devicename);
ALCboolean  alcCloseDevice(ALCdevice *device);


/**
 * Error support.
 *
 * Obtain the most recent Device error.
 */
ALCenum  alcGetError(ALCdevice *device);

/**
 * Extension support.
 *
 * Query for the presence of an extension, and obtain any appropriate
 * function pointers and enum values.
 */
ALCboolean  alcIsExtensionPresent(ALCdevice *device, ALCchar *extname);
void * alcGetProcAddress(ALCdevice *device, ALCchar *funcname);
ALCenum  alcGetEnumValue(ALCdevice *device, ALCchar *enumname);

/** Query function. */
ALCchar * alcGetString(ALCdevice *device, ALCenum param);
void  alcGetIntegerv(ALCdevice *device, ALCenum param, ALCsizei size, ALCint *values);

/** Capture function. */
ALCdevice * alcCaptureOpenDevice(ALCchar *devicename, ALCuint frequency, ALCenum format, ALCsizei buffersize);
ALCboolean  alcCaptureCloseDevice(ALCdevice *device);
void  alcCaptureStart(ALCdevice *device);
void  alcCaptureStop(ALCdevice *device);
void  alcCaptureSamples(ALCdevice *device, ALCvoid *buffer, ALCsizei samples);

/** Pointer-to-function type, useful for dynamically getting ALC entry points. */
alias ALCcontext * function(ALCdevice *device, ALCint *attrlist)LPALCCREATECONTEXT;
alias ALCboolean  function(ALCcontext *context)LPALCMAKECONTEXTCURRENT;
alias void  function(ALCcontext *context)LPALCPROCESSCONTEXT;
alias void  function(ALCcontext *context)LPALCSUSPENDCONTEXT;
alias void  function(ALCcontext *context)LPALCDESTROYCONTEXT;
alias ALCcontext * function()LPALCGETCURRENTCONTEXT;
alias ALCdevice * function(ALCcontext *context)LPALCGETCONTEXTSDEVICE;
alias ALCdevice * function(ALCchar *devicename)LPALCOPENDEVICE;
alias ALCboolean  function(ALCdevice *device)LPALCCLOSEDEVICE;
alias ALCenum  function(ALCdevice *device)LPALCGETERROR;
alias ALCboolean  function(ALCdevice *device, ALCchar *extname)LPALCISEXTENSIONPRESENT;
alias void * function(ALCdevice *device, ALCchar *funcname)LPALCGETPROCADDRESS;
alias ALCenum  function(ALCdevice *device, ALCchar *enumname)LPALCGETENUMVALUE;
alias ALCchar * function(ALCdevice *device, ALCenum param)LPALCGETSTRING;
alias void  function(ALCdevice *device, ALCenum param, ALCsizei size, ALCint *values)LPALCGETINTEGERV;
alias ALCdevice * function(ALCchar *devicename, ALCuint frequency, ALCenum format, ALCsizei buffersize)LPALCCAPTUREOPENDEVICE;
alias ALCboolean  function(ALCdevice *device)LPALCCAPTURECLOSEDEVICE;
alias void  function(ALCdevice *device)LPALCCAPTURESTART;
alias void  function(ALCdevice *device)LPALCCAPTURESTOP;
alias void  function(ALCdevice *device, ALCvoid *buffer, ALCsizei samples)LPALCCAPTURESAMPLES;

