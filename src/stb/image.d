module stb.image;

extern (C):
////   begin header file  ////////////////////////////////////////////////////
//
// Limitations:
//    - no progressive/interlaced support (jpeg, png)
//    - 8-bit samples only (jpeg, png)
//    - not threadsafe
//    - channel subsampling of at most 2 in each dimension (jpeg)
//    - no delayed line count (jpeg) -- IJG doesn't support either
//
// Basic usage (see HDR discussion below):
//    int x,y,n;
//    unsigned char *data = stbi_load(filename, &x, &y, &n, 0);
//    // ... process data if not NULL ... 
//    // ... x = width, y = height, n = # 8-bit components per pixel ...
//    // ... replace '0' with '1'..'4' to force that many components per pixel
//    stbi_image_free(data)
//
// Standard parameters:
//    int *x       -- outputs image width in pixels
//    int *y       -- outputs image height in pixels
//    int *comp    -- outputs # of image components in image file
//    int req_comp -- if non-zero, # of image components requested in result
//
// The return value from an image loader is an 'unsigned char *' which points
// to the pixel data. The pixel data consists of *y scanlines of *x pixels,
// with each pixel consisting of N interleaved 8-bit components; the first
// pixel pointed to is top-left-most in the image. There is no padding between
// image scanlines or between pixels, regardless of format. The number of
// components N is 'req_comp' if req_comp is non-zero, or *comp otherwise.
// If req_comp is non-zero, *comp has the number of components that _would_
// have been output otherwise. E.g. if you set req_comp to 4, you will always
// get RGBA output, but you can check *comp to easily see if it's opaque.
//
// An output image with N components has the following components interleaved
// in this order in each pixel:
//
//     N=#comp     components
//       1           grey
//       2           grey, alpha
//       3           red, green, blue
//       4           red, green, blue, alpha
//
// If image loading fails for any reason, the return value will be NULL,
// and *x, *y, *comp will be unchanged. The function stbi_failure_reason()
// can be queried for an extremely brief, end-user unfriendly explanation
// of why the load failed. Define STBI_NO_FAILURE_STRINGS to avoid
// compiling these strings at all, and STBI_FAILURE_USERMSG to get slightly
// more user-friendly ones.
//
// Paletted PNG and BMP images are automatically depalettized.
//
//
// ===========================================================================
//
// HDR image support   (disable by defining STBI_NO_HDR)
//
// stb_image now supports loading HDR images in general, and currently
// the Radiance .HDR file format, although the support is provided
// generically. You can still load any file through the existing interface;
// if you attempt to load an HDR file, it will be automatically remapped to
// LDR, assuming gamma 2.2 and an arbitrary scale factor defaulting to 1;
// both of these constants can be reconfigured through this interface:
//
//     stbi_hdr_to_ldr_gamma(2.2f);
//     stbi_hdr_to_ldr_scale(1.0f);
//
// (note, do not use _inverse_ constants; stbi_image will invert them
// appropriately).
//
// Additionally, there is a new, parallel interface for loading files as
// (linear) floats to preserve the full dynamic range:
//
//    float *data = stbi_loadf(filename, &x, &y, &n, 0);
// 
// If you load LDR images through this interface, those images will
// be promoted to floating point values, run through the inverse of
// constants corresponding to the above:
//
//     stbi_ldr_to_hdr_scale(1.0f);
//     stbi_ldr_to_hdr_gamma(2.2f);
//
// Finally, given a filename (or an open file or memory block--see header
// file for details) containing image data, you can query for the "most
// appropriate" interface to use (that is, whether the image is HDR or
// not), using:
//
//     stbi_is_hdr(char *filename);

import std.c.stdio;

enum STBI_VERSION = 1;

enum
{
   STBI_default = 0, // only used for req_comp

   STBI_grey       = 1,
   STBI_grey_alpha = 2,
   STBI_rgb        = 3,
   STBI_rgb_alpha  = 4,
};

alias ubyte stbi_uc;

// returns TRUE on success, FALSE if couldn't open file, error writing file
/*
int      stbi_write_bmp       (const(char) *filename,     int x, int y, int comp, void *data);
int      stbi_write_tga       (const(char) *filename,     int x, int y, int comp, void *data);
*/

// PRIMARY API - works on images of any type

// load image by filename, open file, or memory buffer
stbi_uc *stbi_load            (const(char) *filename,     int *x, int *y, int *comp, int req_comp);
stbi_uc *stbi_load_from_file  (FILE *f,                  int *x, int *y, int *comp, int req_comp);
int      stbi_info_from_file  (FILE *f,                  int *x, int *y, int *comp);

stbi_uc *stbi_load_from_memory(const(stbi_uc) *buffer, int len, int *x, int *y, int *comp, int req_comp);
// for stbi_load_from_file, file pointer is left pointing immediately after image

float *stbi_loadf            (const(char) *filename,     int *x, int *y, int *comp, int req_comp);
float *stbi_loadf_from_file  (FILE *f,                  int *x, int *y, int *comp, int req_comp);
float *stbi_loadf_from_memory(const(stbi_uc) *buffer, int len, int *x, int *y, int *comp, int req_comp);

void   stbi_hdr_to_ldr_gamma(float gamma);
void   stbi_hdr_to_ldr_scale(float scale);

void   stbi_ldr_to_hdr_gamma(float gamma);
void   stbi_ldr_to_hdr_scale(float scale);

// get a VERY brief reason for failure
// NOT THREADSAFE
char    *stbi_failure_reason  ();

// free the loaded image -- this is just free()
void     stbi_image_free      (void *retval_from_stbi_load);

// get image dimensions & components without fully decoding
int      stbi_info_from_memory(const(stbi_uc) *buffer, int len, int *x, int *y, int *comp);
int      stbi_is_hdr_from_memory(const(stbi_uc) *buffer, int len);
int      stbi_info            (const(char) *filename,     int *x, int *y, int *comp);
int      stbi_is_hdr          (const(char) *filename);
int      stbi_is_hdr_from_file(FILE *f);

// ZLIB client - used by PNG, available for other purposes

byte *stbi_zlib_decode_malloc_guesssize(const(byte)*buffer, int len, int initial_size, int *outlen);
byte *stbi_zlib_decode_malloc(const(byte)*buffer, int len, int *outlen);
int   stbi_zlib_decode_buffer(byte *obuffer, int olen, const(byte)*ibuffer, int ilen);

byte *stbi_zlib_decode_noheader_malloc(const(byte)*buffer, int len, int *outlen);
int   stbi_zlib_decode_noheader_buffer(byte *obuffer, int olen, const(byte)*ibuffer, int ilen);

// TYPE-SPECIFIC ACCESS

// is it a jpeg?
int      stbi_jpeg_test_memory     (const(stbi_uc) *buffer, int len);
stbi_uc *stbi_jpeg_load_from_memory(const(stbi_uc) *buffer, int len, int *x, int *y, int *comp, int req_comp);
int      stbi_jpeg_info_from_memory(const(stbi_uc) *buffer, int len, int *x, int *y, int *comp);

stbi_uc *stbi_jpeg_load            (const(byte) *filename,     int *x, int *y, int *comp, int req_comp);
int      stbi_jpeg_test_file       (FILE *f);
stbi_uc *stbi_jpeg_load_from_file  (FILE *f,                  int *x, int *y, int *comp, int req_comp);

int      stbi_jpeg_info            (const(byte) *filename,     int *x, int *y, int *comp);
int      stbi_jpeg_info_from_file  (FILE *f,                  int *x, int *y, int *comp);

// is it a png?
int      stbi_png_test_memory      (const(stbi_uc) *buffer, int len);
stbi_uc *stbi_png_load_from_memory (const(stbi_uc) *buffer, int len, int *x, int *y, int *comp, int req_comp);
int      stbi_png_info_from_memory (const(stbi_uc) *buffer, int len, int *x, int *y, int *comp);

stbi_uc *stbi_png_load             (const(byte) *filename,     int *x, int *y, int *comp, int req_comp);
int      stbi_png_info             (const(byte) *filename,     int *x, int *y, int *comp);
int      stbi_png_test_file        (FILE *f);
stbi_uc *stbi_png_load_from_file   (FILE *f,                  int *x, int *y, int *comp, int req_comp);
int      stbi_png_info_from_file   (FILE *f,                  int *x, int *y, int *comp);

// is it a bmp?
int      stbi_bmp_test_memory      (const(stbi_uc) *buffer, int len);

stbi_uc *stbi_bmp_load             (const(byte) *filename,     int *x, int *y, int *comp, int req_comp);
stbi_uc *stbi_bmp_load_from_memory (const(stbi_uc) *buffer, int len, int *x, int *y, int *comp, int req_comp);
int      stbi_bmp_test_file        (FILE *f);
stbi_uc *stbi_bmp_load_from_file   (FILE *f,                  int *x, int *y, int *comp, int req_comp);

// is it a tga?
int      stbi_tga_test_memory      (const(stbi_uc) *buffer, int len);

stbi_uc *stbi_tga_load             (const(byte) *filename,     int *x, int *y, int *comp, int req_comp);
stbi_uc *stbi_tga_load_from_memory (const(stbi_uc) *buffer, int len, int *x, int *y, int *comp, int req_comp);
int      stbi_tga_test_file        (FILE *f);
stbi_uc *stbi_tga_load_from_file   (FILE *f,                  int *x, int *y, int *comp, int req_comp);

// is it a psd?
int      stbi_psd_test_memory      (const(stbi_uc) *buffer, int len);

stbi_uc *stbi_psd_load             (const(char) *filename,     int *x, int *y, int *comp, int req_comp);
stbi_uc *stbi_psd_load_from_memory (const(stbi_uc) *buffer, int len, int *x, int *y, int *comp, int req_comp);
int      stbi_psd_test_file        (FILE *f);
stbi_uc *stbi_psd_load_from_file   (FILE *f,                  int *x, int *y, int *comp, int req_comp);

// is it an hdr?
int      stbi_hdr_test_memory      (const(stbi_uc) *buffer, int len);

float *  stbi_hdr_load             (const(char) *filename,     int *x, int *y, int *comp, int req_comp);
float *  stbi_hdr_load_from_memory (const(stbi_uc) *buffer, int len, int *x, int *y, int *comp, int req_comp);
int      stbi_hdr_test_file        (FILE *f);
float *  stbi_hdr_load_from_file   (FILE *f,                  int *x, int *y, int *comp, int req_comp);

// define new loaders
 struct stbi_loader
{
   int       function(const(stbi_uc) *buffer, int len) test_memory;
   stbi_uc * function(const(stbi_uc) *buffer, int len, int *x, int *y, int *comp, int req_comp) load_from_memory;
   int       function(FILE *f) test_file;
   stbi_uc * function(FILE *f, int *x, int *y, int *comp, int req_comp) load_from_file;
}

// register a loader by filling out the above structure (you must defined ALL functions)
// returns 1 if added or already added, 0 if not added (too many loaders)
// NOT THREADSAFE
int stbi_register_loader(stbi_loader *loader);

// define faster low-level operations (typically SIMD support)
/*
typedef void (*stbi_idct_8x8)(uint8 *out, int out_stride, short data[64], unsigned short *dequantize);
// compute an integer IDCT on "input"
//     input[x] = data[x] * dequantize[x]
//     write results to 'out': 64 samples, each run of 8 spaced by 'out_stride'
//                             CLAMP results to 0..255
typedef void (*stbi_YCbCr_to_RGB_run)(uint8 *output, uint8 const *y, uint8 const *cb, uint8 const *cr, int count, int step);
// compute a conversion from YCbCr to RGB
//     'count' pixels
//     write pixels to 'output'; each pixel is 'step' bytes (either 3 or 4; if 4, write '255' as 4th), order R,G,B
//     y: Y input channel
//     cb: Cb input channel; scale/biased to be 0..255
//     cr: Cr input channel; scale/biased to be 0..255

void stbi_install_idct(stbi_idct_8x8 func);
void stbi_install_YCbCr_to_RGB(stbi_YCbCr_to_RGB_run func);
*/

////   end header file   /////////////////////////////////////////////////////

