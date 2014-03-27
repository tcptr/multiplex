module opengl.glext;
/*
** Copyright (c) 2007-2012 The Khronos Group Inc.
** 
** Permission is hereby granted, free of charge, to any person obtaining a
** copy of this software and/or associated documentation files (the
** "Materials"), to deal in the Materials without restriction, including
** without limitation the rights to use, copy, modify, merge, publish,
** distribute, sublicense, and/or sell copies of the Materials, and to
** permit persons to whom the Materials are furnished to do so, subject to
** the following conditions:
** 
** The above copyright notice and this permission notice shall be included
** in all copies or substantial portions of the Materials.
** 
** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
*/

/* Header file version number, required by OpenGL ABI for Linux */
/* glext.h last updated $Date: 2012-09-19 19:02:24 -0700 (Wed, 19 Sep 2012) $ */
/* Current version at http://www.opengl.org/registry/ */
/* Function declaration macros - to move into glplatform.h */

import std.stdint;
import opengl.gl;

version (GL_VERSION_1_2) {} else {
enum GL_UNSIGNED_BYTE_3_3_2            = 0x8032;
enum GL_UNSIGNED_SHORT_4_4_4_4         = 0x8033;
enum GL_UNSIGNED_SHORT_5_5_5_1         = 0x8034;
enum GL_UNSIGNED_INT_8_8_8_8           = 0x8035;
enum GL_UNSIGNED_INT_10_10_10_2        = 0x8036;
enum GL_TEXTURE_BINDING_3D             = 0x806A;
enum GL_PACK_SKIP_IMAGES               = 0x806B;
enum GL_PACK_IMAGE_HEIGHT              = 0x806C;
enum GL_UNPACK_SKIP_IMAGES             = 0x806D;
enum GL_UNPACK_IMAGE_HEIGHT            = 0x806E;
enum GL_TEXTURE_3D                     = 0x806F;
enum GL_PROXY_TEXTURE_3D               = 0x8070;
enum GL_TEXTURE_DEPTH                  = 0x8071;
enum GL_TEXTURE_WRAP_R                 = 0x8072;
enum GL_MAX_3D_TEXTURE_SIZE            = 0x8073;
enum GL_UNSIGNED_BYTE_2_3_3_REV        = 0x8362;
enum GL_UNSIGNED_SHORT_5_6_5           = 0x8363;
enum GL_UNSIGNED_SHORT_5_6_5_REV       = 0x8364;
enum GL_UNSIGNED_SHORT_4_4_4_4_REV     = 0x8365;
enum GL_UNSIGNED_SHORT_1_5_5_5_REV     = 0x8366;
enum GL_UNSIGNED_INT_8_8_8_8_REV       = 0x8367;
enum GL_UNSIGNED_INT_2_10_10_10_REV    = 0x8368;
enum GL_BGR                            = 0x80E0;
enum GL_BGRA                           = 0x80E1;
enum GL_MAX_ELEMENTS_VERTICES          = 0x80E8;
enum GL_MAX_ELEMENTS_INDICES           = 0x80E9;
//enum GL_CLAMP_TO_EDGE                  = 0x812F;
enum GL_TEXTURE_MIN_LOD                = 0x813A;
enum GL_TEXTURE_MAX_LOD                = 0x813B;
enum GL_TEXTURE_BASE_LEVEL             = 0x813C;
enum GL_TEXTURE_MAX_LEVEL              = 0x813D;
enum GL_SMOOTH_POINT_SIZE_RANGE        = 0x0B12;
enum GL_SMOOTH_POINT_SIZE_GRANULARITY  = 0x0B13;
enum GL_SMOOTH_LINE_WIDTH_RANGE        = 0x0B22;
enum GL_SMOOTH_LINE_WIDTH_GRANULARITY  = 0x0B23;
enum GL_ALIASED_LINE_WIDTH_RANGE       = 0x846E;
enum GL_RESCALE_NORMAL                 = 0x803A;
enum GL_LIGHT_MODEL_COLOR_CONTROL      = 0x81F8;
enum GL_SINGLE_COLOR                   = 0x81F9;
enum GL_SEPARATE_SPECULAR_COLOR        = 0x81FA;
enum GL_ALIASED_POINT_SIZE_RANGE       = 0x846D;
}

version (GL_ARB_imaging) {} else {
enum GL_CONSTANT_COLOR                 = 0x8001;
enum GL_ONE_MINUS_CONSTANT_COLOR       = 0x8002;
enum GL_CONSTANT_ALPHA                 = 0x8003;
enum GL_ONE_MINUS_CONSTANT_ALPHA       = 0x8004;
enum GL_BLEND_COLOR                    = 0x8005;
enum GL_FUNC_ADD                       = 0x8006;
enum GL_MIN                            = 0x8007;
enum GL_MAX                            = 0x8008;
enum GL_BLEND_EQUATION                 = 0x8009;
enum GL_FUNC_SUBTRACT                  = 0x800A;
enum GL_FUNC_REVERSE_SUBTRACT          = 0x800B;
enum GL_CONVOLUTION_1D                 = 0x8010;
enum GL_CONVOLUTION_2D                 = 0x8011;
enum GL_SEPARABLE_2D                   = 0x8012;
enum GL_CONVOLUTION_BORDER_MODE        = 0x8013;
enum GL_CONVOLUTION_FILTER_SCALE       = 0x8014;
enum GL_CONVOLUTION_FILTER_BIAS        = 0x8015;
enum GL_REDUCE                         = 0x8016;
enum GL_CONVOLUTION_FORMAT             = 0x8017;
enum GL_CONVOLUTION_WIDTH              = 0x8018;
enum GL_CONVOLUTION_HEIGHT             = 0x8019;
enum GL_MAX_CONVOLUTION_WIDTH          = 0x801A;
enum GL_MAX_CONVOLUTION_HEIGHT         = 0x801B;
enum GL_POST_CONVOLUTION_RED_SCALE     = 0x801C;
enum GL_POST_CONVOLUTION_GREEN_SCALE   = 0x801D;
enum GL_POST_CONVOLUTION_BLUE_SCALE    = 0x801E;
enum GL_POST_CONVOLUTION_ALPHA_SCALE   = 0x801F;
enum GL_POST_CONVOLUTION_RED_BIAS      = 0x8020;
enum GL_POST_CONVOLUTION_GREEN_BIAS    = 0x8021;
enum GL_POST_CONVOLUTION_BLUE_BIAS     = 0x8022;
enum GL_POST_CONVOLUTION_ALPHA_BIAS    = 0x8023;
enum GL_HISTOGRAM                      = 0x8024;
enum GL_PROXY_HISTOGRAM                = 0x8025;
enum GL_HISTOGRAM_WIDTH                = 0x8026;
enum GL_HISTOGRAM_FORMAT               = 0x8027;
enum GL_HISTOGRAM_RED_SIZE             = 0x8028;
enum GL_HISTOGRAM_GREEN_SIZE           = 0x8029;
enum GL_HISTOGRAM_BLUE_SIZE            = 0x802A;
enum GL_HISTOGRAM_ALPHA_SIZE           = 0x802B;
enum GL_HISTOGRAM_LUMINANCE_SIZE       = 0x802C;
enum GL_HISTOGRAM_SINK                 = 0x802D;
enum GL_MINMAX                         = 0x802E;
enum GL_MINMAX_FORMAT                  = 0x802F;
enum GL_MINMAX_SINK                    = 0x8030;
enum GL_TABLE_TOO_LARGE                = 0x8031;
enum GL_COLOR_MATRIX                   = 0x80B1;
enum GL_COLOR_MATRIX_STACK_DEPTH       = 0x80B2;
enum GL_MAX_COLOR_MATRIX_STACK_DEPTH   = 0x80B3;
enum GL_POST_COLOR_MATRIX_RED_SCALE    = 0x80B4;
enum GL_POST_COLOR_MATRIX_GREEN_SCALE  = 0x80B5;
enum GL_POST_COLOR_MATRIX_BLUE_SCALE   = 0x80B6;
enum GL_POST_COLOR_MATRIX_ALPHA_SCALE  = 0x80B7;
enum GL_POST_COLOR_MATRIX_RED_BIAS     = 0x80B8;
enum GL_POST_COLOR_MATRIX_GREEN_BIAS   = 0x80B9;
enum GL_POST_COLOR_MATRIX_BLUE_BIAS    = 0x80BA;
enum GL_POST_COLOR_MATRIX_ALPHA_BIAS   = 0x80BB;
enum GL_COLOR_TABLE                    = 0x80D0;
enum GL_POST_CONVOLUTION_COLOR_TABLE   = 0x80D1;
enum GL_POST_COLOR_MATRIX_COLOR_TABLE  = 0x80D2;
enum GL_PROXY_COLOR_TABLE              = 0x80D3;
enum GL_PROXY_POST_CONVOLUTION_COLOR_TABLE = 0x80D4;
enum GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE = 0x80D5;
enum GL_COLOR_TABLE_SCALE              = 0x80D6;
enum GL_COLOR_TABLE_BIAS               = 0x80D7;
enum GL_COLOR_TABLE_FORMAT             = 0x80D8;
enum GL_COLOR_TABLE_WIDTH              = 0x80D9;
enum GL_COLOR_TABLE_RED_SIZE           = 0x80DA;
enum GL_COLOR_TABLE_GREEN_SIZE         = 0x80DB;
enum GL_COLOR_TABLE_BLUE_SIZE          = 0x80DC;
enum GL_COLOR_TABLE_ALPHA_SIZE         = 0x80DD;
enum GL_COLOR_TABLE_LUMINANCE_SIZE     = 0x80DE;
enum GL_COLOR_TABLE_INTENSITY_SIZE     = 0x80DF;
enum GL_CONSTANT_BORDER                = 0x8151;
enum GL_REPLICATE_BORDER               = 0x8153;
enum GL_CONVOLUTION_BORDER_COLOR       = 0x8154;
}

version (GL_VERSION_1_3) {} else {
enum GL_TEXTURE0                       = 0x84C0;
enum GL_TEXTURE1                       = 0x84C1;
enum GL_TEXTURE2                       = 0x84C2;
enum GL_TEXTURE3                       = 0x84C3;
enum GL_TEXTURE4                       = 0x84C4;
enum GL_TEXTURE5                       = 0x84C5;
enum GL_TEXTURE6                       = 0x84C6;
enum GL_TEXTURE7                       = 0x84C7;
enum GL_TEXTURE8                       = 0x84C8;
enum GL_TEXTURE9                       = 0x84C9;
enum GL_TEXTURE10                      = 0x84CA;
enum GL_TEXTURE11                      = 0x84CB;
enum GL_TEXTURE12                      = 0x84CC;
enum GL_TEXTURE13                      = 0x84CD;
enum GL_TEXTURE14                      = 0x84CE;
enum GL_TEXTURE15                      = 0x84CF;
enum GL_TEXTURE16                      = 0x84D0;
enum GL_TEXTURE17                      = 0x84D1;
enum GL_TEXTURE18                      = 0x84D2;
enum GL_TEXTURE19                      = 0x84D3;
enum GL_TEXTURE20                      = 0x84D4;
enum GL_TEXTURE21                      = 0x84D5;
enum GL_TEXTURE22                      = 0x84D6;
enum GL_TEXTURE23                      = 0x84D7;
enum GL_TEXTURE24                      = 0x84D8;
enum GL_TEXTURE25                      = 0x84D9;
enum GL_TEXTURE26                      = 0x84DA;
enum GL_TEXTURE27                      = 0x84DB;
enum GL_TEXTURE28                      = 0x84DC;
enum GL_TEXTURE29                      = 0x84DD;
enum GL_TEXTURE30                      = 0x84DE;
enum GL_TEXTURE31                      = 0x84DF;
enum GL_ACTIVE_TEXTURE                 = 0x84E0;
enum GL_MULTISAMPLE                    = 0x809D;
enum GL_SAMPLE_ALPHA_TO_COVERAGE       = 0x809E;
enum GL_SAMPLE_ALPHA_TO_ONE            = 0x809F;
enum GL_SAMPLE_COVERAGE                = 0x80A0;
enum GL_SAMPLE_BUFFERS                 = 0x80A8;
enum GL_SAMPLES                        = 0x80A9;
enum GL_SAMPLE_COVERAGE_VALUE          = 0x80AA;
enum GL_SAMPLE_COVERAGE_INVERT         = 0x80AB;
enum GL_TEXTURE_CUBE_MAP               = 0x8513;
enum GL_TEXTURE_BINDING_CUBE_MAP       = 0x8514;
enum GL_TEXTURE_CUBE_MAP_POSITIVE_X    = 0x8515;
enum GL_TEXTURE_CUBE_MAP_NEGATIVE_X    = 0x8516;
enum GL_TEXTURE_CUBE_MAP_POSITIVE_Y    = 0x8517;
enum GL_TEXTURE_CUBE_MAP_NEGATIVE_Y    = 0x8518;
enum GL_TEXTURE_CUBE_MAP_POSITIVE_Z    = 0x8519;
enum GL_TEXTURE_CUBE_MAP_NEGATIVE_Z    = 0x851A;
enum GL_PROXY_TEXTURE_CUBE_MAP         = 0x851B;
enum GL_MAX_CUBE_MAP_TEXTURE_SIZE      = 0x851C;
enum GL_COMPRESSED_RGB                 = 0x84ED;
enum GL_COMPRESSED_RGBA                = 0x84EE;
enum GL_TEXTURE_COMPRESSION_HINT       = 0x84EF;
enum GL_TEXTURE_COMPRESSED_IMAGE_SIZE  = 0x86A0;
enum GL_TEXTURE_COMPRESSED             = 0x86A1;
enum GL_NUM_COMPRESSED_TEXTURE_FORMATS = 0x86A2;
enum GL_COMPRESSED_TEXTURE_FORMATS     = 0x86A3;
enum GL_CLAMP_TO_BORDER                = 0x812D;
enum GL_CLIENT_ACTIVE_TEXTURE          = 0x84E1;
enum GL_MAX_TEXTURE_UNITS              = 0x84E2;
enum GL_TRANSPOSE_MODELVIEW_MATRIX     = 0x84E3;
enum GL_TRANSPOSE_PROJECTION_MATRIX    = 0x84E4;
enum GL_TRANSPOSE_TEXTURE_MATRIX       = 0x84E5;
enum GL_TRANSPOSE_COLOR_MATRIX         = 0x84E6;
enum GL_MULTISAMPLE_BIT                = 0x20000000;
enum GL_NORMAL_MAP                     = 0x8511;
enum GL_REFLECTION_MAP                 = 0x8512;
enum GL_COMPRESSED_ALPHA               = 0x84E9;
enum GL_COMPRESSED_LUMINANCE           = 0x84EA;
enum GL_COMPRESSED_LUMINANCE_ALPHA     = 0x84EB;
enum GL_COMPRESSED_INTENSITY           = 0x84EC;
enum GL_COMBINE                        = 0x8570;
enum GL_COMBINE_RGB                    = 0x8571;
enum GL_COMBINE_ALPHA                  = 0x8572;
enum GL_SOURCE0_RGB                    = 0x8580;
enum GL_SOURCE1_RGB                    = 0x8581;
enum GL_SOURCE2_RGB                    = 0x8582;
enum GL_SOURCE0_ALPHA                  = 0x8588;
enum GL_SOURCE1_ALPHA                  = 0x8589;
enum GL_SOURCE2_ALPHA                  = 0x858A;
enum GL_OPERAND0_RGB                   = 0x8590;
enum GL_OPERAND1_RGB                   = 0x8591;
enum GL_OPERAND2_RGB                   = 0x8592;
enum GL_OPERAND0_ALPHA                 = 0x8598;
enum GL_OPERAND1_ALPHA                 = 0x8599;
enum GL_OPERAND2_ALPHA                 = 0x859A;
enum GL_RGB_SCALE                      = 0x8573;
enum GL_ADD_SIGNED                     = 0x8574;
enum GL_INTERPOLATE                    = 0x8575;
enum GL_SUBTRACT                       = 0x84E7;
enum GL_CONSTANT                       = 0x8576;
enum GL_PRIMARY_COLOR                  = 0x8577;
enum GL_PREVIOUS                       = 0x8578;
enum GL_DOT3_RGB                       = 0x86AE;
enum GL_DOT3_RGBA                      = 0x86AF;
}

version (GL_VERSION_1_4) {} else {
enum GL_BLEND_DST_RGB                  = 0x80C8;
enum GL_BLEND_SRC_RGB                  = 0x80C9;
enum GL_BLEND_DST_ALPHA                = 0x80CA;
enum GL_BLEND_SRC_ALPHA                = 0x80CB;
enum GL_POINT_FADE_THRESHOLD_SIZE      = 0x8128;
enum GL_DEPTH_COMPONENT16              = 0x81A5;
enum GL_DEPTH_COMPONENT24              = 0x81A6;
enum GL_DEPTH_COMPONENT32              = 0x81A7;
enum GL_MIRRORED_REPEAT                = 0x8370;
enum GL_MAX_TEXTURE_LOD_BIAS           = 0x84FD;
enum GL_TEXTURE_LOD_BIAS               = 0x8501;
enum GL_INCR_WRAP                      = 0x8507;
enum GL_DECR_WRAP                      = 0x8508;
enum GL_TEXTURE_DEPTH_SIZE             = 0x884A;
enum GL_TEXTURE_COMPARE_MODE           = 0x884C;
enum GL_TEXTURE_COMPARE_FUNC           = 0x884D;
enum GL_POINT_SIZE_MIN                 = 0x8126;
enum GL_POINT_SIZE_MAX                 = 0x8127;
enum GL_POINT_DISTANCE_ATTENUATION     = 0x8129;
enum GL_GENERATE_MIPMAP                = 0x8191;
enum GL_GENERATE_MIPMAP_HINT           = 0x8192;
enum GL_FOG_COORDINATE_SOURCE          = 0x8450;
enum GL_FOG_COORDINATE                 = 0x8451;
enum GL_FRAGMENT_DEPTH                 = 0x8452;
enum GL_CURRENT_FOG_COORDINATE         = 0x8453;
enum GL_FOG_COORDINATE_ARRAY_TYPE      = 0x8454;
enum GL_FOG_COORDINATE_ARRAY_STRIDE    = 0x8455;
enum GL_FOG_COORDINATE_ARRAY_POINTER   = 0x8456;
enum GL_FOG_COORDINATE_ARRAY           = 0x8457;
enum GL_COLOR_SUM                      = 0x8458;
enum GL_CURRENT_SECONDARY_COLOR        = 0x8459;
enum GL_SECONDARY_COLOR_ARRAY_SIZE     = 0x845A;
enum GL_SECONDARY_COLOR_ARRAY_TYPE     = 0x845B;
enum GL_SECONDARY_COLOR_ARRAY_STRIDE   = 0x845C;
enum GL_SECONDARY_COLOR_ARRAY_POINTER  = 0x845D;
enum GL_SECONDARY_COLOR_ARRAY          = 0x845E;
enum GL_TEXTURE_FILTER_CONTROL         = 0x8500;
enum GL_DEPTH_TEXTURE_MODE             = 0x884B;
enum GL_COMPARE_R_TO_TEXTURE           = 0x884E;
}

version (GL_VERSION_1_5) {} else {
enum GL_BUFFER_SIZE                    = 0x8764;
enum GL_BUFFER_USAGE                   = 0x8765;
enum GL_QUERY_COUNTER_BITS             = 0x8864;
enum GL_CURRENT_QUERY                  = 0x8865;
enum GL_QUERY_RESULT                   = 0x8866;
enum GL_QUERY_RESULT_AVAILABLE         = 0x8867;
enum GL_ARRAY_BUFFER                   = 0x8892;
enum GL_ELEMENT_ARRAY_BUFFER           = 0x8893;
enum GL_ARRAY_BUFFER_BINDING           = 0x8894;
enum GL_ELEMENT_ARRAY_BUFFER_BINDING   = 0x8895;
enum GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F;
enum GL_READ_ONLY                      = 0x88B8;
enum GL_WRITE_ONLY                     = 0x88B9;
enum GL_READ_WRITE                     = 0x88BA;
enum GL_BUFFER_ACCESS                  = 0x88BB;
enum GL_BUFFER_MAPPED                  = 0x88BC;
enum GL_BUFFER_MAP_POINTER             = 0x88BD;
enum GL_STREAM_DRAW                    = 0x88E0;
enum GL_STREAM_READ                    = 0x88E1;
enum GL_STREAM_COPY                    = 0x88E2;
enum GL_STATIC_DRAW                    = 0x88E4;
enum GL_STATIC_READ                    = 0x88E5;
enum GL_STATIC_COPY                    = 0x88E6;
enum GL_DYNAMIC_DRAW                   = 0x88E8;
enum GL_DYNAMIC_READ                   = 0x88E9;
enum GL_DYNAMIC_COPY                   = 0x88EA;
enum GL_SAMPLES_PASSED                 = 0x8914;
enum GL_SRC1_ALPHA                     = 0x8589;
enum GL_VERTEX_ARRAY_BUFFER_BINDING    = 0x8896;
enum GL_NORMAL_ARRAY_BUFFER_BINDING    = 0x8897;
enum GL_COLOR_ARRAY_BUFFER_BINDING     = 0x8898;
enum GL_INDEX_ARRAY_BUFFER_BINDING     = 0x8899;
enum GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING = 0x889A;
enum GL_EDGE_FLAG_ARRAY_BUFFER_BINDING = 0x889B;
enum GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING = 0x889C;
enum GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING = 0x889D;
enum GL_WEIGHT_ARRAY_BUFFER_BINDING    = 0x889E;
enum GL_FOG_COORD_SRC                  = 0x8450;
enum GL_FOG_COORD                      = 0x8451;
enum GL_CURRENT_FOG_COORD              = 0x8453;
enum GL_FOG_COORD_ARRAY_TYPE           = 0x8454;
enum GL_FOG_COORD_ARRAY_STRIDE         = 0x8455;
enum GL_FOG_COORD_ARRAY_POINTER        = 0x8456;
enum GL_FOG_COORD_ARRAY                = 0x8457;
enum GL_FOG_COORD_ARRAY_BUFFER_BINDING = 0x889D;
enum GL_SRC0_RGB                       = 0x8580;
enum GL_SRC1_RGB                       = 0x8581;
enum GL_SRC2_RGB                       = 0x8582;
enum GL_SRC0_ALPHA                     = 0x8588;
enum GL_SRC2_ALPHA                     = 0x858A;
}

version (GL_VERSION_2_0) {} else {
enum GL_BLEND_EQUATION_RGB             = 0x8009;
enum GL_VERTEX_ATTRIB_ARRAY_ENABLED    = 0x8622;
enum GL_VERTEX_ATTRIB_ARRAY_SIZE       = 0x8623;
enum GL_VERTEX_ATTRIB_ARRAY_STRIDE     = 0x8624;
enum GL_VERTEX_ATTRIB_ARRAY_TYPE       = 0x8625;
enum GL_CURRENT_VERTEX_ATTRIB          = 0x8626;
enum GL_VERTEX_PROGRAM_POINT_SIZE      = 0x8642;
enum GL_VERTEX_ATTRIB_ARRAY_POINTER    = 0x8645;
enum GL_STENCIL_BACK_FUNC              = 0x8800;
enum GL_STENCIL_BACK_FAIL              = 0x8801;
enum GL_STENCIL_BACK_PASS_DEPTH_FAIL   = 0x8802;
enum GL_STENCIL_BACK_PASS_DEPTH_PASS   = 0x8803;
enum GL_MAX_DRAW_BUFFERS               = 0x8824;
enum GL_DRAW_BUFFER0                   = 0x8825;
enum GL_DRAW_BUFFER1                   = 0x8826;
enum GL_DRAW_BUFFER2                   = 0x8827;
enum GL_DRAW_BUFFER3                   = 0x8828;
enum GL_DRAW_BUFFER4                   = 0x8829;
enum GL_DRAW_BUFFER5                   = 0x882A;
enum GL_DRAW_BUFFER6                   = 0x882B;
enum GL_DRAW_BUFFER7                   = 0x882C;
enum GL_DRAW_BUFFER8                   = 0x882D;
enum GL_DRAW_BUFFER9                   = 0x882E;
enum GL_DRAW_BUFFER10                  = 0x882F;
enum GL_DRAW_BUFFER11                  = 0x8830;
enum GL_DRAW_BUFFER12                  = 0x8831;
enum GL_DRAW_BUFFER13                  = 0x8832;
enum GL_DRAW_BUFFER14                  = 0x8833;
enum GL_DRAW_BUFFER15                  = 0x8834;
enum GL_BLEND_EQUATION_ALPHA           = 0x883D;
enum GL_MAX_VERTEX_ATTRIBS             = 0x8869;
enum GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A;
enum GL_MAX_TEXTURE_IMAGE_UNITS        = 0x8872;
enum GL_FRAGMENT_SHADER                = 0x8B30;
enum GL_VERTEX_SHADER                  = 0x8B31;
enum GL_MAX_FRAGMENT_UNIFORM_COMPONENTS = 0x8B49;
enum GL_MAX_VERTEX_UNIFORM_COMPONENTS  = 0x8B4A;
enum GL_MAX_VARYING_FLOATS             = 0x8B4B;
enum GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C;
enum GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D;
enum GL_SHADER_TYPE                    = 0x8B4F;
enum GL_FLOAT_VEC2                     = 0x8B50;
enum GL_FLOAT_VEC3                     = 0x8B51;
enum GL_FLOAT_VEC4                     = 0x8B52;
enum GL_INT_VEC2                       = 0x8B53;
enum GL_INT_VEC3                       = 0x8B54;
enum GL_INT_VEC4                       = 0x8B55;
enum GL_BOOL                           = 0x8B56;
enum GL_BOOL_VEC2                      = 0x8B57;
enum GL_BOOL_VEC3                      = 0x8B58;
enum GL_BOOL_VEC4                      = 0x8B59;
enum GL_FLOAT_MAT2                     = 0x8B5A;
enum GL_FLOAT_MAT3                     = 0x8B5B;
enum GL_FLOAT_MAT4                     = 0x8B5C;
enum GL_SAMPLER_1D                     = 0x8B5D;
enum GL_SAMPLER_2D                     = 0x8B5E;
enum GL_SAMPLER_3D                     = 0x8B5F;
enum GL_SAMPLER_CUBE                   = 0x8B60;
enum GL_SAMPLER_1D_SHADOW              = 0x8B61;
enum GL_SAMPLER_2D_SHADOW              = 0x8B62;
enum GL_DELETE_STATUS                  = 0x8B80;
enum GL_COMPILE_STATUS                 = 0x8B81;
enum GL_LINK_STATUS                    = 0x8B82;
enum GL_VALIDATE_STATUS                = 0x8B83;
enum GL_INFO_LOG_LENGTH                = 0x8B84;
enum GL_ATTACHED_SHADERS               = 0x8B85;
enum GL_ACTIVE_UNIFORMS                = 0x8B86;
enum GL_ACTIVE_UNIFORM_MAX_LENGTH      = 0x8B87;
enum GL_SHADER_SOURCE_LENGTH           = 0x8B88;
enum GL_ACTIVE_ATTRIBUTES              = 0x8B89;
enum GL_ACTIVE_ATTRIBUTE_MAX_LENGTH    = 0x8B8A;
enum GL_FRAGMENT_SHADER_DERIVATIVE_HINT = 0x8B8B;
enum GL_SHADING_LANGUAGE_VERSION       = 0x8B8C;
enum GL_CURRENT_PROGRAM                = 0x8B8D;
enum GL_POINT_SPRITE_COORD_ORIGIN      = 0x8CA0;
enum GL_LOWER_LEFT                     = 0x8CA1;
enum GL_UPPER_LEFT                     = 0x8CA2;
enum GL_STENCIL_BACK_REF               = 0x8CA3;
enum GL_STENCIL_BACK_VALUE_MASK        = 0x8CA4;
enum GL_STENCIL_BACK_WRITEMASK         = 0x8CA5;
enum GL_VERTEX_PROGRAM_TWO_SIDE        = 0x8643;
enum GL_POINT_SPRITE                   = 0x8861;
enum GL_COORD_REPLACE                  = 0x8862;
enum GL_MAX_TEXTURE_COORDS             = 0x8871;
}

version (GL_VERSION_2_1) {} else {
enum GL_PIXEL_PACK_BUFFER              = 0x88EB;
enum GL_PIXEL_UNPACK_BUFFER            = 0x88EC;
enum GL_PIXEL_PACK_BUFFER_BINDING      = 0x88ED;
enum GL_PIXEL_UNPACK_BUFFER_BINDING    = 0x88EF;
enum GL_FLOAT_MAT2x3                   = 0x8B65;
enum GL_FLOAT_MAT2x4                   = 0x8B66;
enum GL_FLOAT_MAT3x2                   = 0x8B67;
enum GL_FLOAT_MAT3x4                   = 0x8B68;
enum GL_FLOAT_MAT4x2                   = 0x8B69;
enum GL_FLOAT_MAT4x3                   = 0x8B6A;
enum GL_SRGB                           = 0x8C40;
enum GL_SRGB8                          = 0x8C41;
enum GL_SRGB_ALPHA                     = 0x8C42;
enum GL_SRGB8_ALPHA8                   = 0x8C43;
enum GL_COMPRESSED_SRGB                = 0x8C48;
enum GL_COMPRESSED_SRGB_ALPHA          = 0x8C49;
enum GL_CURRENT_RASTER_SECONDARY_COLOR = 0x845F;
enum GL_SLUMINANCE_ALPHA               = 0x8C44;
enum GL_SLUMINANCE8_ALPHA8             = 0x8C45;
enum GL_SLUMINANCE                     = 0x8C46;
enum GL_SLUMINANCE8                    = 0x8C47;
enum GL_COMPRESSED_SLUMINANCE          = 0x8C4A;
enum GL_COMPRESSED_SLUMINANCE_ALPHA    = 0x8C4B;
}

version (GL_VERSION_3_0) {} else {
enum GL_COMPARE_REF_TO_TEXTURE         = 0x884E;
enum GL_CLIP_DISTANCE0                 = 0x3000;
enum GL_CLIP_DISTANCE1                 = 0x3001;
enum GL_CLIP_DISTANCE2                 = 0x3002;
enum GL_CLIP_DISTANCE3                 = 0x3003;
enum GL_CLIP_DISTANCE4                 = 0x3004;
enum GL_CLIP_DISTANCE5                 = 0x3005;
enum GL_CLIP_DISTANCE6                 = 0x3006;
enum GL_CLIP_DISTANCE7                 = 0x3007;
enum GL_MAX_CLIP_DISTANCES             = 0x0D32;
enum GL_MAJOR_VERSION                  = 0x821B;
enum GL_MINOR_VERSION                  = 0x821C;
enum GL_NUM_EXTENSIONS                 = 0x821D;
enum GL_CONTEXT_FLAGS                  = 0x821E;
enum GL_COMPRESSED_RED                 = 0x8225;
enum GL_COMPRESSED_RG                  = 0x8226;
enum GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT = 0x0001;
enum GL_RGBA32F                        = 0x8814;
enum GL_RGB32F                         = 0x8815;
enum GL_RGBA16F                        = 0x881A;
enum GL_RGB16F                         = 0x881B;
enum GL_VERTEX_ATTRIB_ARRAY_INTEGER    = 0x88FD;
enum GL_MAX_ARRAY_TEXTURE_LAYERS       = 0x88FF;
enum GL_MIN_PROGRAM_TEXEL_OFFSET       = 0x8904;
enum GL_MAX_PROGRAM_TEXEL_OFFSET       = 0x8905;
enum GL_CLAMP_READ_COLOR               = 0x891C;
enum GL_FIXED_ONLY                     = 0x891D;
enum GL_MAX_VARYING_COMPONENTS         = 0x8B4B;
enum GL_TEXTURE_1D_ARRAY               = 0x8C18;
enum GL_PROXY_TEXTURE_1D_ARRAY         = 0x8C19;
enum GL_TEXTURE_2D_ARRAY               = 0x8C1A;
enum GL_PROXY_TEXTURE_2D_ARRAY         = 0x8C1B;
enum GL_TEXTURE_BINDING_1D_ARRAY       = 0x8C1C;
enum GL_TEXTURE_BINDING_2D_ARRAY       = 0x8C1D;
enum GL_R11F_G11F_B10F                 = 0x8C3A;
enum GL_UNSIGNED_INT_10F_11F_11F_REV   = 0x8C3B;
enum GL_RGB9_E5                        = 0x8C3D;
enum GL_UNSIGNED_INT_5_9_9_9_REV       = 0x8C3E;
enum GL_TEXTURE_SHARED_SIZE            = 0x8C3F;
enum GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = 0x8C76;
enum GL_TRANSFORM_FEEDBACK_BUFFER_MODE = 0x8C7F;
enum GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = 0x8C80;
enum GL_TRANSFORM_FEEDBACK_VARYINGS    = 0x8C83;
enum GL_TRANSFORM_FEEDBACK_BUFFER_START = 0x8C84;
enum GL_TRANSFORM_FEEDBACK_BUFFER_SIZE = 0x8C85;
enum GL_PRIMITIVES_GENERATED           = 0x8C87;
enum GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = 0x8C88;
enum GL_RASTERIZER_DISCARD             = 0x8C89;
enum GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 0x8C8A;
enum GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = 0x8C8B;
enum GL_INTERLEAVED_ATTRIBS            = 0x8C8C;
enum GL_SEPARATE_ATTRIBS               = 0x8C8D;
enum GL_TRANSFORM_FEEDBACK_BUFFER      = 0x8C8E;
enum GL_TRANSFORM_FEEDBACK_BUFFER_BINDING = 0x8C8F;
enum GL_RGBA32UI                       = 0x8D70;
enum GL_RGB32UI                        = 0x8D71;
enum GL_RGBA16UI                       = 0x8D76;
enum GL_RGB16UI                        = 0x8D77;
enum GL_RGBA8UI                        = 0x8D7C;
enum GL_RGB8UI                         = 0x8D7D;
enum GL_RGBA32I                        = 0x8D82;
enum GL_RGB32I                         = 0x8D83;
enum GL_RGBA16I                        = 0x8D88;
enum GL_RGB16I                         = 0x8D89;
enum GL_RGBA8I                         = 0x8D8E;
enum GL_RGB8I                          = 0x8D8F;
enum GL_RED_INTEGER                    = 0x8D94;
enum GL_GREEN_INTEGER                  = 0x8D95;
enum GL_BLUE_INTEGER                   = 0x8D96;
enum GL_RGB_INTEGER                    = 0x8D98;
enum GL_RGBA_INTEGER                   = 0x8D99;
enum GL_BGR_INTEGER                    = 0x8D9A;
enum GL_BGRA_INTEGER                   = 0x8D9B;
enum GL_SAMPLER_1D_ARRAY               = 0x8DC0;
enum GL_SAMPLER_2D_ARRAY               = 0x8DC1;
enum GL_SAMPLER_1D_ARRAY_SHADOW        = 0x8DC3;
enum GL_SAMPLER_2D_ARRAY_SHADOW        = 0x8DC4;
enum GL_SAMPLER_CUBE_SHADOW            = 0x8DC5;
enum GL_UNSIGNED_INT_VEC2              = 0x8DC6;
enum GL_UNSIGNED_INT_VEC3              = 0x8DC7;
enum GL_UNSIGNED_INT_VEC4              = 0x8DC8;
enum GL_INT_SAMPLER_1D                 = 0x8DC9;
enum GL_INT_SAMPLER_2D                 = 0x8DCA;
enum GL_INT_SAMPLER_3D                 = 0x8DCB;
enum GL_INT_SAMPLER_CUBE               = 0x8DCC;
enum GL_INT_SAMPLER_1D_ARRAY           = 0x8DCE;
enum GL_INT_SAMPLER_2D_ARRAY           = 0x8DCF;
enum GL_UNSIGNED_INT_SAMPLER_1D        = 0x8DD1;
enum GL_UNSIGNED_INT_SAMPLER_2D        = 0x8DD2;
enum GL_UNSIGNED_INT_SAMPLER_3D        = 0x8DD3;
enum GL_UNSIGNED_INT_SAMPLER_CUBE      = 0x8DD4;
enum GL_UNSIGNED_INT_SAMPLER_1D_ARRAY  = 0x8DD6;
enum GL_UNSIGNED_INT_SAMPLER_2D_ARRAY  = 0x8DD7;
enum GL_QUERY_WAIT                     = 0x8E13;
enum GL_QUERY_NO_WAIT                  = 0x8E14;
enum GL_QUERY_BY_REGION_WAIT           = 0x8E15;
enum GL_QUERY_BY_REGION_NO_WAIT        = 0x8E16;
enum GL_BUFFER_ACCESS_FLAGS            = 0x911F;
enum GL_BUFFER_MAP_LENGTH              = 0x9120;
enum GL_BUFFER_MAP_OFFSET              = 0x9121;
/* Reuse tokens from ARB_depth_buffer_float */
/* reuse GL_DEPTH_COMPONENT32F */
/* reuse GL_DEPTH32F_STENCIL8 */
/* reuse GL_FLOAT_32_UNSIGNED_INT_24_8_REV */
/* Reuse tokens from ARB_framebuffer_object */
/* reuse GL_INVALID_FRAMEBUFFER_OPERATION */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE */
/* reuse GL_FRAMEBUFFER_DEFAULT */
/* reuse GL_FRAMEBUFFER_UNDEFINED */
/* reuse GL_DEPTH_STENCIL_ATTACHMENT */
/* reuse GL_INDEX */
/* reuse GL_MAX_RENDERBUFFER_SIZE */
/* reuse GL_DEPTH_STENCIL */
/* reuse GL_UNSIGNED_INT_24_8 */
/* reuse GL_DEPTH24_STENCIL8 */
/* reuse GL_TEXTURE_STENCIL_SIZE */
/* reuse GL_TEXTURE_RED_TYPE */
/* reuse GL_TEXTURE_GREEN_TYPE */
/* reuse GL_TEXTURE_BLUE_TYPE */
/* reuse GL_TEXTURE_ALPHA_TYPE */
/* reuse GL_TEXTURE_DEPTH_TYPE */
/* reuse GL_UNSIGNED_NORMALIZED */
/* reuse GL_FRAMEBUFFER_BINDING */
/* reuse GL_DRAW_FRAMEBUFFER_BINDING */
/* reuse GL_RENDERBUFFER_BINDING */
/* reuse GL_READ_FRAMEBUFFER */
/* reuse GL_DRAW_FRAMEBUFFER */
/* reuse GL_READ_FRAMEBUFFER_BINDING */
/* reuse GL_RENDERBUFFER_SAMPLES */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER */
/* reuse GL_FRAMEBUFFER_COMPLETE */
/* reuse GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT */
/* reuse GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT */
/* reuse GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER */
/* reuse GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER */
/* reuse GL_FRAMEBUFFER_UNSUPPORTED */
/* reuse GL_MAX_COLOR_ATTACHMENTS */
/* reuse GL_COLOR_ATTACHMENT0 */
/* reuse GL_COLOR_ATTACHMENT1 */
/* reuse GL_COLOR_ATTACHMENT2 */
/* reuse GL_COLOR_ATTACHMENT3 */
/* reuse GL_COLOR_ATTACHMENT4 */
/* reuse GL_COLOR_ATTACHMENT5 */
/* reuse GL_COLOR_ATTACHMENT6 */
/* reuse GL_COLOR_ATTACHMENT7 */
/* reuse GL_COLOR_ATTACHMENT8 */
/* reuse GL_COLOR_ATTACHMENT9 */
/* reuse GL_COLOR_ATTACHMENT10 */
/* reuse GL_COLOR_ATTACHMENT11 */
/* reuse GL_COLOR_ATTACHMENT12 */
/* reuse GL_COLOR_ATTACHMENT13 */
/* reuse GL_COLOR_ATTACHMENT14 */
/* reuse GL_COLOR_ATTACHMENT15 */
/* reuse GL_DEPTH_ATTACHMENT */
/* reuse GL_STENCIL_ATTACHMENT */
/* reuse GL_FRAMEBUFFER */
/* reuse GL_RENDERBUFFER */
/* reuse GL_RENDERBUFFER_WIDTH */
/* reuse GL_RENDERBUFFER_HEIGHT */
/* reuse GL_RENDERBUFFER_INTERNAL_FORMAT */
/* reuse GL_STENCIL_INDEX1 */
/* reuse GL_STENCIL_INDEX4 */
/* reuse GL_STENCIL_INDEX8 */
/* reuse GL_STENCIL_INDEX16 */
/* reuse GL_RENDERBUFFER_RED_SIZE */
/* reuse GL_RENDERBUFFER_GREEN_SIZE */
/* reuse GL_RENDERBUFFER_BLUE_SIZE */
/* reuse GL_RENDERBUFFER_ALPHA_SIZE */
/* reuse GL_RENDERBUFFER_DEPTH_SIZE */
/* reuse GL_RENDERBUFFER_STENCIL_SIZE */
/* reuse GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE */
/* reuse GL_MAX_SAMPLES */
/* Reuse tokens from ARB_framebuffer_sRGB */
/* reuse GL_FRAMEBUFFER_SRGB */
/* Reuse tokens from ARB_half_float_vertex */
/* reuse GL_HALF_FLOAT */
/* Reuse tokens from ARB_map_buffer_range */
/* reuse GL_MAP_READ_BIT */
/* reuse GL_MAP_WRITE_BIT */
/* reuse GL_MAP_INVALIDATE_RANGE_BIT */
/* reuse GL_MAP_INVALIDATE_BUFFER_BIT */
/* reuse GL_MAP_FLUSH_EXPLICIT_BIT */
/* reuse GL_MAP_UNSYNCHRONIZED_BIT */
/* Reuse tokens from ARB_texture_compression_rgtc */
/* reuse GL_COMPRESSED_RED_RGTC1 */
/* reuse GL_COMPRESSED_SIGNED_RED_RGTC1 */
/* reuse GL_COMPRESSED_RG_RGTC2 */
/* reuse GL_COMPRESSED_SIGNED_RG_RGTC2 */
/* Reuse tokens from ARB_texture_rg */
/* reuse GL_RG */
/* reuse GL_RG_INTEGER */
/* reuse GL_R8 */
/* reuse GL_R16 */
/* reuse GL_RG8 */
/* reuse GL_RG16 */
/* reuse GL_R16F */
/* reuse GL_R32F */
/* reuse GL_RG16F */
/* reuse GL_RG32F */
/* reuse GL_R8I */
/* reuse GL_R8UI */
/* reuse GL_R16I */
/* reuse GL_R16UI */
/* reuse GL_R32I */
/* reuse GL_R32UI */
/* reuse GL_RG8I */
/* reuse GL_RG8UI */
/* reuse GL_RG16I */
/* reuse GL_RG16UI */
/* reuse GL_RG32I */
/* reuse GL_RG32UI */
/* Reuse tokens from ARB_vertex_array_object */
/* reuse GL_VERTEX_ARRAY_BINDING */
enum GL_CLAMP_VERTEX_COLOR             = 0x891A;
enum GL_CLAMP_FRAGMENT_COLOR           = 0x891B;
enum GL_ALPHA_INTEGER                  = 0x8D97;
/* Reuse tokens from ARB_framebuffer_object */
/* reuse GL_TEXTURE_LUMINANCE_TYPE */
/* reuse GL_TEXTURE_INTENSITY_TYPE */
}

version (GL_VERSION_3_1) {} else {
enum GL_SAMPLER_2D_RECT                = 0x8B63;
enum GL_SAMPLER_2D_RECT_SHADOW         = 0x8B64;
enum GL_SAMPLER_BUFFER                 = 0x8DC2;
enum GL_INT_SAMPLER_2D_RECT            = 0x8DCD;
enum GL_INT_SAMPLER_BUFFER             = 0x8DD0;
enum GL_UNSIGNED_INT_SAMPLER_2D_RECT   = 0x8DD5;
enum GL_UNSIGNED_INT_SAMPLER_BUFFER    = 0x8DD8;
enum GL_TEXTURE_BUFFER                 = 0x8C2A;
enum GL_MAX_TEXTURE_BUFFER_SIZE        = 0x8C2B;
enum GL_TEXTURE_BINDING_BUFFER         = 0x8C2C;
enum GL_TEXTURE_BUFFER_DATA_STORE_BINDING = 0x8C2D;
enum GL_TEXTURE_RECTANGLE              = 0x84F5;
enum GL_TEXTURE_BINDING_RECTANGLE      = 0x84F6;
enum GL_PROXY_TEXTURE_RECTANGLE        = 0x84F7;
enum GL_MAX_RECTANGLE_TEXTURE_SIZE     = 0x84F8;
enum GL_RED_SNORM                      = 0x8F90;
enum GL_RG_SNORM                       = 0x8F91;
enum GL_RGB_SNORM                      = 0x8F92;
enum GL_RGBA_SNORM                     = 0x8F93;
enum GL_R8_SNORM                       = 0x8F94;
enum GL_RG8_SNORM                      = 0x8F95;
enum GL_RGB8_SNORM                     = 0x8F96;
enum GL_RGBA8_SNORM                    = 0x8F97;
enum GL_R16_SNORM                      = 0x8F98;
enum GL_RG16_SNORM                     = 0x8F99;
enum GL_RGB16_SNORM                    = 0x8F9A;
enum GL_RGBA16_SNORM                   = 0x8F9B;
enum GL_SIGNED_NORMALIZED              = 0x8F9C;
enum GL_PRIMITIVE_RESTART              = 0x8F9D;
enum GL_PRIMITIVE_RESTART_INDEX        = 0x8F9E;
/* Reuse tokens from ARB_copy_buffer */
/* reuse GL_COPY_READ_BUFFER */
/* reuse GL_COPY_WRITE_BUFFER */
/* Reuse tokens from ARB_draw_instanced (none) */
/* Reuse tokens from ARB_uniform_buffer_object */
/* reuse GL_UNIFORM_BUFFER */
/* reuse GL_UNIFORM_BUFFER_BINDING */
/* reuse GL_UNIFORM_BUFFER_START */
/* reuse GL_UNIFORM_BUFFER_SIZE */
/* reuse GL_MAX_VERTEX_UNIFORM_BLOCKS */
/* reuse GL_MAX_FRAGMENT_UNIFORM_BLOCKS */
/* reuse GL_MAX_COMBINED_UNIFORM_BLOCKS */
/* reuse GL_MAX_UNIFORM_BUFFER_BINDINGS */
/* reuse GL_MAX_UNIFORM_BLOCK_SIZE */
/* reuse GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS */
/* reuse GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS */
/* reuse GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT */
/* reuse GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH */
/* reuse GL_ACTIVE_UNIFORM_BLOCKS */
/* reuse GL_UNIFORM_TYPE */
/* reuse GL_UNIFORM_SIZE */
/* reuse GL_UNIFORM_NAME_LENGTH */
/* reuse GL_UNIFORM_BLOCK_INDEX */
/* reuse GL_UNIFORM_OFFSET */
/* reuse GL_UNIFORM_ARRAY_STRIDE */
/* reuse GL_UNIFORM_MATRIX_STRIDE */
/* reuse GL_UNIFORM_IS_ROW_MAJOR */
/* reuse GL_UNIFORM_BLOCK_BINDING */
/* reuse GL_UNIFORM_BLOCK_DATA_SIZE */
/* reuse GL_UNIFORM_BLOCK_NAME_LENGTH */
/* reuse GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS */
/* reuse GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES */
/* reuse GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER */
/* reuse GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER */
/* reuse GL_INVALID_INDEX */
}

version (GL_VERSION_3_2) {} else {
enum GL_CONTEXT_CORE_PROFILE_BIT       = 0x00000001;
enum GL_CONTEXT_COMPATIBILITY_PROFILE_BIT = 0x00000002;
enum GL_LINES_ADJACENCY                = 0x000A;
enum GL_LINE_STRIP_ADJACENCY           = 0x000B;
enum GL_TRIANGLES_ADJACENCY            = 0x000C;
enum GL_TRIANGLE_STRIP_ADJACENCY       = 0x000D;
enum GL_PROGRAM_POINT_SIZE             = 0x8642;
enum GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS = 0x8C29;
enum GL_FRAMEBUFFER_ATTACHMENT_LAYERED = 0x8DA7;
enum GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS = 0x8DA8;
enum GL_GEOMETRY_SHADER                = 0x8DD9;
enum GL_GEOMETRY_VERTICES_OUT          = 0x8916;
enum GL_GEOMETRY_INPUT_TYPE            = 0x8917;
enum GL_GEOMETRY_OUTPUT_TYPE           = 0x8918;
enum GL_MAX_GEOMETRY_UNIFORM_COMPONENTS = 0x8DDF;
enum GL_MAX_GEOMETRY_OUTPUT_VERTICES   = 0x8DE0;
enum GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS = 0x8DE1;
enum GL_MAX_VERTEX_OUTPUT_COMPONENTS   = 0x9122;
enum GL_MAX_GEOMETRY_INPUT_COMPONENTS  = 0x9123;
enum GL_MAX_GEOMETRY_OUTPUT_COMPONENTS = 0x9124;
enum GL_MAX_FRAGMENT_INPUT_COMPONENTS  = 0x9125;
enum GL_CONTEXT_PROFILE_MASK           = 0x9126;
/* reuse GL_MAX_VARYING_COMPONENTS */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER */
/* Reuse tokens from ARB_depth_clamp */
/* reuse GL_DEPTH_CLAMP */
/* Reuse tokens from ARB_draw_elements_base_vertex (none) */
/* Reuse tokens from ARB_fragment_coord_conventions (none) */
/* Reuse tokens from ARB_provoking_vertex */
/* reuse GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION */
/* reuse GL_FIRST_VERTEX_CONVENTION */
/* reuse GL_LAST_VERTEX_CONVENTION */
/* reuse GL_PROVOKING_VERTEX */
/* Reuse tokens from ARB_seamless_cube_map */
/* reuse GL_TEXTURE_CUBE_MAP_SEAMLESS */
/* Reuse tokens from ARB_sync */
/* reuse GL_MAX_SERVER_WAIT_TIMEOUT */
/* reuse GL_OBJECT_TYPE */
/* reuse GL_SYNC_CONDITION */
/* reuse GL_SYNC_STATUS */
/* reuse GL_SYNC_FLAGS */
/* reuse GL_SYNC_FENCE */
/* reuse GL_SYNC_GPU_COMMANDS_COMPLETE */
/* reuse GL_UNSIGNALED */
/* reuse GL_SIGNALED */
/* reuse GL_ALREADY_SIGNALED */
/* reuse GL_TIMEOUT_EXPIRED */
/* reuse GL_CONDITION_SATISFIED */
/* reuse GL_WAIT_FAILED */
/* reuse GL_TIMEOUT_IGNORED */
/* reuse GL_SYNC_FLUSH_COMMANDS_BIT */
/* reuse GL_TIMEOUT_IGNORED */
/* Reuse tokens from ARB_texture_multisample */
/* reuse GL_SAMPLE_POSITION */
/* reuse GL_SAMPLE_MASK */
/* reuse GL_SAMPLE_MASK_VALUE */
/* reuse GL_MAX_SAMPLE_MASK_WORDS */
/* reuse GL_TEXTURE_2D_MULTISAMPLE */
/* reuse GL_PROXY_TEXTURE_2D_MULTISAMPLE */
/* reuse GL_TEXTURE_2D_MULTISAMPLE_ARRAY */
/* reuse GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY */
/* reuse GL_TEXTURE_BINDING_2D_MULTISAMPLE */
/* reuse GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY */
/* reuse GL_TEXTURE_SAMPLES */
/* reuse GL_TEXTURE_FIXED_SAMPLE_LOCATIONS */
/* reuse GL_SAMPLER_2D_MULTISAMPLE */
/* reuse GL_INT_SAMPLER_2D_MULTISAMPLE */
/* reuse GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE */
/* reuse GL_SAMPLER_2D_MULTISAMPLE_ARRAY */
/* reuse GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY */
/* reuse GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY */
/* reuse GL_MAX_COLOR_TEXTURE_SAMPLES */
/* reuse GL_MAX_DEPTH_TEXTURE_SAMPLES */
/* reuse GL_MAX_INTEGER_SAMPLES */
/* Don't need to reuse tokens from ARB_vertex_array_bgra since they're already in 1.2 core */
}

version (GL_VERSION_3_3) {} else {
enum GL_VERTEX_ATTRIB_ARRAY_DIVISOR    = 0x88FE;
/* Reuse tokens from ARB_blend_func_extended */
/* reuse GL_SRC1_COLOR */
/* reuse GL_ONE_MINUS_SRC1_COLOR */
/* reuse GL_ONE_MINUS_SRC1_ALPHA */
/* reuse GL_MAX_DUAL_SOURCE_DRAW_BUFFERS */
/* Reuse tokens from ARB_explicit_attrib_location (none) */
/* Reuse tokens from ARB_occlusion_query2 */
/* reuse GL_ANY_SAMPLES_PASSED */
/* Reuse tokens from ARB_sampler_objects */
/* reuse GL_SAMPLER_BINDING */
/* Reuse tokens from ARB_shader_bit_encoding (none) */
/* Reuse tokens from ARB_texture_rgb10_a2ui */
/* reuse GL_RGB10_A2UI */
/* Reuse tokens from ARB_texture_swizzle */
/* reuse GL_TEXTURE_SWIZZLE_R */
/* reuse GL_TEXTURE_SWIZZLE_G */
/* reuse GL_TEXTURE_SWIZZLE_B */
/* reuse GL_TEXTURE_SWIZZLE_A */
/* reuse GL_TEXTURE_SWIZZLE_RGBA */
/* Reuse tokens from ARB_timer_query */
/* reuse GL_TIME_ELAPSED */
/* reuse GL_TIMESTAMP */
/* Reuse tokens from ARB_vertex_type_2_10_10_10_rev */
/* reuse GL_INT_2_10_10_10_REV */
}

version (GL_VERSION_4_0) {} else {
enum GL_SAMPLE_SHADING                 = 0x8C36;
enum GL_MIN_SAMPLE_SHADING_VALUE       = 0x8C37;
enum GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET = 0x8E5E;
enum GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET = 0x8E5F;
enum GL_TEXTURE_CUBE_MAP_ARRAY         = 0x9009;
enum GL_TEXTURE_BINDING_CUBE_MAP_ARRAY = 0x900A;
enum GL_PROXY_TEXTURE_CUBE_MAP_ARRAY   = 0x900B;
enum GL_SAMPLER_CUBE_MAP_ARRAY         = 0x900C;
enum GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW  = 0x900D;
enum GL_INT_SAMPLER_CUBE_MAP_ARRAY     = 0x900E;
enum GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY = 0x900F;
/* Reuse tokens from ARB_texture_query_lod (none) */
/* Reuse tokens from ARB_draw_buffers_blend (none) */
/* Reuse tokens from ARB_draw_indirect */
/* reuse GL_DRAW_INDIRECT_BUFFER */
/* reuse GL_DRAW_INDIRECT_BUFFER_BINDING */
/* Reuse tokens from ARB_gpu_shader5 */
/* reuse GL_GEOMETRY_SHADER_INVOCATIONS */
/* reuse GL_MAX_GEOMETRY_SHADER_INVOCATIONS */
/* reuse GL_MIN_FRAGMENT_INTERPOLATION_OFFSET */
/* reuse GL_MAX_FRAGMENT_INTERPOLATION_OFFSET */
/* reuse GL_FRAGMENT_INTERPOLATION_OFFSET_BITS */
/* reuse GL_MAX_VERTEX_STREAMS */
/* Reuse tokens from ARB_gpu_shader_fp64 */
/* reuse GL_DOUBLE_VEC2 */
/* reuse GL_DOUBLE_VEC3 */
/* reuse GL_DOUBLE_VEC4 */
/* reuse GL_DOUBLE_MAT2 */
/* reuse GL_DOUBLE_MAT3 */
/* reuse GL_DOUBLE_MAT4 */
/* reuse GL_DOUBLE_MAT2x3 */
/* reuse GL_DOUBLE_MAT2x4 */
/* reuse GL_DOUBLE_MAT3x2 */
/* reuse GL_DOUBLE_MAT3x4 */
/* reuse GL_DOUBLE_MAT4x2 */
/* reuse GL_DOUBLE_MAT4x3 */
/* Reuse tokens from ARB_shader_subroutine */
/* reuse GL_ACTIVE_SUBROUTINES */
/* reuse GL_ACTIVE_SUBROUTINE_UNIFORMS */
/* reuse GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS */
/* reuse GL_ACTIVE_SUBROUTINE_MAX_LENGTH */
/* reuse GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH */
/* reuse GL_MAX_SUBROUTINES */
/* reuse GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS */
/* reuse GL_NUM_COMPATIBLE_SUBROUTINES */
/* reuse GL_COMPATIBLE_SUBROUTINES */
/* Reuse tokens from ARB_tessellation_shader */
/* reuse GL_PATCHES */
/* reuse GL_PATCH_VERTICES */
/* reuse GL_PATCH_DEFAULT_INNER_LEVEL */
/* reuse GL_PATCH_DEFAULT_OUTER_LEVEL */
/* reuse GL_TESS_CONTROL_OUTPUT_VERTICES */
/* reuse GL_TESS_GEN_MODE */
/* reuse GL_TESS_GEN_SPACING */
/* reuse GL_TESS_GEN_VERTEX_ORDER */
/* reuse GL_TESS_GEN_POINT_MODE */
/* reuse GL_ISOLINES */
/* reuse GL_FRACTIONAL_ODD */
/* reuse GL_FRACTIONAL_EVEN */
/* reuse GL_MAX_PATCH_VERTICES */
/* reuse GL_MAX_TESS_GEN_LEVEL */
/* reuse GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS */
/* reuse GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS */
/* reuse GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS */
/* reuse GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS */
/* reuse GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS */
/* reuse GL_MAX_TESS_PATCH_COMPONENTS */
/* reuse GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS */
/* reuse GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS */
/* reuse GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS */
/* reuse GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS */
/* reuse GL_MAX_TESS_CONTROL_INPUT_COMPONENTS */
/* reuse GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS */
/* reuse GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS */
/* reuse GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS */
/* reuse GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER */
/* reuse GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER */
/* reuse GL_TESS_EVALUATION_SHADER */
/* reuse GL_TESS_CONTROL_SHADER */
/* Reuse tokens from ARB_texture_buffer_object_rgb32 (none) */
/* Reuse tokens from ARB_transform_feedback2 */
/* reuse GL_TRANSFORM_FEEDBACK */
/* reuse GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED */
/* reuse GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE */
/* reuse GL_TRANSFORM_FEEDBACK_BINDING */
/* Reuse tokens from ARB_transform_feedback3 */
/* reuse GL_MAX_TRANSFORM_FEEDBACK_BUFFERS */
/* reuse GL_MAX_VERTEX_STREAMS */
}

version (GL_VERSION_4_1) {} else {
/* Reuse tokens from ARB_ES2_compatibility */
/* reuse GL_FIXED */
/* reuse GL_IMPLEMENTATION_COLOR_READ_TYPE */
/* reuse GL_IMPLEMENTATION_COLOR_READ_FORMAT */
/* reuse GL_LOW_FLOAT */
/* reuse GL_MEDIUM_FLOAT */
/* reuse GL_HIGH_FLOAT */
/* reuse GL_LOW_INT */
/* reuse GL_MEDIUM_INT */
/* reuse GL_HIGH_INT */
/* reuse GL_SHADER_COMPILER */
/* reuse GL_SHADER_BINARY_FORMATS */
/* reuse GL_NUM_SHADER_BINARY_FORMATS */
/* reuse GL_MAX_VERTEX_UNIFORM_VECTORS */
/* reuse GL_MAX_VARYING_VECTORS */
/* reuse GL_MAX_FRAGMENT_UNIFORM_VECTORS */
/* reuse GL_RGB565 */
/* Reuse tokens from ARB_get_program_binary */
/* reuse GL_PROGRAM_BINARY_RETRIEVABLE_HINT */
/* reuse GL_PROGRAM_BINARY_LENGTH */
/* reuse GL_NUM_PROGRAM_BINARY_FORMATS */
/* reuse GL_PROGRAM_BINARY_FORMATS */
/* Reuse tokens from ARB_separate_shader_objects */
/* reuse GL_VERTEX_SHADER_BIT */
/* reuse GL_FRAGMENT_SHADER_BIT */
/* reuse GL_GEOMETRY_SHADER_BIT */
/* reuse GL_TESS_CONTROL_SHADER_BIT */
/* reuse GL_TESS_EVALUATION_SHADER_BIT */
/* reuse GL_ALL_SHADER_BITS */
/* reuse GL_PROGRAM_SEPARABLE */
/* reuse GL_ACTIVE_PROGRAM */
/* reuse GL_PROGRAM_PIPELINE_BINDING */
/* Reuse tokens from ARB_shader_precision (none) */
/* Reuse tokens from ARB_vertex_attrib_64bit - all are in GL 3.0 and 4.0 already */
/* Reuse tokens from ARB_viewport_array - some are in GL 1.1 and ARB_provoking_vertex already */
/* reuse GL_MAX_VIEWPORTS */
/* reuse GL_VIEWPORT_SUBPIXEL_BITS */
/* reuse GL_VIEWPORT_BOUNDS_RANGE */
/* reuse GL_LAYER_PROVOKING_VERTEX */
/* reuse GL_VIEWPORT_INDEX_PROVOKING_VERTEX */
/* reuse GL_UNDEFINED_VERTEX */
}

version (GL_VERSION_4_2) {} else {
/* Reuse tokens from ARB_base_instance (none) */
/* Reuse tokens from ARB_shading_language_420pack (none) */
/* Reuse tokens from ARB_transform_feedback_instanced (none) */
/* Reuse tokens from ARB_compressed_texture_pixel_storage */
/* reuse GL_UNPACK_COMPRESSED_BLOCK_WIDTH */
/* reuse GL_UNPACK_COMPRESSED_BLOCK_HEIGHT */
/* reuse GL_UNPACK_COMPRESSED_BLOCK_DEPTH */
/* reuse GL_UNPACK_COMPRESSED_BLOCK_SIZE */
/* reuse GL_PACK_COMPRESSED_BLOCK_WIDTH */
/* reuse GL_PACK_COMPRESSED_BLOCK_HEIGHT */
/* reuse GL_PACK_COMPRESSED_BLOCK_DEPTH */
/* reuse GL_PACK_COMPRESSED_BLOCK_SIZE */
/* Reuse tokens from ARB_conservative_depth (none) */
/* Reuse tokens from ARB_internalformat_query */
/* reuse GL_NUM_SAMPLE_COUNTS */
/* Reuse tokens from ARB_map_buffer_alignment */
/* reuse GL_MIN_MAP_BUFFER_ALIGNMENT */
/* Reuse tokens from ARB_shader_atomic_counters */
/* reuse GL_ATOMIC_COUNTER_BUFFER */
/* reuse GL_ATOMIC_COUNTER_BUFFER_BINDING */
/* reuse GL_ATOMIC_COUNTER_BUFFER_START */
/* reuse GL_ATOMIC_COUNTER_BUFFER_SIZE */
/* reuse GL_ATOMIC_COUNTER_BUFFER_DATA_SIZE */
/* reuse GL_ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTERS */
/* reuse GL_ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTER_INDICES */
/* reuse GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_VERTEX_SHADER */
/* reuse GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_CONTROL_SHADER */
/* reuse GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_EVALUATION_SHADER */
/* reuse GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_GEOMETRY_SHADER */
/* reuse GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_FRAGMENT_SHADER */
/* reuse GL_MAX_VERTEX_ATOMIC_COUNTER_BUFFERS */
/* reuse GL_MAX_TESS_CONTROL_ATOMIC_COUNTER_BUFFERS */
/* reuse GL_MAX_TESS_EVALUATION_ATOMIC_COUNTER_BUFFERS */
/* reuse GL_MAX_GEOMETRY_ATOMIC_COUNTER_BUFFERS */
/* reuse GL_MAX_FRAGMENT_ATOMIC_COUNTER_BUFFERS */
/* reuse GL_MAX_COMBINED_ATOMIC_COUNTER_BUFFERS */
/* reuse GL_MAX_VERTEX_ATOMIC_COUNTERS */
/* reuse GL_MAX_TESS_CONTROL_ATOMIC_COUNTERS */
/* reuse GL_MAX_TESS_EVALUATION_ATOMIC_COUNTERS */
/* reuse GL_MAX_GEOMETRY_ATOMIC_COUNTERS */
/* reuse GL_MAX_FRAGMENT_ATOMIC_COUNTERS */
/* reuse GL_MAX_COMBINED_ATOMIC_COUNTERS */
/* reuse GL_MAX_ATOMIC_COUNTER_BUFFER_SIZE */
/* reuse GL_MAX_ATOMIC_COUNTER_BUFFER_BINDINGS */
/* reuse GL_ACTIVE_ATOMIC_COUNTER_BUFFERS */
/* reuse GL_UNIFORM_ATOMIC_COUNTER_BUFFER_INDEX */
/* reuse GL_UNSIGNED_INT_ATOMIC_COUNTER */
/* Reuse tokens from ARB_shader_image_load_store */
/* reuse GL_VERTEX_ATTRIB_ARRAY_BARRIER_BIT */
/* reuse GL_ELEMENT_ARRAY_BARRIER_BIT */
/* reuse GL_UNIFORM_BARRIER_BIT */
/* reuse GL_TEXTURE_FETCH_BARRIER_BIT */
/* reuse GL_SHADER_IMAGE_ACCESS_BARRIER_BIT */
/* reuse GL_COMMAND_BARRIER_BIT */
/* reuse GL_PIXEL_BUFFER_BARRIER_BIT */
/* reuse GL_TEXTURE_UPDATE_BARRIER_BIT */
/* reuse GL_BUFFER_UPDATE_BARRIER_BIT */
/* reuse GL_FRAMEBUFFER_BARRIER_BIT */
/* reuse GL_TRANSFORM_FEEDBACK_BARRIER_BIT */
/* reuse GL_ATOMIC_COUNTER_BARRIER_BIT */
/* reuse GL_ALL_BARRIER_BITS */
/* reuse GL_MAX_IMAGE_UNITS */
/* reuse GL_MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS */
/* reuse GL_IMAGE_BINDING_NAME */
/* reuse GL_IMAGE_BINDING_LEVEL */
/* reuse GL_IMAGE_BINDING_LAYERED */
/* reuse GL_IMAGE_BINDING_LAYER */
/* reuse GL_IMAGE_BINDING_ACCESS */
/* reuse GL_IMAGE_1D */
/* reuse GL_IMAGE_2D */
/* reuse GL_IMAGE_3D */
/* reuse GL_IMAGE_2D_RECT */
/* reuse GL_IMAGE_CUBE */
/* reuse GL_IMAGE_BUFFER */
/* reuse GL_IMAGE_1D_ARRAY */
/* reuse GL_IMAGE_2D_ARRAY */
/* reuse GL_IMAGE_CUBE_MAP_ARRAY */
/* reuse GL_IMAGE_2D_MULTISAMPLE */
/* reuse GL_IMAGE_2D_MULTISAMPLE_ARRAY */
/* reuse GL_INT_IMAGE_1D */
/* reuse GL_INT_IMAGE_2D */
/* reuse GL_INT_IMAGE_3D */
/* reuse GL_INT_IMAGE_2D_RECT */
/* reuse GL_INT_IMAGE_CUBE */
/* reuse GL_INT_IMAGE_BUFFER */
/* reuse GL_INT_IMAGE_1D_ARRAY */
/* reuse GL_INT_IMAGE_2D_ARRAY */
/* reuse GL_INT_IMAGE_CUBE_MAP_ARRAY */
/* reuse GL_INT_IMAGE_2D_MULTISAMPLE */
/* reuse GL_INT_IMAGE_2D_MULTISAMPLE_ARRAY */
/* reuse GL_UNSIGNED_INT_IMAGE_1D */
/* reuse GL_UNSIGNED_INT_IMAGE_2D */
/* reuse GL_UNSIGNED_INT_IMAGE_3D */
/* reuse GL_UNSIGNED_INT_IMAGE_2D_RECT */
/* reuse GL_UNSIGNED_INT_IMAGE_CUBE */
/* reuse GL_UNSIGNED_INT_IMAGE_BUFFER */
/* reuse GL_UNSIGNED_INT_IMAGE_1D_ARRAY */
/* reuse GL_UNSIGNED_INT_IMAGE_2D_ARRAY */
/* reuse GL_UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY */
/* reuse GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE */
/* reuse GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY */
/* reuse GL_MAX_IMAGE_SAMPLES */
/* reuse GL_IMAGE_BINDING_FORMAT */
/* reuse GL_IMAGE_FORMAT_COMPATIBILITY_TYPE */
/* reuse GL_IMAGE_FORMAT_COMPATIBILITY_BY_SIZE */
/* reuse GL_IMAGE_FORMAT_COMPATIBILITY_BY_CLASS */
/* reuse GL_MAX_VERTEX_IMAGE_UNIFORMS */
/* reuse GL_MAX_TESS_CONTROL_IMAGE_UNIFORMS */
/* reuse GL_MAX_TESS_EVALUATION_IMAGE_UNIFORMS */
/* reuse GL_MAX_GEOMETRY_IMAGE_UNIFORMS */
/* reuse GL_MAX_FRAGMENT_IMAGE_UNIFORMS */
/* reuse GL_MAX_COMBINED_IMAGE_UNIFORMS */
/* Reuse tokens from ARB_shading_language_packing (none) */
/* Reuse tokens from ARB_texture_storage */
/* reuse GL_TEXTURE_IMMUTABLE_FORMAT */
}

version (GL_VERSION_4_3) {} else {
enum GL_NUM_SHADING_LANGUAGE_VERSIONS  = 0x82E9;
enum GL_VERTEX_ATTRIB_ARRAY_LONG       = 0x874E;
/* Reuse tokens from ARB_arrays_of_arrays (none, GLSL only) */
/* Reuse tokens from ARB_fragment_layer_viewport (none, GLSL only) */
/* Reuse tokens from ARB_shader_image_size (none, GLSL only) */
/* Reuse tokens from ARB_ES3_compatibility */
/* reuse GL_COMPRESSED_RGB8_ETC2 */
/* reuse GL_COMPRESSED_SRGB8_ETC2 */
/* reuse GL_COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2 */
/* reuse GL_COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2 */
/* reuse GL_COMPRESSED_RGBA8_ETC2_EAC */
/* reuse GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC */
/* reuse GL_COMPRESSED_R11_EAC */
/* reuse GL_COMPRESSED_SIGNED_R11_EAC */
/* reuse GL_COMPRESSED_RG11_EAC */
/* reuse GL_COMPRESSED_SIGNED_RG11_EAC */
/* reuse GL_PRIMITIVE_RESTART_FIXED_INDEX */
/* reuse GL_ANY_SAMPLES_PASSED_CONSERVATIVE */
/* reuse GL_MAX_ELEMENT_INDEX */
/* Reuse tokens from ARB_clear_buffer_object (none) */
/* Reuse tokens from ARB_compute_shader */
/* reuse GL_COMPUTE_SHADER */
/* reuse GL_MAX_COMPUTE_UNIFORM_BLOCKS */
/* reuse GL_MAX_COMPUTE_TEXTURE_IMAGE_UNITS */
/* reuse GL_MAX_COMPUTE_IMAGE_UNIFORMS */
/* reuse GL_MAX_COMPUTE_SHARED_MEMORY_SIZE */
/* reuse GL_MAX_COMPUTE_UNIFORM_COMPONENTS */
/* reuse GL_MAX_COMPUTE_ATOMIC_COUNTER_BUFFERS */
/* reuse GL_MAX_COMPUTE_ATOMIC_COUNTERS */
/* reuse GL_MAX_COMBINED_COMPUTE_UNIFORM_COMPONENTS */
/* reuse GL_MAX_COMPUTE_LOCAL_INVOCATIONS */
/* reuse GL_MAX_COMPUTE_WORK_GROUP_COUNT */
/* reuse GL_MAX_COMPUTE_WORK_GROUP_SIZE */
/* reuse GL_COMPUTE_LOCAL_WORK_SIZE */
/* reuse GL_UNIFORM_BLOCK_REFERENCED_BY_COMPUTE_SHADER */
/* reuse GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_COMPUTE_SHADER */
/* reuse GL_DISPATCH_INDIRECT_BUFFER */
/* reuse GL_DISPATCH_INDIRECT_BUFFER_BINDING */
/* Reuse tokens from ARB_copy_image (none) */
/* Reuse tokens from KHR_debug */
/* reuse GL_DEBUG_OUTPUT_SYNCHRONOUS */
/* reuse GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH */
/* reuse GL_DEBUG_CALLBACK_FUNCTION */
/* reuse GL_DEBUG_CALLBACK_USER_PARAM */
/* reuse GL_DEBUG_SOURCE_API */
/* reuse GL_DEBUG_SOURCE_WINDOW_SYSTEM */
/* reuse GL_DEBUG_SOURCE_SHADER_COMPILER */
/* reuse GL_DEBUG_SOURCE_THIRD_PARTY */
/* reuse GL_DEBUG_SOURCE_APPLICATION */
/* reuse GL_DEBUG_SOURCE_OTHER */
/* reuse GL_DEBUG_TYPE_ERROR */
/* reuse GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR */
/* reuse GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR */
/* reuse GL_DEBUG_TYPE_PORTABILITY */
/* reuse GL_DEBUG_TYPE_PERFORMANCE */
/* reuse GL_DEBUG_TYPE_OTHER */
/* reuse GL_MAX_DEBUG_MESSAGE_LENGTH */
/* reuse GL_MAX_DEBUG_LOGGED_MESSAGES */
/* reuse GL_DEBUG_LOGGED_MESSAGES */
/* reuse GL_DEBUG_SEVERITY_HIGH */
/* reuse GL_DEBUG_SEVERITY_MEDIUM */
/* reuse GL_DEBUG_SEVERITY_LOW */
/* reuse GL_DEBUG_TYPE_MARKER */
/* reuse GL_DEBUG_TYPE_PUSH_GROUP */
/* reuse GL_DEBUG_TYPE_POP_GROUP */
/* reuse GL_DEBUG_SEVERITY_NOTIFICATION */
/* reuse GL_MAX_DEBUG_GROUP_STACK_DEPTH */
/* reuse GL_DEBUG_GROUP_STACK_DEPTH */
/* reuse GL_BUFFER */
/* reuse GL_SHADER */
/* reuse GL_PROGRAM */
/* reuse GL_QUERY */
/* reuse GL_PROGRAM_PIPELINE */
/* reuse GL_SAMPLER */
/* reuse GL_DISPLAY_LIST */
/* reuse GL_MAX_LABEL_LENGTH */
/* reuse GL_DEBUG_OUTPUT */
/* reuse GL_CONTEXT_FLAG_DEBUG_BIT */
/* reuse GL_STACK_UNDERFLOW */
/* reuse GL_STACK_OVERFLOW */
/* Reuse tokens from ARB_explicit_uniform_location */
/* reuse GL_MAX_UNIFORM_LOCATIONS */
/* Reuse tokens from ARB_framebuffer_no_attachments */
/* reuse GL_FRAMEBUFFER_DEFAULT_WIDTH */
/* reuse GL_FRAMEBUFFER_DEFAULT_HEIGHT */
/* reuse GL_FRAMEBUFFER_DEFAULT_LAYERS */
/* reuse GL_FRAMEBUFFER_DEFAULT_SAMPLES */
/* reuse GL_FRAMEBUFFER_DEFAULT_FIXED_SAMPLE_LOCATIONS */
/* reuse GL_MAX_FRAMEBUFFER_WIDTH */
/* reuse GL_MAX_FRAMEBUFFER_HEIGHT */
/* reuse GL_MAX_FRAMEBUFFER_LAYERS */
/* reuse GL_MAX_FRAMEBUFFER_SAMPLES */
/* Reuse tokens from ARB_internalformat_query2 */
/* reuse GL_INTERNALFORMAT_SUPPORTED */
/* reuse GL_INTERNALFORMAT_PREFERRED */
/* reuse GL_INTERNALFORMAT_RED_SIZE */
/* reuse GL_INTERNALFORMAT_GREEN_SIZE */
/* reuse GL_INTERNALFORMAT_BLUE_SIZE */
/* reuse GL_INTERNALFORMAT_ALPHA_SIZE */
/* reuse GL_INTERNALFORMAT_DEPTH_SIZE */
/* reuse GL_INTERNALFORMAT_STENCIL_SIZE */
/* reuse GL_INTERNALFORMAT_SHARED_SIZE */
/* reuse GL_INTERNALFORMAT_RED_TYPE */
/* reuse GL_INTERNALFORMAT_GREEN_TYPE */
/* reuse GL_INTERNALFORMAT_BLUE_TYPE */
/* reuse GL_INTERNALFORMAT_ALPHA_TYPE */
/* reuse GL_INTERNALFORMAT_DEPTH_TYPE */
/* reuse GL_INTERNALFORMAT_STENCIL_TYPE */
/* reuse GL_MAX_WIDTH */
/* reuse GL_MAX_HEIGHT */
/* reuse GL_MAX_DEPTH */
/* reuse GL_MAX_LAYERS */
/* reuse GL_MAX_COMBINED_DIMENSIONS */
/* reuse GL_COLOR_COMPONENTS */
/* reuse GL_DEPTH_COMPONENTS */
/* reuse GL_STENCIL_COMPONENTS */
/* reuse GL_COLOR_RENDERABLE */
/* reuse GL_DEPTH_RENDERABLE */
/* reuse GL_STENCIL_RENDERABLE */
/* reuse GL_FRAMEBUFFER_RENDERABLE */
/* reuse GL_FRAMEBUFFER_RENDERABLE_LAYERED */
/* reuse GL_FRAMEBUFFER_BLEND */
/* reuse GL_READ_PIXELS */
/* reuse GL_READ_PIXELS_FORMAT */
/* reuse GL_READ_PIXELS_TYPE */
/* reuse GL_TEXTURE_IMAGE_FORMAT */
/* reuse GL_TEXTURE_IMAGE_TYPE */
/* reuse GL_GET_TEXTURE_IMAGE_FORMAT */
/* reuse GL_GET_TEXTURE_IMAGE_TYPE */
/* reuse GL_MIPMAP */
/* reuse GL_MANUAL_GENERATE_MIPMAP */
/* reuse GL_AUTO_GENERATE_MIPMAP */
/* reuse GL_COLOR_ENCODING */
/* reuse GL_SRGB_READ */
/* reuse GL_SRGB_WRITE */
/* reuse GL_FILTER */
/* reuse GL_VERTEX_TEXTURE */
/* reuse GL_TESS_CONTROL_TEXTURE */
/* reuse GL_TESS_EVALUATION_TEXTURE */
/* reuse GL_GEOMETRY_TEXTURE */
/* reuse GL_FRAGMENT_TEXTURE */
/* reuse GL_COMPUTE_TEXTURE */
/* reuse GL_TEXTURE_SHADOW */
/* reuse GL_TEXTURE_GATHER */
/* reuse GL_TEXTURE_GATHER_SHADOW */
/* reuse GL_SHADER_IMAGE_LOAD */
/* reuse GL_SHADER_IMAGE_STORE */
/* reuse GL_SHADER_IMAGE_ATOMIC */
/* reuse GL_IMAGE_TEXEL_SIZE */
/* reuse GL_IMAGE_COMPATIBILITY_CLASS */
/* reuse GL_IMAGE_PIXEL_FORMAT */
/* reuse GL_IMAGE_PIXEL_TYPE */
/* reuse GL_SIMULTANEOUS_TEXTURE_AND_DEPTH_TEST */
/* reuse GL_SIMULTANEOUS_TEXTURE_AND_STENCIL_TEST */
/* reuse GL_SIMULTANEOUS_TEXTURE_AND_DEPTH_WRITE */
/* reuse GL_SIMULTANEOUS_TEXTURE_AND_STENCIL_WRITE */
/* reuse GL_TEXTURE_COMPRESSED_BLOCK_WIDTH */
/* reuse GL_TEXTURE_COMPRESSED_BLOCK_HEIGHT */
/* reuse GL_TEXTURE_COMPRESSED_BLOCK_SIZE */
/* reuse GL_CLEAR_BUFFER */
/* reuse GL_TEXTURE_VIEW */
/* reuse GL_VIEW_COMPATIBILITY_CLASS */
/* reuse GL_FULL_SUPPORT */
/* reuse GL_CAVEAT_SUPPORT */
/* reuse GL_IMAGE_CLASS_4_X_32 */
/* reuse GL_IMAGE_CLASS_2_X_32 */
/* reuse GL_IMAGE_CLASS_1_X_32 */
/* reuse GL_IMAGE_CLASS_4_X_16 */
/* reuse GL_IMAGE_CLASS_2_X_16 */
/* reuse GL_IMAGE_CLASS_1_X_16 */
/* reuse GL_IMAGE_CLASS_4_X_8 */
/* reuse GL_IMAGE_CLASS_2_X_8 */
/* reuse GL_IMAGE_CLASS_1_X_8 */
/* reuse GL_IMAGE_CLASS_11_11_10 */
/* reuse GL_IMAGE_CLASS_10_10_10_2 */
/* reuse GL_VIEW_CLASS_128_BITS */
/* reuse GL_VIEW_CLASS_96_BITS */
/* reuse GL_VIEW_CLASS_64_BITS */
/* reuse GL_VIEW_CLASS_48_BITS */
/* reuse GL_VIEW_CLASS_32_BITS */
/* reuse GL_VIEW_CLASS_24_BITS */
/* reuse GL_VIEW_CLASS_16_BITS */
/* reuse GL_VIEW_CLASS_8_BITS */
/* reuse GL_VIEW_CLASS_S3TC_DXT1_RGB */
/* reuse GL_VIEW_CLASS_S3TC_DXT1_RGBA */
/* reuse GL_VIEW_CLASS_S3TC_DXT3_RGBA */
/* reuse GL_VIEW_CLASS_S3TC_DXT5_RGBA */
/* reuse GL_VIEW_CLASS_RGTC1_RED */
/* reuse GL_VIEW_CLASS_RGTC2_RG */
/* reuse GL_VIEW_CLASS_BPTC_UNORM */
/* reuse GL_VIEW_CLASS_BPTC_FLOAT */
/* Reuse tokens from ARB_invalidate_subdata (none) */
/* Reuse tokens from ARB_multi_draw_indirect (none) */
/* Reuse tokens from ARB_program_interface_query */
/* reuse GL_UNIFORM */
/* reuse GL_UNIFORM_BLOCK */
/* reuse GL_PROGRAM_INPUT */
/* reuse GL_PROGRAM_OUTPUT */
/* reuse GL_BUFFER_VARIABLE */
/* reuse GL_SHADER_STORAGE_BLOCK */
/* reuse GL_VERTEX_SUBROUTINE */
/* reuse GL_TESS_CONTROL_SUBROUTINE */
/* reuse GL_TESS_EVALUATION_SUBROUTINE */
/* reuse GL_GEOMETRY_SUBROUTINE */
/* reuse GL_FRAGMENT_SUBROUTINE */
/* reuse GL_COMPUTE_SUBROUTINE */
/* reuse GL_VERTEX_SUBROUTINE_UNIFORM */
/* reuse GL_TESS_CONTROL_SUBROUTINE_UNIFORM */
/* reuse GL_TESS_EVALUATION_SUBROUTINE_UNIFORM */
/* reuse GL_GEOMETRY_SUBROUTINE_UNIFORM */
/* reuse GL_FRAGMENT_SUBROUTINE_UNIFORM */
/* reuse GL_COMPUTE_SUBROUTINE_UNIFORM */
/* reuse GL_TRANSFORM_FEEDBACK_VARYING */
/* reuse GL_ACTIVE_RESOURCES */
/* reuse GL_MAX_NAME_LENGTH */
/* reuse GL_MAX_NUM_ACTIVE_VARIABLES */
/* reuse GL_MAX_NUM_COMPATIBLE_SUBROUTINES */
/* reuse GL_NAME_LENGTH */
/* reuse GL_TYPE */
/* reuse GL_ARRAY_SIZE */
/* reuse GL_OFFSET */
/* reuse GL_BLOCK_INDEX */
/* reuse GL_ARRAY_STRIDE */
/* reuse GL_MATRIX_STRIDE */
/* reuse GL_IS_ROW_MAJOR */
/* reuse GL_ATOMIC_COUNTER_BUFFER_INDEX */
/* reuse GL_BUFFER_BINDING */
/* reuse GL_BUFFER_DATA_SIZE */
/* reuse GL_NUM_ACTIVE_VARIABLES */
/* reuse GL_ACTIVE_VARIABLES */
/* reuse GL_REFERENCED_BY_VERTEX_SHADER */
/* reuse GL_REFERENCED_BY_TESS_CONTROL_SHADER */
/* reuse GL_REFERENCED_BY_TESS_EVALUATION_SHADER */
/* reuse GL_REFERENCED_BY_GEOMETRY_SHADER */
/* reuse GL_REFERENCED_BY_FRAGMENT_SHADER */
/* reuse GL_REFERENCED_BY_COMPUTE_SHADER */
/* reuse GL_TOP_LEVEL_ARRAY_SIZE */
/* reuse GL_TOP_LEVEL_ARRAY_STRIDE */
/* reuse GL_LOCATION */
/* reuse GL_LOCATION_INDEX */
/* reuse GL_IS_PER_PATCH */
/* Reuse tokens from ARB_robust_buffer_access_behavior (none) */
/* Reuse tokens from ARB_shader_storage_buffer_object */
/* reuse GL_SHADER_STORAGE_BUFFER */
/* reuse GL_SHADER_STORAGE_BUFFER_BINDING */
/* reuse GL_SHADER_STORAGE_BUFFER_START */
/* reuse GL_SHADER_STORAGE_BUFFER_SIZE */
/* reuse GL_MAX_VERTEX_SHADER_STORAGE_BLOCKS */
/* reuse GL_MAX_GEOMETRY_SHADER_STORAGE_BLOCKS */
/* reuse GL_MAX_TESS_CONTROL_SHADER_STORAGE_BLOCKS */
/* reuse GL_MAX_TESS_EVALUATION_SHADER_STORAGE_BLOCKS */
/* reuse GL_MAX_FRAGMENT_SHADER_STORAGE_BLOCKS */
/* reuse GL_MAX_COMPUTE_SHADER_STORAGE_BLOCKS */
/* reuse GL_MAX_COMBINED_SHADER_STORAGE_BLOCKS */
/* reuse GL_MAX_SHADER_STORAGE_BUFFER_BINDINGS */
/* reuse GL_MAX_SHADER_STORAGE_BLOCK_SIZE */
/* reuse GL_SHADER_STORAGE_BUFFER_OFFSET_ALIGNMENT */
/* reuse GL_SHADER_STORAGE_BARRIER_BIT */
/* reuse GL_MAX_COMBINED_SHADER_OUTPUT_RESOURCES */
/* Reuse tokens from ARB_stencil_texturing */
/* reuse GL_DEPTH_STENCIL_TEXTURE_MODE */
/* Reuse tokens from ARB_texture_buffer_range */
/* reuse GL_TEXTURE_BUFFER_OFFSET */
/* reuse GL_TEXTURE_BUFFER_SIZE */
/* reuse GL_TEXTURE_BUFFER_OFFSET_ALIGNMENT */
/* Reuse tokens from ARB_texture_query_levels (none) */
/* Reuse tokens from ARB_texture_storage_multisample (none) */
/* Reuse tokens from ARB_texture_view */
/* reuse GL_TEXTURE_VIEW_MIN_LEVEL */
/* reuse GL_TEXTURE_VIEW_NUM_LEVELS */
/* reuse GL_TEXTURE_VIEW_MIN_LAYER */
/* reuse GL_TEXTURE_VIEW_NUM_LAYERS */
/* reuse GL_TEXTURE_IMMUTABLE_LEVELS */
/* Reuse tokens from ARB_vertex_attrib_binding */
/* reuse GL_VERTEX_ATTRIB_BINDING */
/* reuse GL_VERTEX_ATTRIB_RELATIVE_OFFSET */
/* reuse GL_VERTEX_BINDING_DIVISOR */
/* reuse GL_VERTEX_BINDING_OFFSET */
/* reuse GL_VERTEX_BINDING_STRIDE */
/* reuse GL_MAX_VERTEX_ATTRIB_RELATIVE_OFFSET */
/* reuse GL_MAX_VERTEX_ATTRIB_BINDINGS */
}

version (GL_ARB_multitexture) {} else {
enum GL_TEXTURE0_ARB                   = 0x84C0;
enum GL_TEXTURE1_ARB                   = 0x84C1;
enum GL_TEXTURE2_ARB                   = 0x84C2;
enum GL_TEXTURE3_ARB                   = 0x84C3;
enum GL_TEXTURE4_ARB                   = 0x84C4;
enum GL_TEXTURE5_ARB                   = 0x84C5;
enum GL_TEXTURE6_ARB                   = 0x84C6;
enum GL_TEXTURE7_ARB                   = 0x84C7;
enum GL_TEXTURE8_ARB                   = 0x84C8;
enum GL_TEXTURE9_ARB                   = 0x84C9;
enum GL_TEXTURE10_ARB                  = 0x84CA;
enum GL_TEXTURE11_ARB                  = 0x84CB;
enum GL_TEXTURE12_ARB                  = 0x84CC;
enum GL_TEXTURE13_ARB                  = 0x84CD;
enum GL_TEXTURE14_ARB                  = 0x84CE;
enum GL_TEXTURE15_ARB                  = 0x84CF;
enum GL_TEXTURE16_ARB                  = 0x84D0;
enum GL_TEXTURE17_ARB                  = 0x84D1;
enum GL_TEXTURE18_ARB                  = 0x84D2;
enum GL_TEXTURE19_ARB                  = 0x84D3;
enum GL_TEXTURE20_ARB                  = 0x84D4;
enum GL_TEXTURE21_ARB                  = 0x84D5;
enum GL_TEXTURE22_ARB                  = 0x84D6;
enum GL_TEXTURE23_ARB                  = 0x84D7;
enum GL_TEXTURE24_ARB                  = 0x84D8;
enum GL_TEXTURE25_ARB                  = 0x84D9;
enum GL_TEXTURE26_ARB                  = 0x84DA;
enum GL_TEXTURE27_ARB                  = 0x84DB;
enum GL_TEXTURE28_ARB                  = 0x84DC;
enum GL_TEXTURE29_ARB                  = 0x84DD;
enum GL_TEXTURE30_ARB                  = 0x84DE;
enum GL_TEXTURE31_ARB                  = 0x84DF;
enum GL_ACTIVE_TEXTURE_ARB             = 0x84E0;
enum GL_CLIENT_ACTIVE_TEXTURE_ARB      = 0x84E1;
enum GL_MAX_TEXTURE_UNITS_ARB          = 0x84E2;
}

version (GL_ARB_transpose_matrix) {} else {
enum GL_TRANSPOSE_MODELVIEW_MATRIX_ARB = 0x84E3;
enum GL_TRANSPOSE_PROJECTION_MATRIX_ARB = 0x84E4;
enum GL_TRANSPOSE_TEXTURE_MATRIX_ARB   = 0x84E5;
enum GL_TRANSPOSE_COLOR_MATRIX_ARB     = 0x84E6;
}

version (GL_ARB_multisample) {} else {
enum GL_MULTISAMPLE_ARB                = 0x809D;
enum GL_SAMPLE_ALPHA_TO_COVERAGE_ARB   = 0x809E;
enum GL_SAMPLE_ALPHA_TO_ONE_ARB        = 0x809F;
enum GL_SAMPLE_COVERAGE_ARB            = 0x80A0;
enum GL_SAMPLE_BUFFERS_ARB             = 0x80A8;
enum GL_SAMPLES_ARB                    = 0x80A9;
enum GL_SAMPLE_COVERAGE_VALUE_ARB      = 0x80AA;
enum GL_SAMPLE_COVERAGE_INVERT_ARB     = 0x80AB;
enum GL_MULTISAMPLE_BIT_ARB            = 0x20000000;
}

version (GL_ARB_texture_env_add) {} else {
}

version (GL_ARB_texture_cube_map) {} else {
enum GL_NORMAL_MAP_ARB                 = 0x8511;
enum GL_REFLECTION_MAP_ARB             = 0x8512;
enum GL_TEXTURE_CUBE_MAP_ARB           = 0x8513;
enum GL_TEXTURE_BINDING_CUBE_MAP_ARB   = 0x8514;
enum GL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB = 0x8515;
enum GL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB = 0x8516;
enum GL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB = 0x8517;
enum GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB = 0x8518;
enum GL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB = 0x8519;
enum GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB = 0x851A;
enum GL_PROXY_TEXTURE_CUBE_MAP_ARB     = 0x851B;
enum GL_MAX_CUBE_MAP_TEXTURE_SIZE_ARB  = 0x851C;
}

version (GL_ARB_texture_compression) {} else {
enum GL_COMPRESSED_ALPHA_ARB           = 0x84E9;
enum GL_COMPRESSED_LUMINANCE_ARB       = 0x84EA;
enum GL_COMPRESSED_LUMINANCE_ALPHA_ARB = 0x84EB;
enum GL_COMPRESSED_INTENSITY_ARB       = 0x84EC;
enum GL_COMPRESSED_RGB_ARB             = 0x84ED;
enum GL_COMPRESSED_RGBA_ARB            = 0x84EE;
enum GL_TEXTURE_COMPRESSION_HINT_ARB   = 0x84EF;
enum GL_TEXTURE_COMPRESSED_IMAGE_SIZE_ARB = 0x86A0;
enum GL_TEXTURE_COMPRESSED_ARB         = 0x86A1;
enum GL_NUM_COMPRESSED_TEXTURE_FORMATS_ARB = 0x86A2;
enum GL_COMPRESSED_TEXTURE_FORMATS_ARB = 0x86A3;
}

version (GL_ARB_texture_border_clamp) {} else {
enum GL_CLAMP_TO_BORDER_ARB            = 0x812D;
}

version (GL_ARB_point_parameters) {} else {
enum GL_POINT_SIZE_MIN_ARB             = 0x8126;
enum GL_POINT_SIZE_MAX_ARB             = 0x8127;
enum GL_POINT_FADE_THRESHOLD_SIZE_ARB  = 0x8128;
enum GL_POINT_DISTANCE_ATTENUATION_ARB = 0x8129;
}

version (GL_ARB_vertex_blend) {} else {
enum GL_MAX_VERTEX_UNITS_ARB           = 0x86A4;
enum GL_ACTIVE_VERTEX_UNITS_ARB        = 0x86A5;
enum GL_WEIGHT_SUM_UNITY_ARB           = 0x86A6;
enum GL_VERTEX_BLEND_ARB               = 0x86A7;
enum GL_CURRENT_WEIGHT_ARB             = 0x86A8;
enum GL_WEIGHT_ARRAY_TYPE_ARB          = 0x86A9;
enum GL_WEIGHT_ARRAY_STRIDE_ARB        = 0x86AA;
enum GL_WEIGHT_ARRAY_SIZE_ARB          = 0x86AB;
enum GL_WEIGHT_ARRAY_POINTER_ARB       = 0x86AC;
enum GL_WEIGHT_ARRAY_ARB               = 0x86AD;
enum GL_MODELVIEW0_ARB                 = 0x1700;
enum GL_MODELVIEW1_ARB                 = 0x850A;
enum GL_MODELVIEW2_ARB                 = 0x8722;
enum GL_MODELVIEW3_ARB                 = 0x8723;
enum GL_MODELVIEW4_ARB                 = 0x8724;
enum GL_MODELVIEW5_ARB                 = 0x8725;
enum GL_MODELVIEW6_ARB                 = 0x8726;
enum GL_MODELVIEW7_ARB                 = 0x8727;
enum GL_MODELVIEW8_ARB                 = 0x8728;
enum GL_MODELVIEW9_ARB                 = 0x8729;
enum GL_MODELVIEW10_ARB                = 0x872A;
enum GL_MODELVIEW11_ARB                = 0x872B;
enum GL_MODELVIEW12_ARB                = 0x872C;
enum GL_MODELVIEW13_ARB                = 0x872D;
enum GL_MODELVIEW14_ARB                = 0x872E;
enum GL_MODELVIEW15_ARB                = 0x872F;
enum GL_MODELVIEW16_ARB                = 0x8730;
enum GL_MODELVIEW17_ARB                = 0x8731;
enum GL_MODELVIEW18_ARB                = 0x8732;
enum GL_MODELVIEW19_ARB                = 0x8733;
enum GL_MODELVIEW20_ARB                = 0x8734;
enum GL_MODELVIEW21_ARB                = 0x8735;
enum GL_MODELVIEW22_ARB                = 0x8736;
enum GL_MODELVIEW23_ARB                = 0x8737;
enum GL_MODELVIEW24_ARB                = 0x8738;
enum GL_MODELVIEW25_ARB                = 0x8739;
enum GL_MODELVIEW26_ARB                = 0x873A;
enum GL_MODELVIEW27_ARB                = 0x873B;
enum GL_MODELVIEW28_ARB                = 0x873C;
enum GL_MODELVIEW29_ARB                = 0x873D;
enum GL_MODELVIEW30_ARB                = 0x873E;
enum GL_MODELVIEW31_ARB                = 0x873F;
}

version (GL_ARB_matrix_palette) {} else {
enum GL_MATRIX_PALETTE_ARB             = 0x8840;
enum GL_MAX_MATRIX_PALETTE_STACK_DEPTH_ARB = 0x8841;
enum GL_MAX_PALETTE_MATRICES_ARB       = 0x8842;
enum GL_CURRENT_PALETTE_MATRIX_ARB     = 0x8843;
enum GL_MATRIX_INDEX_ARRAY_ARB         = 0x8844;
enum GL_CURRENT_MATRIX_INDEX_ARB       = 0x8845;
enum GL_MATRIX_INDEX_ARRAY_SIZE_ARB    = 0x8846;
enum GL_MATRIX_INDEX_ARRAY_TYPE_ARB    = 0x8847;
enum GL_MATRIX_INDEX_ARRAY_STRIDE_ARB  = 0x8848;
enum GL_MATRIX_INDEX_ARRAY_POINTER_ARB = 0x8849;
}

version (GL_ARB_texture_env_combine) {} else {
enum GL_COMBINE_ARB                    = 0x8570;
enum GL_COMBINE_RGB_ARB                = 0x8571;
enum GL_COMBINE_ALPHA_ARB              = 0x8572;
enum GL_SOURCE0_RGB_ARB                = 0x8580;
enum GL_SOURCE1_RGB_ARB                = 0x8581;
enum GL_SOURCE2_RGB_ARB                = 0x8582;
enum GL_SOURCE0_ALPHA_ARB              = 0x8588;
enum GL_SOURCE1_ALPHA_ARB              = 0x8589;
enum GL_SOURCE2_ALPHA_ARB              = 0x858A;
enum GL_OPERAND0_RGB_ARB               = 0x8590;
enum GL_OPERAND1_RGB_ARB               = 0x8591;
enum GL_OPERAND2_RGB_ARB               = 0x8592;
enum GL_OPERAND0_ALPHA_ARB             = 0x8598;
enum GL_OPERAND1_ALPHA_ARB             = 0x8599;
enum GL_OPERAND2_ALPHA_ARB             = 0x859A;
enum GL_RGB_SCALE_ARB                  = 0x8573;
enum GL_ADD_SIGNED_ARB                 = 0x8574;
enum GL_INTERPOLATE_ARB                = 0x8575;
enum GL_SUBTRACT_ARB                   = 0x84E7;
enum GL_CONSTANT_ARB                   = 0x8576;
enum GL_PRIMARY_COLOR_ARB              = 0x8577;
enum GL_PREVIOUS_ARB                   = 0x8578;
}

version (GL_ARB_texture_env_crossbar) {} else {
}

version (GL_ARB_texture_env_dot3) {} else {
enum GL_DOT3_RGB_ARB                   = 0x86AE;
enum GL_DOT3_RGBA_ARB                  = 0x86AF;
}

version (GL_ARB_texture_mirrored_repeat) {} else {
enum GL_MIRRORED_REPEAT_ARB            = 0x8370;
}

version (GL_ARB_depth_texture) {} else {
enum GL_DEPTH_COMPONENT16_ARB          = 0x81A5;
enum GL_DEPTH_COMPONENT24_ARB          = 0x81A6;
enum GL_DEPTH_COMPONENT32_ARB          = 0x81A7;
enum GL_TEXTURE_DEPTH_SIZE_ARB         = 0x884A;
enum GL_DEPTH_TEXTURE_MODE_ARB         = 0x884B;
}

version (GL_ARB_shadow) {} else {
enum GL_TEXTURE_COMPARE_MODE_ARB       = 0x884C;
enum GL_TEXTURE_COMPARE_FUNC_ARB       = 0x884D;
enum GL_COMPARE_R_TO_TEXTURE_ARB       = 0x884E;
}

version (GL_ARB_shadow_ambient) {} else {
enum GL_TEXTURE_COMPARE_FAIL_VALUE_ARB = 0x80BF;
}

version (GL_ARB_window_pos) {} else {
}

version (GL_ARB_vertex_program) {} else {
enum GL_COLOR_SUM_ARB                  = 0x8458;
enum GL_VERTEX_PROGRAM_ARB             = 0x8620;
enum GL_VERTEX_ATTRIB_ARRAY_ENABLED_ARB = 0x8622;
enum GL_VERTEX_ATTRIB_ARRAY_SIZE_ARB   = 0x8623;
enum GL_VERTEX_ATTRIB_ARRAY_STRIDE_ARB = 0x8624;
enum GL_VERTEX_ATTRIB_ARRAY_TYPE_ARB   = 0x8625;
enum GL_CURRENT_VERTEX_ATTRIB_ARB      = 0x8626;
enum GL_PROGRAM_LENGTH_ARB             = 0x8627;
enum GL_PROGRAM_STRING_ARB             = 0x8628;
enum GL_MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB = 0x862E;
enum GL_MAX_PROGRAM_MATRICES_ARB       = 0x862F;
enum GL_CURRENT_MATRIX_STACK_DEPTH_ARB = 0x8640;
enum GL_CURRENT_MATRIX_ARB             = 0x8641;
enum GL_VERTEX_PROGRAM_POINT_SIZE_ARB  = 0x8642;
enum GL_VERTEX_PROGRAM_TWO_SIDE_ARB    = 0x8643;
enum GL_VERTEX_ATTRIB_ARRAY_POINTER_ARB = 0x8645;
enum GL_PROGRAM_ERROR_POSITION_ARB     = 0x864B;
enum GL_PROGRAM_BINDING_ARB            = 0x8677;
enum GL_MAX_VERTEX_ATTRIBS_ARB         = 0x8869;
enum GL_VERTEX_ATTRIB_ARRAY_NORMALIZED_ARB = 0x886A;
enum GL_PROGRAM_ERROR_STRING_ARB       = 0x8874;
enum GL_PROGRAM_FORMAT_ASCII_ARB       = 0x8875;
enum GL_PROGRAM_FORMAT_ARB             = 0x8876;
enum GL_PROGRAM_INSTRUCTIONS_ARB       = 0x88A0;
enum GL_MAX_PROGRAM_INSTRUCTIONS_ARB   = 0x88A1;
enum GL_PROGRAM_NATIVE_INSTRUCTIONS_ARB = 0x88A2;
enum GL_MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB = 0x88A3;
enum GL_PROGRAM_TEMPORARIES_ARB        = 0x88A4;
enum GL_MAX_PROGRAM_TEMPORARIES_ARB    = 0x88A5;
enum GL_PROGRAM_NATIVE_TEMPORARIES_ARB = 0x88A6;
enum GL_MAX_PROGRAM_NATIVE_TEMPORARIES_ARB = 0x88A7;
enum GL_PROGRAM_PARAMETERS_ARB         = 0x88A8;
enum GL_MAX_PROGRAM_PARAMETERS_ARB     = 0x88A9;
enum GL_PROGRAM_NATIVE_PARAMETERS_ARB  = 0x88AA;
enum GL_MAX_PROGRAM_NATIVE_PARAMETERS_ARB = 0x88AB;
enum GL_PROGRAM_ATTRIBS_ARB            = 0x88AC;
enum GL_MAX_PROGRAM_ATTRIBS_ARB        = 0x88AD;
enum GL_PROGRAM_NATIVE_ATTRIBS_ARB     = 0x88AE;
enum GL_MAX_PROGRAM_NATIVE_ATTRIBS_ARB = 0x88AF;
enum GL_PROGRAM_ADDRESS_REGISTERS_ARB  = 0x88B0;
enum GL_MAX_PROGRAM_ADDRESS_REGISTERS_ARB = 0x88B1;
enum GL_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB = 0x88B2;
enum GL_MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB = 0x88B3;
enum GL_MAX_PROGRAM_LOCAL_PARAMETERS_ARB = 0x88B4;
enum GL_MAX_PROGRAM_ENV_PARAMETERS_ARB = 0x88B5;
enum GL_PROGRAM_UNDER_NATIVE_LIMITS_ARB = 0x88B6;
enum GL_TRANSPOSE_CURRENT_MATRIX_ARB   = 0x88B7;
enum GL_MATRIX0_ARB                    = 0x88C0;
enum GL_MATRIX1_ARB                    = 0x88C1;
enum GL_MATRIX2_ARB                    = 0x88C2;
enum GL_MATRIX3_ARB                    = 0x88C3;
enum GL_MATRIX4_ARB                    = 0x88C4;
enum GL_MATRIX5_ARB                    = 0x88C5;
enum GL_MATRIX6_ARB                    = 0x88C6;
enum GL_MATRIX7_ARB                    = 0x88C7;
enum GL_MATRIX8_ARB                    = 0x88C8;
enum GL_MATRIX9_ARB                    = 0x88C9;
enum GL_MATRIX10_ARB                   = 0x88CA;
enum GL_MATRIX11_ARB                   = 0x88CB;
enum GL_MATRIX12_ARB                   = 0x88CC;
enum GL_MATRIX13_ARB                   = 0x88CD;
enum GL_MATRIX14_ARB                   = 0x88CE;
enum GL_MATRIX15_ARB                   = 0x88CF;
enum GL_MATRIX16_ARB                   = 0x88D0;
enum GL_MATRIX17_ARB                   = 0x88D1;
enum GL_MATRIX18_ARB                   = 0x88D2;
enum GL_MATRIX19_ARB                   = 0x88D3;
enum GL_MATRIX20_ARB                   = 0x88D4;
enum GL_MATRIX21_ARB                   = 0x88D5;
enum GL_MATRIX22_ARB                   = 0x88D6;
enum GL_MATRIX23_ARB                   = 0x88D7;
enum GL_MATRIX24_ARB                   = 0x88D8;
enum GL_MATRIX25_ARB                   = 0x88D9;
enum GL_MATRIX26_ARB                   = 0x88DA;
enum GL_MATRIX27_ARB                   = 0x88DB;
enum GL_MATRIX28_ARB                   = 0x88DC;
enum GL_MATRIX29_ARB                   = 0x88DD;
enum GL_MATRIX30_ARB                   = 0x88DE;
enum GL_MATRIX31_ARB                   = 0x88DF;
}

version (GL_ARB_fragment_program) {} else {
enum GL_FRAGMENT_PROGRAM_ARB           = 0x8804;
enum GL_PROGRAM_ALU_INSTRUCTIONS_ARB   = 0x8805;
enum GL_PROGRAM_TEX_INSTRUCTIONS_ARB   = 0x8806;
enum GL_PROGRAM_TEX_INDIRECTIONS_ARB   = 0x8807;
enum GL_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB = 0x8808;
enum GL_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB = 0x8809;
enum GL_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB = 0x880A;
enum GL_MAX_PROGRAM_ALU_INSTRUCTIONS_ARB = 0x880B;
enum GL_MAX_PROGRAM_TEX_INSTRUCTIONS_ARB = 0x880C;
enum GL_MAX_PROGRAM_TEX_INDIRECTIONS_ARB = 0x880D;
enum GL_MAX_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB = 0x880E;
enum GL_MAX_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB = 0x880F;
enum GL_MAX_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB = 0x8810;
enum GL_MAX_TEXTURE_COORDS_ARB         = 0x8871;
enum GL_MAX_TEXTURE_IMAGE_UNITS_ARB    = 0x8872;
}

version (GL_ARB_vertex_buffer_object) {} else {
enum GL_BUFFER_SIZE_ARB                = 0x8764;
enum GL_BUFFER_USAGE_ARB               = 0x8765;
enum GL_ARRAY_BUFFER_ARB               = 0x8892;
enum GL_ELEMENT_ARRAY_BUFFER_ARB       = 0x8893;
enum GL_ARRAY_BUFFER_BINDING_ARB       = 0x8894;
enum GL_ELEMENT_ARRAY_BUFFER_BINDING_ARB = 0x8895;
enum GL_VERTEX_ARRAY_BUFFER_BINDING_ARB = 0x8896;
enum GL_NORMAL_ARRAY_BUFFER_BINDING_ARB = 0x8897;
enum GL_COLOR_ARRAY_BUFFER_BINDING_ARB = 0x8898;
enum GL_INDEX_ARRAY_BUFFER_BINDING_ARB = 0x8899;
enum GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING_ARB = 0x889A;
enum GL_EDGE_FLAG_ARRAY_BUFFER_BINDING_ARB = 0x889B;
enum GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING_ARB = 0x889C;
enum GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING_ARB = 0x889D;
enum GL_WEIGHT_ARRAY_BUFFER_BINDING_ARB = 0x889E;
enum GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING_ARB = 0x889F;
enum GL_READ_ONLY_ARB                  = 0x88B8;
enum GL_WRITE_ONLY_ARB                 = 0x88B9;
enum GL_READ_WRITE_ARB                 = 0x88BA;
enum GL_BUFFER_ACCESS_ARB              = 0x88BB;
enum GL_BUFFER_MAPPED_ARB              = 0x88BC;
enum GL_BUFFER_MAP_POINTER_ARB         = 0x88BD;
enum GL_STREAM_DRAW_ARB                = 0x88E0;
enum GL_STREAM_READ_ARB                = 0x88E1;
enum GL_STREAM_COPY_ARB                = 0x88E2;
enum GL_STATIC_DRAW_ARB                = 0x88E4;
enum GL_STATIC_READ_ARB                = 0x88E5;
enum GL_STATIC_COPY_ARB                = 0x88E6;
enum GL_DYNAMIC_DRAW_ARB               = 0x88E8;
enum GL_DYNAMIC_READ_ARB               = 0x88E9;
enum GL_DYNAMIC_COPY_ARB               = 0x88EA;
}

version (GL_ARB_occlusion_query) {} else {
enum GL_QUERY_COUNTER_BITS_ARB         = 0x8864;
enum GL_CURRENT_QUERY_ARB              = 0x8865;
enum GL_QUERY_RESULT_ARB               = 0x8866;
enum GL_QUERY_RESULT_AVAILABLE_ARB     = 0x8867;
enum GL_SAMPLES_PASSED_ARB             = 0x8914;
}

version (GL_ARB_shader_objects) {} else {
enum GL_PROGRAM_OBJECT_ARB             = 0x8B40;
enum GL_SHADER_OBJECT_ARB              = 0x8B48;
enum GL_OBJECT_TYPE_ARB                = 0x8B4E;
enum GL_OBJECT_SUBTYPE_ARB             = 0x8B4F;
enum GL_FLOAT_VEC2_ARB                 = 0x8B50;
enum GL_FLOAT_VEC3_ARB                 = 0x8B51;
enum GL_FLOAT_VEC4_ARB                 = 0x8B52;
enum GL_INT_VEC2_ARB                   = 0x8B53;
enum GL_INT_VEC3_ARB                   = 0x8B54;
enum GL_INT_VEC4_ARB                   = 0x8B55;
enum GL_BOOL_ARB                       = 0x8B56;
enum GL_BOOL_VEC2_ARB                  = 0x8B57;
enum GL_BOOL_VEC3_ARB                  = 0x8B58;
enum GL_BOOL_VEC4_ARB                  = 0x8B59;
enum GL_FLOAT_MAT2_ARB                 = 0x8B5A;
enum GL_FLOAT_MAT3_ARB                 = 0x8B5B;
enum GL_FLOAT_MAT4_ARB                 = 0x8B5C;
enum GL_SAMPLER_1D_ARB                 = 0x8B5D;
enum GL_SAMPLER_2D_ARB                 = 0x8B5E;
enum GL_SAMPLER_3D_ARB                 = 0x8B5F;
enum GL_SAMPLER_CUBE_ARB               = 0x8B60;
enum GL_SAMPLER_1D_SHADOW_ARB          = 0x8B61;
enum GL_SAMPLER_2D_SHADOW_ARB          = 0x8B62;
enum GL_SAMPLER_2D_RECT_ARB            = 0x8B63;
enum GL_SAMPLER_2D_RECT_SHADOW_ARB     = 0x8B64;
enum GL_OBJECT_DELETE_STATUS_ARB       = 0x8B80;
enum GL_OBJECT_COMPILE_STATUS_ARB      = 0x8B81;
enum GL_OBJECT_LINK_STATUS_ARB         = 0x8B82;
enum GL_OBJECT_VALIDATE_STATUS_ARB     = 0x8B83;
enum GL_OBJECT_INFO_LOG_LENGTH_ARB     = 0x8B84;
enum GL_OBJECT_ATTACHED_OBJECTS_ARB    = 0x8B85;
enum GL_OBJECT_ACTIVE_UNIFORMS_ARB     = 0x8B86;
enum GL_OBJECT_ACTIVE_UNIFORM_MAX_LENGTH_ARB = 0x8B87;
enum GL_OBJECT_SHADER_SOURCE_LENGTH_ARB = 0x8B88;
}

version (GL_ARB_vertex_shader) {} else {
enum GL_VERTEX_SHADER_ARB              = 0x8B31;
enum GL_MAX_VERTEX_UNIFORM_COMPONENTS_ARB = 0x8B4A;
enum GL_MAX_VARYING_FLOATS_ARB         = 0x8B4B;
enum GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB = 0x8B4C;
enum GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS_ARB = 0x8B4D;
enum GL_OBJECT_ACTIVE_ATTRIBUTES_ARB   = 0x8B89;
enum GL_OBJECT_ACTIVE_ATTRIBUTE_MAX_LENGTH_ARB = 0x8B8A;
}

version (GL_ARB_fragment_shader) {} else {
enum GL_FRAGMENT_SHADER_ARB            = 0x8B30;
enum GL_MAX_FRAGMENT_UNIFORM_COMPONENTS_ARB = 0x8B49;
enum GL_FRAGMENT_SHADER_DERIVATIVE_HINT_ARB = 0x8B8B;
}

version (GL_ARB_shading_language_100) {} else {
enum GL_SHADING_LANGUAGE_VERSION_ARB   = 0x8B8C;
}

version (GL_ARB_texture_non_power_of_two) {} else {
}

version (GL_ARB_point_sprite) {} else {
enum GL_POINT_SPRITE_ARB               = 0x8861;
enum GL_COORD_REPLACE_ARB              = 0x8862;
}

version (GL_ARB_fragment_program_shadow) {} else {
}

version (GL_ARB_draw_buffers) {} else {
enum GL_MAX_DRAW_BUFFERS_ARB           = 0x8824;
enum GL_DRAW_BUFFER0_ARB               = 0x8825;
enum GL_DRAW_BUFFER1_ARB               = 0x8826;
enum GL_DRAW_BUFFER2_ARB               = 0x8827;
enum GL_DRAW_BUFFER3_ARB               = 0x8828;
enum GL_DRAW_BUFFER4_ARB               = 0x8829;
enum GL_DRAW_BUFFER5_ARB               = 0x882A;
enum GL_DRAW_BUFFER6_ARB               = 0x882B;
enum GL_DRAW_BUFFER7_ARB               = 0x882C;
enum GL_DRAW_BUFFER8_ARB               = 0x882D;
enum GL_DRAW_BUFFER9_ARB               = 0x882E;
enum GL_DRAW_BUFFER10_ARB              = 0x882F;
enum GL_DRAW_BUFFER11_ARB              = 0x8830;
enum GL_DRAW_BUFFER12_ARB              = 0x8831;
enum GL_DRAW_BUFFER13_ARB              = 0x8832;
enum GL_DRAW_BUFFER14_ARB              = 0x8833;
enum GL_DRAW_BUFFER15_ARB              = 0x8834;
}

version (GL_ARB_texture_rectangle) {} else {
enum GL_TEXTURE_RECTANGLE_ARB          = 0x84F5;
enum GL_TEXTURE_BINDING_RECTANGLE_ARB  = 0x84F6;
enum GL_PROXY_TEXTURE_RECTANGLE_ARB    = 0x84F7;
enum GL_MAX_RECTANGLE_TEXTURE_SIZE_ARB = 0x84F8;
}

version (GL_ARB_color_buffer_float) {} else {
enum GL_RGBA_FLOAT_MODE_ARB            = 0x8820;
enum GL_CLAMP_VERTEX_COLOR_ARB         = 0x891A;
enum GL_CLAMP_FRAGMENT_COLOR_ARB       = 0x891B;
enum GL_CLAMP_READ_COLOR_ARB           = 0x891C;
enum GL_FIXED_ONLY_ARB                 = 0x891D;
}

version (GL_ARB_half_float_pixel) {} else {
enum GL_HALF_FLOAT_ARB                 = 0x140B;
}

version (GL_ARB_texture_float) {} else {
enum GL_TEXTURE_RED_TYPE_ARB           = 0x8C10;
enum GL_TEXTURE_GREEN_TYPE_ARB         = 0x8C11;
enum GL_TEXTURE_BLUE_TYPE_ARB          = 0x8C12;
enum GL_TEXTURE_ALPHA_TYPE_ARB         = 0x8C13;
enum GL_TEXTURE_LUMINANCE_TYPE_ARB     = 0x8C14;
enum GL_TEXTURE_INTENSITY_TYPE_ARB     = 0x8C15;
enum GL_TEXTURE_DEPTH_TYPE_ARB         = 0x8C16;
enum GL_UNSIGNED_NORMALIZED_ARB        = 0x8C17;
enum GL_RGBA32F_ARB                    = 0x8814;
enum GL_RGB32F_ARB                     = 0x8815;
enum GL_ALPHA32F_ARB                   = 0x8816;
enum GL_INTENSITY32F_ARB               = 0x8817;
enum GL_LUMINANCE32F_ARB               = 0x8818;
enum GL_LUMINANCE_ALPHA32F_ARB         = 0x8819;
enum GL_RGBA16F_ARB                    = 0x881A;
enum GL_RGB16F_ARB                     = 0x881B;
enum GL_ALPHA16F_ARB                   = 0x881C;
enum GL_INTENSITY16F_ARB               = 0x881D;
enum GL_LUMINANCE16F_ARB               = 0x881E;
enum GL_LUMINANCE_ALPHA16F_ARB         = 0x881F;
}

version (GL_ARB_pixel_buffer_object) {} else {
enum GL_PIXEL_PACK_BUFFER_ARB          = 0x88EB;
enum GL_PIXEL_UNPACK_BUFFER_ARB        = 0x88EC;
enum GL_PIXEL_PACK_BUFFER_BINDING_ARB  = 0x88ED;
enum GL_PIXEL_UNPACK_BUFFER_BINDING_ARB = 0x88EF;
}

version (GL_ARB_depth_buffer_float) {} else {
enum GL_DEPTH_COMPONENT32F             = 0x8CAC;
enum GL_DEPTH32F_STENCIL8              = 0x8CAD;
enum GL_FLOAT_32_UNSIGNED_INT_24_8_REV = 0x8DAD;
}

version (GL_ARB_draw_instanced) {} else {
}

version (GL_ARB_framebuffer_object) {} else {
enum GL_INVALID_FRAMEBUFFER_OPERATION  = 0x0506;
enum GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 0x8210;
enum GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 0x8211;
enum GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE = 0x8212;
enum GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 0x8213;
enum GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 0x8214;
enum GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 0x8215;
enum GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 0x8216;
enum GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 0x8217;
enum GL_FRAMEBUFFER_DEFAULT            = 0x8218;
enum GL_FRAMEBUFFER_UNDEFINED          = 0x8219;
enum GL_DEPTH_STENCIL_ATTACHMENT       = 0x821A;
enum GL_MAX_RENDERBUFFER_SIZE          = 0x84E8;
enum GL_DEPTH_STENCIL                  = 0x84F9;
enum GL_UNSIGNED_INT_24_8              = 0x84FA;
enum GL_DEPTH24_STENCIL8               = 0x88F0;
enum GL_TEXTURE_STENCIL_SIZE           = 0x88F1;
enum GL_TEXTURE_RED_TYPE               = 0x8C10;
enum GL_TEXTURE_GREEN_TYPE             = 0x8C11;
enum GL_TEXTURE_BLUE_TYPE              = 0x8C12;
enum GL_TEXTURE_ALPHA_TYPE             = 0x8C13;
enum GL_TEXTURE_DEPTH_TYPE             = 0x8C16;
enum GL_UNSIGNED_NORMALIZED            = 0x8C17;
enum GL_FRAMEBUFFER_BINDING            = 0x8CA6;
enum GL_DRAW_FRAMEBUFFER_BINDING       = GL_FRAMEBUFFER_BINDING;
enum GL_RENDERBUFFER_BINDING           = 0x8CA7;
enum GL_READ_FRAMEBUFFER               = 0x8CA8;
enum GL_DRAW_FRAMEBUFFER               = 0x8CA9;
enum GL_READ_FRAMEBUFFER_BINDING       = 0x8CAA;
enum GL_RENDERBUFFER_SAMPLES           = 0x8CAB;
enum GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0;
enum GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1;
enum GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2;
enum GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3;
enum GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4;
enum GL_FRAMEBUFFER_COMPLETE           = 0x8CD5;
enum GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6;
enum GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7;
enum GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER = 0x8CDB;
enum GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER = 0x8CDC;
enum GL_FRAMEBUFFER_UNSUPPORTED        = 0x8CDD;
enum GL_MAX_COLOR_ATTACHMENTS          = 0x8CDF;
enum GL_COLOR_ATTACHMENT0              = 0x8CE0;
enum GL_COLOR_ATTACHMENT1              = 0x8CE1;
enum GL_COLOR_ATTACHMENT2              = 0x8CE2;
enum GL_COLOR_ATTACHMENT3              = 0x8CE3;
enum GL_COLOR_ATTACHMENT4              = 0x8CE4;
enum GL_COLOR_ATTACHMENT5              = 0x8CE5;
enum GL_COLOR_ATTACHMENT6              = 0x8CE6;
enum GL_COLOR_ATTACHMENT7              = 0x8CE7;
enum GL_COLOR_ATTACHMENT8              = 0x8CE8;
enum GL_COLOR_ATTACHMENT9              = 0x8CE9;
enum GL_COLOR_ATTACHMENT10             = 0x8CEA;
enum GL_COLOR_ATTACHMENT11             = 0x8CEB;
enum GL_COLOR_ATTACHMENT12             = 0x8CEC;
enum GL_COLOR_ATTACHMENT13             = 0x8CED;
enum GL_COLOR_ATTACHMENT14             = 0x8CEE;
enum GL_COLOR_ATTACHMENT15             = 0x8CEF;
enum GL_DEPTH_ATTACHMENT               = 0x8D00;
enum GL_STENCIL_ATTACHMENT             = 0x8D20;
enum GL_FRAMEBUFFER                    = 0x8D40;
enum GL_RENDERBUFFER                   = 0x8D41;
enum GL_RENDERBUFFER_WIDTH             = 0x8D42;
enum GL_RENDERBUFFER_HEIGHT            = 0x8D43;
enum GL_RENDERBUFFER_INTERNAL_FORMAT   = 0x8D44;
enum GL_STENCIL_INDEX1                 = 0x8D46;
enum GL_STENCIL_INDEX4                 = 0x8D47;
enum GL_STENCIL_INDEX8                 = 0x8D48;
enum GL_STENCIL_INDEX16                = 0x8D49;
enum GL_RENDERBUFFER_RED_SIZE          = 0x8D50;
enum GL_RENDERBUFFER_GREEN_SIZE        = 0x8D51;
enum GL_RENDERBUFFER_BLUE_SIZE         = 0x8D52;
enum GL_RENDERBUFFER_ALPHA_SIZE        = 0x8D53;
enum GL_RENDERBUFFER_DEPTH_SIZE        = 0x8D54;
enum GL_RENDERBUFFER_STENCIL_SIZE      = 0x8D55;
enum GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 0x8D56;
enum GL_MAX_SAMPLES                    = 0x8D57;
enum GL_INDEX                          = 0x8222;
enum GL_TEXTURE_LUMINANCE_TYPE         = 0x8C14;
enum GL_TEXTURE_INTENSITY_TYPE         = 0x8C15;
}

version (GL_ARB_framebuffer_sRGB) {} else {
enum GL_FRAMEBUFFER_SRGB               = 0x8DB9;
}

version (GL_ARB_geometry_shader4) {} else {
enum GL_LINES_ADJACENCY_ARB            = 0x000A;
enum GL_LINE_STRIP_ADJACENCY_ARB       = 0x000B;
enum GL_TRIANGLES_ADJACENCY_ARB        = 0x000C;
enum GL_TRIANGLE_STRIP_ADJACENCY_ARB   = 0x000D;
enum GL_PROGRAM_POINT_SIZE_ARB         = 0x8642;
enum GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_ARB = 0x8C29;
enum GL_FRAMEBUFFER_ATTACHMENT_LAYERED_ARB = 0x8DA7;
enum GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_ARB = 0x8DA8;
enum GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_ARB = 0x8DA9;
enum GL_GEOMETRY_SHADER_ARB            = 0x8DD9;
enum GL_GEOMETRY_VERTICES_OUT_ARB      = 0x8DDA;
enum GL_GEOMETRY_INPUT_TYPE_ARB        = 0x8DDB;
enum GL_GEOMETRY_OUTPUT_TYPE_ARB       = 0x8DDC;
enum GL_MAX_GEOMETRY_VARYING_COMPONENTS_ARB = 0x8DDD;
enum GL_MAX_VERTEX_VARYING_COMPONENTS_ARB = 0x8DDE;
enum GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_ARB = 0x8DDF;
enum GL_MAX_GEOMETRY_OUTPUT_VERTICES_ARB = 0x8DE0;
enum GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_ARB = 0x8DE1;
/* reuse GL_MAX_VARYING_COMPONENTS */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER */
}

version (GL_ARB_half_float_vertex) {} else {
enum GL_HALF_FLOAT                     = 0x140B;
}

version (GL_ARB_instanced_arrays) {} else {
enum GL_VERTEX_ATTRIB_ARRAY_DIVISOR_ARB = 0x88FE;
}

version (GL_ARB_map_buffer_range) {} else {
enum GL_MAP_READ_BIT                   = 0x0001;
enum GL_MAP_WRITE_BIT                  = 0x0002;
enum GL_MAP_INVALIDATE_RANGE_BIT       = 0x0004;
enum GL_MAP_INVALIDATE_BUFFER_BIT      = 0x0008;
enum GL_MAP_FLUSH_EXPLICIT_BIT         = 0x0010;
enum GL_MAP_UNSYNCHRONIZED_BIT         = 0x0020;
}

version (GL_ARB_texture_buffer_object) {} else {
enum GL_TEXTURE_BUFFER_ARB             = 0x8C2A;
enum GL_MAX_TEXTURE_BUFFER_SIZE_ARB    = 0x8C2B;
enum GL_TEXTURE_BINDING_BUFFER_ARB     = 0x8C2C;
enum GL_TEXTURE_BUFFER_DATA_STORE_BINDING_ARB = 0x8C2D;
enum GL_TEXTURE_BUFFER_FORMAT_ARB      = 0x8C2E;
}

version (GL_ARB_texture_compression_rgtc) {} else {
enum GL_COMPRESSED_RED_RGTC1           = 0x8DBB;
enum GL_COMPRESSED_SIGNED_RED_RGTC1    = 0x8DBC;
enum GL_COMPRESSED_RG_RGTC2            = 0x8DBD;
enum GL_COMPRESSED_SIGNED_RG_RGTC2     = 0x8DBE;
}

version (GL_ARB_texture_rg) {} else {
enum GL_RG                             = 0x8227;
enum GL_RG_INTEGER                     = 0x8228;
enum GL_R8                             = 0x8229;
enum GL_R16                            = 0x822A;
enum GL_RG8                            = 0x822B;
enum GL_RG16                           = 0x822C;
enum GL_R16F                           = 0x822D;
enum GL_R32F                           = 0x822E;
enum GL_RG16F                          = 0x822F;
enum GL_RG32F                          = 0x8230;
enum GL_R8I                            = 0x8231;
enum GL_R8UI                           = 0x8232;
enum GL_R16I                           = 0x8233;
enum GL_R16UI                          = 0x8234;
enum GL_R32I                           = 0x8235;
enum GL_R32UI                          = 0x8236;
enum GL_RG8I                           = 0x8237;
enum GL_RG8UI                          = 0x8238;
enum GL_RG16I                          = 0x8239;
enum GL_RG16UI                         = 0x823A;
enum GL_RG32I                          = 0x823B;
enum GL_RG32UI                         = 0x823C;
}

version (GL_ARB_vertex_array_object) {} else {
enum GL_VERTEX_ARRAY_BINDING           = 0x85B5;
}

version (GL_ARB_uniform_buffer_object) {} else {
enum GL_UNIFORM_BUFFER                 = 0x8A11;
enum GL_UNIFORM_BUFFER_BINDING         = 0x8A28;
enum GL_UNIFORM_BUFFER_START           = 0x8A29;
enum GL_UNIFORM_BUFFER_SIZE            = 0x8A2A;
enum GL_MAX_VERTEX_UNIFORM_BLOCKS      = 0x8A2B;
enum GL_MAX_GEOMETRY_UNIFORM_BLOCKS    = 0x8A2C;
enum GL_MAX_FRAGMENT_UNIFORM_BLOCKS    = 0x8A2D;
enum GL_MAX_COMBINED_UNIFORM_BLOCKS    = 0x8A2E;
enum GL_MAX_UNIFORM_BUFFER_BINDINGS    = 0x8A2F;
enum GL_MAX_UNIFORM_BLOCK_SIZE         = 0x8A30;
enum GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 0x8A31;
enum GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS = 0x8A32;
enum GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 0x8A33;
enum GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT = 0x8A34;
enum GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = 0x8A35;
enum GL_ACTIVE_UNIFORM_BLOCKS          = 0x8A36;
enum GL_UNIFORM_TYPE                   = 0x8A37;
enum GL_UNIFORM_SIZE                   = 0x8A38;
enum GL_UNIFORM_NAME_LENGTH            = 0x8A39;
enum GL_UNIFORM_BLOCK_INDEX            = 0x8A3A;
enum GL_UNIFORM_OFFSET                 = 0x8A3B;
enum GL_UNIFORM_ARRAY_STRIDE           = 0x8A3C;
enum GL_UNIFORM_MATRIX_STRIDE          = 0x8A3D;
enum GL_UNIFORM_IS_ROW_MAJOR           = 0x8A3E;
enum GL_UNIFORM_BLOCK_BINDING          = 0x8A3F;
enum GL_UNIFORM_BLOCK_DATA_SIZE        = 0x8A40;
enum GL_UNIFORM_BLOCK_NAME_LENGTH      = 0x8A41;
enum GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS  = 0x8A42;
enum GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 0x8A43;
enum GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 0x8A44;
enum GL_UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER = 0x8A45;
enum GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 0x8A46;
enum GL_INVALID_INDEX                  = 0xFFFFFFFFu;
}

version (GL_ARB_compatibility) {} else {
/* ARB_compatibility just defines tokens from core 3.0 */
}

version (GL_ARB_copy_buffer) {} else {
enum GL_COPY_READ_BUFFER_BINDING       = 0x8F36;
enum GL_COPY_READ_BUFFER               = GL_COPY_READ_BUFFER_BINDING;
enum GL_COPY_WRITE_BUFFER_BINDING      = 0x8F37;
enum GL_COPY_WRITE_BUFFER              = GL_COPY_WRITE_BUFFER_BINDING;
}

version (GL_ARB_shader_texture_lod) {} else {
}

version (GL_ARB_depth_clamp) {} else {
enum GL_DEPTH_CLAMP                    = 0x864F;
}

version (GL_ARB_draw_elements_base_vertex) {} else {
}

version (GL_ARB_fragment_coord_conventions) {} else {
}

version (GL_ARB_provoking_vertex) {} else {
enum GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION = 0x8E4C;
enum GL_FIRST_VERTEX_CONVENTION        = 0x8E4D;
enum GL_LAST_VERTEX_CONVENTION         = 0x8E4E;
enum GL_PROVOKING_VERTEX               = 0x8E4F;
}

version (GL_ARB_seamless_cube_map) {} else {
enum GL_TEXTURE_CUBE_MAP_SEAMLESS      = 0x884F;
}

version (GL_ARB_sync) {} else {
enum GL_MAX_SERVER_WAIT_TIMEOUT        = 0x9111;
enum GL_OBJECT_TYPE                    = 0x9112;
enum GL_SYNC_CONDITION                 = 0x9113;
enum GL_SYNC_STATUS                    = 0x9114;
enum GL_SYNC_FLAGS                     = 0x9115;
enum GL_SYNC_FENCE                     = 0x9116;
enum GL_SYNC_GPU_COMMANDS_COMPLETE     = 0x9117;
enum GL_UNSIGNALED                     = 0x9118;
enum GL_SIGNALED                       = 0x9119;
enum GL_ALREADY_SIGNALED               = 0x911A;
enum GL_TIMEOUT_EXPIRED                = 0x911B;
enum GL_CONDITION_SATISFIED            = 0x911C;
enum GL_WAIT_FAILED                    = 0x911D;
enum GL_SYNC_FLUSH_COMMANDS_BIT        = 0x00000001;
enum GL_TIMEOUT_IGNORED                = 0xFFFFFFFFFFFFFFFF;
}

version (GL_ARB_texture_multisample) {} else {
enum GL_SAMPLE_POSITION                = 0x8E50;
enum GL_SAMPLE_MASK                    = 0x8E51;
enum GL_SAMPLE_MASK_VALUE              = 0x8E52;
enum GL_MAX_SAMPLE_MASK_WORDS          = 0x8E59;
enum GL_TEXTURE_2D_MULTISAMPLE         = 0x9100;
enum GL_PROXY_TEXTURE_2D_MULTISAMPLE   = 0x9101;
enum GL_TEXTURE_2D_MULTISAMPLE_ARRAY   = 0x9102;
enum GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY = 0x9103;
enum GL_TEXTURE_BINDING_2D_MULTISAMPLE = 0x9104;
enum GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY = 0x9105;
enum GL_TEXTURE_SAMPLES                = 0x9106;
enum GL_TEXTURE_FIXED_SAMPLE_LOCATIONS = 0x9107;
enum GL_SAMPLER_2D_MULTISAMPLE         = 0x9108;
enum GL_INT_SAMPLER_2D_MULTISAMPLE     = 0x9109;
enum GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE = 0x910A;
enum GL_SAMPLER_2D_MULTISAMPLE_ARRAY   = 0x910B;
enum GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910C;
enum GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910D;
enum GL_MAX_COLOR_TEXTURE_SAMPLES      = 0x910E;
enum GL_MAX_DEPTH_TEXTURE_SAMPLES      = 0x910F;
enum GL_MAX_INTEGER_SAMPLES            = 0x9110;
}

version (GL_ARB_vertex_array_bgra) {} else {
/* reuse GL_BGRA */
}

version (GL_ARB_draw_buffers_blend) {} else {
}

version (GL_ARB_sample_shading) {} else {
enum GL_SAMPLE_SHADING_ARB             = 0x8C36;
enum GL_MIN_SAMPLE_SHADING_VALUE_ARB   = 0x8C37;
}

version (GL_ARB_texture_cube_map_array) {} else {
enum GL_TEXTURE_CUBE_MAP_ARRAY_ARB     = 0x9009;
enum GL_TEXTURE_BINDING_CUBE_MAP_ARRAY_ARB = 0x900A;
enum GL_PROXY_TEXTURE_CUBE_MAP_ARRAY_ARB = 0x900B;
enum GL_SAMPLER_CUBE_MAP_ARRAY_ARB     = 0x900C;
enum GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW_ARB = 0x900D;
enum GL_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = 0x900E;
enum GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = 0x900F;
}

version (GL_ARB_texture_gather) {} else {
enum GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = 0x8E5E;
enum GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = 0x8E5F;
enum GL_MAX_PROGRAM_TEXTURE_GATHER_COMPONENTS_ARB = 0x8F9F;
}

version (GL_ARB_texture_query_lod) {} else {
}

version (GL_ARB_shading_language_include) {} else {
enum GL_SHADER_INCLUDE_ARB             = 0x8DAE;
enum GL_NAMED_STRING_LENGTH_ARB        = 0x8DE9;
enum GL_NAMED_STRING_TYPE_ARB          = 0x8DEA;
}

version (GL_ARB_texture_compression_bptc) {} else {
enum GL_COMPRESSED_RGBA_BPTC_UNORM_ARB = 0x8E8C;
enum GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM_ARB = 0x8E8D;
enum GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT_ARB = 0x8E8E;
enum GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_ARB = 0x8E8F;
}

version (GL_ARB_blend_func_extended) {} else {
enum GL_SRC1_COLOR                     = 0x88F9;
/* reuse GL_SRC1_ALPHA */
enum GL_ONE_MINUS_SRC1_COLOR           = 0x88FA;
enum GL_ONE_MINUS_SRC1_ALPHA           = 0x88FB;
enum GL_MAX_DUAL_SOURCE_DRAW_BUFFERS   = 0x88FC;
}

version (GL_ARB_explicit_attrib_location) {} else {
}

version (GL_ARB_occlusion_query2) {} else {
enum GL_ANY_SAMPLES_PASSED             = 0x8C2F;
}

version (GL_ARB_sampler_objects) {} else {
enum GL_SAMPLER_BINDING                = 0x8919;
}

version (GL_ARB_shader_bit_encoding) {} else {
}

version (GL_ARB_texture_rgb10_a2ui) {} else {
enum GL_RGB10_A2UI                     = 0x906F;
}

version (GL_ARB_texture_swizzle) {} else {
enum GL_TEXTURE_SWIZZLE_R              = 0x8E42;
enum GL_TEXTURE_SWIZZLE_G              = 0x8E43;
enum GL_TEXTURE_SWIZZLE_B              = 0x8E44;
enum GL_TEXTURE_SWIZZLE_A              = 0x8E45;
enum GL_TEXTURE_SWIZZLE_RGBA           = 0x8E46;
}

version (GL_ARB_timer_query) {} else {
enum GL_TIME_ELAPSED                   = 0x88BF;
enum GL_TIMESTAMP                      = 0x8E28;
}

version (GL_ARB_vertex_type_2_10_10_10_rev) {} else {
/* reuse GL_UNSIGNED_INT_2_10_10_10_REV */
enum GL_INT_2_10_10_10_REV             = 0x8D9F;
}

version (GL_ARB_draw_indirect) {} else {
enum GL_DRAW_INDIRECT_BUFFER           = 0x8F3F;
enum GL_DRAW_INDIRECT_BUFFER_BINDING   = 0x8F43;
}

version (GL_ARB_gpu_shader5) {} else {
enum GL_GEOMETRY_SHADER_INVOCATIONS    = 0x887F;
enum GL_MAX_GEOMETRY_SHADER_INVOCATIONS = 0x8E5A;
enum GL_MIN_FRAGMENT_INTERPOLATION_OFFSET = 0x8E5B;
enum GL_MAX_FRAGMENT_INTERPOLATION_OFFSET = 0x8E5C;
enum GL_FRAGMENT_INTERPOLATION_OFFSET_BITS = 0x8E5D;
/* reuse GL_MAX_VERTEX_STREAMS */
}

version (GL_ARB_gpu_shader_fp64) {} else {
/* reuse GL_DOUBLE */
enum GL_DOUBLE_VEC2                    = 0x8FFC;
enum GL_DOUBLE_VEC3                    = 0x8FFD;
enum GL_DOUBLE_VEC4                    = 0x8FFE;
enum GL_DOUBLE_MAT2                    = 0x8F46;
enum GL_DOUBLE_MAT3                    = 0x8F47;
enum GL_DOUBLE_MAT4                    = 0x8F48;
enum GL_DOUBLE_MAT2x3                  = 0x8F49;
enum GL_DOUBLE_MAT2x4                  = 0x8F4A;
enum GL_DOUBLE_MAT3x2                  = 0x8F4B;
enum GL_DOUBLE_MAT3x4                  = 0x8F4C;
enum GL_DOUBLE_MAT4x2                  = 0x8F4D;
enum GL_DOUBLE_MAT4x3                  = 0x8F4E;
}

version (GL_ARB_shader_subroutine) {} else {
enum GL_ACTIVE_SUBROUTINES             = 0x8DE5;
enum GL_ACTIVE_SUBROUTINE_UNIFORMS     = 0x8DE6;
enum GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS = 0x8E47;
enum GL_ACTIVE_SUBROUTINE_MAX_LENGTH   = 0x8E48;
enum GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH = 0x8E49;
enum GL_MAX_SUBROUTINES                = 0x8DE7;
enum GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS = 0x8DE8;
enum GL_NUM_COMPATIBLE_SUBROUTINES     = 0x8E4A;
enum GL_COMPATIBLE_SUBROUTINES         = 0x8E4B;
/* reuse GL_UNIFORM_SIZE */
/* reuse GL_UNIFORM_NAME_LENGTH */
}

version (GL_ARB_tessellation_shader) {} else {
enum GL_PATCHES                        = 0x000E;
enum GL_PATCH_VERTICES                 = 0x8E72;
enum GL_PATCH_DEFAULT_INNER_LEVEL      = 0x8E73;
enum GL_PATCH_DEFAULT_OUTER_LEVEL      = 0x8E74;
enum GL_TESS_CONTROL_OUTPUT_VERTICES   = 0x8E75;
enum GL_TESS_GEN_MODE                  = 0x8E76;
enum GL_TESS_GEN_SPACING               = 0x8E77;
enum GL_TESS_GEN_VERTEX_ORDER          = 0x8E78;
enum GL_TESS_GEN_POINT_MODE            = 0x8E79;
/* reuse GL_TRIANGLES */
/* reuse GL_QUADS */
enum GL_ISOLINES                       = 0x8E7A;
/* reuse GL_EQUAL */
enum GL_FRACTIONAL_ODD                 = 0x8E7B;
enum GL_FRACTIONAL_EVEN                = 0x8E7C;
/* reuse GL_CCW */
/* reuse GL_CW */
enum GL_MAX_PATCH_VERTICES             = 0x8E7D;
enum GL_MAX_TESS_GEN_LEVEL             = 0x8E7E;
enum GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS = 0x8E7F;
enum GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS = 0x8E80;
enum GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS = 0x8E81;
enum GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS = 0x8E82;
enum GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS = 0x8E83;
enum GL_MAX_TESS_PATCH_COMPONENTS      = 0x8E84;
enum GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS = 0x8E85;
enum GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS = 0x8E86;
enum GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS = 0x8E89;
enum GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS = 0x8E8A;
enum GL_MAX_TESS_CONTROL_INPUT_COMPONENTS = 0x886C;
enum GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS = 0x886D;
enum GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS = 0x8E1E;
enum GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS = 0x8E1F;
enum GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER = 0x84F0;
enum GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x84F1;
enum GL_TESS_EVALUATION_SHADER         = 0x8E87;
enum GL_TESS_CONTROL_SHADER            = 0x8E88;
}

version (GL_ARB_texture_buffer_object_rgb32) {} else {
/* reuse GL_RGB32F */
/* reuse GL_RGB32UI */
/* reuse GL_RGB32I */
}

version (GL_ARB_transform_feedback2) {} else {
enum GL_TRANSFORM_FEEDBACK             = 0x8E22;
enum GL_TRANSFORM_FEEDBACK_PAUSED      = 0x8E23;
enum GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED = GL_TRANSFORM_FEEDBACK_PAUSED;
enum GL_TRANSFORM_FEEDBACK_ACTIVE      = 0x8E24;
enum GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE = GL_TRANSFORM_FEEDBACK_ACTIVE;
enum GL_TRANSFORM_FEEDBACK_BINDING     = 0x8E25;
}

version (GL_ARB_transform_feedback3) {} else {
enum GL_MAX_TRANSFORM_FEEDBACK_BUFFERS = 0x8E70;
enum GL_MAX_VERTEX_STREAMS             = 0x8E71;
}

version (GL_ARB_ES2_compatibility) {} else {
enum GL_FIXED                          = 0x140C;
enum GL_IMPLEMENTATION_COLOR_READ_TYPE = 0x8B9A;
enum GL_IMPLEMENTATION_COLOR_READ_FORMAT = 0x8B9B;
enum GL_LOW_FLOAT                      = 0x8DF0;
enum GL_MEDIUM_FLOAT                   = 0x8DF1;
enum GL_HIGH_FLOAT                     = 0x8DF2;
enum GL_LOW_INT                        = 0x8DF3;
enum GL_MEDIUM_INT                     = 0x8DF4;
enum GL_HIGH_INT                       = 0x8DF5;
enum GL_SHADER_COMPILER                = 0x8DFA;
enum GL_SHADER_BINARY_FORMATS          = 0x8DF8;
enum GL_NUM_SHADER_BINARY_FORMATS      = 0x8DF9;
enum GL_MAX_VERTEX_UNIFORM_VECTORS     = 0x8DFB;
enum GL_MAX_VARYING_VECTORS            = 0x8DFC;
enum GL_MAX_FRAGMENT_UNIFORM_VECTORS   = 0x8DFD;
enum GL_RGB565                         = 0x8D62;
}

version (GL_ARB_get_program_binary) {} else {
enum GL_PROGRAM_BINARY_RETRIEVABLE_HINT = 0x8257;
enum GL_PROGRAM_BINARY_LENGTH          = 0x8741;
enum GL_NUM_PROGRAM_BINARY_FORMATS     = 0x87FE;
enum GL_PROGRAM_BINARY_FORMATS         = 0x87FF;
}

version (GL_ARB_separate_shader_objects) {} else {
enum GL_VERTEX_SHADER_BIT              = 0x00000001;
enum GL_FRAGMENT_SHADER_BIT            = 0x00000002;
enum GL_GEOMETRY_SHADER_BIT            = 0x00000004;
enum GL_TESS_CONTROL_SHADER_BIT        = 0x00000008;
enum GL_TESS_EVALUATION_SHADER_BIT     = 0x00000010;
enum GL_ALL_SHADER_BITS                = 0xFFFFFFFF;
enum GL_PROGRAM_SEPARABLE              = 0x8258;
enum GL_ACTIVE_PROGRAM                 = 0x8259;
enum GL_PROGRAM_PIPELINE_BINDING       = 0x825A;
}

version (GL_ARB_shader_precision) {} else {
}

version (GL_ARB_vertex_attrib_64bit) {} else {
/* reuse GL_RGB32I */
/* reuse GL_DOUBLE_VEC2 */
/* reuse GL_DOUBLE_VEC3 */
/* reuse GL_DOUBLE_VEC4 */
/* reuse GL_DOUBLE_MAT2 */
/* reuse GL_DOUBLE_MAT3 */
/* reuse GL_DOUBLE_MAT4 */
/* reuse GL_DOUBLE_MAT2x3 */
/* reuse GL_DOUBLE_MAT2x4 */
/* reuse GL_DOUBLE_MAT3x2 */
/* reuse GL_DOUBLE_MAT3x4 */
/* reuse GL_DOUBLE_MAT4x2 */
/* reuse GL_DOUBLE_MAT4x3 */
}

version (GL_ARB_viewport_array) {} else {
/* reuse GL_SCISSOR_BOX */
/* reuse GL_VIEWPORT */
/* reuse GL_DEPTH_RANGE */
/* reuse GL_SCISSOR_TEST */
enum GL_MAX_VIEWPORTS                  = 0x825B;
enum GL_VIEWPORT_SUBPIXEL_BITS         = 0x825C;
enum GL_VIEWPORT_BOUNDS_RANGE          = 0x825D;
enum GL_LAYER_PROVOKING_VERTEX         = 0x825E;
enum GL_VIEWPORT_INDEX_PROVOKING_VERTEX = 0x825F;
enum GL_UNDEFINED_VERTEX               = 0x8260;
/* reuse GL_FIRST_VERTEX_CONVENTION */
/* reuse GL_LAST_VERTEX_CONVENTION */
/* reuse GL_PROVOKING_VERTEX */
}

version (GL_ARB_cl_event) {} else {
enum GL_SYNC_CL_EVENT_ARB              = 0x8240;
enum GL_SYNC_CL_EVENT_COMPLETE_ARB     = 0x8241;
}

version (GL_ARB_debug_output) {} else {
enum GL_DEBUG_OUTPUT_SYNCHRONOUS_ARB   = 0x8242;
enum GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH_ARB = 0x8243;
enum GL_DEBUG_CALLBACK_FUNCTION_ARB    = 0x8244;
enum GL_DEBUG_CALLBACK_USER_PARAM_ARB  = 0x8245;
enum GL_DEBUG_SOURCE_API_ARB           = 0x8246;
enum GL_DEBUG_SOURCE_WINDOW_SYSTEM_ARB = 0x8247;
enum GL_DEBUG_SOURCE_SHADER_COMPILER_ARB = 0x8248;
enum GL_DEBUG_SOURCE_THIRD_PARTY_ARB   = 0x8249;
enum GL_DEBUG_SOURCE_APPLICATION_ARB   = 0x824A;
enum GL_DEBUG_SOURCE_OTHER_ARB         = 0x824B;
enum GL_DEBUG_TYPE_ERROR_ARB           = 0x824C;
enum GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR_ARB = 0x824D;
enum GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR_ARB = 0x824E;
enum GL_DEBUG_TYPE_PORTABILITY_ARB     = 0x824F;
enum GL_DEBUG_TYPE_PERFORMANCE_ARB     = 0x8250;
enum GL_DEBUG_TYPE_OTHER_ARB           = 0x8251;
enum GL_MAX_DEBUG_MESSAGE_LENGTH_ARB   = 0x9143;
enum GL_MAX_DEBUG_LOGGED_MESSAGES_ARB  = 0x9144;
enum GL_DEBUG_LOGGED_MESSAGES_ARB      = 0x9145;
enum GL_DEBUG_SEVERITY_HIGH_ARB        = 0x9146;
enum GL_DEBUG_SEVERITY_MEDIUM_ARB      = 0x9147;
enum GL_DEBUG_SEVERITY_LOW_ARB         = 0x9148;
}

version (GL_ARB_robustness) {} else {
/* reuse GL_NO_ERROR */
enum GL_CONTEXT_FLAG_ROBUST_ACCESS_BIT_ARB = 0x00000004;
enum GL_LOSE_CONTEXT_ON_RESET_ARB      = 0x8252;
enum GL_GUILTY_CONTEXT_RESET_ARB       = 0x8253;
enum GL_INNOCENT_CONTEXT_RESET_ARB     = 0x8254;
enum GL_UNKNOWN_CONTEXT_RESET_ARB      = 0x8255;
enum GL_RESET_NOTIFICATION_STRATEGY_ARB = 0x8256;
enum GL_NO_RESET_NOTIFICATION_ARB      = 0x8261;
}

version (GL_ARB_shader_stencil_export) {} else {
}

version (GL_ARB_base_instance) {} else {
}

version (GL_ARB_shading_language_420pack) {} else {
}

version (GL_ARB_transform_feedback_instanced) {} else {
}

version (GL_ARB_compressed_texture_pixel_storage) {} else {
enum GL_UNPACK_COMPRESSED_BLOCK_WIDTH  = 0x9127;
enum GL_UNPACK_COMPRESSED_BLOCK_HEIGHT = 0x9128;
enum GL_UNPACK_COMPRESSED_BLOCK_DEPTH  = 0x9129;
enum GL_UNPACK_COMPRESSED_BLOCK_SIZE   = 0x912A;
enum GL_PACK_COMPRESSED_BLOCK_WIDTH    = 0x912B;
enum GL_PACK_COMPRESSED_BLOCK_HEIGHT   = 0x912C;
enum GL_PACK_COMPRESSED_BLOCK_DEPTH    = 0x912D;
enum GL_PACK_COMPRESSED_BLOCK_SIZE     = 0x912E;
}

version (GL_ARB_conservative_depth) {} else {
}

version (GL_ARB_internalformat_query) {} else {
enum GL_NUM_SAMPLE_COUNTS              = 0x9380;
}

version (GL_ARB_map_buffer_alignment) {} else {
enum GL_MIN_MAP_BUFFER_ALIGNMENT       = 0x90BC;
}

version (GL_ARB_shader_atomic_counters) {} else {
enum GL_ATOMIC_COUNTER_BUFFER          = 0x92C0;
enum GL_ATOMIC_COUNTER_BUFFER_BINDING  = 0x92C1;
enum GL_ATOMIC_COUNTER_BUFFER_START    = 0x92C2;
enum GL_ATOMIC_COUNTER_BUFFER_SIZE     = 0x92C3;
enum GL_ATOMIC_COUNTER_BUFFER_DATA_SIZE = 0x92C4;
enum GL_ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTERS = 0x92C5;
enum GL_ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTER_INDICES = 0x92C6;
enum GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_VERTEX_SHADER = 0x92C7;
enum GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_CONTROL_SHADER = 0x92C8;
enum GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x92C9;
enum GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_GEOMETRY_SHADER = 0x92CA;
enum GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_FRAGMENT_SHADER = 0x92CB;
enum GL_MAX_VERTEX_ATOMIC_COUNTER_BUFFERS = 0x92CC;
enum GL_MAX_TESS_CONTROL_ATOMIC_COUNTER_BUFFERS = 0x92CD;
enum GL_MAX_TESS_EVALUATION_ATOMIC_COUNTER_BUFFERS = 0x92CE;
enum GL_MAX_GEOMETRY_ATOMIC_COUNTER_BUFFERS = 0x92CF;
enum GL_MAX_FRAGMENT_ATOMIC_COUNTER_BUFFERS = 0x92D0;
enum GL_MAX_COMBINED_ATOMIC_COUNTER_BUFFERS = 0x92D1;
enum GL_MAX_VERTEX_ATOMIC_COUNTERS     = 0x92D2;
enum GL_MAX_TESS_CONTROL_ATOMIC_COUNTERS = 0x92D3;
enum GL_MAX_TESS_EVALUATION_ATOMIC_COUNTERS = 0x92D4;
enum GL_MAX_GEOMETRY_ATOMIC_COUNTERS   = 0x92D5;
enum GL_MAX_FRAGMENT_ATOMIC_COUNTERS   = 0x92D6;
enum GL_MAX_COMBINED_ATOMIC_COUNTERS   = 0x92D7;
enum GL_MAX_ATOMIC_COUNTER_BUFFER_SIZE = 0x92D8;
enum GL_MAX_ATOMIC_COUNTER_BUFFER_BINDINGS = 0x92DC;
enum GL_ACTIVE_ATOMIC_COUNTER_BUFFERS  = 0x92D9;
enum GL_UNIFORM_ATOMIC_COUNTER_BUFFER_INDEX = 0x92DA;
enum GL_UNSIGNED_INT_ATOMIC_COUNTER    = 0x92DB;
}

version (GL_ARB_shader_image_load_store) {} else {
enum GL_VERTEX_ATTRIB_ARRAY_BARRIER_BIT = 0x00000001;
enum GL_ELEMENT_ARRAY_BARRIER_BIT      = 0x00000002;
enum GL_UNIFORM_BARRIER_BIT            = 0x00000004;
enum GL_TEXTURE_FETCH_BARRIER_BIT      = 0x00000008;
enum GL_SHADER_IMAGE_ACCESS_BARRIER_BIT = 0x00000020;
enum GL_COMMAND_BARRIER_BIT            = 0x00000040;
enum GL_PIXEL_BUFFER_BARRIER_BIT       = 0x00000080;
enum GL_TEXTURE_UPDATE_BARRIER_BIT     = 0x00000100;
enum GL_BUFFER_UPDATE_BARRIER_BIT      = 0x00000200;
enum GL_FRAMEBUFFER_BARRIER_BIT        = 0x00000400;
enum GL_TRANSFORM_FEEDBACK_BARRIER_BIT = 0x00000800;
enum GL_ATOMIC_COUNTER_BARRIER_BIT     = 0x00001000;
enum GL_ALL_BARRIER_BITS               = 0xFFFFFFFF;
enum GL_MAX_IMAGE_UNITS                = 0x8F38;
enum GL_MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS = 0x8F39;
enum GL_IMAGE_BINDING_NAME             = 0x8F3A;
enum GL_IMAGE_BINDING_LEVEL            = 0x8F3B;
enum GL_IMAGE_BINDING_LAYERED          = 0x8F3C;
enum GL_IMAGE_BINDING_LAYER            = 0x8F3D;
enum GL_IMAGE_BINDING_ACCESS           = 0x8F3E;
enum GL_IMAGE_1D                       = 0x904C;
enum GL_IMAGE_2D                       = 0x904D;
enum GL_IMAGE_3D                       = 0x904E;
enum GL_IMAGE_2D_RECT                  = 0x904F;
enum GL_IMAGE_CUBE                     = 0x9050;
enum GL_IMAGE_BUFFER                   = 0x9051;
enum GL_IMAGE_1D_ARRAY                 = 0x9052;
enum GL_IMAGE_2D_ARRAY                 = 0x9053;
enum GL_IMAGE_CUBE_MAP_ARRAY           = 0x9054;
enum GL_IMAGE_2D_MULTISAMPLE           = 0x9055;
enum GL_IMAGE_2D_MULTISAMPLE_ARRAY     = 0x9056;
enum GL_INT_IMAGE_1D                   = 0x9057;
enum GL_INT_IMAGE_2D                   = 0x9058;
enum GL_INT_IMAGE_3D                   = 0x9059;
enum GL_INT_IMAGE_2D_RECT              = 0x905A;
enum GL_INT_IMAGE_CUBE                 = 0x905B;
enum GL_INT_IMAGE_BUFFER               = 0x905C;
enum GL_INT_IMAGE_1D_ARRAY             = 0x905D;
enum GL_INT_IMAGE_2D_ARRAY             = 0x905E;
enum GL_INT_IMAGE_CUBE_MAP_ARRAY       = 0x905F;
enum GL_INT_IMAGE_2D_MULTISAMPLE       = 0x9060;
enum GL_INT_IMAGE_2D_MULTISAMPLE_ARRAY = 0x9061;
enum GL_UNSIGNED_INT_IMAGE_1D          = 0x9062;
enum GL_UNSIGNED_INT_IMAGE_2D          = 0x9063;
enum GL_UNSIGNED_INT_IMAGE_3D          = 0x9064;
enum GL_UNSIGNED_INT_IMAGE_2D_RECT     = 0x9065;
enum GL_UNSIGNED_INT_IMAGE_CUBE        = 0x9066;
enum GL_UNSIGNED_INT_IMAGE_BUFFER      = 0x9067;
enum GL_UNSIGNED_INT_IMAGE_1D_ARRAY    = 0x9068;
enum GL_UNSIGNED_INT_IMAGE_2D_ARRAY    = 0x9069;
enum GL_UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY = 0x906A;
enum GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE = 0x906B;
enum GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY = 0x906C;
enum GL_MAX_IMAGE_SAMPLES              = 0x906D;
enum GL_IMAGE_BINDING_FORMAT           = 0x906E;
enum GL_IMAGE_FORMAT_COMPATIBILITY_TYPE = 0x90C7;
enum GL_IMAGE_FORMAT_COMPATIBILITY_BY_SIZE = 0x90C8;
enum GL_IMAGE_FORMAT_COMPATIBILITY_BY_CLASS = 0x90C9;
enum GL_MAX_VERTEX_IMAGE_UNIFORMS      = 0x90CA;
enum GL_MAX_TESS_CONTROL_IMAGE_UNIFORMS = 0x90CB;
enum GL_MAX_TESS_EVALUATION_IMAGE_UNIFORMS = 0x90CC;
enum GL_MAX_GEOMETRY_IMAGE_UNIFORMS    = 0x90CD;
enum GL_MAX_FRAGMENT_IMAGE_UNIFORMS    = 0x90CE;
enum GL_MAX_COMBINED_IMAGE_UNIFORMS    = 0x90CF;
}

version (GL_ARB_shading_language_packing) {} else {
}

version (GL_ARB_texture_storage) {} else {
enum GL_TEXTURE_IMMUTABLE_FORMAT       = 0x912F;
}

version (GL_KHR_texture_compression_astc_ldr) {} else {
enum GL_COMPRESSED_RGBA_ASTC_4x4_KHR   = 0x93B0;
enum GL_COMPRESSED_RGBA_ASTC_5x4_KHR   = 0x93B1;
enum GL_COMPRESSED_RGBA_ASTC_5x5_KHR   = 0x93B2;
enum GL_COMPRESSED_RGBA_ASTC_6x5_KHR   = 0x93B3;
enum GL_COMPRESSED_RGBA_ASTC_6x6_KHR   = 0x93B4;
enum GL_COMPRESSED_RGBA_ASTC_8x5_KHR   = 0x93B5;
enum GL_COMPRESSED_RGBA_ASTC_8x6_KHR   = 0x93B6;
enum GL_COMPRESSED_RGBA_ASTC_8x8_KHR   = 0x93B7;
enum GL_COMPRESSED_RGBA_ASTC_10x5_KHR  = 0x93B8;
enum GL_COMPRESSED_RGBA_ASTC_10x6_KHR  = 0x93B9;
enum GL_COMPRESSED_RGBA_ASTC_10x8_KHR  = 0x93BA;
enum GL_COMPRESSED_RGBA_ASTC_10x10_KHR = 0x93BB;
enum GL_COMPRESSED_RGBA_ASTC_12x10_KHR = 0x93BC;
enum GL_COMPRESSED_RGBA_ASTC_12x12_KHR = 0x93BD;
enum GL_COMPRESSED_SRGB8_ALPHA8_ASTC_4x4_KHR = 0x93D0;
enum GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x4_KHR = 0x93D1;
enum GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x5_KHR = 0x93D2;
enum GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x5_KHR = 0x93D3;
enum GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x6_KHR = 0x93D4;
enum GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x5_KHR = 0x93D5;
enum GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x6_KHR = 0x93D6;
enum GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x8_KHR = 0x93D7;
enum GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x5_KHR = 0x93D8;
enum GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR = 0x93D9;
enum GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x8_KHR = 0x93DA;
enum GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x10_KHR = 0x93DB;
enum GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x10_KHR = 0x93DC;
enum GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x12_KHR = 0x93DD;
}

version (GL_KHR_debug) {} else {
enum GL_DEBUG_OUTPUT_SYNCHRONOUS       = 0x8242;
enum GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH = 0x8243;
enum GL_DEBUG_CALLBACK_FUNCTION        = 0x8244;
enum GL_DEBUG_CALLBACK_USER_PARAM      = 0x8245;
enum GL_DEBUG_SOURCE_API               = 0x8246;
enum GL_DEBUG_SOURCE_WINDOW_SYSTEM     = 0x8247;
enum GL_DEBUG_SOURCE_SHADER_COMPILER   = 0x8248;
enum GL_DEBUG_SOURCE_THIRD_PARTY       = 0x8249;
enum GL_DEBUG_SOURCE_APPLICATION       = 0x824A;
enum GL_DEBUG_SOURCE_OTHER             = 0x824B;
enum GL_DEBUG_TYPE_ERROR               = 0x824C;
enum GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR = 0x824D;
enum GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR  = 0x824E;
enum GL_DEBUG_TYPE_PORTABILITY         = 0x824F;
enum GL_DEBUG_TYPE_PERFORMANCE         = 0x8250;
enum GL_DEBUG_TYPE_OTHER               = 0x8251;
enum GL_DEBUG_TYPE_MARKER              = 0x8268;
enum GL_DEBUG_TYPE_PUSH_GROUP          = 0x8269;
enum GL_DEBUG_TYPE_POP_GROUP           = 0x826A;
enum GL_DEBUG_SEVERITY_NOTIFICATION    = 0x826B;
enum GL_MAX_DEBUG_GROUP_STACK_DEPTH    = 0x826C;
enum GL_DEBUG_GROUP_STACK_DEPTH        = 0x826D;
enum GL_BUFFER                         = 0x82E0;
enum GL_SHADER                         = 0x82E1;
enum GL_PROGRAM                        = 0x82E2;
enum GL_QUERY                          = 0x82E3;
enum GL_PROGRAM_PIPELINE               = 0x82E4;
enum GL_SAMPLER                        = 0x82E6;
enum GL_DISPLAY_LIST                   = 0x82E7;
/* DISPLAY_LIST used in compatibility profile only */
enum GL_MAX_LABEL_LENGTH               = 0x82E8;
enum GL_MAX_DEBUG_MESSAGE_LENGTH       = 0x9143;
enum GL_MAX_DEBUG_LOGGED_MESSAGES      = 0x9144;
enum GL_DEBUG_LOGGED_MESSAGES          = 0x9145;
enum GL_DEBUG_SEVERITY_HIGH            = 0x9146;
enum GL_DEBUG_SEVERITY_MEDIUM          = 0x9147;
enum GL_DEBUG_SEVERITY_LOW             = 0x9148;
enum GL_DEBUG_OUTPUT                   = 0x92E0;
enum GL_CONTEXT_FLAG_DEBUG_BIT         = 0x00000002;
/* reuse GL_STACK_UNDERFLOW */
/* reuse GL_STACK_OVERFLOW */
}

version (GL_ARB_arrays_of_arrays) {} else {
}

version (GL_ARB_clear_buffer_object) {} else {
}

version (GL_ARB_compute_shader) {} else {
enum GL_COMPUTE_SHADER                 = 0x91B9;
enum GL_MAX_COMPUTE_UNIFORM_BLOCKS     = 0x91BB;
enum GL_MAX_COMPUTE_TEXTURE_IMAGE_UNITS = 0x91BC;
enum GL_MAX_COMPUTE_IMAGE_UNIFORMS     = 0x91BD;
enum GL_MAX_COMPUTE_SHARED_MEMORY_SIZE = 0x8262;
enum GL_MAX_COMPUTE_UNIFORM_COMPONENTS = 0x8263;
enum GL_MAX_COMPUTE_ATOMIC_COUNTER_BUFFERS = 0x8264;
enum GL_MAX_COMPUTE_ATOMIC_COUNTERS    = 0x8265;
enum GL_MAX_COMBINED_COMPUTE_UNIFORM_COMPONENTS = 0x8266;
enum GL_MAX_COMPUTE_LOCAL_INVOCATIONS  = 0x90EB;
enum GL_MAX_COMPUTE_WORK_GROUP_COUNT   = 0x91BE;
enum GL_MAX_COMPUTE_WORK_GROUP_SIZE    = 0x91BF;
enum GL_COMPUTE_LOCAL_WORK_SIZE        = 0x8267;
enum GL_UNIFORM_BLOCK_REFERENCED_BY_COMPUTE_SHADER = 0x90EC;
enum GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_COMPUTE_SHADER = 0x90ED;
enum GL_DISPATCH_INDIRECT_BUFFER       = 0x90EE;
enum GL_DISPATCH_INDIRECT_BUFFER_BINDING = 0x90EF;
enum GL_COMPUTE_SHADER_BIT             = 0x00000020;
}

version (GL_ARB_copy_image) {} else {
}

version (GL_ARB_texture_view) {} else {
enum GL_TEXTURE_VIEW_MIN_LEVEL         = 0x82DB;
enum GL_TEXTURE_VIEW_NUM_LEVELS        = 0x82DC;
enum GL_TEXTURE_VIEW_MIN_LAYER         = 0x82DD;
enum GL_TEXTURE_VIEW_NUM_LAYERS        = 0x82DE;
enum GL_TEXTURE_IMMUTABLE_LEVELS       = 0x82DF;
}

version (GL_ARB_vertex_attrib_binding) {} else {
enum GL_VERTEX_ATTRIB_BINDING          = 0x82D4;
enum GL_VERTEX_ATTRIB_RELATIVE_OFFSET  = 0x82D5;
enum GL_VERTEX_BINDING_DIVISOR         = 0x82D6;
enum GL_VERTEX_BINDING_OFFSET          = 0x82D7;
enum GL_VERTEX_BINDING_STRIDE          = 0x82D8;
enum GL_MAX_VERTEX_ATTRIB_RELATIVE_OFFSET = 0x82D9;
enum GL_MAX_VERTEX_ATTRIB_BINDINGS     = 0x82DA;
}

version (GL_ARB_robustness_isolation) {} else {
}

version (GL_ARB_ES3_compatibility) {} else {
enum GL_COMPRESSED_RGB8_ETC2           = 0x9274;
enum GL_COMPRESSED_SRGB8_ETC2          = 0x9275;
enum GL_COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9276;
enum GL_COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9277;
enum GL_COMPRESSED_RGBA8_ETC2_EAC      = 0x9278;
enum GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC = 0x9279;
enum GL_COMPRESSED_R11_EAC             = 0x9270;
enum GL_COMPRESSED_SIGNED_R11_EAC      = 0x9271;
enum GL_COMPRESSED_RG11_EAC            = 0x9272;
enum GL_COMPRESSED_SIGNED_RG11_EAC     = 0x9273;
enum GL_PRIMITIVE_RESTART_FIXED_INDEX  = 0x8D69;
enum GL_ANY_SAMPLES_PASSED_CONSERVATIVE = 0x8D6A;
enum GL_MAX_ELEMENT_INDEX              = 0x8D6B;
}

version (GL_ARB_explicit_uniform_location) {} else {
enum GL_MAX_UNIFORM_LOCATIONS          = 0x826E;
}

version (GL_ARB_fragment_layer_viewport) {} else {
}

version (GL_ARB_framebuffer_no_attachments) {} else {
enum GL_FRAMEBUFFER_DEFAULT_WIDTH      = 0x9310;
enum GL_FRAMEBUFFER_DEFAULT_HEIGHT     = 0x9311;
enum GL_FRAMEBUFFER_DEFAULT_LAYERS     = 0x9312;
enum GL_FRAMEBUFFER_DEFAULT_SAMPLES    = 0x9313;
enum GL_FRAMEBUFFER_DEFAULT_FIXED_SAMPLE_LOCATIONS = 0x9314;
enum GL_MAX_FRAMEBUFFER_WIDTH          = 0x9315;
enum GL_MAX_FRAMEBUFFER_HEIGHT         = 0x9316;
enum GL_MAX_FRAMEBUFFER_LAYERS         = 0x9317;
enum GL_MAX_FRAMEBUFFER_SAMPLES        = 0x9318;
}

version (GL_ARB_internalformat_query2) {} else {
/* reuse GL_IMAGE_FORMAT_COMPATIBILITY_TYPE */
/* reuse GL_NUM_SAMPLE_COUNTS */
/* reuse GL_RENDERBUFFER */
/* reuse GL_SAMPLES */
/* reuse GL_TEXTURE_1D */
/* reuse GL_TEXTURE_1D_ARRAY */
/* reuse GL_TEXTURE_2D */
/* reuse GL_TEXTURE_2D_ARRAY */
/* reuse GL_TEXTURE_3D */
/* reuse GL_TEXTURE_CUBE_MAP */
/* reuse GL_TEXTURE_CUBE_MAP_ARRAY */
/* reuse GL_TEXTURE_RECTANGLE */
/* reuse GL_TEXTURE_BUFFER */
/* reuse GL_TEXTURE_2D_MULTISAMPLE */
/* reuse GL_TEXTURE_2D_MULTISAMPLE_ARRAY */
/* reuse GL_TEXTURE_COMPRESSED */
enum GL_INTERNALFORMAT_SUPPORTED       = 0x826F;
enum GL_INTERNALFORMAT_PREFERRED       = 0x8270;
enum GL_INTERNALFORMAT_RED_SIZE        = 0x8271;
enum GL_INTERNALFORMAT_GREEN_SIZE      = 0x8272;
enum GL_INTERNALFORMAT_BLUE_SIZE       = 0x8273;
enum GL_INTERNALFORMAT_ALPHA_SIZE      = 0x8274;
enum GL_INTERNALFORMAT_DEPTH_SIZE      = 0x8275;
enum GL_INTERNALFORMAT_STENCIL_SIZE    = 0x8276;
enum GL_INTERNALFORMAT_SHARED_SIZE     = 0x8277;
enum GL_INTERNALFORMAT_RED_TYPE        = 0x8278;
enum GL_INTERNALFORMAT_GREEN_TYPE      = 0x8279;
enum GL_INTERNALFORMAT_BLUE_TYPE       = 0x827A;
enum GL_INTERNALFORMAT_ALPHA_TYPE      = 0x827B;
enum GL_INTERNALFORMAT_DEPTH_TYPE      = 0x827C;
enum GL_INTERNALFORMAT_STENCIL_TYPE    = 0x827D;
enum GL_MAX_WIDTH                      = 0x827E;
enum GL_MAX_HEIGHT                     = 0x827F;
enum GL_MAX_DEPTH                      = 0x8280;
enum GL_MAX_LAYERS                     = 0x8281;
enum GL_MAX_COMBINED_DIMENSIONS        = 0x8282;
enum GL_COLOR_COMPONENTS               = 0x8283;
enum GL_DEPTH_COMPONENTS               = 0x8284;
enum GL_STENCIL_COMPONENTS             = 0x8285;
enum GL_COLOR_RENDERABLE               = 0x8286;
enum GL_DEPTH_RENDERABLE               = 0x8287;
enum GL_STENCIL_RENDERABLE             = 0x8288;
enum GL_FRAMEBUFFER_RENDERABLE         = 0x8289;
enum GL_FRAMEBUFFER_RENDERABLE_LAYERED = 0x828A;
enum GL_FRAMEBUFFER_BLEND              = 0x828B;
enum GL_READ_PIXELS                    = 0x828C;
enum GL_READ_PIXELS_FORMAT             = 0x828D;
enum GL_READ_PIXELS_TYPE               = 0x828E;
enum GL_TEXTURE_IMAGE_FORMAT           = 0x828F;
enum GL_TEXTURE_IMAGE_TYPE             = 0x8290;
enum GL_GET_TEXTURE_IMAGE_FORMAT       = 0x8291;
enum GL_GET_TEXTURE_IMAGE_TYPE         = 0x8292;
enum GL_MIPMAP                         = 0x8293;
enum GL_MANUAL_GENERATE_MIPMAP         = 0x8294;
enum GL_AUTO_GENERATE_MIPMAP           = 0x8295;
enum GL_COLOR_ENCODING                 = 0x8296;
enum GL_SRGB_READ                      = 0x8297;
enum GL_SRGB_WRITE                     = 0x8298;
enum GL_SRGB_DECODE_ARB                = 0x8299;
enum GL_FILTER                         = 0x829A;
enum GL_VERTEX_TEXTURE                 = 0x829B;
enum GL_TESS_CONTROL_TEXTURE           = 0x829C;
enum GL_TESS_EVALUATION_TEXTURE        = 0x829D;
enum GL_GEOMETRY_TEXTURE               = 0x829E;
enum GL_FRAGMENT_TEXTURE               = 0x829F;
enum GL_COMPUTE_TEXTURE                = 0x82A0;
enum GL_TEXTURE_SHADOW                 = 0x82A1;
enum GL_TEXTURE_GATHER                 = 0x82A2;
enum GL_TEXTURE_GATHER_SHADOW          = 0x82A3;
enum GL_SHADER_IMAGE_LOAD              = 0x82A4;
enum GL_SHADER_IMAGE_STORE             = 0x82A5;
enum GL_SHADER_IMAGE_ATOMIC            = 0x82A6;
enum GL_IMAGE_TEXEL_SIZE               = 0x82A7;
enum GL_IMAGE_COMPATIBILITY_CLASS      = 0x82A8;
enum GL_IMAGE_PIXEL_FORMAT             = 0x82A9;
enum GL_IMAGE_PIXEL_TYPE               = 0x82AA;
enum GL_SIMULTANEOUS_TEXTURE_AND_DEPTH_TEST = 0x82AC;
enum GL_SIMULTANEOUS_TEXTURE_AND_STENCIL_TEST = 0x82AD;
enum GL_SIMULTANEOUS_TEXTURE_AND_DEPTH_WRITE = 0x82AE;
enum GL_SIMULTANEOUS_TEXTURE_AND_STENCIL_WRITE = 0x82AF;
enum GL_TEXTURE_COMPRESSED_BLOCK_WIDTH = 0x82B1;
enum GL_TEXTURE_COMPRESSED_BLOCK_HEIGHT = 0x82B2;
enum GL_TEXTURE_COMPRESSED_BLOCK_SIZE  = 0x82B3;
enum GL_CLEAR_BUFFER                   = 0x82B4;
enum GL_TEXTURE_VIEW                   = 0x82B5;
enum GL_VIEW_COMPATIBILITY_CLASS       = 0x82B6;
enum GL_FULL_SUPPORT                   = 0x82B7;
enum GL_CAVEAT_SUPPORT                 = 0x82B8;
enum GL_IMAGE_CLASS_4_X_32             = 0x82B9;
enum GL_IMAGE_CLASS_2_X_32             = 0x82BA;
enum GL_IMAGE_CLASS_1_X_32             = 0x82BB;
enum GL_IMAGE_CLASS_4_X_16             = 0x82BC;
enum GL_IMAGE_CLASS_2_X_16             = 0x82BD;
enum GL_IMAGE_CLASS_1_X_16             = 0x82BE;
enum GL_IMAGE_CLASS_4_X_8              = 0x82BF;
enum GL_IMAGE_CLASS_2_X_8              = 0x82C0;
enum GL_IMAGE_CLASS_1_X_8              = 0x82C1;
enum GL_IMAGE_CLASS_11_11_10           = 0x82C2;
enum GL_IMAGE_CLASS_10_10_10_2         = 0x82C3;
enum GL_VIEW_CLASS_128_BITS            = 0x82C4;
enum GL_VIEW_CLASS_96_BITS             = 0x82C5;
enum GL_VIEW_CLASS_64_BITS             = 0x82C6;
enum GL_VIEW_CLASS_48_BITS             = 0x82C7;
enum GL_VIEW_CLASS_32_BITS             = 0x82C8;
enum GL_VIEW_CLASS_24_BITS             = 0x82C9;
enum GL_VIEW_CLASS_16_BITS             = 0x82CA;
enum GL_VIEW_CLASS_8_BITS              = 0x82CB;
enum GL_VIEW_CLASS_S3TC_DXT1_RGB       = 0x82CC;
enum GL_VIEW_CLASS_S3TC_DXT1_RGBA      = 0x82CD;
enum GL_VIEW_CLASS_S3TC_DXT3_RGBA      = 0x82CE;
enum GL_VIEW_CLASS_S3TC_DXT5_RGBA      = 0x82CF;
enum GL_VIEW_CLASS_RGTC1_RED           = 0x82D0;
enum GL_VIEW_CLASS_RGTC2_RG            = 0x82D1;
enum GL_VIEW_CLASS_BPTC_UNORM          = 0x82D2;
enum GL_VIEW_CLASS_BPTC_FLOAT          = 0x82D3;
}

version (GL_ARB_invalidate_subdata) {} else {
}

version (GL_ARB_multi_draw_indirect) {} else {
}

version (GL_ARB_program_interface_query) {} else {
enum GL_UNIFORM                        = 0x92E1;
enum GL_UNIFORM_BLOCK                  = 0x92E2;
enum GL_PROGRAM_INPUT                  = 0x92E3;
enum GL_PROGRAM_OUTPUT                 = 0x92E4;
enum GL_BUFFER_VARIABLE                = 0x92E5;
enum GL_SHADER_STORAGE_BLOCK           = 0x92E6;
/* reuse GL_ATOMIC_COUNTER_BUFFER */
enum GL_VERTEX_SUBROUTINE              = 0x92E8;
enum GL_TESS_CONTROL_SUBROUTINE        = 0x92E9;
enum GL_TESS_EVALUATION_SUBROUTINE     = 0x92EA;
enum GL_GEOMETRY_SUBROUTINE            = 0x92EB;
enum GL_FRAGMENT_SUBROUTINE            = 0x92EC;
enum GL_COMPUTE_SUBROUTINE             = 0x92ED;
enum GL_VERTEX_SUBROUTINE_UNIFORM      = 0x92EE;
enum GL_TESS_CONTROL_SUBROUTINE_UNIFORM = 0x92EF;
enum GL_TESS_EVALUATION_SUBROUTINE_UNIFORM = 0x92F0;
enum GL_GEOMETRY_SUBROUTINE_UNIFORM    = 0x92F1;
enum GL_FRAGMENT_SUBROUTINE_UNIFORM    = 0x92F2;
enum GL_COMPUTE_SUBROUTINE_UNIFORM     = 0x92F3;
enum GL_TRANSFORM_FEEDBACK_VARYING     = 0x92F4;
enum GL_ACTIVE_RESOURCES               = 0x92F5;
enum GL_MAX_NAME_LENGTH                = 0x92F6;
enum GL_MAX_NUM_ACTIVE_VARIABLES       = 0x92F7;
enum GL_MAX_NUM_COMPATIBLE_SUBROUTINES = 0x92F8;
enum GL_NAME_LENGTH                    = 0x92F9;
enum GL_TYPE                           = 0x92FA;
enum GL_ARRAY_SIZE                     = 0x92FB;
enum GL_OFFSET                         = 0x92FC;
enum GL_BLOCK_INDEX                    = 0x92FD;
enum GL_ARRAY_STRIDE                   = 0x92FE;
enum GL_MATRIX_STRIDE                  = 0x92FF;
enum GL_IS_ROW_MAJOR                   = 0x9300;
enum GL_ATOMIC_COUNTER_BUFFER_INDEX    = 0x9301;
enum GL_BUFFER_BINDING                 = 0x9302;
enum GL_BUFFER_DATA_SIZE               = 0x9303;
enum GL_NUM_ACTIVE_VARIABLES           = 0x9304;
enum GL_ACTIVE_VARIABLES               = 0x9305;
enum GL_REFERENCED_BY_VERTEX_SHADER    = 0x9306;
enum GL_REFERENCED_BY_TESS_CONTROL_SHADER = 0x9307;
enum GL_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x9308;
enum GL_REFERENCED_BY_GEOMETRY_SHADER  = 0x9309;
enum GL_REFERENCED_BY_FRAGMENT_SHADER  = 0x930A;
enum GL_REFERENCED_BY_COMPUTE_SHADER   = 0x930B;
enum GL_TOP_LEVEL_ARRAY_SIZE           = 0x930C;
enum GL_TOP_LEVEL_ARRAY_STRIDE         = 0x930D;
enum GL_LOCATION                       = 0x930E;
enum GL_LOCATION_INDEX                 = 0x930F;
enum GL_IS_PER_PATCH                   = 0x92E7;
/* reuse GL_NUM_COMPATIBLE_SUBROUTINES */
/* reuse GL_COMPATIBLE_SUBROUTINES */
}

version (GL_ARB_robust_buffer_access_behavior) {} else {
}

version (GL_ARB_shader_image_size) {} else {
}

version (GL_ARB_shader_storage_buffer_object) {} else {
enum GL_SHADER_STORAGE_BUFFER          = 0x90D2;
enum GL_SHADER_STORAGE_BUFFER_BINDING  = 0x90D3;
enum GL_SHADER_STORAGE_BUFFER_START    = 0x90D4;
enum GL_SHADER_STORAGE_BUFFER_SIZE     = 0x90D5;
enum GL_MAX_VERTEX_SHADER_STORAGE_BLOCKS = 0x90D6;
enum GL_MAX_GEOMETRY_SHADER_STORAGE_BLOCKS = 0x90D7;
enum GL_MAX_TESS_CONTROL_SHADER_STORAGE_BLOCKS = 0x90D8;
enum GL_MAX_TESS_EVALUATION_SHADER_STORAGE_BLOCKS = 0x90D9;
enum GL_MAX_FRAGMENT_SHADER_STORAGE_BLOCKS = 0x90DA;
enum GL_MAX_COMPUTE_SHADER_STORAGE_BLOCKS = 0x90DB;
enum GL_MAX_COMBINED_SHADER_STORAGE_BLOCKS = 0x90DC;
enum GL_MAX_SHADER_STORAGE_BUFFER_BINDINGS = 0x90DD;
enum GL_MAX_SHADER_STORAGE_BLOCK_SIZE  = 0x90DE;
enum GL_SHADER_STORAGE_BUFFER_OFFSET_ALIGNMENT = 0x90DF;
enum GL_SHADER_STORAGE_BARRIER_BIT     = 0x2000;
enum GL_MAX_COMBINED_SHADER_OUTPUT_RESOURCES = GL_MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS;
/* reuse GL_MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS */
}

version (GL_ARB_stencil_texturing) {} else {
enum GL_DEPTH_STENCIL_TEXTURE_MODE     = 0x90EA;
}

version (GL_ARB_texture_buffer_range) {} else {
enum GL_TEXTURE_BUFFER_OFFSET          = 0x919D;
enum GL_TEXTURE_BUFFER_SIZE            = 0x919E;
enum GL_TEXTURE_BUFFER_OFFSET_ALIGNMENT = 0x919F;
}

version (GL_ARB_texture_query_levels) {} else {
}

version (GL_ARB_texture_storage_multisample) {} else {
}

version (GL_EXT_abgr) {} else {
enum GL_ABGR_EXT                       = 0x8000;
}

version (GL_EXT_blend_color) {} else {
enum GL_CONSTANT_COLOR_EXT             = 0x8001;
enum GL_ONE_MINUS_CONSTANT_COLOR_EXT   = 0x8002;
enum GL_CONSTANT_ALPHA_EXT             = 0x8003;
enum GL_ONE_MINUS_CONSTANT_ALPHA_EXT   = 0x8004;
enum GL_BLEND_COLOR_EXT                = 0x8005;
}

version (GL_EXT_polygon_offset) {} else {
enum GL_POLYGON_OFFSET_EXT             = 0x8037;
enum GL_POLYGON_OFFSET_FACTOR_EXT      = 0x8038;
enum GL_POLYGON_OFFSET_BIAS_EXT        = 0x8039;
}

version (GL_EXT_texture) {} else {
enum GL_ALPHA4_EXT                     = 0x803B;
enum GL_ALPHA8_EXT                     = 0x803C;
enum GL_ALPHA12_EXT                    = 0x803D;
enum GL_ALPHA16_EXT                    = 0x803E;
enum GL_LUMINANCE4_EXT                 = 0x803F;
enum GL_LUMINANCE8_EXT                 = 0x8040;
enum GL_LUMINANCE12_EXT                = 0x8041;
enum GL_LUMINANCE16_EXT                = 0x8042;
enum GL_LUMINANCE4_ALPHA4_EXT          = 0x8043;
enum GL_LUMINANCE6_ALPHA2_EXT          = 0x8044;
enum GL_LUMINANCE8_ALPHA8_EXT          = 0x8045;
enum GL_LUMINANCE12_ALPHA4_EXT         = 0x8046;
enum GL_LUMINANCE12_ALPHA12_EXT        = 0x8047;
enum GL_LUMINANCE16_ALPHA16_EXT        = 0x8048;
enum GL_INTENSITY_EXT                  = 0x8049;
enum GL_INTENSITY4_EXT                 = 0x804A;
enum GL_INTENSITY8_EXT                 = 0x804B;
enum GL_INTENSITY12_EXT                = 0x804C;
enum GL_INTENSITY16_EXT                = 0x804D;
enum GL_RGB2_EXT                       = 0x804E;
enum GL_RGB4_EXT                       = 0x804F;
enum GL_RGB5_EXT                       = 0x8050;
enum GL_RGB8_EXT                       = 0x8051;
enum GL_RGB10_EXT                      = 0x8052;
enum GL_RGB12_EXT                      = 0x8053;
enum GL_RGB16_EXT                      = 0x8054;
enum GL_RGBA2_EXT                      = 0x8055;
enum GL_RGBA4_EXT                      = 0x8056;
enum GL_RGB5_A1_EXT                    = 0x8057;
enum GL_RGBA8_EXT                      = 0x8058;
enum GL_RGB10_A2_EXT                   = 0x8059;
enum GL_RGBA12_EXT                     = 0x805A;
enum GL_RGBA16_EXT                     = 0x805B;
enum GL_TEXTURE_RED_SIZE_EXT           = 0x805C;
enum GL_TEXTURE_GREEN_SIZE_EXT         = 0x805D;
enum GL_TEXTURE_BLUE_SIZE_EXT          = 0x805E;
enum GL_TEXTURE_ALPHA_SIZE_EXT         = 0x805F;
enum GL_TEXTURE_LUMINANCE_SIZE_EXT     = 0x8060;
enum GL_TEXTURE_INTENSITY_SIZE_EXT     = 0x8061;
enum GL_REPLACE_EXT                    = 0x8062;
enum GL_PROXY_TEXTURE_1D_EXT           = 0x8063;
enum GL_PROXY_TEXTURE_2D_EXT           = 0x8064;
enum GL_TEXTURE_TOO_LARGE_EXT          = 0x8065;
}

version (GL_EXT_texture3D) {} else {
enum GL_PACK_SKIP_IMAGES_EXT           = 0x806B;
enum GL_PACK_IMAGE_HEIGHT_EXT          = 0x806C;
enum GL_UNPACK_SKIP_IMAGES_EXT         = 0x806D;
enum GL_UNPACK_IMAGE_HEIGHT_EXT        = 0x806E;
enum GL_TEXTURE_3D_EXT                 = 0x806F;
enum GL_PROXY_TEXTURE_3D_EXT           = 0x8070;
enum GL_TEXTURE_DEPTH_EXT              = 0x8071;
enum GL_TEXTURE_WRAP_R_EXT             = 0x8072;
enum GL_MAX_3D_TEXTURE_SIZE_EXT        = 0x8073;
}

version (GL_SGIS_texture_filter4) {} else {
enum GL_FILTER4_SGIS                   = 0x8146;
enum GL_TEXTURE_FILTER4_SIZE_SGIS      = 0x8147;
}

version (GL_EXT_subtexture) {} else {
}

version (GL_EXT_copy_texture) {} else {
}

version (GL_EXT_histogram) {} else {
enum GL_HISTOGRAM_EXT                  = 0x8024;
enum GL_PROXY_HISTOGRAM_EXT            = 0x8025;
enum GL_HISTOGRAM_WIDTH_EXT            = 0x8026;
enum GL_HISTOGRAM_FORMAT_EXT           = 0x8027;
enum GL_HISTOGRAM_RED_SIZE_EXT         = 0x8028;
enum GL_HISTOGRAM_GREEN_SIZE_EXT       = 0x8029;
enum GL_HISTOGRAM_BLUE_SIZE_EXT        = 0x802A;
enum GL_HISTOGRAM_ALPHA_SIZE_EXT       = 0x802B;
enum GL_HISTOGRAM_LUMINANCE_SIZE_EXT   = 0x802C;
enum GL_HISTOGRAM_SINK_EXT             = 0x802D;
enum GL_MINMAX_EXT                     = 0x802E;
enum GL_MINMAX_FORMAT_EXT              = 0x802F;
enum GL_MINMAX_SINK_EXT                = 0x8030;
enum GL_TABLE_TOO_LARGE_EXT            = 0x8031;
}

version (GL_EXT_convolution) {} else {
enum GL_CONVOLUTION_1D_EXT             = 0x8010;
enum GL_CONVOLUTION_2D_EXT             = 0x8011;
enum GL_SEPARABLE_2D_EXT               = 0x8012;
enum GL_CONVOLUTION_BORDER_MODE_EXT    = 0x8013;
enum GL_CONVOLUTION_FILTER_SCALE_EXT   = 0x8014;
enum GL_CONVOLUTION_FILTER_BIAS_EXT    = 0x8015;
enum GL_REDUCE_EXT                     = 0x8016;
enum GL_CONVOLUTION_FORMAT_EXT         = 0x8017;
enum GL_CONVOLUTION_WIDTH_EXT          = 0x8018;
enum GL_CONVOLUTION_HEIGHT_EXT         = 0x8019;
enum GL_MAX_CONVOLUTION_WIDTH_EXT      = 0x801A;
enum GL_MAX_CONVOLUTION_HEIGHT_EXT     = 0x801B;
enum GL_POST_CONVOLUTION_RED_SCALE_EXT = 0x801C;
enum GL_POST_CONVOLUTION_GREEN_SCALE_EXT = 0x801D;
enum GL_POST_CONVOLUTION_BLUE_SCALE_EXT = 0x801E;
enum GL_POST_CONVOLUTION_ALPHA_SCALE_EXT = 0x801F;
enum GL_POST_CONVOLUTION_RED_BIAS_EXT  = 0x8020;
enum GL_POST_CONVOLUTION_GREEN_BIAS_EXT = 0x8021;
enum GL_POST_CONVOLUTION_BLUE_BIAS_EXT = 0x8022;
enum GL_POST_CONVOLUTION_ALPHA_BIAS_EXT = 0x8023;
}

version (GL_SGI_color_matrix) {} else {
enum GL_COLOR_MATRIX_SGI               = 0x80B1;
enum GL_COLOR_MATRIX_STACK_DEPTH_SGI   = 0x80B2;
enum GL_MAX_COLOR_MATRIX_STACK_DEPTH_SGI = 0x80B3;
enum GL_POST_COLOR_MATRIX_RED_SCALE_SGI = 0x80B4;
enum GL_POST_COLOR_MATRIX_GREEN_SCALE_SGI = 0x80B5;
enum GL_POST_COLOR_MATRIX_BLUE_SCALE_SGI = 0x80B6;
enum GL_POST_COLOR_MATRIX_ALPHA_SCALE_SGI = 0x80B7;
enum GL_POST_COLOR_MATRIX_RED_BIAS_SGI = 0x80B8;
enum GL_POST_COLOR_MATRIX_GREEN_BIAS_SGI = 0x80B9;
enum GL_POST_COLOR_MATRIX_BLUE_BIAS_SGI = 0x80BA;
enum GL_POST_COLOR_MATRIX_ALPHA_BIAS_SGI = 0x80BB;
}

version (GL_SGI_color_table) {} else {
enum GL_COLOR_TABLE_SGI                = 0x80D0;
enum GL_POST_CONVOLUTION_COLOR_TABLE_SGI = 0x80D1;
enum GL_POST_COLOR_MATRIX_COLOR_TABLE_SGI = 0x80D2;
enum GL_PROXY_COLOR_TABLE_SGI          = 0x80D3;
enum GL_PROXY_POST_CONVOLUTION_COLOR_TABLE_SGI = 0x80D4;
enum GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE_SGI = 0x80D5;
enum GL_COLOR_TABLE_SCALE_SGI          = 0x80D6;
enum GL_COLOR_TABLE_BIAS_SGI           = 0x80D7;
enum GL_COLOR_TABLE_FORMAT_SGI         = 0x80D8;
enum GL_COLOR_TABLE_WIDTH_SGI          = 0x80D9;
enum GL_COLOR_TABLE_RED_SIZE_SGI       = 0x80DA;
enum GL_COLOR_TABLE_GREEN_SIZE_SGI     = 0x80DB;
enum GL_COLOR_TABLE_BLUE_SIZE_SGI      = 0x80DC;
enum GL_COLOR_TABLE_ALPHA_SIZE_SGI     = 0x80DD;
enum GL_COLOR_TABLE_LUMINANCE_SIZE_SGI = 0x80DE;
enum GL_COLOR_TABLE_INTENSITY_SIZE_SGI = 0x80DF;
}

version (GL_SGIS_pixel_texture) {} else {
enum GL_PIXEL_TEXTURE_SGIS             = 0x8353;
enum GL_PIXEL_FRAGMENT_RGB_SOURCE_SGIS = 0x8354;
enum GL_PIXEL_FRAGMENT_ALPHA_SOURCE_SGIS = 0x8355;
enum GL_PIXEL_GROUP_COLOR_SGIS         = 0x8356;
}

version (GL_SGIX_pixel_texture) {} else {
enum GL_PIXEL_TEX_GEN_SGIX             = 0x8139;
enum GL_PIXEL_TEX_GEN_MODE_SGIX        = 0x832B;
}

version (GL_SGIS_texture4D) {} else {
enum GL_PACK_SKIP_VOLUMES_SGIS         = 0x8130;
enum GL_PACK_IMAGE_DEPTH_SGIS          = 0x8131;
enum GL_UNPACK_SKIP_VOLUMES_SGIS       = 0x8132;
enum GL_UNPACK_IMAGE_DEPTH_SGIS        = 0x8133;
enum GL_TEXTURE_4D_SGIS                = 0x8134;
enum GL_PROXY_TEXTURE_4D_SGIS          = 0x8135;
enum GL_TEXTURE_4DSIZE_SGIS            = 0x8136;
enum GL_TEXTURE_WRAP_Q_SGIS            = 0x8137;
enum GL_MAX_4D_TEXTURE_SIZE_SGIS       = 0x8138;
enum GL_TEXTURE_4D_BINDING_SGIS        = 0x814F;
}

version (GL_SGI_texture_color_table) {} else {
enum GL_TEXTURE_COLOR_TABLE_SGI        = 0x80BC;
enum GL_PROXY_TEXTURE_COLOR_TABLE_SGI  = 0x80BD;
}

version (GL_EXT_cmyka) {} else {
enum GL_CMYK_EXT                       = 0x800C;
enum GL_CMYKA_EXT                      = 0x800D;
enum GL_PACK_CMYK_HINT_EXT             = 0x800E;
enum GL_UNPACK_CMYK_HINT_EXT           = 0x800F;
}

version (GL_EXT_texture_object) {} else {
enum GL_TEXTURE_PRIORITY_EXT           = 0x8066;
enum GL_TEXTURE_RESIDENT_EXT           = 0x8067;
enum GL_TEXTURE_1D_BINDING_EXT         = 0x8068;
enum GL_TEXTURE_2D_BINDING_EXT         = 0x8069;
enum GL_TEXTURE_3D_BINDING_EXT         = 0x806A;
}

version (GL_SGIS_detail_texture) {} else {
enum GL_DETAIL_TEXTURE_2D_SGIS         = 0x8095;
enum GL_DETAIL_TEXTURE_2D_BINDING_SGIS = 0x8096;
enum GL_LINEAR_DETAIL_SGIS             = 0x8097;
enum GL_LINEAR_DETAIL_ALPHA_SGIS       = 0x8098;
enum GL_LINEAR_DETAIL_COLOR_SGIS       = 0x8099;
enum GL_DETAIL_TEXTURE_LEVEL_SGIS      = 0x809A;
enum GL_DETAIL_TEXTURE_MODE_SGIS       = 0x809B;
enum GL_DETAIL_TEXTURE_FUNC_POINTS_SGIS = 0x809C;
}

version (GL_SGIS_sharpen_texture) {} else {
enum GL_LINEAR_SHARPEN_SGIS            = 0x80AD;
enum GL_LINEAR_SHARPEN_ALPHA_SGIS      = 0x80AE;
enum GL_LINEAR_SHARPEN_COLOR_SGIS      = 0x80AF;
enum GL_SHARPEN_TEXTURE_FUNC_POINTS_SGIS = 0x80B0;
}

version (GL_EXT_packed_pixels) {} else {
enum GL_UNSIGNED_BYTE_3_3_2_EXT        = 0x8032;
enum GL_UNSIGNED_SHORT_4_4_4_4_EXT     = 0x8033;
enum GL_UNSIGNED_SHORT_5_5_5_1_EXT     = 0x8034;
enum GL_UNSIGNED_INT_8_8_8_8_EXT       = 0x8035;
enum GL_UNSIGNED_INT_10_10_10_2_EXT    = 0x8036;
}

version (GL_SGIS_texture_lod) {} else {
enum GL_TEXTURE_MIN_LOD_SGIS           = 0x813A;
enum GL_TEXTURE_MAX_LOD_SGIS           = 0x813B;
enum GL_TEXTURE_BASE_LEVEL_SGIS        = 0x813C;
enum GL_TEXTURE_MAX_LEVEL_SGIS         = 0x813D;
}

version (GL_SGIS_multisample) {} else {
enum GL_MULTISAMPLE_SGIS               = 0x809D;
enum GL_SAMPLE_ALPHA_TO_MASK_SGIS      = 0x809E;
enum GL_SAMPLE_ALPHA_TO_ONE_SGIS       = 0x809F;
enum GL_SAMPLE_MASK_SGIS               = 0x80A0;
enum GL_1PASS_SGIS                     = 0x80A1;
enum GL_2PASS_0_SGIS                   = 0x80A2;
enum GL_2PASS_1_SGIS                   = 0x80A3;
enum GL_4PASS_0_SGIS                   = 0x80A4;
enum GL_4PASS_1_SGIS                   = 0x80A5;
enum GL_4PASS_2_SGIS                   = 0x80A6;
enum GL_4PASS_3_SGIS                   = 0x80A7;
enum GL_SAMPLE_BUFFERS_SGIS            = 0x80A8;
enum GL_SAMPLES_SGIS                   = 0x80A9;
enum GL_SAMPLE_MASK_VALUE_SGIS         = 0x80AA;
enum GL_SAMPLE_MASK_INVERT_SGIS        = 0x80AB;
enum GL_SAMPLE_PATTERN_SGIS            = 0x80AC;
}

version (GL_EXT_rescale_normal) {} else {
enum GL_RESCALE_NORMAL_EXT             = 0x803A;
}

version (GL_EXT_vertex_array) {} else {
enum GL_VERTEX_ARRAY_EXT               = 0x8074;
enum GL_NORMAL_ARRAY_EXT               = 0x8075;
enum GL_COLOR_ARRAY_EXT                = 0x8076;
enum GL_INDEX_ARRAY_EXT                = 0x8077;
enum GL_TEXTURE_COORD_ARRAY_EXT        = 0x8078;
enum GL_EDGE_FLAG_ARRAY_EXT            = 0x8079;
enum GL_VERTEX_ARRAY_SIZE_EXT          = 0x807A;
enum GL_VERTEX_ARRAY_TYPE_EXT          = 0x807B;
enum GL_VERTEX_ARRAY_STRIDE_EXT        = 0x807C;
enum GL_VERTEX_ARRAY_COUNT_EXT         = 0x807D;
enum GL_NORMAL_ARRAY_TYPE_EXT          = 0x807E;
enum GL_NORMAL_ARRAY_STRIDE_EXT        = 0x807F;
enum GL_NORMAL_ARRAY_COUNT_EXT         = 0x8080;
enum GL_COLOR_ARRAY_SIZE_EXT           = 0x8081;
enum GL_COLOR_ARRAY_TYPE_EXT           = 0x8082;
enum GL_COLOR_ARRAY_STRIDE_EXT         = 0x8083;
enum GL_COLOR_ARRAY_COUNT_EXT          = 0x8084;
enum GL_INDEX_ARRAY_TYPE_EXT           = 0x8085;
enum GL_INDEX_ARRAY_STRIDE_EXT         = 0x8086;
enum GL_INDEX_ARRAY_COUNT_EXT          = 0x8087;
enum GL_TEXTURE_COORD_ARRAY_SIZE_EXT   = 0x8088;
enum GL_TEXTURE_COORD_ARRAY_TYPE_EXT   = 0x8089;
enum GL_TEXTURE_COORD_ARRAY_STRIDE_EXT = 0x808A;
enum GL_TEXTURE_COORD_ARRAY_COUNT_EXT  = 0x808B;
enum GL_EDGE_FLAG_ARRAY_STRIDE_EXT     = 0x808C;
enum GL_EDGE_FLAG_ARRAY_COUNT_EXT      = 0x808D;
enum GL_VERTEX_ARRAY_POINTER_EXT       = 0x808E;
enum GL_NORMAL_ARRAY_POINTER_EXT       = 0x808F;
enum GL_COLOR_ARRAY_POINTER_EXT        = 0x8090;
enum GL_INDEX_ARRAY_POINTER_EXT        = 0x8091;
enum GL_TEXTURE_COORD_ARRAY_POINTER_EXT = 0x8092;
enum GL_EDGE_FLAG_ARRAY_POINTER_EXT    = 0x8093;
}

version (GL_EXT_misc_attribute) {} else {
}

version (GL_SGIS_generate_mipmap) {} else {
enum GL_GENERATE_MIPMAP_SGIS           = 0x8191;
enum GL_GENERATE_MIPMAP_HINT_SGIS      = 0x8192;
}

version (GL_SGIX_clipmap) {} else {
enum GL_LINEAR_CLIPMAP_LINEAR_SGIX     = 0x8170;
enum GL_TEXTURE_CLIPMAP_CENTER_SGIX    = 0x8171;
enum GL_TEXTURE_CLIPMAP_FRAME_SGIX     = 0x8172;
enum GL_TEXTURE_CLIPMAP_OFFSET_SGIX    = 0x8173;
enum GL_TEXTURE_CLIPMAP_VIRTUAL_DEPTH_SGIX = 0x8174;
enum GL_TEXTURE_CLIPMAP_LOD_OFFSET_SGIX = 0x8175;
enum GL_TEXTURE_CLIPMAP_DEPTH_SGIX     = 0x8176;
enum GL_MAX_CLIPMAP_DEPTH_SGIX         = 0x8177;
enum GL_MAX_CLIPMAP_VIRTUAL_DEPTH_SGIX = 0x8178;
enum GL_NEAREST_CLIPMAP_NEAREST_SGIX   = 0x844D;
enum GL_NEAREST_CLIPMAP_LINEAR_SGIX    = 0x844E;
enum GL_LINEAR_CLIPMAP_NEAREST_SGIX    = 0x844F;
}

version (GL_SGIX_shadow) {} else {
enum GL_TEXTURE_COMPARE_SGIX           = 0x819A;
enum GL_TEXTURE_COMPARE_OPERATOR_SGIX  = 0x819B;
enum GL_TEXTURE_LEQUAL_R_SGIX          = 0x819C;
enum GL_TEXTURE_GEQUAL_R_SGIX          = 0x819D;
}

version (GL_SGIS_texture_edge_clamp) {} else {
enum GL_CLAMP_TO_EDGE_SGIS             = 0x812F;
}

version (GL_SGIS_texture_border_clamp) {} else {
enum GL_CLAMP_TO_BORDER_SGIS           = 0x812D;
}

version (GL_EXT_blend_minmax) {} else {
enum GL_FUNC_ADD_EXT                   = 0x8006;
enum GL_MIN_EXT                        = 0x8007;
enum GL_MAX_EXT                        = 0x8008;
enum GL_BLEND_EQUATION_EXT             = 0x8009;
}

version (GL_EXT_blend_subtract) {} else {
enum GL_FUNC_SUBTRACT_EXT              = 0x800A;
enum GL_FUNC_REVERSE_SUBTRACT_EXT      = 0x800B;
}

version (GL_EXT_blend_logic_op) {} else {
}

version (GL_SGIX_interlace) {} else {
enum GL_INTERLACE_SGIX                 = 0x8094;
}

version (GL_SGIX_pixel_tiles) {} else {
enum GL_PIXEL_TILE_BEST_ALIGNMENT_SGIX = 0x813E;
enum GL_PIXEL_TILE_CACHE_INCREMENT_SGIX = 0x813F;
enum GL_PIXEL_TILE_WIDTH_SGIX          = 0x8140;
enum GL_PIXEL_TILE_HEIGHT_SGIX         = 0x8141;
enum GL_PIXEL_TILE_GRID_WIDTH_SGIX     = 0x8142;
enum GL_PIXEL_TILE_GRID_HEIGHT_SGIX    = 0x8143;
enum GL_PIXEL_TILE_GRID_DEPTH_SGIX     = 0x8144;
enum GL_PIXEL_TILE_CACHE_SIZE_SGIX     = 0x8145;
}

version (GL_SGIS_texture_select) {} else {
enum GL_DUAL_ALPHA4_SGIS               = 0x8110;
enum GL_DUAL_ALPHA8_SGIS               = 0x8111;
enum GL_DUAL_ALPHA12_SGIS              = 0x8112;
enum GL_DUAL_ALPHA16_SGIS              = 0x8113;
enum GL_DUAL_LUMINANCE4_SGIS           = 0x8114;
enum GL_DUAL_LUMINANCE8_SGIS           = 0x8115;
enum GL_DUAL_LUMINANCE12_SGIS          = 0x8116;
enum GL_DUAL_LUMINANCE16_SGIS          = 0x8117;
enum GL_DUAL_INTENSITY4_SGIS           = 0x8118;
enum GL_DUAL_INTENSITY8_SGIS           = 0x8119;
enum GL_DUAL_INTENSITY12_SGIS          = 0x811A;
enum GL_DUAL_INTENSITY16_SGIS          = 0x811B;
enum GL_DUAL_LUMINANCE_ALPHA4_SGIS     = 0x811C;
enum GL_DUAL_LUMINANCE_ALPHA8_SGIS     = 0x811D;
enum GL_QUAD_ALPHA4_SGIS               = 0x811E;
enum GL_QUAD_ALPHA8_SGIS               = 0x811F;
enum GL_QUAD_LUMINANCE4_SGIS           = 0x8120;
enum GL_QUAD_LUMINANCE8_SGIS           = 0x8121;
enum GL_QUAD_INTENSITY4_SGIS           = 0x8122;
enum GL_QUAD_INTENSITY8_SGIS           = 0x8123;
enum GL_DUAL_TEXTURE_SELECT_SGIS       = 0x8124;
enum GL_QUAD_TEXTURE_SELECT_SGIS       = 0x8125;
}

version (GL_SGIX_sprite) {} else {
enum GL_SPRITE_SGIX                    = 0x8148;
enum GL_SPRITE_MODE_SGIX               = 0x8149;
enum GL_SPRITE_AXIS_SGIX               = 0x814A;
enum GL_SPRITE_TRANSLATION_SGIX        = 0x814B;
enum GL_SPRITE_AXIAL_SGIX              = 0x814C;
enum GL_SPRITE_OBJECT_ALIGNED_SGIX     = 0x814D;
enum GL_SPRITE_EYE_ALIGNED_SGIX        = 0x814E;
}

version (GL_SGIX_texture_multi_buffer) {} else {
enum GL_TEXTURE_MULTI_BUFFER_HINT_SGIX = 0x812E;
}

version (GL_EXT_point_parameters) {} else {
enum GL_POINT_SIZE_MIN_EXT             = 0x8126;
enum GL_POINT_SIZE_MAX_EXT             = 0x8127;
enum GL_POINT_FADE_THRESHOLD_SIZE_EXT  = 0x8128;
enum GL_DISTANCE_ATTENUATION_EXT       = 0x8129;
}

version (GL_SGIS_point_parameters) {} else {
enum GL_POINT_SIZE_MIN_SGIS            = 0x8126;
enum GL_POINT_SIZE_MAX_SGIS            = 0x8127;
enum GL_POINT_FADE_THRESHOLD_SIZE_SGIS = 0x8128;
enum GL_DISTANCE_ATTENUATION_SGIS      = 0x8129;
}

version (GL_SGIX_instruments) {} else {
enum GL_INSTRUMENT_BUFFER_POINTER_SGIX = 0x8180;
enum GL_INSTRUMENT_MEASUREMENTS_SGIX   = 0x8181;
}

version (GL_SGIX_texture_scale_bias) {} else {
enum GL_POST_TEXTURE_FILTER_BIAS_SGIX  = 0x8179;
enum GL_POST_TEXTURE_FILTER_SCALE_SGIX = 0x817A;
enum GL_POST_TEXTURE_FILTER_BIAS_RANGE_SGIX = 0x817B;
enum GL_POST_TEXTURE_FILTER_SCALE_RANGE_SGIX = 0x817C;
}

version (GL_SGIX_framezoom) {} else {
enum GL_FRAMEZOOM_SGIX                 = 0x818B;
enum GL_FRAMEZOOM_FACTOR_SGIX          = 0x818C;
enum GL_MAX_FRAMEZOOM_FACTOR_SGIX      = 0x818D;
}

version (GL_SGIX_tag_sample_buffer) {} else {
}

version (GL_FfdMaskSGIX) {} else {
enum GL_TEXTURE_DEFORMATION_BIT_SGIX   = 0x00000001;
enum GL_GEOMETRY_DEFORMATION_BIT_SGIX  = 0x00000002;
}

version (GL_SGIX_polynomial_ffd) {} else {
enum GL_GEOMETRY_DEFORMATION_SGIX      = 0x8194;
enum GL_TEXTURE_DEFORMATION_SGIX       = 0x8195;
enum GL_DEFORMATIONS_MASK_SGIX         = 0x8196;
enum GL_MAX_DEFORMATION_ORDER_SGIX     = 0x8197;
}

version (GL_SGIX_reference_plane) {} else {
enum GL_REFERENCE_PLANE_SGIX           = 0x817D;
enum GL_REFERENCE_PLANE_EQUATION_SGIX  = 0x817E;
}

version (GL_SGIX_flush_raster) {} else {
}

version (GL_SGIX_depth_texture) {} else {
enum GL_DEPTH_COMPONENT16_SGIX         = 0x81A5;
enum GL_DEPTH_COMPONENT24_SGIX         = 0x81A6;
enum GL_DEPTH_COMPONENT32_SGIX         = 0x81A7;
}

version (GL_SGIS_fog_function) {} else {
enum GL_FOG_FUNC_SGIS                  = 0x812A;
enum GL_FOG_FUNC_POINTS_SGIS           = 0x812B;
enum GL_MAX_FOG_FUNC_POINTS_SGIS       = 0x812C;
}

version (GL_SGIX_fog_offset) {} else {
enum GL_FOG_OFFSET_SGIX                = 0x8198;
enum GL_FOG_OFFSET_VALUE_SGIX          = 0x8199;
}

version (GL_HP_image_transform) {} else {
enum GL_IMAGE_SCALE_X_HP               = 0x8155;
enum GL_IMAGE_SCALE_Y_HP               = 0x8156;
enum GL_IMAGE_TRANSLATE_X_HP           = 0x8157;
enum GL_IMAGE_TRANSLATE_Y_HP           = 0x8158;
enum GL_IMAGE_ROTATE_ANGLE_HP          = 0x8159;
enum GL_IMAGE_ROTATE_ORIGIN_X_HP       = 0x815A;
enum GL_IMAGE_ROTATE_ORIGIN_Y_HP       = 0x815B;
enum GL_IMAGE_MAG_FILTER_HP            = 0x815C;
enum GL_IMAGE_MIN_FILTER_HP            = 0x815D;
enum GL_IMAGE_CUBIC_WEIGHT_HP          = 0x815E;
enum GL_CUBIC_HP                       = 0x815F;
enum GL_AVERAGE_HP                     = 0x8160;
enum GL_IMAGE_TRANSFORM_2D_HP          = 0x8161;
enum GL_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP = 0x8162;
enum GL_PROXY_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP = 0x8163;
}

version (GL_HP_convolution_border_modes) {} else {
enum GL_IGNORE_BORDER_HP               = 0x8150;
enum GL_CONSTANT_BORDER_HP             = 0x8151;
enum GL_REPLICATE_BORDER_HP            = 0x8153;
enum GL_CONVOLUTION_BORDER_COLOR_HP    = 0x8154;
}

version (GL_INGR_palette_buffer) {} else {
}

version (GL_SGIX_texture_add_env) {} else {
enum GL_TEXTURE_ENV_BIAS_SGIX          = 0x80BE;
}

version (GL_EXT_color_subtable) {} else {
}

version (GL_PGI_vertex_hints) {} else {
enum GL_VERTEX_DATA_HINT_PGI           = 0x1A22A;
enum GL_VERTEX_CONSISTENT_HINT_PGI     = 0x1A22B;
enum GL_MATERIAL_SIDE_HINT_PGI         = 0x1A22C;
enum GL_MAX_VERTEX_HINT_PGI            = 0x1A22D;
enum GL_COLOR3_BIT_PGI                 = 0x00010000;
enum GL_COLOR4_BIT_PGI                 = 0x00020000;
enum GL_EDGEFLAG_BIT_PGI               = 0x00040000;
enum GL_INDEX_BIT_PGI                  = 0x00080000;
enum GL_MAT_AMBIENT_BIT_PGI            = 0x00100000;
enum GL_MAT_AMBIENT_AND_DIFFUSE_BIT_PGI = 0x00200000;
enum GL_MAT_DIFFUSE_BIT_PGI            = 0x00400000;
enum GL_MAT_EMISSION_BIT_PGI           = 0x00800000;
enum GL_MAT_COLOR_INDEXES_BIT_PGI      = 0x01000000;
enum GL_MAT_SHININESS_BIT_PGI          = 0x02000000;
enum GL_MAT_SPECULAR_BIT_PGI           = 0x04000000;
enum GL_NORMAL_BIT_PGI                 = 0x08000000;
enum GL_TEXCOORD1_BIT_PGI              = 0x10000000;
enum GL_TEXCOORD2_BIT_PGI              = 0x20000000;
enum GL_TEXCOORD3_BIT_PGI              = 0x40000000;
enum GL_TEXCOORD4_BIT_PGI              = 0x80000000;
enum GL_VERTEX23_BIT_PGI               = 0x00000004;
enum GL_VERTEX4_BIT_PGI                = 0x00000008;
}

version (GL_PGI_misc_hints) {} else {
enum GL_PREFER_DOUBLEBUFFER_HINT_PGI   = 0x1A1F8;
enum GL_CONSERVE_MEMORY_HINT_PGI       = 0x1A1FD;
enum GL_RECLAIM_MEMORY_HINT_PGI        = 0x1A1FE;
enum GL_NATIVE_GRAPHICS_HANDLE_PGI     = 0x1A202;
enum GL_NATIVE_GRAPHICS_BEGIN_HINT_PGI = 0x1A203;
enum GL_NATIVE_GRAPHICS_END_HINT_PGI   = 0x1A204;
enum GL_ALWAYS_FAST_HINT_PGI           = 0x1A20C;
enum GL_ALWAYS_SOFT_HINT_PGI           = 0x1A20D;
enum GL_ALLOW_DRAW_OBJ_HINT_PGI        = 0x1A20E;
enum GL_ALLOW_DRAW_WIN_HINT_PGI        = 0x1A20F;
enum GL_ALLOW_DRAW_FRG_HINT_PGI        = 0x1A210;
enum GL_ALLOW_DRAW_MEM_HINT_PGI        = 0x1A211;
enum GL_STRICT_DEPTHFUNC_HINT_PGI      = 0x1A216;
enum GL_STRICT_LIGHTING_HINT_PGI       = 0x1A217;
enum GL_STRICT_SCISSOR_HINT_PGI        = 0x1A218;
enum GL_FULL_STIPPLE_HINT_PGI          = 0x1A219;
enum GL_CLIP_NEAR_HINT_PGI             = 0x1A220;
enum GL_CLIP_FAR_HINT_PGI              = 0x1A221;
enum GL_WIDE_LINE_HINT_PGI             = 0x1A222;
enum GL_BACK_NORMALS_HINT_PGI          = 0x1A223;
}

version (GL_EXT_paletted_texture) {} else {
enum GL_COLOR_INDEX1_EXT               = 0x80E2;
enum GL_COLOR_INDEX2_EXT               = 0x80E3;
enum GL_COLOR_INDEX4_EXT               = 0x80E4;
enum GL_COLOR_INDEX8_EXT               = 0x80E5;
enum GL_COLOR_INDEX12_EXT              = 0x80E6;
enum GL_COLOR_INDEX16_EXT              = 0x80E7;
enum GL_TEXTURE_INDEX_SIZE_EXT         = 0x80ED;
}

version (GL_EXT_clip_volume_hint) {} else {
enum GL_CLIP_VOLUME_CLIPPING_HINT_EXT  = 0x80F0;
}

version (GL_SGIX_list_priority) {} else {
enum GL_LIST_PRIORITY_SGIX             = 0x8182;
}

version (GL_SGIX_ir_instrument1) {} else {
enum GL_IR_INSTRUMENT1_SGIX            = 0x817F;
}

version (GL_SGIX_calligraphic_fragment) {} else {
enum GL_CALLIGRAPHIC_FRAGMENT_SGIX     = 0x8183;
}

version (GL_SGIX_texture_lod_bias) {} else {
enum GL_TEXTURE_LOD_BIAS_S_SGIX        = 0x818E;
enum GL_TEXTURE_LOD_BIAS_T_SGIX        = 0x818F;
enum GL_TEXTURE_LOD_BIAS_R_SGIX        = 0x8190;
}

version (GL_SGIX_shadow_ambient) {} else {
enum GL_SHADOW_AMBIENT_SGIX            = 0x80BF;
}

version (GL_EXT_index_texture) {} else {
}

version (GL_EXT_index_material) {} else {
enum GL_INDEX_MATERIAL_EXT             = 0x81B8;
enum GL_INDEX_MATERIAL_PARAMETER_EXT   = 0x81B9;
enum GL_INDEX_MATERIAL_FACE_EXT        = 0x81BA;
}

version (GL_EXT_index_func) {} else {
enum GL_INDEX_TEST_EXT                 = 0x81B5;
enum GL_INDEX_TEST_FUNC_EXT            = 0x81B6;
enum GL_INDEX_TEST_REF_EXT             = 0x81B7;
}

version (GL_EXT_index_array_formats) {} else {
enum GL_IUI_V2F_EXT                    = 0x81AD;
enum GL_IUI_V3F_EXT                    = 0x81AE;
enum GL_IUI_N3F_V2F_EXT                = 0x81AF;
enum GL_IUI_N3F_V3F_EXT                = 0x81B0;
enum GL_T2F_IUI_V2F_EXT                = 0x81B1;
enum GL_T2F_IUI_V3F_EXT                = 0x81B2;
enum GL_T2F_IUI_N3F_V2F_EXT            = 0x81B3;
enum GL_T2F_IUI_N3F_V3F_EXT            = 0x81B4;
}

version (GL_EXT_compiled_vertex_array) {} else {
enum GL_ARRAY_ELEMENT_LOCK_FIRST_EXT   = 0x81A8;
enum GL_ARRAY_ELEMENT_LOCK_COUNT_EXT   = 0x81A9;
}

version (GL_EXT_cull_vertex) {} else {
enum GL_CULL_VERTEX_EXT                = 0x81AA;
enum GL_CULL_VERTEX_EYE_POSITION_EXT   = 0x81AB;
enum GL_CULL_VERTEX_OBJECT_POSITION_EXT = 0x81AC;
}

version (GL_SGIX_ycrcb) {} else {
enum GL_YCRCB_422_SGIX                 = 0x81BB;
enum GL_YCRCB_444_SGIX                 = 0x81BC;
}

version (GL_SGIX_fragment_lighting) {} else {
enum GL_FRAGMENT_LIGHTING_SGIX         = 0x8400;
enum GL_FRAGMENT_COLOR_MATERIAL_SGIX   = 0x8401;
enum GL_FRAGMENT_COLOR_MATERIAL_FACE_SGIX = 0x8402;
enum GL_FRAGMENT_COLOR_MATERIAL_PARAMETER_SGIX = 0x8403;
enum GL_MAX_FRAGMENT_LIGHTS_SGIX       = 0x8404;
enum GL_MAX_ACTIVE_LIGHTS_SGIX         = 0x8405;
enum GL_CURRENT_RASTER_NORMAL_SGIX     = 0x8406;
enum GL_LIGHT_ENV_MODE_SGIX            = 0x8407;
enum GL_FRAGMENT_LIGHT_MODEL_LOCAL_VIEWER_SGIX = 0x8408;
enum GL_FRAGMENT_LIGHT_MODEL_TWO_SIDE_SGIX = 0x8409;
enum GL_FRAGMENT_LIGHT_MODEL_AMBIENT_SGIX = 0x840A;
enum GL_FRAGMENT_LIGHT_MODEL_NORMAL_INTERPOLATION_SGIX = 0x840B;
enum GL_FRAGMENT_LIGHT0_SGIX           = 0x840C;
enum GL_FRAGMENT_LIGHT1_SGIX           = 0x840D;
enum GL_FRAGMENT_LIGHT2_SGIX           = 0x840E;
enum GL_FRAGMENT_LIGHT3_SGIX           = 0x840F;
enum GL_FRAGMENT_LIGHT4_SGIX           = 0x8410;
enum GL_FRAGMENT_LIGHT5_SGIX           = 0x8411;
enum GL_FRAGMENT_LIGHT6_SGIX           = 0x8412;
enum GL_FRAGMENT_LIGHT7_SGIX           = 0x8413;
}

version (GL_IBM_rasterpos_clip) {} else {
enum GL_RASTER_POSITION_UNCLIPPED_IBM  = 0x19262;
}

version (GL_HP_texture_lighting) {} else {
enum GL_TEXTURE_LIGHTING_MODE_HP       = 0x8167;
enum GL_TEXTURE_POST_SPECULAR_HP       = 0x8168;
enum GL_TEXTURE_PRE_SPECULAR_HP        = 0x8169;
}

version (GL_EXT_draw_range_elements) {} else {
enum GL_MAX_ELEMENTS_VERTICES_EXT      = 0x80E8;
enum GL_MAX_ELEMENTS_INDICES_EXT       = 0x80E9;
}

version (GL_WIN_phong_shading) {} else {
enum GL_PHONG_WIN                      = 0x80EA;
enum GL_PHONG_HINT_WIN                 = 0x80EB;
}

version (GL_WIN_specular_fog) {} else {
enum GL_FOG_SPECULAR_TEXTURE_WIN       = 0x80EC;
}

version (GL_EXT_light_texture) {} else {
enum GL_FRAGMENT_MATERIAL_EXT          = 0x8349;
enum GL_FRAGMENT_NORMAL_EXT            = 0x834A;
enum GL_FRAGMENT_COLOR_EXT             = 0x834C;
enum GL_ATTENUATION_EXT                = 0x834D;
enum GL_SHADOW_ATTENUATION_EXT         = 0x834E;
enum GL_TEXTURE_APPLICATION_MODE_EXT   = 0x834F;
enum GL_TEXTURE_LIGHT_EXT              = 0x8350;
enum GL_TEXTURE_MATERIAL_FACE_EXT      = 0x8351;
enum GL_TEXTURE_MATERIAL_PARAMETER_EXT = 0x8352;
/* reuse GL_FRAGMENT_DEPTH_EXT */
}

version (GL_SGIX_blend_alpha_minmax) {} else {
enum GL_ALPHA_MIN_SGIX                 = 0x8320;
enum GL_ALPHA_MAX_SGIX                 = 0x8321;
}

version (GL_SGIX_impact_pixel_texture) {} else {
enum GL_PIXEL_TEX_GEN_Q_CEILING_SGIX   = 0x8184;
enum GL_PIXEL_TEX_GEN_Q_ROUND_SGIX     = 0x8185;
enum GL_PIXEL_TEX_GEN_Q_FLOOR_SGIX     = 0x8186;
enum GL_PIXEL_TEX_GEN_ALPHA_REPLACE_SGIX = 0x8187;
enum GL_PIXEL_TEX_GEN_ALPHA_NO_REPLACE_SGIX = 0x8188;
enum GL_PIXEL_TEX_GEN_ALPHA_LS_SGIX    = 0x8189;
enum GL_PIXEL_TEX_GEN_ALPHA_MS_SGIX    = 0x818A;
}

version (GL_EXT_bgra) {} else {
enum GL_BGR_EXT                        = 0x80E0;
enum GL_BGRA_EXT                       = 0x80E1;
}

version (GL_SGIX_async) {} else {
enum GL_ASYNC_MARKER_SGIX              = 0x8329;
}

version (GL_SGIX_async_pixel) {} else {
enum GL_ASYNC_TEX_IMAGE_SGIX           = 0x835C;
enum GL_ASYNC_DRAW_PIXELS_SGIX         = 0x835D;
enum GL_ASYNC_READ_PIXELS_SGIX         = 0x835E;
enum GL_MAX_ASYNC_TEX_IMAGE_SGIX       = 0x835F;
enum GL_MAX_ASYNC_DRAW_PIXELS_SGIX     = 0x8360;
enum GL_MAX_ASYNC_READ_PIXELS_SGIX     = 0x8361;
}

version (GL_SGIX_async_histogram) {} else {
enum GL_ASYNC_HISTOGRAM_SGIX           = 0x832C;
enum GL_MAX_ASYNC_HISTOGRAM_SGIX       = 0x832D;
}

version (GL_INTEL_texture_scissor) {} else {
}

version (GL_INTEL_parallel_arrays) {} else {
enum GL_PARALLEL_ARRAYS_INTEL          = 0x83F4;
enum GL_VERTEX_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F5;
enum GL_NORMAL_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F6;
enum GL_COLOR_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F7;
enum GL_TEXTURE_COORD_ARRAY_PARALLEL_POINTERS_INTEL = 0x83F8;
}

version (GL_HP_occlusion_test) {} else {
enum GL_OCCLUSION_TEST_HP              = 0x8165;
enum GL_OCCLUSION_TEST_RESULT_HP       = 0x8166;
}

version (GL_EXT_pixel_transform) {} else {
enum GL_PIXEL_TRANSFORM_2D_EXT         = 0x8330;
enum GL_PIXEL_MAG_FILTER_EXT           = 0x8331;
enum GL_PIXEL_MIN_FILTER_EXT           = 0x8332;
enum GL_PIXEL_CUBIC_WEIGHT_EXT         = 0x8333;
enum GL_CUBIC_EXT                      = 0x8334;
enum GL_AVERAGE_EXT                    = 0x8335;
enum GL_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT = 0x8336;
enum GL_MAX_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT = 0x8337;
enum GL_PIXEL_TRANSFORM_2D_MATRIX_EXT  = 0x8338;
}

version (GL_EXT_pixel_transform_color_table) {} else {
}

version (GL_EXT_shared_texture_palette) {} else {
enum GL_SHARED_TEXTURE_PALETTE_EXT     = 0x81FB;
}

version (GL_EXT_separate_specular_color) {} else {
enum GL_LIGHT_MODEL_COLOR_CONTROL_EXT  = 0x81F8;
enum GL_SINGLE_COLOR_EXT               = 0x81F9;
enum GL_SEPARATE_SPECULAR_COLOR_EXT    = 0x81FA;
}

version (GL_EXT_secondary_color) {} else {
enum GL_COLOR_SUM_EXT                  = 0x8458;
enum GL_CURRENT_SECONDARY_COLOR_EXT    = 0x8459;
enum GL_SECONDARY_COLOR_ARRAY_SIZE_EXT = 0x845A;
enum GL_SECONDARY_COLOR_ARRAY_TYPE_EXT = 0x845B;
enum GL_SECONDARY_COLOR_ARRAY_STRIDE_EXT = 0x845C;
enum GL_SECONDARY_COLOR_ARRAY_POINTER_EXT = 0x845D;
enum GL_SECONDARY_COLOR_ARRAY_EXT      = 0x845E;
}

version (GL_EXT_texture_perturb_normal) {} else {
enum GL_PERTURB_EXT                    = 0x85AE;
enum GL_TEXTURE_NORMAL_EXT             = 0x85AF;
}

version (GL_EXT_multi_draw_arrays) {} else {
}

version (GL_EXT_fog_coord) {} else {
enum GL_FOG_COORDINATE_SOURCE_EXT      = 0x8450;
enum GL_FOG_COORDINATE_EXT             = 0x8451;
enum GL_FRAGMENT_DEPTH_EXT             = 0x8452;
enum GL_CURRENT_FOG_COORDINATE_EXT     = 0x8453;
enum GL_FOG_COORDINATE_ARRAY_TYPE_EXT  = 0x8454;
enum GL_FOG_COORDINATE_ARRAY_STRIDE_EXT = 0x8455;
enum GL_FOG_COORDINATE_ARRAY_POINTER_EXT = 0x8456;
enum GL_FOG_COORDINATE_ARRAY_EXT       = 0x8457;
}

version (GL_REND_screen_coordinates) {} else {
enum GL_SCREEN_COORDINATES_REND        = 0x8490;
enum GL_INVERTED_SCREEN_W_REND         = 0x8491;
}

version (GL_EXT_coordinate_frame) {} else {
enum GL_TANGENT_ARRAY_EXT              = 0x8439;
enum GL_BINORMAL_ARRAY_EXT             = 0x843A;
enum GL_CURRENT_TANGENT_EXT            = 0x843B;
enum GL_CURRENT_BINORMAL_EXT           = 0x843C;
enum GL_TANGENT_ARRAY_TYPE_EXT         = 0x843E;
enum GL_TANGENT_ARRAY_STRIDE_EXT       = 0x843F;
enum GL_BINORMAL_ARRAY_TYPE_EXT        = 0x8440;
enum GL_BINORMAL_ARRAY_STRIDE_EXT      = 0x8441;
enum GL_TANGENT_ARRAY_POINTER_EXT      = 0x8442;
enum GL_BINORMAL_ARRAY_POINTER_EXT     = 0x8443;
enum GL_MAP1_TANGENT_EXT               = 0x8444;
enum GL_MAP2_TANGENT_EXT               = 0x8445;
enum GL_MAP1_BINORMAL_EXT              = 0x8446;
enum GL_MAP2_BINORMAL_EXT              = 0x8447;
}

version (GL_EXT_texture_env_combine) {} else {
enum GL_COMBINE_EXT                    = 0x8570;
enum GL_COMBINE_RGB_EXT                = 0x8571;
enum GL_COMBINE_ALPHA_EXT              = 0x8572;
enum GL_RGB_SCALE_EXT                  = 0x8573;
enum GL_ADD_SIGNED_EXT                 = 0x8574;
enum GL_INTERPOLATE_EXT                = 0x8575;
enum GL_CONSTANT_EXT                   = 0x8576;
enum GL_PRIMARY_COLOR_EXT              = 0x8577;
enum GL_PREVIOUS_EXT                   = 0x8578;
enum GL_SOURCE0_RGB_EXT                = 0x8580;
enum GL_SOURCE1_RGB_EXT                = 0x8581;
enum GL_SOURCE2_RGB_EXT                = 0x8582;
enum GL_SOURCE0_ALPHA_EXT              = 0x8588;
enum GL_SOURCE1_ALPHA_EXT              = 0x8589;
enum GL_SOURCE2_ALPHA_EXT              = 0x858A;
enum GL_OPERAND0_RGB_EXT               = 0x8590;
enum GL_OPERAND1_RGB_EXT               = 0x8591;
enum GL_OPERAND2_RGB_EXT               = 0x8592;
enum GL_OPERAND0_ALPHA_EXT             = 0x8598;
enum GL_OPERAND1_ALPHA_EXT             = 0x8599;
enum GL_OPERAND2_ALPHA_EXT             = 0x859A;
}

version (GL_APPLE_specular_vector) {} else {
enum GL_LIGHT_MODEL_SPECULAR_VECTOR_APPLE = 0x85B0;
}

version (GL_APPLE_transform_hint) {} else {
enum GL_TRANSFORM_HINT_APPLE           = 0x85B1;
}

version (GL_SGIX_fog_scale) {} else {
enum GL_FOG_SCALE_SGIX                 = 0x81FC;
enum GL_FOG_SCALE_VALUE_SGIX           = 0x81FD;
}

version (GL_SUNX_constant_data) {} else {
enum GL_UNPACK_CONSTANT_DATA_SUNX      = 0x81D5;
enum GL_TEXTURE_CONSTANT_DATA_SUNX     = 0x81D6;
}

version (GL_SUN_global_alpha) {} else {
enum GL_GLOBAL_ALPHA_SUN               = 0x81D9;
enum GL_GLOBAL_ALPHA_FACTOR_SUN        = 0x81DA;
}

version (GL_SUN_triangle_list) {} else {
enum GL_RESTART_SUN                    = 0x0001;
enum GL_REPLACE_MIDDLE_SUN             = 0x0002;
enum GL_REPLACE_OLDEST_SUN             = 0x0003;
enum GL_TRIANGLE_LIST_SUN              = 0x81D7;
enum GL_REPLACEMENT_CODE_SUN           = 0x81D8;
enum GL_REPLACEMENT_CODE_ARRAY_SUN     = 0x85C0;
enum GL_REPLACEMENT_CODE_ARRAY_TYPE_SUN = 0x85C1;
enum GL_REPLACEMENT_CODE_ARRAY_STRIDE_SUN = 0x85C2;
enum GL_REPLACEMENT_CODE_ARRAY_POINTER_SUN = 0x85C3;
enum GL_R1UI_V3F_SUN                   = 0x85C4;
enum GL_R1UI_C4UB_V3F_SUN              = 0x85C5;
enum GL_R1UI_C3F_V3F_SUN               = 0x85C6;
enum GL_R1UI_N3F_V3F_SUN               = 0x85C7;
enum GL_R1UI_C4F_N3F_V3F_SUN           = 0x85C8;
enum GL_R1UI_T2F_V3F_SUN               = 0x85C9;
enum GL_R1UI_T2F_N3F_V3F_SUN           = 0x85CA;
enum GL_R1UI_T2F_C4F_N3F_V3F_SUN       = 0x85CB;
}

version (GL_SUN_vertex) {} else {
}

version (GL_EXT_blend_func_separate) {} else {
enum GL_BLEND_DST_RGB_EXT              = 0x80C8;
enum GL_BLEND_SRC_RGB_EXT              = 0x80C9;
enum GL_BLEND_DST_ALPHA_EXT            = 0x80CA;
enum GL_BLEND_SRC_ALPHA_EXT            = 0x80CB;
}

version (GL_INGR_color_clamp) {} else {
enum GL_RED_MIN_CLAMP_INGR             = 0x8560;
enum GL_GREEN_MIN_CLAMP_INGR           = 0x8561;
enum GL_BLUE_MIN_CLAMP_INGR            = 0x8562;
enum GL_ALPHA_MIN_CLAMP_INGR           = 0x8563;
enum GL_RED_MAX_CLAMP_INGR             = 0x8564;
enum GL_GREEN_MAX_CLAMP_INGR           = 0x8565;
enum GL_BLUE_MAX_CLAMP_INGR            = 0x8566;
enum GL_ALPHA_MAX_CLAMP_INGR           = 0x8567;
}

version (GL_INGR_interlace_read) {} else {
enum GL_INTERLACE_READ_INGR            = 0x8568;
}

version (GL_EXT_stencil_wrap) {} else {
enum GL_INCR_WRAP_EXT                  = 0x8507;
enum GL_DECR_WRAP_EXT                  = 0x8508;
}

version (GL_EXT_422_pixels) {} else {
enum GL_422_EXT                        = 0x80CC;
enum GL_422_REV_EXT                    = 0x80CD;
enum GL_422_AVERAGE_EXT                = 0x80CE;
enum GL_422_REV_AVERAGE_EXT            = 0x80CF;
}

version (GL_NV_texgen_reflection) {} else {
enum GL_NORMAL_MAP_NV                  = 0x8511;
enum GL_REFLECTION_MAP_NV              = 0x8512;
}

version (GL_EXT_texture_cube_map) {} else {
enum GL_NORMAL_MAP_EXT                 = 0x8511;
enum GL_REFLECTION_MAP_EXT             = 0x8512;
enum GL_TEXTURE_CUBE_MAP_EXT           = 0x8513;
enum GL_TEXTURE_BINDING_CUBE_MAP_EXT   = 0x8514;
enum GL_TEXTURE_CUBE_MAP_POSITIVE_X_EXT = 0x8515;
enum GL_TEXTURE_CUBE_MAP_NEGATIVE_X_EXT = 0x8516;
enum GL_TEXTURE_CUBE_MAP_POSITIVE_Y_EXT = 0x8517;
enum GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_EXT = 0x8518;
enum GL_TEXTURE_CUBE_MAP_POSITIVE_Z_EXT = 0x8519;
enum GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_EXT = 0x851A;
enum GL_PROXY_TEXTURE_CUBE_MAP_EXT     = 0x851B;
enum GL_MAX_CUBE_MAP_TEXTURE_SIZE_EXT  = 0x851C;
}

version (GL_SUN_convolution_border_modes) {} else {
enum GL_WRAP_BORDER_SUN                = 0x81D4;
}

version (GL_EXT_texture_env_add) {} else {
}

version (GL_EXT_texture_lod_bias) {} else {
enum GL_MAX_TEXTURE_LOD_BIAS_EXT       = 0x84FD;
enum GL_TEXTURE_FILTER_CONTROL_EXT     = 0x8500;
enum GL_TEXTURE_LOD_BIAS_EXT           = 0x8501;
}

version (GL_EXT_texture_filter_anisotropic) {} else {
enum GL_TEXTURE_MAX_ANISOTROPY_EXT     = 0x84FE;
enum GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT = 0x84FF;
}

version (GL_EXT_vertex_weighting) {} else {
enum GL_MODELVIEW0_STACK_DEPTH_EXT     = GL_MODELVIEW_STACK_DEPTH;
enum GL_MODELVIEW1_STACK_DEPTH_EXT     = 0x8502;
enum GL_MODELVIEW0_MATRIX_EXT          = GL_MODELVIEW_MATRIX;
enum GL_MODELVIEW1_MATRIX_EXT          = 0x8506;
enum GL_VERTEX_WEIGHTING_EXT           = 0x8509;
enum GL_MODELVIEW0_EXT                 = GL_MODELVIEW;
enum GL_MODELVIEW1_EXT                 = 0x850A;
enum GL_CURRENT_VERTEX_WEIGHT_EXT      = 0x850B;
enum GL_VERTEX_WEIGHT_ARRAY_EXT        = 0x850C;
enum GL_VERTEX_WEIGHT_ARRAY_SIZE_EXT   = 0x850D;
enum GL_VERTEX_WEIGHT_ARRAY_TYPE_EXT   = 0x850E;
enum GL_VERTEX_WEIGHT_ARRAY_STRIDE_EXT = 0x850F;
enum GL_VERTEX_WEIGHT_ARRAY_POINTER_EXT = 0x8510;
}

version (GL_NV_light_max_exponent) {} else {
enum GL_MAX_SHININESS_NV               = 0x8504;
enum GL_MAX_SPOT_EXPONENT_NV           = 0x8505;
}

version (GL_NV_vertex_array_range) {} else {
enum GL_VERTEX_ARRAY_RANGE_NV          = 0x851D;
enum GL_VERTEX_ARRAY_RANGE_LENGTH_NV   = 0x851E;
enum GL_VERTEX_ARRAY_RANGE_VALID_NV    = 0x851F;
enum GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_NV = 0x8520;
enum GL_VERTEX_ARRAY_RANGE_POINTER_NV  = 0x8521;
}

version (GL_NV_register_combiners) {} else {
enum GL_REGISTER_COMBINERS_NV          = 0x8522;
enum GL_VARIABLE_A_NV                  = 0x8523;
enum GL_VARIABLE_B_NV                  = 0x8524;
enum GL_VARIABLE_C_NV                  = 0x8525;
enum GL_VARIABLE_D_NV                  = 0x8526;
enum GL_VARIABLE_E_NV                  = 0x8527;
enum GL_VARIABLE_F_NV                  = 0x8528;
enum GL_VARIABLE_G_NV                  = 0x8529;
enum GL_CONSTANT_COLOR0_NV             = 0x852A;
enum GL_CONSTANT_COLOR1_NV             = 0x852B;
enum GL_PRIMARY_COLOR_NV               = 0x852C;
enum GL_SECONDARY_COLOR_NV             = 0x852D;
enum GL_SPARE0_NV                      = 0x852E;
enum GL_SPARE1_NV                      = 0x852F;
enum GL_DISCARD_NV                     = 0x8530;
enum GL_E_TIMES_F_NV                   = 0x8531;
enum GL_SPARE0_PLUS_SECONDARY_COLOR_NV = 0x8532;
enum GL_UNSIGNED_IDENTITY_NV           = 0x8536;
enum GL_UNSIGNED_INVERT_NV             = 0x8537;
enum GL_EXPAND_NORMAL_NV               = 0x8538;
enum GL_EXPAND_NEGATE_NV               = 0x8539;
enum GL_HALF_BIAS_NORMAL_NV            = 0x853A;
enum GL_HALF_BIAS_NEGATE_NV            = 0x853B;
enum GL_SIGNED_IDENTITY_NV             = 0x853C;
enum GL_SIGNED_NEGATE_NV               = 0x853D;
enum GL_SCALE_BY_TWO_NV                = 0x853E;
enum GL_SCALE_BY_FOUR_NV               = 0x853F;
enum GL_SCALE_BY_ONE_HALF_NV           = 0x8540;
enum GL_BIAS_BY_NEGATIVE_ONE_HALF_NV   = 0x8541;
enum GL_COMBINER_INPUT_NV              = 0x8542;
enum GL_COMBINER_MAPPING_NV            = 0x8543;
enum GL_COMBINER_COMPONENT_USAGE_NV    = 0x8544;
enum GL_COMBINER_AB_DOT_PRODUCT_NV     = 0x8545;
enum GL_COMBINER_CD_DOT_PRODUCT_NV     = 0x8546;
enum GL_COMBINER_MUX_SUM_NV            = 0x8547;
enum GL_COMBINER_SCALE_NV              = 0x8548;
enum GL_COMBINER_BIAS_NV               = 0x8549;
enum GL_COMBINER_AB_OUTPUT_NV          = 0x854A;
enum GL_COMBINER_CD_OUTPUT_NV          = 0x854B;
enum GL_COMBINER_SUM_OUTPUT_NV         = 0x854C;
enum GL_MAX_GENERAL_COMBINERS_NV       = 0x854D;
enum GL_NUM_GENERAL_COMBINERS_NV       = 0x854E;
enum GL_COLOR_SUM_CLAMP_NV             = 0x854F;
enum GL_COMBINER0_NV                   = 0x8550;
enum GL_COMBINER1_NV                   = 0x8551;
enum GL_COMBINER2_NV                   = 0x8552;
enum GL_COMBINER3_NV                   = 0x8553;
enum GL_COMBINER4_NV                   = 0x8554;
enum GL_COMBINER5_NV                   = 0x8555;
enum GL_COMBINER6_NV                   = 0x8556;
enum GL_COMBINER7_NV                   = 0x8557;
/* reuse GL_TEXTURE0_ARB */
/* reuse GL_TEXTURE1_ARB */
/* reuse GL_ZERO */
/* reuse GL_NONE */
/* reuse GL_FOG */
}

version (GL_NV_fog_distance) {} else {
enum GL_FOG_DISTANCE_MODE_NV           = 0x855A;
enum GL_EYE_RADIAL_NV                  = 0x855B;
enum GL_EYE_PLANE_ABSOLUTE_NV          = 0x855C;
/* reuse GL_EYE_PLANE */
}

version (GL_NV_texgen_emboss) {} else {
enum GL_EMBOSS_LIGHT_NV                = 0x855D;
enum GL_EMBOSS_CONSTANT_NV             = 0x855E;
enum GL_EMBOSS_MAP_NV                  = 0x855F;
}

version (GL_NV_blend_square) {} else {
}

version (GL_NV_texture_env_combine4) {} else {
enum GL_COMBINE4_NV                    = 0x8503;
enum GL_SOURCE3_RGB_NV                 = 0x8583;
enum GL_SOURCE3_ALPHA_NV               = 0x858B;
enum GL_OPERAND3_RGB_NV                = 0x8593;
enum GL_OPERAND3_ALPHA_NV              = 0x859B;
}

version (GL_MESA_resize_buffers) {} else {
}

version (GL_MESA_window_pos) {} else {
}

version (GL_EXT_texture_compression_s3tc) {} else {
enum GL_COMPRESSED_RGB_S3TC_DXT1_EXT   = 0x83F0;
enum GL_COMPRESSED_RGBA_S3TC_DXT1_EXT  = 0x83F1;
enum GL_COMPRESSED_RGBA_S3TC_DXT3_EXT  = 0x83F2;
enum GL_COMPRESSED_RGBA_S3TC_DXT5_EXT  = 0x83F3;
}

version (GL_IBM_cull_vertex) {} else {
enum GL_CULL_VERTEX_IBM                = 103050;
}

version (GL_IBM_multimode_draw_arrays) {} else {
}

version (GL_IBM_vertex_array_lists) {} else {
enum GL_VERTEX_ARRAY_LIST_IBM          = 103070;
enum GL_NORMAL_ARRAY_LIST_IBM          = 103071;
enum GL_COLOR_ARRAY_LIST_IBM           = 103072;
enum GL_INDEX_ARRAY_LIST_IBM           = 103073;
enum GL_TEXTURE_COORD_ARRAY_LIST_IBM   = 103074;
enum GL_EDGE_FLAG_ARRAY_LIST_IBM       = 103075;
enum GL_FOG_COORDINATE_ARRAY_LIST_IBM  = 103076;
enum GL_SECONDARY_COLOR_ARRAY_LIST_IBM = 103077;
enum GL_VERTEX_ARRAY_LIST_STRIDE_IBM   = 103080;
enum GL_NORMAL_ARRAY_LIST_STRIDE_IBM   = 103081;
enum GL_COLOR_ARRAY_LIST_STRIDE_IBM    = 103082;
enum GL_INDEX_ARRAY_LIST_STRIDE_IBM    = 103083;
enum GL_TEXTURE_COORD_ARRAY_LIST_STRIDE_IBM = 103084;
enum GL_EDGE_FLAG_ARRAY_LIST_STRIDE_IBM = 103085;
enum GL_FOG_COORDINATE_ARRAY_LIST_STRIDE_IBM = 103086;
enum GL_SECONDARY_COLOR_ARRAY_LIST_STRIDE_IBM = 103087;
}

version (GL_SGIX_subsample) {} else {
enum GL_PACK_SUBSAMPLE_RATE_SGIX       = 0x85A0;
enum GL_UNPACK_SUBSAMPLE_RATE_SGIX     = 0x85A1;
enum GL_PIXEL_SUBSAMPLE_4444_SGIX      = 0x85A2;
enum GL_PIXEL_SUBSAMPLE_2424_SGIX      = 0x85A3;
enum GL_PIXEL_SUBSAMPLE_4242_SGIX      = 0x85A4;
}

version (GL_SGIX_ycrcb_subsample) {} else {
}

version (GL_SGIX_ycrcba) {} else {
enum GL_YCRCB_SGIX                     = 0x8318;
enum GL_YCRCBA_SGIX                    = 0x8319;
}

version (GL_SGI_depth_pass_instrument) {} else {
enum GL_DEPTH_PASS_INSTRUMENT_SGIX     = 0x8310;
enum GL_DEPTH_PASS_INSTRUMENT_COUNTERS_SGIX = 0x8311;
enum GL_DEPTH_PASS_INSTRUMENT_MAX_SGIX = 0x8312;
}

version (GL_3DFX_texture_compression_FXT1) {} else {
enum GL_COMPRESSED_RGB_FXT1_3DFX       = 0x86B0;
enum GL_COMPRESSED_RGBA_FXT1_3DFX      = 0x86B1;
}

version (GL_3DFX_multisample) {} else {
enum GL_MULTISAMPLE_3DFX               = 0x86B2;
enum GL_SAMPLE_BUFFERS_3DFX            = 0x86B3;
enum GL_SAMPLES_3DFX                   = 0x86B4;
enum GL_MULTISAMPLE_BIT_3DFX           = 0x20000000;
}

version (GL_3DFX_tbuffer) {} else {
}

version (GL_EXT_multisample) {} else {
enum GL_MULTISAMPLE_EXT                = 0x809D;
enum GL_SAMPLE_ALPHA_TO_MASK_EXT       = 0x809E;
enum GL_SAMPLE_ALPHA_TO_ONE_EXT        = 0x809F;
enum GL_SAMPLE_MASK_EXT                = 0x80A0;
enum GL_1PASS_EXT                      = 0x80A1;
enum GL_2PASS_0_EXT                    = 0x80A2;
enum GL_2PASS_1_EXT                    = 0x80A3;
enum GL_4PASS_0_EXT                    = 0x80A4;
enum GL_4PASS_1_EXT                    = 0x80A5;
enum GL_4PASS_2_EXT                    = 0x80A6;
enum GL_4PASS_3_EXT                    = 0x80A7;
enum GL_SAMPLE_BUFFERS_EXT             = 0x80A8;
enum GL_SAMPLES_EXT                    = 0x80A9;
enum GL_SAMPLE_MASK_VALUE_EXT          = 0x80AA;
enum GL_SAMPLE_MASK_INVERT_EXT         = 0x80AB;
enum GL_SAMPLE_PATTERN_EXT             = 0x80AC;
enum GL_MULTISAMPLE_BIT_EXT            = 0x20000000;
}

version (GL_SGIX_vertex_preclip) {} else {
enum GL_VERTEX_PRECLIP_SGIX            = 0x83EE;
enum GL_VERTEX_PRECLIP_HINT_SGIX       = 0x83EF;
}

version (GL_SGIX_convolution_accuracy) {} else {
enum GL_CONVOLUTION_HINT_SGIX          = 0x8316;
}

version (GL_SGIX_resample) {} else {
enum GL_PACK_RESAMPLE_SGIX             = 0x842C;
enum GL_UNPACK_RESAMPLE_SGIX           = 0x842D;
enum GL_RESAMPLE_REPLICATE_SGIX        = 0x842E;
enum GL_RESAMPLE_ZERO_FILL_SGIX        = 0x842F;
enum GL_RESAMPLE_DECIMATE_SGIX         = 0x8430;
}

version (GL_SGIS_point_line_texgen) {} else {
enum GL_EYE_DISTANCE_TO_POINT_SGIS     = 0x81F0;
enum GL_OBJECT_DISTANCE_TO_POINT_SGIS  = 0x81F1;
enum GL_EYE_DISTANCE_TO_LINE_SGIS      = 0x81F2;
enum GL_OBJECT_DISTANCE_TO_LINE_SGIS   = 0x81F3;
enum GL_EYE_POINT_SGIS                 = 0x81F4;
enum GL_OBJECT_POINT_SGIS              = 0x81F5;
enum GL_EYE_LINE_SGIS                  = 0x81F6;
enum GL_OBJECT_LINE_SGIS               = 0x81F7;
}

version (GL_SGIS_texture_color_mask) {} else {
enum GL_TEXTURE_COLOR_WRITEMASK_SGIS   = 0x81EF;
}

version (GL_EXT_texture_env_dot3) {} else {
enum GL_DOT3_RGB_EXT                   = 0x8740;
enum GL_DOT3_RGBA_EXT                  = 0x8741;
}

version (GL_ATI_texture_mirror_once) {} else {
enum GL_MIRROR_CLAMP_ATI               = 0x8742;
enum GL_MIRROR_CLAMP_TO_EDGE_ATI       = 0x8743;
}

version (GL_NV_fence) {} else {
enum GL_ALL_COMPLETED_NV               = 0x84F2;
enum GL_FENCE_STATUS_NV                = 0x84F3;
enum GL_FENCE_CONDITION_NV             = 0x84F4;
}

version (GL_IBM_texture_mirrored_repeat) {} else {
enum GL_MIRRORED_REPEAT_IBM            = 0x8370;
}

version (GL_NV_evaluators) {} else {
enum GL_EVAL_2D_NV                     = 0x86C0;
enum GL_EVAL_TRIANGULAR_2D_NV          = 0x86C1;
enum GL_MAP_TESSELLATION_NV            = 0x86C2;
enum GL_MAP_ATTRIB_U_ORDER_NV          = 0x86C3;
enum GL_MAP_ATTRIB_V_ORDER_NV          = 0x86C4;
enum GL_EVAL_FRACTIONAL_TESSELLATION_NV = 0x86C5;
enum GL_EVAL_VERTEX_ATTRIB0_NV         = 0x86C6;
enum GL_EVAL_VERTEX_ATTRIB1_NV         = 0x86C7;
enum GL_EVAL_VERTEX_ATTRIB2_NV         = 0x86C8;
enum GL_EVAL_VERTEX_ATTRIB3_NV         = 0x86C9;
enum GL_EVAL_VERTEX_ATTRIB4_NV         = 0x86CA;
enum GL_EVAL_VERTEX_ATTRIB5_NV         = 0x86CB;
enum GL_EVAL_VERTEX_ATTRIB6_NV         = 0x86CC;
enum GL_EVAL_VERTEX_ATTRIB7_NV         = 0x86CD;
enum GL_EVAL_VERTEX_ATTRIB8_NV         = 0x86CE;
enum GL_EVAL_VERTEX_ATTRIB9_NV         = 0x86CF;
enum GL_EVAL_VERTEX_ATTRIB10_NV        = 0x86D0;
enum GL_EVAL_VERTEX_ATTRIB11_NV        = 0x86D1;
enum GL_EVAL_VERTEX_ATTRIB12_NV        = 0x86D2;
enum GL_EVAL_VERTEX_ATTRIB13_NV        = 0x86D3;
enum GL_EVAL_VERTEX_ATTRIB14_NV        = 0x86D4;
enum GL_EVAL_VERTEX_ATTRIB15_NV        = 0x86D5;
enum GL_MAX_MAP_TESSELLATION_NV        = 0x86D6;
enum GL_MAX_RATIONAL_EVAL_ORDER_NV     = 0x86D7;
}

version (GL_NV_packed_depth_stencil) {} else {
enum GL_DEPTH_STENCIL_NV               = 0x84F9;
enum GL_UNSIGNED_INT_24_8_NV           = 0x84FA;
}

version (GL_NV_register_combiners2) {} else {
enum GL_PER_STAGE_CONSTANTS_NV         = 0x8535;
}

version (GL_NV_texture_compression_vtc) {} else {
}

version (GL_NV_texture_rectangle) {} else {
enum GL_TEXTURE_RECTANGLE_NV           = 0x84F5;
enum GL_TEXTURE_BINDING_RECTANGLE_NV   = 0x84F6;
enum GL_PROXY_TEXTURE_RECTANGLE_NV     = 0x84F7;
enum GL_MAX_RECTANGLE_TEXTURE_SIZE_NV  = 0x84F8;
}

version (GL_NV_texture_shader) {} else {
enum GL_OFFSET_TEXTURE_RECTANGLE_NV    = 0x864C;
enum GL_OFFSET_TEXTURE_RECTANGLE_SCALE_NV = 0x864D;
enum GL_DOT_PRODUCT_TEXTURE_RECTANGLE_NV = 0x864E;
enum GL_RGBA_UNSIGNED_DOT_PRODUCT_MAPPING_NV = 0x86D9;
enum GL_UNSIGNED_INT_S8_S8_8_8_NV      = 0x86DA;
enum GL_UNSIGNED_INT_8_8_S8_S8_REV_NV  = 0x86DB;
enum GL_DSDT_MAG_INTENSITY_NV          = 0x86DC;
enum GL_SHADER_CONSISTENT_NV           = 0x86DD;
enum GL_TEXTURE_SHADER_NV              = 0x86DE;
enum GL_SHADER_OPERATION_NV            = 0x86DF;
enum GL_CULL_MODES_NV                  = 0x86E0;
enum GL_OFFSET_TEXTURE_MATRIX_NV       = 0x86E1;
enum GL_OFFSET_TEXTURE_SCALE_NV        = 0x86E2;
enum GL_OFFSET_TEXTURE_BIAS_NV         = 0x86E3;
enum GL_OFFSET_TEXTURE_2D_MATRIX_NV    = GL_OFFSET_TEXTURE_MATRIX_NV;
enum GL_OFFSET_TEXTURE_2D_SCALE_NV     = GL_OFFSET_TEXTURE_SCALE_NV;
enum GL_OFFSET_TEXTURE_2D_BIAS_NV      = GL_OFFSET_TEXTURE_BIAS_NV;
enum GL_PREVIOUS_TEXTURE_INPUT_NV      = 0x86E4;
enum GL_CONST_EYE_NV                   = 0x86E5;
enum GL_PASS_THROUGH_NV                = 0x86E6;
enum GL_CULL_FRAGMENT_NV               = 0x86E7;
enum GL_OFFSET_TEXTURE_2D_NV           = 0x86E8;
enum GL_DEPENDENT_AR_TEXTURE_2D_NV     = 0x86E9;
enum GL_DEPENDENT_GB_TEXTURE_2D_NV     = 0x86EA;
enum GL_DOT_PRODUCT_NV                 = 0x86EC;
enum GL_DOT_PRODUCT_DEPTH_REPLACE_NV   = 0x86ED;
enum GL_DOT_PRODUCT_TEXTURE_2D_NV      = 0x86EE;
enum GL_DOT_PRODUCT_TEXTURE_CUBE_MAP_NV = 0x86F0;
enum GL_DOT_PRODUCT_DIFFUSE_CUBE_MAP_NV = 0x86F1;
enum GL_DOT_PRODUCT_REFLECT_CUBE_MAP_NV = 0x86F2;
enum GL_DOT_PRODUCT_CONST_EYE_REFLECT_CUBE_MAP_NV = 0x86F3;
enum GL_HILO_NV                        = 0x86F4;
enum GL_DSDT_NV                        = 0x86F5;
enum GL_DSDT_MAG_NV                    = 0x86F6;
enum GL_DSDT_MAG_VIB_NV                = 0x86F7;
enum GL_HILO16_NV                      = 0x86F8;
enum GL_SIGNED_HILO_NV                 = 0x86F9;
enum GL_SIGNED_HILO16_NV               = 0x86FA;
enum GL_SIGNED_RGBA_NV                 = 0x86FB;
enum GL_SIGNED_RGBA8_NV                = 0x86FC;
enum GL_SIGNED_RGB_NV                  = 0x86FE;
enum GL_SIGNED_RGB8_NV                 = 0x86FF;
enum GL_SIGNED_LUMINANCE_NV            = 0x8701;
enum GL_SIGNED_LUMINANCE8_NV           = 0x8702;
enum GL_SIGNED_LUMINANCE_ALPHA_NV      = 0x8703;
enum GL_SIGNED_LUMINANCE8_ALPHA8_NV    = 0x8704;
enum GL_SIGNED_ALPHA_NV                = 0x8705;
enum GL_SIGNED_ALPHA8_NV               = 0x8706;
enum GL_SIGNED_INTENSITY_NV            = 0x8707;
enum GL_SIGNED_INTENSITY8_NV           = 0x8708;
enum GL_DSDT8_NV                       = 0x8709;
enum GL_DSDT8_MAG8_NV                  = 0x870A;
enum GL_DSDT8_MAG8_INTENSITY8_NV       = 0x870B;
enum GL_SIGNED_RGB_UNSIGNED_ALPHA_NV   = 0x870C;
enum GL_SIGNED_RGB8_UNSIGNED_ALPHA8_NV = 0x870D;
enum GL_HI_SCALE_NV                    = 0x870E;
enum GL_LO_SCALE_NV                    = 0x870F;
enum GL_DS_SCALE_NV                    = 0x8710;
enum GL_DT_SCALE_NV                    = 0x8711;
enum GL_MAGNITUDE_SCALE_NV             = 0x8712;
enum GL_VIBRANCE_SCALE_NV              = 0x8713;
enum GL_HI_BIAS_NV                     = 0x8714;
enum GL_LO_BIAS_NV                     = 0x8715;
enum GL_DS_BIAS_NV                     = 0x8716;
enum GL_DT_BIAS_NV                     = 0x8717;
enum GL_MAGNITUDE_BIAS_NV              = 0x8718;
enum GL_VIBRANCE_BIAS_NV               = 0x8719;
enum GL_TEXTURE_BORDER_VALUES_NV       = 0x871A;
enum GL_TEXTURE_HI_SIZE_NV             = 0x871B;
enum GL_TEXTURE_LO_SIZE_NV             = 0x871C;
enum GL_TEXTURE_DS_SIZE_NV             = 0x871D;
enum GL_TEXTURE_DT_SIZE_NV             = 0x871E;
enum GL_TEXTURE_MAG_SIZE_NV            = 0x871F;
}

version (GL_NV_texture_shader2) {} else {
enum GL_DOT_PRODUCT_TEXTURE_3D_NV      = 0x86EF;
}

version (GL_NV_vertex_array_range2) {} else {
enum GL_VERTEX_ARRAY_RANGE_WITHOUT_FLUSH_NV = 0x8533;
}

version (GL_NV_vertex_program) {} else {
enum GL_VERTEX_PROGRAM_NV              = 0x8620;
enum GL_VERTEX_STATE_PROGRAM_NV        = 0x8621;
enum GL_ATTRIB_ARRAY_SIZE_NV           = 0x8623;
enum GL_ATTRIB_ARRAY_STRIDE_NV         = 0x8624;
enum GL_ATTRIB_ARRAY_TYPE_NV           = 0x8625;
enum GL_CURRENT_ATTRIB_NV              = 0x8626;
enum GL_PROGRAM_LENGTH_NV              = 0x8627;
enum GL_PROGRAM_STRING_NV              = 0x8628;
enum GL_MODELVIEW_PROJECTION_NV        = 0x8629;
enum GL_IDENTITY_NV                    = 0x862A;
enum GL_INVERSE_NV                     = 0x862B;
enum GL_TRANSPOSE_NV                   = 0x862C;
enum GL_INVERSE_TRANSPOSE_NV           = 0x862D;
enum GL_MAX_TRACK_MATRIX_STACK_DEPTH_NV = 0x862E;
enum GL_MAX_TRACK_MATRICES_NV          = 0x862F;
enum GL_MATRIX0_NV                     = 0x8630;
enum GL_MATRIX1_NV                     = 0x8631;
enum GL_MATRIX2_NV                     = 0x8632;
enum GL_MATRIX3_NV                     = 0x8633;
enum GL_MATRIX4_NV                     = 0x8634;
enum GL_MATRIX5_NV                     = 0x8635;
enum GL_MATRIX6_NV                     = 0x8636;
enum GL_MATRIX7_NV                     = 0x8637;
enum GL_CURRENT_MATRIX_STACK_DEPTH_NV  = 0x8640;
enum GL_CURRENT_MATRIX_NV              = 0x8641;
enum GL_VERTEX_PROGRAM_POINT_SIZE_NV   = 0x8642;
enum GL_VERTEX_PROGRAM_TWO_SIDE_NV     = 0x8643;
enum GL_PROGRAM_PARAMETER_NV           = 0x8644;
enum GL_ATTRIB_ARRAY_POINTER_NV        = 0x8645;
enum GL_PROGRAM_TARGET_NV              = 0x8646;
enum GL_PROGRAM_RESIDENT_NV            = 0x8647;
enum GL_TRACK_MATRIX_NV                = 0x8648;
enum GL_TRACK_MATRIX_TRANSFORM_NV      = 0x8649;
enum GL_VERTEX_PROGRAM_BINDING_NV      = 0x864A;
enum GL_PROGRAM_ERROR_POSITION_NV      = 0x864B;
enum GL_VERTEX_ATTRIB_ARRAY0_NV        = 0x8650;
enum GL_VERTEX_ATTRIB_ARRAY1_NV        = 0x8651;
enum GL_VERTEX_ATTRIB_ARRAY2_NV        = 0x8652;
enum GL_VERTEX_ATTRIB_ARRAY3_NV        = 0x8653;
enum GL_VERTEX_ATTRIB_ARRAY4_NV        = 0x8654;
enum GL_VERTEX_ATTRIB_ARRAY5_NV        = 0x8655;
enum GL_VERTEX_ATTRIB_ARRAY6_NV        = 0x8656;
enum GL_VERTEX_ATTRIB_ARRAY7_NV        = 0x8657;
enum GL_VERTEX_ATTRIB_ARRAY8_NV        = 0x8658;
enum GL_VERTEX_ATTRIB_ARRAY9_NV        = 0x8659;
enum GL_VERTEX_ATTRIB_ARRAY10_NV       = 0x865A;
enum GL_VERTEX_ATTRIB_ARRAY11_NV       = 0x865B;
enum GL_VERTEX_ATTRIB_ARRAY12_NV       = 0x865C;
enum GL_VERTEX_ATTRIB_ARRAY13_NV       = 0x865D;
enum GL_VERTEX_ATTRIB_ARRAY14_NV       = 0x865E;
enum GL_VERTEX_ATTRIB_ARRAY15_NV       = 0x865F;
enum GL_MAP1_VERTEX_ATTRIB0_4_NV       = 0x8660;
enum GL_MAP1_VERTEX_ATTRIB1_4_NV       = 0x8661;
enum GL_MAP1_VERTEX_ATTRIB2_4_NV       = 0x8662;
enum GL_MAP1_VERTEX_ATTRIB3_4_NV       = 0x8663;
enum GL_MAP1_VERTEX_ATTRIB4_4_NV       = 0x8664;
enum GL_MAP1_VERTEX_ATTRIB5_4_NV       = 0x8665;
enum GL_MAP1_VERTEX_ATTRIB6_4_NV       = 0x8666;
enum GL_MAP1_VERTEX_ATTRIB7_4_NV       = 0x8667;
enum GL_MAP1_VERTEX_ATTRIB8_4_NV       = 0x8668;
enum GL_MAP1_VERTEX_ATTRIB9_4_NV       = 0x8669;
enum GL_MAP1_VERTEX_ATTRIB10_4_NV      = 0x866A;
enum GL_MAP1_VERTEX_ATTRIB11_4_NV      = 0x866B;
enum GL_MAP1_VERTEX_ATTRIB12_4_NV      = 0x866C;
enum GL_MAP1_VERTEX_ATTRIB13_4_NV      = 0x866D;
enum GL_MAP1_VERTEX_ATTRIB14_4_NV      = 0x866E;
enum GL_MAP1_VERTEX_ATTRIB15_4_NV      = 0x866F;
enum GL_MAP2_VERTEX_ATTRIB0_4_NV       = 0x8670;
enum GL_MAP2_VERTEX_ATTRIB1_4_NV       = 0x8671;
enum GL_MAP2_VERTEX_ATTRIB2_4_NV       = 0x8672;
enum GL_MAP2_VERTEX_ATTRIB3_4_NV       = 0x8673;
enum GL_MAP2_VERTEX_ATTRIB4_4_NV       = 0x8674;
enum GL_MAP2_VERTEX_ATTRIB5_4_NV       = 0x8675;
enum GL_MAP2_VERTEX_ATTRIB6_4_NV       = 0x8676;
enum GL_MAP2_VERTEX_ATTRIB7_4_NV       = 0x8677;
enum GL_MAP2_VERTEX_ATTRIB8_4_NV       = 0x8678;
enum GL_MAP2_VERTEX_ATTRIB9_4_NV       = 0x8679;
enum GL_MAP2_VERTEX_ATTRIB10_4_NV      = 0x867A;
enum GL_MAP2_VERTEX_ATTRIB11_4_NV      = 0x867B;
enum GL_MAP2_VERTEX_ATTRIB12_4_NV      = 0x867C;
enum GL_MAP2_VERTEX_ATTRIB13_4_NV      = 0x867D;
enum GL_MAP2_VERTEX_ATTRIB14_4_NV      = 0x867E;
enum GL_MAP2_VERTEX_ATTRIB15_4_NV      = 0x867F;
}

version (GL_SGIX_texture_coordinate_clamp) {} else {
enum GL_TEXTURE_MAX_CLAMP_S_SGIX       = 0x8369;
enum GL_TEXTURE_MAX_CLAMP_T_SGIX       = 0x836A;
enum GL_TEXTURE_MAX_CLAMP_R_SGIX       = 0x836B;
}

version (GL_SGIX_scalebias_hint) {} else {
enum GL_SCALEBIAS_HINT_SGIX            = 0x8322;
}

version (GL_OML_interlace) {} else {
enum GL_INTERLACE_OML                  = 0x8980;
enum GL_INTERLACE_READ_OML             = 0x8981;
}

version (GL_OML_subsample) {} else {
enum GL_FORMAT_SUBSAMPLE_24_24_OML     = 0x8982;
enum GL_FORMAT_SUBSAMPLE_244_244_OML   = 0x8983;
}

version (GL_OML_resample) {} else {
enum GL_PACK_RESAMPLE_OML              = 0x8984;
enum GL_UNPACK_RESAMPLE_OML            = 0x8985;
enum GL_RESAMPLE_REPLICATE_OML         = 0x8986;
enum GL_RESAMPLE_ZERO_FILL_OML         = 0x8987;
enum GL_RESAMPLE_AVERAGE_OML           = 0x8988;
enum GL_RESAMPLE_DECIMATE_OML          = 0x8989;
}

version (GL_NV_copy_depth_to_color) {} else {
enum GL_DEPTH_STENCIL_TO_RGBA_NV       = 0x886E;
enum GL_DEPTH_STENCIL_TO_BGRA_NV       = 0x886F;
}

version (GL_ATI_envmap_bumpmap) {} else {
enum GL_BUMP_ROT_MATRIX_ATI            = 0x8775;
enum GL_BUMP_ROT_MATRIX_SIZE_ATI       = 0x8776;
enum GL_BUMP_NUM_TEX_UNITS_ATI         = 0x8777;
enum GL_BUMP_TEX_UNITS_ATI             = 0x8778;
enum GL_DUDV_ATI                       = 0x8779;
enum GL_DU8DV8_ATI                     = 0x877A;
enum GL_BUMP_ENVMAP_ATI                = 0x877B;
enum GL_BUMP_TARGET_ATI                = 0x877C;
}

version (GL_ATI_fragment_shader) {} else {
enum GL_FRAGMENT_SHADER_ATI            = 0x8920;
enum GL_REG_0_ATI                      = 0x8921;
enum GL_REG_1_ATI                      = 0x8922;
enum GL_REG_2_ATI                      = 0x8923;
enum GL_REG_3_ATI                      = 0x8924;
enum GL_REG_4_ATI                      = 0x8925;
enum GL_REG_5_ATI                      = 0x8926;
enum GL_REG_6_ATI                      = 0x8927;
enum GL_REG_7_ATI                      = 0x8928;
enum GL_REG_8_ATI                      = 0x8929;
enum GL_REG_9_ATI                      = 0x892A;
enum GL_REG_10_ATI                     = 0x892B;
enum GL_REG_11_ATI                     = 0x892C;
enum GL_REG_12_ATI                     = 0x892D;
enum GL_REG_13_ATI                     = 0x892E;
enum GL_REG_14_ATI                     = 0x892F;
enum GL_REG_15_ATI                     = 0x8930;
enum GL_REG_16_ATI                     = 0x8931;
enum GL_REG_17_ATI                     = 0x8932;
enum GL_REG_18_ATI                     = 0x8933;
enum GL_REG_19_ATI                     = 0x8934;
enum GL_REG_20_ATI                     = 0x8935;
enum GL_REG_21_ATI                     = 0x8936;
enum GL_REG_22_ATI                     = 0x8937;
enum GL_REG_23_ATI                     = 0x8938;
enum GL_REG_24_ATI                     = 0x8939;
enum GL_REG_25_ATI                     = 0x893A;
enum GL_REG_26_ATI                     = 0x893B;
enum GL_REG_27_ATI                     = 0x893C;
enum GL_REG_28_ATI                     = 0x893D;
enum GL_REG_29_ATI                     = 0x893E;
enum GL_REG_30_ATI                     = 0x893F;
enum GL_REG_31_ATI                     = 0x8940;
enum GL_CON_0_ATI                      = 0x8941;
enum GL_CON_1_ATI                      = 0x8942;
enum GL_CON_2_ATI                      = 0x8943;
enum GL_CON_3_ATI                      = 0x8944;
enum GL_CON_4_ATI                      = 0x8945;
enum GL_CON_5_ATI                      = 0x8946;
enum GL_CON_6_ATI                      = 0x8947;
enum GL_CON_7_ATI                      = 0x8948;
enum GL_CON_8_ATI                      = 0x8949;
enum GL_CON_9_ATI                      = 0x894A;
enum GL_CON_10_ATI                     = 0x894B;
enum GL_CON_11_ATI                     = 0x894C;
enum GL_CON_12_ATI                     = 0x894D;
enum GL_CON_13_ATI                     = 0x894E;
enum GL_CON_14_ATI                     = 0x894F;
enum GL_CON_15_ATI                     = 0x8950;
enum GL_CON_16_ATI                     = 0x8951;
enum GL_CON_17_ATI                     = 0x8952;
enum GL_CON_18_ATI                     = 0x8953;
enum GL_CON_19_ATI                     = 0x8954;
enum GL_CON_20_ATI                     = 0x8955;
enum GL_CON_21_ATI                     = 0x8956;
enum GL_CON_22_ATI                     = 0x8957;
enum GL_CON_23_ATI                     = 0x8958;
enum GL_CON_24_ATI                     = 0x8959;
enum GL_CON_25_ATI                     = 0x895A;
enum GL_CON_26_ATI                     = 0x895B;
enum GL_CON_27_ATI                     = 0x895C;
enum GL_CON_28_ATI                     = 0x895D;
enum GL_CON_29_ATI                     = 0x895E;
enum GL_CON_30_ATI                     = 0x895F;
enum GL_CON_31_ATI                     = 0x8960;
enum GL_MOV_ATI                        = 0x8961;
enum GL_ADD_ATI                        = 0x8963;
enum GL_MUL_ATI                        = 0x8964;
enum GL_SUB_ATI                        = 0x8965;
enum GL_DOT3_ATI                       = 0x8966;
enum GL_DOT4_ATI                       = 0x8967;
enum GL_MAD_ATI                        = 0x8968;
enum GL_LERP_ATI                       = 0x8969;
enum GL_CND_ATI                        = 0x896A;
enum GL_CND0_ATI                       = 0x896B;
enum GL_DOT2_ADD_ATI                   = 0x896C;
enum GL_SECONDARY_INTERPOLATOR_ATI     = 0x896D;
enum GL_NUM_FRAGMENT_REGISTERS_ATI     = 0x896E;
enum GL_NUM_FRAGMENT_CONSTANTS_ATI     = 0x896F;
enum GL_NUM_PASSES_ATI                 = 0x8970;
enum GL_NUM_INSTRUCTIONS_PER_PASS_ATI  = 0x8971;
enum GL_NUM_INSTRUCTIONS_TOTAL_ATI     = 0x8972;
enum GL_NUM_INPUT_INTERPOLATOR_COMPONENTS_ATI = 0x8973;
enum GL_NUM_LOOPBACK_COMPONENTS_ATI    = 0x8974;
enum GL_COLOR_ALPHA_PAIRING_ATI        = 0x8975;
enum GL_SWIZZLE_STR_ATI                = 0x8976;
enum GL_SWIZZLE_STQ_ATI                = 0x8977;
enum GL_SWIZZLE_STR_DR_ATI             = 0x8978;
enum GL_SWIZZLE_STQ_DQ_ATI             = 0x8979;
enum GL_SWIZZLE_STRQ_ATI               = 0x897A;
enum GL_SWIZZLE_STRQ_DQ_ATI            = 0x897B;
enum GL_RED_BIT_ATI                    = 0x00000001;
enum GL_GREEN_BIT_ATI                  = 0x00000002;
enum GL_BLUE_BIT_ATI                   = 0x00000004;
enum GL_2X_BIT_ATI                     = 0x00000001;
enum GL_4X_BIT_ATI                     = 0x00000002;
enum GL_8X_BIT_ATI                     = 0x00000004;
enum GL_HALF_BIT_ATI                   = 0x00000008;
enum GL_QUARTER_BIT_ATI                = 0x00000010;
enum GL_EIGHTH_BIT_ATI                 = 0x00000020;
enum GL_SATURATE_BIT_ATI               = 0x00000040;
enum GL_COMP_BIT_ATI                   = 0x00000002;
enum GL_NEGATE_BIT_ATI                 = 0x00000004;
enum GL_BIAS_BIT_ATI                   = 0x00000008;
}

version (GL_ATI_pn_triangles) {} else {
enum GL_PN_TRIANGLES_ATI               = 0x87F0;
enum GL_MAX_PN_TRIANGLES_TESSELATION_LEVEL_ATI = 0x87F1;
enum GL_PN_TRIANGLES_POINT_MODE_ATI    = 0x87F2;
enum GL_PN_TRIANGLES_NORMAL_MODE_ATI   = 0x87F3;
enum GL_PN_TRIANGLES_TESSELATION_LEVEL_ATI = 0x87F4;
enum GL_PN_TRIANGLES_POINT_MODE_LINEAR_ATI = 0x87F5;
enum GL_PN_TRIANGLES_POINT_MODE_CUBIC_ATI = 0x87F6;
enum GL_PN_TRIANGLES_NORMAL_MODE_LINEAR_ATI = 0x87F7;
enum GL_PN_TRIANGLES_NORMAL_MODE_QUADRATIC_ATI = 0x87F8;
}

version (GL_ATI_vertex_array_object) {} else {
enum GL_STATIC_ATI                     = 0x8760;
enum GL_DYNAMIC_ATI                    = 0x8761;
enum GL_PRESERVE_ATI                   = 0x8762;
enum GL_DISCARD_ATI                    = 0x8763;
enum GL_OBJECT_BUFFER_SIZE_ATI         = 0x8764;
enum GL_OBJECT_BUFFER_USAGE_ATI        = 0x8765;
enum GL_ARRAY_OBJECT_BUFFER_ATI        = 0x8766;
enum GL_ARRAY_OBJECT_OFFSET_ATI        = 0x8767;
}

version (GL_EXT_vertex_shader) {} else {
enum GL_VERTEX_SHADER_EXT              = 0x8780;
enum GL_VERTEX_SHADER_BINDING_EXT      = 0x8781;
enum GL_OP_INDEX_EXT                   = 0x8782;
enum GL_OP_NEGATE_EXT                  = 0x8783;
enum GL_OP_DOT3_EXT                    = 0x8784;
enum GL_OP_DOT4_EXT                    = 0x8785;
enum GL_OP_MUL_EXT                     = 0x8786;
enum GL_OP_ADD_EXT                     = 0x8787;
enum GL_OP_MADD_EXT                    = 0x8788;
enum GL_OP_FRAC_EXT                    = 0x8789;
enum GL_OP_MAX_EXT                     = 0x878A;
enum GL_OP_MIN_EXT                     = 0x878B;
enum GL_OP_SET_GE_EXT                  = 0x878C;
enum GL_OP_SET_LT_EXT                  = 0x878D;
enum GL_OP_CLAMP_EXT                   = 0x878E;
enum GL_OP_FLOOR_EXT                   = 0x878F;
enum GL_OP_ROUND_EXT                   = 0x8790;
enum GL_OP_EXP_BASE_2_EXT              = 0x8791;
enum GL_OP_LOG_BASE_2_EXT              = 0x8792;
enum GL_OP_POWER_EXT                   = 0x8793;
enum GL_OP_RECIP_EXT                   = 0x8794;
enum GL_OP_RECIP_SQRT_EXT              = 0x8795;
enum GL_OP_SUB_EXT                     = 0x8796;
enum GL_OP_CROSS_PRODUCT_EXT           = 0x8797;
enum GL_OP_MULTIPLY_MATRIX_EXT         = 0x8798;
enum GL_OP_MOV_EXT                     = 0x8799;
enum GL_OUTPUT_VERTEX_EXT              = 0x879A;
enum GL_OUTPUT_COLOR0_EXT              = 0x879B;
enum GL_OUTPUT_COLOR1_EXT              = 0x879C;
enum GL_OUTPUT_TEXTURE_COORD0_EXT      = 0x879D;
enum GL_OUTPUT_TEXTURE_COORD1_EXT      = 0x879E;
enum GL_OUTPUT_TEXTURE_COORD2_EXT      = 0x879F;
enum GL_OUTPUT_TEXTURE_COORD3_EXT      = 0x87A0;
enum GL_OUTPUT_TEXTURE_COORD4_EXT      = 0x87A1;
enum GL_OUTPUT_TEXTURE_COORD5_EXT      = 0x87A2;
enum GL_OUTPUT_TEXTURE_COORD6_EXT      = 0x87A3;
enum GL_OUTPUT_TEXTURE_COORD7_EXT      = 0x87A4;
enum GL_OUTPUT_TEXTURE_COORD8_EXT      = 0x87A5;
enum GL_OUTPUT_TEXTURE_COORD9_EXT      = 0x87A6;
enum GL_OUTPUT_TEXTURE_COORD10_EXT     = 0x87A7;
enum GL_OUTPUT_TEXTURE_COORD11_EXT     = 0x87A8;
enum GL_OUTPUT_TEXTURE_COORD12_EXT     = 0x87A9;
enum GL_OUTPUT_TEXTURE_COORD13_EXT     = 0x87AA;
enum GL_OUTPUT_TEXTURE_COORD14_EXT     = 0x87AB;
enum GL_OUTPUT_TEXTURE_COORD15_EXT     = 0x87AC;
enum GL_OUTPUT_TEXTURE_COORD16_EXT     = 0x87AD;
enum GL_OUTPUT_TEXTURE_COORD17_EXT     = 0x87AE;
enum GL_OUTPUT_TEXTURE_COORD18_EXT     = 0x87AF;
enum GL_OUTPUT_TEXTURE_COORD19_EXT     = 0x87B0;
enum GL_OUTPUT_TEXTURE_COORD20_EXT     = 0x87B1;
enum GL_OUTPUT_TEXTURE_COORD21_EXT     = 0x87B2;
enum GL_OUTPUT_TEXTURE_COORD22_EXT     = 0x87B3;
enum GL_OUTPUT_TEXTURE_COORD23_EXT     = 0x87B4;
enum GL_OUTPUT_TEXTURE_COORD24_EXT     = 0x87B5;
enum GL_OUTPUT_TEXTURE_COORD25_EXT     = 0x87B6;
enum GL_OUTPUT_TEXTURE_COORD26_EXT     = 0x87B7;
enum GL_OUTPUT_TEXTURE_COORD27_EXT     = 0x87B8;
enum GL_OUTPUT_TEXTURE_COORD28_EXT     = 0x87B9;
enum GL_OUTPUT_TEXTURE_COORD29_EXT     = 0x87BA;
enum GL_OUTPUT_TEXTURE_COORD30_EXT     = 0x87BB;
enum GL_OUTPUT_TEXTURE_COORD31_EXT     = 0x87BC;
enum GL_OUTPUT_FOG_EXT                 = 0x87BD;
enum GL_SCALAR_EXT                     = 0x87BE;
enum GL_VECTOR_EXT                     = 0x87BF;
enum GL_MATRIX_EXT                     = 0x87C0;
enum GL_VARIANT_EXT                    = 0x87C1;
enum GL_INVARIANT_EXT                  = 0x87C2;
enum GL_LOCAL_CONSTANT_EXT             = 0x87C3;
enum GL_LOCAL_EXT                      = 0x87C4;
enum GL_MAX_VERTEX_SHADER_INSTRUCTIONS_EXT = 0x87C5;
enum GL_MAX_VERTEX_SHADER_VARIANTS_EXT = 0x87C6;
enum GL_MAX_VERTEX_SHADER_INVARIANTS_EXT = 0x87C7;
enum GL_MAX_VERTEX_SHADER_LOCAL_CONSTANTS_EXT = 0x87C8;
enum GL_MAX_VERTEX_SHADER_LOCALS_EXT   = 0x87C9;
enum GL_MAX_OPTIMIZED_VERTEX_SHADER_INSTRUCTIONS_EXT = 0x87CA;
enum GL_MAX_OPTIMIZED_VERTEX_SHADER_VARIANTS_EXT = 0x87CB;
enum GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCAL_CONSTANTS_EXT = 0x87CC;
enum GL_MAX_OPTIMIZED_VERTEX_SHADER_INVARIANTS_EXT = 0x87CD;
enum GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCALS_EXT = 0x87CE;
enum GL_VERTEX_SHADER_INSTRUCTIONS_EXT = 0x87CF;
enum GL_VERTEX_SHADER_VARIANTS_EXT     = 0x87D0;
enum GL_VERTEX_SHADER_INVARIANTS_EXT   = 0x87D1;
enum GL_VERTEX_SHADER_LOCAL_CONSTANTS_EXT = 0x87D2;
enum GL_VERTEX_SHADER_LOCALS_EXT       = 0x87D3;
enum GL_VERTEX_SHADER_OPTIMIZED_EXT    = 0x87D4;
enum GL_X_EXT                          = 0x87D5;
enum GL_Y_EXT                          = 0x87D6;
enum GL_Z_EXT                          = 0x87D7;
enum GL_W_EXT                          = 0x87D8;
enum GL_NEGATIVE_X_EXT                 = 0x87D9;
enum GL_NEGATIVE_Y_EXT                 = 0x87DA;
enum GL_NEGATIVE_Z_EXT                 = 0x87DB;
enum GL_NEGATIVE_W_EXT                 = 0x87DC;
enum GL_ZERO_EXT                       = 0x87DD;
enum GL_ONE_EXT                        = 0x87DE;
enum GL_NEGATIVE_ONE_EXT               = 0x87DF;
enum GL_NORMALIZED_RANGE_EXT           = 0x87E0;
enum GL_FULL_RANGE_EXT                 = 0x87E1;
enum GL_CURRENT_VERTEX_EXT             = 0x87E2;
enum GL_MVP_MATRIX_EXT                 = 0x87E3;
enum GL_VARIANT_VALUE_EXT              = 0x87E4;
enum GL_VARIANT_DATATYPE_EXT           = 0x87E5;
enum GL_VARIANT_ARRAY_STRIDE_EXT       = 0x87E6;
enum GL_VARIANT_ARRAY_TYPE_EXT         = 0x87E7;
enum GL_VARIANT_ARRAY_EXT              = 0x87E8;
enum GL_VARIANT_ARRAY_POINTER_EXT      = 0x87E9;
enum GL_INVARIANT_VALUE_EXT            = 0x87EA;
enum GL_INVARIANT_DATATYPE_EXT         = 0x87EB;
enum GL_LOCAL_CONSTANT_VALUE_EXT       = 0x87EC;
enum GL_LOCAL_CONSTANT_DATATYPE_EXT    = 0x87ED;
}

version (GL_ATI_vertex_streams) {} else {
enum GL_MAX_VERTEX_STREAMS_ATI         = 0x876B;
enum GL_VERTEX_STREAM0_ATI             = 0x876C;
enum GL_VERTEX_STREAM1_ATI             = 0x876D;
enum GL_VERTEX_STREAM2_ATI             = 0x876E;
enum GL_VERTEX_STREAM3_ATI             = 0x876F;
enum GL_VERTEX_STREAM4_ATI             = 0x8770;
enum GL_VERTEX_STREAM5_ATI             = 0x8771;
enum GL_VERTEX_STREAM6_ATI             = 0x8772;
enum GL_VERTEX_STREAM7_ATI             = 0x8773;
enum GL_VERTEX_SOURCE_ATI              = 0x8774;
}

version (GL_ATI_element_array) {} else {
enum GL_ELEMENT_ARRAY_ATI              = 0x8768;
enum GL_ELEMENT_ARRAY_TYPE_ATI         = 0x8769;
enum GL_ELEMENT_ARRAY_POINTER_ATI      = 0x876A;
}

version (GL_SUN_mesh_array) {} else {
enum GL_QUAD_MESH_SUN                  = 0x8614;
enum GL_TRIANGLE_MESH_SUN              = 0x8615;
}

version (GL_SUN_slice_accum) {} else {
enum GL_SLICE_ACCUM_SUN                = 0x85CC;
}

version (GL_NV_multisample_filter_hint) {} else {
enum GL_MULTISAMPLE_FILTER_HINT_NV     = 0x8534;
}

version (GL_NV_depth_clamp) {} else {
enum GL_DEPTH_CLAMP_NV                 = 0x864F;
}

version (GL_NV_occlusion_query) {} else {
enum GL_PIXEL_COUNTER_BITS_NV          = 0x8864;
enum GL_CURRENT_OCCLUSION_QUERY_ID_NV  = 0x8865;
enum GL_PIXEL_COUNT_NV                 = 0x8866;
enum GL_PIXEL_COUNT_AVAILABLE_NV       = 0x8867;
}

version (GL_NV_point_sprite) {} else {
enum GL_POINT_SPRITE_NV                = 0x8861;
enum GL_COORD_REPLACE_NV               = 0x8862;
enum GL_POINT_SPRITE_R_MODE_NV         = 0x8863;
}

version (GL_NV_texture_shader3) {} else {
enum GL_OFFSET_PROJECTIVE_TEXTURE_2D_NV = 0x8850;
enum GL_OFFSET_PROJECTIVE_TEXTURE_2D_SCALE_NV = 0x8851;
enum GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_NV = 0x8852;
enum GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_SCALE_NV = 0x8853;
enum GL_OFFSET_HILO_TEXTURE_2D_NV      = 0x8854;
enum GL_OFFSET_HILO_TEXTURE_RECTANGLE_NV = 0x8855;
enum GL_OFFSET_HILO_PROJECTIVE_TEXTURE_2D_NV = 0x8856;
enum GL_OFFSET_HILO_PROJECTIVE_TEXTURE_RECTANGLE_NV = 0x8857;
enum GL_DEPENDENT_HILO_TEXTURE_2D_NV   = 0x8858;
enum GL_DEPENDENT_RGB_TEXTURE_3D_NV    = 0x8859;
enum GL_DEPENDENT_RGB_TEXTURE_CUBE_MAP_NV = 0x885A;
enum GL_DOT_PRODUCT_PASS_THROUGH_NV    = 0x885B;
enum GL_DOT_PRODUCT_TEXTURE_1D_NV      = 0x885C;
enum GL_DOT_PRODUCT_AFFINE_DEPTH_REPLACE_NV = 0x885D;
enum GL_HILO8_NV                       = 0x885E;
enum GL_SIGNED_HILO8_NV                = 0x885F;
enum GL_FORCE_BLUE_TO_ONE_NV           = 0x8860;
}

version (GL_NV_vertex_program1_1) {} else {
}

version (GL_EXT_shadow_funcs) {} else {
}

version (GL_EXT_stencil_two_side) {} else {
enum GL_STENCIL_TEST_TWO_SIDE_EXT      = 0x8910;
enum GL_ACTIVE_STENCIL_FACE_EXT        = 0x8911;
}

version (GL_ATI_text_fragment_shader) {} else {
enum GL_TEXT_FRAGMENT_SHADER_ATI       = 0x8200;
}

version (GL_APPLE_client_storage) {} else {
enum GL_UNPACK_CLIENT_STORAGE_APPLE    = 0x85B2;
}

version (GL_APPLE_element_array) {} else {
enum GL_ELEMENT_ARRAY_APPLE            = 0x8A0C;
enum GL_ELEMENT_ARRAY_TYPE_APPLE       = 0x8A0D;
enum GL_ELEMENT_ARRAY_POINTER_APPLE    = 0x8A0E;
}

version (GL_APPLE_fence) {} else {
enum GL_DRAW_PIXELS_APPLE              = 0x8A0A;
enum GL_FENCE_APPLE                    = 0x8A0B;
}

version (GL_APPLE_vertex_array_object) {} else {
enum GL_VERTEX_ARRAY_BINDING_APPLE     = 0x85B5;
}

version (GL_APPLE_vertex_array_range) {} else {
enum GL_VERTEX_ARRAY_RANGE_APPLE       = 0x851D;
enum GL_VERTEX_ARRAY_RANGE_LENGTH_APPLE = 0x851E;
enum GL_VERTEX_ARRAY_STORAGE_HINT_APPLE = 0x851F;
enum GL_VERTEX_ARRAY_RANGE_POINTER_APPLE = 0x8521;
enum GL_STORAGE_CLIENT_APPLE           = 0x85B4;
enum GL_STORAGE_CACHED_APPLE           = 0x85BE;
enum GL_STORAGE_SHARED_APPLE           = 0x85BF;
}

version (GL_APPLE_ycbcr_422) {} else {
enum GL_YCBCR_422_APPLE                = 0x85B9;
enum GL_UNSIGNED_SHORT_8_8_APPLE       = 0x85BA;
enum GL_UNSIGNED_SHORT_8_8_REV_APPLE   = 0x85BB;
}

version (GL_S3_s3tc) {} else {
enum GL_RGB_S3TC                       = 0x83A0;
enum GL_RGB4_S3TC                      = 0x83A1;
enum GL_RGBA_S3TC                      = 0x83A2;
enum GL_RGBA4_S3TC                     = 0x83A3;
enum GL_RGBA_DXT5_S3TC                 = 0x83A4;
enum GL_RGBA4_DXT5_S3TC                = 0x83A5;
}

version (GL_ATI_draw_buffers) {} else {
enum GL_MAX_DRAW_BUFFERS_ATI           = 0x8824;
enum GL_DRAW_BUFFER0_ATI               = 0x8825;
enum GL_DRAW_BUFFER1_ATI               = 0x8826;
enum GL_DRAW_BUFFER2_ATI               = 0x8827;
enum GL_DRAW_BUFFER3_ATI               = 0x8828;
enum GL_DRAW_BUFFER4_ATI               = 0x8829;
enum GL_DRAW_BUFFER5_ATI               = 0x882A;
enum GL_DRAW_BUFFER6_ATI               = 0x882B;
enum GL_DRAW_BUFFER7_ATI               = 0x882C;
enum GL_DRAW_BUFFER8_ATI               = 0x882D;
enum GL_DRAW_BUFFER9_ATI               = 0x882E;
enum GL_DRAW_BUFFER10_ATI              = 0x882F;
enum GL_DRAW_BUFFER11_ATI              = 0x8830;
enum GL_DRAW_BUFFER12_ATI              = 0x8831;
enum GL_DRAW_BUFFER13_ATI              = 0x8832;
enum GL_DRAW_BUFFER14_ATI              = 0x8833;
enum GL_DRAW_BUFFER15_ATI              = 0x8834;
}

version (GL_ATI_pixel_format_float) {} else {
enum GL_RGBA_FLOAT_MODE_ATI            = 0x8820;
enum GL_COLOR_CLEAR_UNCLAMPED_VALUE_ATI = 0x8835;
}

version (GL_ATI_texture_env_combine3) {} else {
enum GL_MODULATE_ADD_ATI               = 0x8744;
enum GL_MODULATE_SIGNED_ADD_ATI        = 0x8745;
enum GL_MODULATE_SUBTRACT_ATI          = 0x8746;
}

version (GL_ATI_texture_float) {} else {
enum GL_RGBA_FLOAT32_ATI               = 0x8814;
enum GL_RGB_FLOAT32_ATI                = 0x8815;
enum GL_ALPHA_FLOAT32_ATI              = 0x8816;
enum GL_INTENSITY_FLOAT32_ATI          = 0x8817;
enum GL_LUMINANCE_FLOAT32_ATI          = 0x8818;
enum GL_LUMINANCE_ALPHA_FLOAT32_ATI    = 0x8819;
enum GL_RGBA_FLOAT16_ATI               = 0x881A;
enum GL_RGB_FLOAT16_ATI                = 0x881B;
enum GL_ALPHA_FLOAT16_ATI              = 0x881C;
enum GL_INTENSITY_FLOAT16_ATI          = 0x881D;
enum GL_LUMINANCE_FLOAT16_ATI          = 0x881E;
enum GL_LUMINANCE_ALPHA_FLOAT16_ATI    = 0x881F;
}

version (GL_NV_float_buffer) {} else {
enum GL_FLOAT_R_NV                     = 0x8880;
enum GL_FLOAT_RG_NV                    = 0x8881;
enum GL_FLOAT_RGB_NV                   = 0x8882;
enum GL_FLOAT_RGBA_NV                  = 0x8883;
enum GL_FLOAT_R16_NV                   = 0x8884;
enum GL_FLOAT_R32_NV                   = 0x8885;
enum GL_FLOAT_RG16_NV                  = 0x8886;
enum GL_FLOAT_RG32_NV                  = 0x8887;
enum GL_FLOAT_RGB16_NV                 = 0x8888;
enum GL_FLOAT_RGB32_NV                 = 0x8889;
enum GL_FLOAT_RGBA16_NV                = 0x888A;
enum GL_FLOAT_RGBA32_NV                = 0x888B;
enum GL_TEXTURE_FLOAT_COMPONENTS_NV    = 0x888C;
enum GL_FLOAT_CLEAR_COLOR_VALUE_NV     = 0x888D;
enum GL_FLOAT_RGBA_MODE_NV             = 0x888E;
}

version (GL_NV_fragment_program) {} else {
enum GL_MAX_FRAGMENT_PROGRAM_LOCAL_PARAMETERS_NV = 0x8868;
enum GL_FRAGMENT_PROGRAM_NV            = 0x8870;
enum GL_MAX_TEXTURE_COORDS_NV          = 0x8871;
enum GL_MAX_TEXTURE_IMAGE_UNITS_NV     = 0x8872;
enum GL_FRAGMENT_PROGRAM_BINDING_NV    = 0x8873;
enum GL_PROGRAM_ERROR_STRING_NV        = 0x8874;
}

version (GL_NV_half_float) {} else {
enum GL_HALF_FLOAT_NV                  = 0x140B;
}

version (GL_NV_pixel_data_range) {} else {
enum GL_WRITE_PIXEL_DATA_RANGE_NV      = 0x8878;
enum GL_READ_PIXEL_DATA_RANGE_NV       = 0x8879;
enum GL_WRITE_PIXEL_DATA_RANGE_LENGTH_NV = 0x887A;
enum GL_READ_PIXEL_DATA_RANGE_LENGTH_NV = 0x887B;
enum GL_WRITE_PIXEL_DATA_RANGE_POINTER_NV = 0x887C;
enum GL_READ_PIXEL_DATA_RANGE_POINTER_NV = 0x887D;
}

version (GL_NV_primitive_restart) {} else {
enum GL_PRIMITIVE_RESTART_NV           = 0x8558;
enum GL_PRIMITIVE_RESTART_INDEX_NV     = 0x8559;
}

version (GL_NV_texture_expand_normal) {} else {
enum GL_TEXTURE_UNSIGNED_REMAP_MODE_NV = 0x888F;
}

version (GL_NV_vertex_program2) {} else {
}

version (GL_ATI_map_object_buffer) {} else {
}

version (GL_ATI_separate_stencil) {} else {
enum GL_STENCIL_BACK_FUNC_ATI          = 0x8800;
enum GL_STENCIL_BACK_FAIL_ATI          = 0x8801;
enum GL_STENCIL_BACK_PASS_DEPTH_FAIL_ATI = 0x8802;
enum GL_STENCIL_BACK_PASS_DEPTH_PASS_ATI = 0x8803;
}

version (GL_ATI_vertex_attrib_array_object) {} else {
}

version (GL_OES_read_format) {} else {
enum GL_IMPLEMENTATION_COLOR_READ_TYPE_OES = 0x8B9A;
enum GL_IMPLEMENTATION_COLOR_READ_FORMAT_OES = 0x8B9B;
}

version (GL_EXT_depth_bounds_test) {} else {
enum GL_DEPTH_BOUNDS_TEST_EXT          = 0x8890;
enum GL_DEPTH_BOUNDS_EXT               = 0x8891;
}

version (GL_EXT_texture_mirror_clamp) {} else {
enum GL_MIRROR_CLAMP_EXT               = 0x8742;
enum GL_MIRROR_CLAMP_TO_EDGE_EXT       = 0x8743;
enum GL_MIRROR_CLAMP_TO_BORDER_EXT     = 0x8912;
}

version (GL_EXT_blend_equation_separate) {} else {
enum GL_BLEND_EQUATION_RGB_EXT         = 0x8009;
enum GL_BLEND_EQUATION_ALPHA_EXT       = 0x883D;
}

version (GL_MESA_pack_invert) {} else {
enum GL_PACK_INVERT_MESA               = 0x8758;
}

version (GL_MESA_ycbcr_texture) {} else {
enum GL_UNSIGNED_SHORT_8_8_MESA        = 0x85BA;
enum GL_UNSIGNED_SHORT_8_8_REV_MESA    = 0x85BB;
enum GL_YCBCR_MESA                     = 0x8757;
}

version (GL_EXT_pixel_buffer_object) {} else {
enum GL_PIXEL_PACK_BUFFER_EXT          = 0x88EB;
enum GL_PIXEL_UNPACK_BUFFER_EXT        = 0x88EC;
enum GL_PIXEL_PACK_BUFFER_BINDING_EXT  = 0x88ED;
enum GL_PIXEL_UNPACK_BUFFER_BINDING_EXT = 0x88EF;
}

version (GL_NV_fragment_program_option) {} else {
}

version (GL_NV_fragment_program2) {} else {
enum GL_MAX_PROGRAM_EXEC_INSTRUCTIONS_NV = 0x88F4;
enum GL_MAX_PROGRAM_CALL_DEPTH_NV      = 0x88F5;
enum GL_MAX_PROGRAM_IF_DEPTH_NV        = 0x88F6;
enum GL_MAX_PROGRAM_LOOP_DEPTH_NV      = 0x88F7;
enum GL_MAX_PROGRAM_LOOP_COUNT_NV      = 0x88F8;
}

version (GL_NV_vertex_program2_option) {} else {
/* reuse GL_MAX_PROGRAM_EXEC_INSTRUCTIONS_NV */
/* reuse GL_MAX_PROGRAM_CALL_DEPTH_NV */
}

version (GL_NV_vertex_program3) {} else {
/* reuse GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS_ARB */
}

version (GL_EXT_framebuffer_object) {} else {
enum GL_INVALID_FRAMEBUFFER_OPERATION_EXT = 0x0506;
enum GL_MAX_RENDERBUFFER_SIZE_EXT      = 0x84E8;
enum GL_FRAMEBUFFER_BINDING_EXT        = 0x8CA6;
enum GL_RENDERBUFFER_BINDING_EXT       = 0x8CA7;
enum GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE_EXT = 0x8CD0;
enum GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME_EXT = 0x8CD1;
enum GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL_EXT = 0x8CD2;
enum GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE_EXT = 0x8CD3;
enum GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_3D_ZOFFSET_EXT = 0x8CD4;
enum GL_FRAMEBUFFER_COMPLETE_EXT       = 0x8CD5;
enum GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT_EXT = 0x8CD6;
enum GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT_EXT = 0x8CD7;
enum GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS_EXT = 0x8CD9;
enum GL_FRAMEBUFFER_INCOMPLETE_FORMATS_EXT = 0x8CDA;
enum GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER_EXT = 0x8CDB;
enum GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER_EXT = 0x8CDC;
enum GL_FRAMEBUFFER_UNSUPPORTED_EXT    = 0x8CDD;
enum GL_MAX_COLOR_ATTACHMENTS_EXT      = 0x8CDF;
enum GL_COLOR_ATTACHMENT0_EXT          = 0x8CE0;
enum GL_COLOR_ATTACHMENT1_EXT          = 0x8CE1;
enum GL_COLOR_ATTACHMENT2_EXT          = 0x8CE2;
enum GL_COLOR_ATTACHMENT3_EXT          = 0x8CE3;
enum GL_COLOR_ATTACHMENT4_EXT          = 0x8CE4;
enum GL_COLOR_ATTACHMENT5_EXT          = 0x8CE5;
enum GL_COLOR_ATTACHMENT6_EXT          = 0x8CE6;
enum GL_COLOR_ATTACHMENT7_EXT          = 0x8CE7;
enum GL_COLOR_ATTACHMENT8_EXT          = 0x8CE8;
enum GL_COLOR_ATTACHMENT9_EXT          = 0x8CE9;
enum GL_COLOR_ATTACHMENT10_EXT         = 0x8CEA;
enum GL_COLOR_ATTACHMENT11_EXT         = 0x8CEB;
enum GL_COLOR_ATTACHMENT12_EXT         = 0x8CEC;
enum GL_COLOR_ATTACHMENT13_EXT         = 0x8CED;
enum GL_COLOR_ATTACHMENT14_EXT         = 0x8CEE;
enum GL_COLOR_ATTACHMENT15_EXT         = 0x8CEF;
enum GL_DEPTH_ATTACHMENT_EXT           = 0x8D00;
enum GL_STENCIL_ATTACHMENT_EXT         = 0x8D20;
enum GL_FRAMEBUFFER_EXT                = 0x8D40;
enum GL_RENDERBUFFER_EXT               = 0x8D41;
enum GL_RENDERBUFFER_WIDTH_EXT         = 0x8D42;
enum GL_RENDERBUFFER_HEIGHT_EXT        = 0x8D43;
enum GL_RENDERBUFFER_INTERNAL_FORMAT_EXT = 0x8D44;
enum GL_STENCIL_INDEX1_EXT             = 0x8D46;
enum GL_STENCIL_INDEX4_EXT             = 0x8D47;
enum GL_STENCIL_INDEX8_EXT             = 0x8D48;
enum GL_STENCIL_INDEX16_EXT            = 0x8D49;
enum GL_RENDERBUFFER_RED_SIZE_EXT      = 0x8D50;
enum GL_RENDERBUFFER_GREEN_SIZE_EXT    = 0x8D51;
enum GL_RENDERBUFFER_BLUE_SIZE_EXT     = 0x8D52;
enum GL_RENDERBUFFER_ALPHA_SIZE_EXT    = 0x8D53;
enum GL_RENDERBUFFER_DEPTH_SIZE_EXT    = 0x8D54;
enum GL_RENDERBUFFER_STENCIL_SIZE_EXT  = 0x8D55;
}

version (GL_GREMEDY_string_marker) {} else {
}

version (GL_EXT_packed_depth_stencil) {} else {
enum GL_DEPTH_STENCIL_EXT              = 0x84F9;
enum GL_UNSIGNED_INT_24_8_EXT          = 0x84FA;
enum GL_DEPTH24_STENCIL8_EXT           = 0x88F0;
enum GL_TEXTURE_STENCIL_SIZE_EXT       = 0x88F1;
}

version (GL_EXT_stencil_clear_tag) {} else {
enum GL_STENCIL_TAG_BITS_EXT           = 0x88F2;
enum GL_STENCIL_CLEAR_TAG_VALUE_EXT    = 0x88F3;
}

version (GL_EXT_texture_sRGB) {} else {
enum GL_SRGB_EXT                       = 0x8C40;
enum GL_SRGB8_EXT                      = 0x8C41;
enum GL_SRGB_ALPHA_EXT                 = 0x8C42;
enum GL_SRGB8_ALPHA8_EXT               = 0x8C43;
enum GL_SLUMINANCE_ALPHA_EXT           = 0x8C44;
enum GL_SLUMINANCE8_ALPHA8_EXT         = 0x8C45;
enum GL_SLUMINANCE_EXT                 = 0x8C46;
enum GL_SLUMINANCE8_EXT                = 0x8C47;
enum GL_COMPRESSED_SRGB_EXT            = 0x8C48;
enum GL_COMPRESSED_SRGB_ALPHA_EXT      = 0x8C49;
enum GL_COMPRESSED_SLUMINANCE_EXT      = 0x8C4A;
enum GL_COMPRESSED_SLUMINANCE_ALPHA_EXT = 0x8C4B;
enum GL_COMPRESSED_SRGB_S3TC_DXT1_EXT  = 0x8C4C;
enum GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT = 0x8C4D;
enum GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT = 0x8C4E;
enum GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT = 0x8C4F;
}

version (GL_EXT_framebuffer_blit) {} else {
enum GL_READ_FRAMEBUFFER_EXT           = 0x8CA8;
enum GL_DRAW_FRAMEBUFFER_EXT           = 0x8CA9;
enum GL_DRAW_FRAMEBUFFER_BINDING_EXT   = GL_FRAMEBUFFER_BINDING_EXT;
enum GL_READ_FRAMEBUFFER_BINDING_EXT   = 0x8CAA;
}

version (GL_EXT_framebuffer_multisample) {} else {
enum GL_RENDERBUFFER_SAMPLES_EXT       = 0x8CAB;
enum GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE_EXT = 0x8D56;
enum GL_MAX_SAMPLES_EXT                = 0x8D57;
}

version (GL_MESAX_texture_stack) {} else {
enum GL_TEXTURE_1D_STACK_MESAX         = 0x8759;
enum GL_TEXTURE_2D_STACK_MESAX         = 0x875A;
enum GL_PROXY_TEXTURE_1D_STACK_MESAX   = 0x875B;
enum GL_PROXY_TEXTURE_2D_STACK_MESAX   = 0x875C;
enum GL_TEXTURE_1D_STACK_BINDING_MESAX = 0x875D;
enum GL_TEXTURE_2D_STACK_BINDING_MESAX = 0x875E;
}

version (GL_EXT_timer_query) {} else {
enum GL_TIME_ELAPSED_EXT               = 0x88BF;
}

version (GL_EXT_gpu_program_parameters) {} else {
}

version (GL_APPLE_flush_buffer_range) {} else {
enum GL_BUFFER_SERIALIZED_MODIFY_APPLE = 0x8A12;
enum GL_BUFFER_FLUSHING_UNMAP_APPLE    = 0x8A13;
}

version (GL_NV_gpu_program4) {} else {
enum GL_MIN_PROGRAM_TEXEL_OFFSET_NV    = 0x8904;
enum GL_MAX_PROGRAM_TEXEL_OFFSET_NV    = 0x8905;
enum GL_PROGRAM_ATTRIB_COMPONENTS_NV   = 0x8906;
enum GL_PROGRAM_RESULT_COMPONENTS_NV   = 0x8907;
enum GL_MAX_PROGRAM_ATTRIB_COMPONENTS_NV = 0x8908;
enum GL_MAX_PROGRAM_RESULT_COMPONENTS_NV = 0x8909;
enum GL_MAX_PROGRAM_GENERIC_ATTRIBS_NV = 0x8DA5;
enum GL_MAX_PROGRAM_GENERIC_RESULTS_NV = 0x8DA6;
}

version (GL_NV_geometry_program4) {} else {
enum GL_LINES_ADJACENCY_EXT            = 0x000A;
enum GL_LINE_STRIP_ADJACENCY_EXT       = 0x000B;
enum GL_TRIANGLES_ADJACENCY_EXT        = 0x000C;
enum GL_TRIANGLE_STRIP_ADJACENCY_EXT   = 0x000D;
enum GL_GEOMETRY_PROGRAM_NV            = 0x8C26;
enum GL_MAX_PROGRAM_OUTPUT_VERTICES_NV = 0x8C27;
enum GL_MAX_PROGRAM_TOTAL_OUTPUT_COMPONENTS_NV = 0x8C28;
enum GL_GEOMETRY_VERTICES_OUT_EXT      = 0x8DDA;
enum GL_GEOMETRY_INPUT_TYPE_EXT        = 0x8DDB;
enum GL_GEOMETRY_OUTPUT_TYPE_EXT       = 0x8DDC;
enum GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_EXT = 0x8C29;
enum GL_FRAMEBUFFER_ATTACHMENT_LAYERED_EXT = 0x8DA7;
enum GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_EXT = 0x8DA8;
enum GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_EXT = 0x8DA9;
enum GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT = 0x8CD4;
enum GL_PROGRAM_POINT_SIZE_EXT         = 0x8642;
}

version (GL_EXT_geometry_shader4) {} else {
enum GL_GEOMETRY_SHADER_EXT            = 0x8DD9;
/* reuse GL_GEOMETRY_VERTICES_OUT_EXT */
/* reuse GL_GEOMETRY_INPUT_TYPE_EXT */
/* reuse GL_GEOMETRY_OUTPUT_TYPE_EXT */
/* reuse GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_EXT */
enum GL_MAX_GEOMETRY_VARYING_COMPONENTS_EXT = 0x8DDD;
enum GL_MAX_VERTEX_VARYING_COMPONENTS_EXT = 0x8DDE;
enum GL_MAX_VARYING_COMPONENTS_EXT     = 0x8B4B;
enum GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_EXT = 0x8DDF;
enum GL_MAX_GEOMETRY_OUTPUT_VERTICES_EXT = 0x8DE0;
enum GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_EXT = 0x8DE1;
/* reuse GL_LINES_ADJACENCY_EXT */
/* reuse GL_LINE_STRIP_ADJACENCY_EXT */
/* reuse GL_TRIANGLES_ADJACENCY_EXT */
/* reuse GL_TRIANGLE_STRIP_ADJACENCY_EXT */
/* reuse GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_EXT */
/* reuse GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_EXT */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_LAYERED_EXT */
/* reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT */
/* reuse GL_PROGRAM_POINT_SIZE_EXT */
}

version (GL_NV_vertex_program4) {} else {
enum GL_VERTEX_ATTRIB_ARRAY_INTEGER_NV = 0x88FD;
}

version (GL_EXT_gpu_shader4) {} else {
enum GL_SAMPLER_1D_ARRAY_EXT           = 0x8DC0;
enum GL_SAMPLER_2D_ARRAY_EXT           = 0x8DC1;
enum GL_SAMPLER_BUFFER_EXT             = 0x8DC2;
enum GL_SAMPLER_1D_ARRAY_SHADOW_EXT    = 0x8DC3;
enum GL_SAMPLER_2D_ARRAY_SHADOW_EXT    = 0x8DC4;
enum GL_SAMPLER_CUBE_SHADOW_EXT        = 0x8DC5;
enum GL_UNSIGNED_INT_VEC2_EXT          = 0x8DC6;
enum GL_UNSIGNED_INT_VEC3_EXT          = 0x8DC7;
enum GL_UNSIGNED_INT_VEC4_EXT          = 0x8DC8;
enum GL_INT_SAMPLER_1D_EXT             = 0x8DC9;
enum GL_INT_SAMPLER_2D_EXT             = 0x8DCA;
enum GL_INT_SAMPLER_3D_EXT             = 0x8DCB;
enum GL_INT_SAMPLER_CUBE_EXT           = 0x8DCC;
enum GL_INT_SAMPLER_2D_RECT_EXT        = 0x8DCD;
enum GL_INT_SAMPLER_1D_ARRAY_EXT       = 0x8DCE;
enum GL_INT_SAMPLER_2D_ARRAY_EXT       = 0x8DCF;
enum GL_INT_SAMPLER_BUFFER_EXT         = 0x8DD0;
enum GL_UNSIGNED_INT_SAMPLER_1D_EXT    = 0x8DD1;
enum GL_UNSIGNED_INT_SAMPLER_2D_EXT    = 0x8DD2;
enum GL_UNSIGNED_INT_SAMPLER_3D_EXT    = 0x8DD3;
enum GL_UNSIGNED_INT_SAMPLER_CUBE_EXT  = 0x8DD4;
enum GL_UNSIGNED_INT_SAMPLER_2D_RECT_EXT = 0x8DD5;
enum GL_UNSIGNED_INT_SAMPLER_1D_ARRAY_EXT = 0x8DD6;
enum GL_UNSIGNED_INT_SAMPLER_2D_ARRAY_EXT = 0x8DD7;
enum GL_UNSIGNED_INT_SAMPLER_BUFFER_EXT = 0x8DD8;
}

version (GL_EXT_draw_instanced) {} else {
}

version (GL_EXT_packed_float) {} else {
enum GL_R11F_G11F_B10F_EXT             = 0x8C3A;
enum GL_UNSIGNED_INT_10F_11F_11F_REV_EXT = 0x8C3B;
enum GL_RGBA_SIGNED_COMPONENTS_EXT     = 0x8C3C;
}

version (GL_EXT_texture_array) {} else {
enum GL_TEXTURE_1D_ARRAY_EXT           = 0x8C18;
enum GL_PROXY_TEXTURE_1D_ARRAY_EXT     = 0x8C19;
enum GL_TEXTURE_2D_ARRAY_EXT           = 0x8C1A;
enum GL_PROXY_TEXTURE_2D_ARRAY_EXT     = 0x8C1B;
enum GL_TEXTURE_BINDING_1D_ARRAY_EXT   = 0x8C1C;
enum GL_TEXTURE_BINDING_2D_ARRAY_EXT   = 0x8C1D;
enum GL_MAX_ARRAY_TEXTURE_LAYERS_EXT   = 0x88FF;
enum GL_COMPARE_REF_DEPTH_TO_TEXTURE_EXT = 0x884E;
/* reuse GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT */
}

version (GL_EXT_texture_buffer_object) {} else {
enum GL_TEXTURE_BUFFER_EXT             = 0x8C2A;
enum GL_MAX_TEXTURE_BUFFER_SIZE_EXT    = 0x8C2B;
enum GL_TEXTURE_BINDING_BUFFER_EXT     = 0x8C2C;
enum GL_TEXTURE_BUFFER_DATA_STORE_BINDING_EXT = 0x8C2D;
enum GL_TEXTURE_BUFFER_FORMAT_EXT      = 0x8C2E;
}

version (GL_EXT_texture_compression_latc) {} else {
enum GL_COMPRESSED_LUMINANCE_LATC1_EXT = 0x8C70;
enum GL_COMPRESSED_SIGNED_LUMINANCE_LATC1_EXT = 0x8C71;
enum GL_COMPRESSED_LUMINANCE_ALPHA_LATC2_EXT = 0x8C72;
enum GL_COMPRESSED_SIGNED_LUMINANCE_ALPHA_LATC2_EXT = 0x8C73;
}

version (GL_EXT_texture_compression_rgtc) {} else {
enum GL_COMPRESSED_RED_RGTC1_EXT       = 0x8DBB;
enum GL_COMPRESSED_SIGNED_RED_RGTC1_EXT = 0x8DBC;
enum GL_COMPRESSED_RED_GREEN_RGTC2_EXT = 0x8DBD;
enum GL_COMPRESSED_SIGNED_RED_GREEN_RGTC2_EXT = 0x8DBE;
}

version (GL_EXT_texture_shared_exponent) {} else {
enum GL_RGB9_E5_EXT                    = 0x8C3D;
enum GL_UNSIGNED_INT_5_9_9_9_REV_EXT   = 0x8C3E;
enum GL_TEXTURE_SHARED_SIZE_EXT        = 0x8C3F;
}

version (GL_NV_depth_buffer_float) {} else {
enum GL_DEPTH_COMPONENT32F_NV          = 0x8DAB;
enum GL_DEPTH32F_STENCIL8_NV           = 0x8DAC;
enum GL_FLOAT_32_UNSIGNED_INT_24_8_REV_NV = 0x8DAD;
enum GL_DEPTH_BUFFER_FLOAT_MODE_NV     = 0x8DAF;
}

version (GL_NV_fragment_program4) {} else {
}

version (GL_NV_framebuffer_multisample_coverage) {} else {
enum GL_RENDERBUFFER_COVERAGE_SAMPLES_NV = 0x8CAB;
enum GL_RENDERBUFFER_COLOR_SAMPLES_NV  = 0x8E10;
enum GL_MAX_MULTISAMPLE_COVERAGE_MODES_NV = 0x8E11;
enum GL_MULTISAMPLE_COVERAGE_MODES_NV  = 0x8E12;
}

version (GL_EXT_framebuffer_sRGB) {} else {
enum GL_FRAMEBUFFER_SRGB_EXT           = 0x8DB9;
enum GL_FRAMEBUFFER_SRGB_CAPABLE_EXT   = 0x8DBA;
}

version (GL_NV_geometry_shader4) {} else {
}

version (GL_NV_parameter_buffer_object) {} else {
enum GL_MAX_PROGRAM_PARAMETER_BUFFER_BINDINGS_NV = 0x8DA0;
enum GL_MAX_PROGRAM_PARAMETER_BUFFER_SIZE_NV = 0x8DA1;
enum GL_VERTEX_PROGRAM_PARAMETER_BUFFER_NV = 0x8DA2;
enum GL_GEOMETRY_PROGRAM_PARAMETER_BUFFER_NV = 0x8DA3;
enum GL_FRAGMENT_PROGRAM_PARAMETER_BUFFER_NV = 0x8DA4;
}

version (GL_EXT_draw_buffers2) {} else {
}

version (GL_NV_transform_feedback) {} else {
enum GL_BACK_PRIMARY_COLOR_NV          = 0x8C77;
enum GL_BACK_SECONDARY_COLOR_NV        = 0x8C78;
enum GL_TEXTURE_COORD_NV               = 0x8C79;
enum GL_CLIP_DISTANCE_NV               = 0x8C7A;
enum GL_VERTEX_ID_NV                   = 0x8C7B;
enum GL_PRIMITIVE_ID_NV                = 0x8C7C;
enum GL_GENERIC_ATTRIB_NV              = 0x8C7D;
enum GL_TRANSFORM_FEEDBACK_ATTRIBS_NV  = 0x8C7E;
enum GL_TRANSFORM_FEEDBACK_BUFFER_MODE_NV = 0x8C7F;
enum GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_NV = 0x8C80;
enum GL_ACTIVE_VARYINGS_NV             = 0x8C81;
enum GL_ACTIVE_VARYING_MAX_LENGTH_NV   = 0x8C82;
enum GL_TRANSFORM_FEEDBACK_VARYINGS_NV = 0x8C83;
enum GL_TRANSFORM_FEEDBACK_BUFFER_START_NV = 0x8C84;
enum GL_TRANSFORM_FEEDBACK_BUFFER_SIZE_NV = 0x8C85;
enum GL_TRANSFORM_FEEDBACK_RECORD_NV   = 0x8C86;
enum GL_PRIMITIVES_GENERATED_NV        = 0x8C87;
enum GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_NV = 0x8C88;
enum GL_RASTERIZER_DISCARD_NV          = 0x8C89;
enum GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS_NV = 0x8C8A;
enum GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_NV = 0x8C8B;
enum GL_INTERLEAVED_ATTRIBS_NV         = 0x8C8C;
enum GL_SEPARATE_ATTRIBS_NV            = 0x8C8D;
enum GL_TRANSFORM_FEEDBACK_BUFFER_NV   = 0x8C8E;
enum GL_TRANSFORM_FEEDBACK_BUFFER_BINDING_NV = 0x8C8F;
enum GL_LAYER_NV                       = 0x8DAA;
enum GL_NEXT_BUFFER_NV                 = -2;
enum GL_SKIP_COMPONENTS4_NV            = -3;
enum GL_SKIP_COMPONENTS3_NV            = -4;
enum GL_SKIP_COMPONENTS2_NV            = -5;
enum GL_SKIP_COMPONENTS1_NV            = -6;
}

version (GL_EXT_bindable_uniform) {} else {
enum GL_MAX_VERTEX_BINDABLE_UNIFORMS_EXT = 0x8DE2;
enum GL_MAX_FRAGMENT_BINDABLE_UNIFORMS_EXT = 0x8DE3;
enum GL_MAX_GEOMETRY_BINDABLE_UNIFORMS_EXT = 0x8DE4;
enum GL_MAX_BINDABLE_UNIFORM_SIZE_EXT  = 0x8DED;
enum GL_UNIFORM_BUFFER_EXT             = 0x8DEE;
enum GL_UNIFORM_BUFFER_BINDING_EXT     = 0x8DEF;
}

version (GL_EXT_texture_integer) {} else {
enum GL_RGBA32UI_EXT                   = 0x8D70;
enum GL_RGB32UI_EXT                    = 0x8D71;
enum GL_ALPHA32UI_EXT                  = 0x8D72;
enum GL_INTENSITY32UI_EXT              = 0x8D73;
enum GL_LUMINANCE32UI_EXT              = 0x8D74;
enum GL_LUMINANCE_ALPHA32UI_EXT        = 0x8D75;
enum GL_RGBA16UI_EXT                   = 0x8D76;
enum GL_RGB16UI_EXT                    = 0x8D77;
enum GL_ALPHA16UI_EXT                  = 0x8D78;
enum GL_INTENSITY16UI_EXT              = 0x8D79;
enum GL_LUMINANCE16UI_EXT              = 0x8D7A;
enum GL_LUMINANCE_ALPHA16UI_EXT        = 0x8D7B;
enum GL_RGBA8UI_EXT                    = 0x8D7C;
enum GL_RGB8UI_EXT                     = 0x8D7D;
enum GL_ALPHA8UI_EXT                   = 0x8D7E;
enum GL_INTENSITY8UI_EXT               = 0x8D7F;
enum GL_LUMINANCE8UI_EXT               = 0x8D80;
enum GL_LUMINANCE_ALPHA8UI_EXT         = 0x8D81;
enum GL_RGBA32I_EXT                    = 0x8D82;
enum GL_RGB32I_EXT                     = 0x8D83;
enum GL_ALPHA32I_EXT                   = 0x8D84;
enum GL_INTENSITY32I_EXT               = 0x8D85;
enum GL_LUMINANCE32I_EXT               = 0x8D86;
enum GL_LUMINANCE_ALPHA32I_EXT         = 0x8D87;
enum GL_RGBA16I_EXT                    = 0x8D88;
enum GL_RGB16I_EXT                     = 0x8D89;
enum GL_ALPHA16I_EXT                   = 0x8D8A;
enum GL_INTENSITY16I_EXT               = 0x8D8B;
enum GL_LUMINANCE16I_EXT               = 0x8D8C;
enum GL_LUMINANCE_ALPHA16I_EXT         = 0x8D8D;
enum GL_RGBA8I_EXT                     = 0x8D8E;
enum GL_RGB8I_EXT                      = 0x8D8F;
enum GL_ALPHA8I_EXT                    = 0x8D90;
enum GL_INTENSITY8I_EXT                = 0x8D91;
enum GL_LUMINANCE8I_EXT                = 0x8D92;
enum GL_LUMINANCE_ALPHA8I_EXT          = 0x8D93;
enum GL_RED_INTEGER_EXT                = 0x8D94;
enum GL_GREEN_INTEGER_EXT              = 0x8D95;
enum GL_BLUE_INTEGER_EXT               = 0x8D96;
enum GL_ALPHA_INTEGER_EXT              = 0x8D97;
enum GL_RGB_INTEGER_EXT                = 0x8D98;
enum GL_RGBA_INTEGER_EXT               = 0x8D99;
enum GL_BGR_INTEGER_EXT                = 0x8D9A;
enum GL_BGRA_INTEGER_EXT               = 0x8D9B;
enum GL_LUMINANCE_INTEGER_EXT          = 0x8D9C;
enum GL_LUMINANCE_ALPHA_INTEGER_EXT    = 0x8D9D;
enum GL_RGBA_INTEGER_MODE_EXT          = 0x8D9E;
}

version (GL_GREMEDY_frame_terminator) {} else {
}

version (GL_NV_conditional_render) {} else {
enum GL_QUERY_WAIT_NV                  = 0x8E13;
enum GL_QUERY_NO_WAIT_NV               = 0x8E14;
enum GL_QUERY_BY_REGION_WAIT_NV        = 0x8E15;
enum GL_QUERY_BY_REGION_NO_WAIT_NV     = 0x8E16;
}

version (GL_NV_present_video) {} else {
enum GL_FRAME_NV                       = 0x8E26;
enum GL_FIELDS_NV                      = 0x8E27;
enum GL_CURRENT_TIME_NV                = 0x8E28;
enum GL_NUM_FILL_STREAMS_NV            = 0x8E29;
enum GL_PRESENT_TIME_NV                = 0x8E2A;
enum GL_PRESENT_DURATION_NV            = 0x8E2B;
}

version (GL_EXT_transform_feedback) {} else {
enum GL_TRANSFORM_FEEDBACK_BUFFER_EXT  = 0x8C8E;
enum GL_TRANSFORM_FEEDBACK_BUFFER_START_EXT = 0x8C84;
enum GL_TRANSFORM_FEEDBACK_BUFFER_SIZE_EXT = 0x8C85;
enum GL_TRANSFORM_FEEDBACK_BUFFER_BINDING_EXT = 0x8C8F;
enum GL_INTERLEAVED_ATTRIBS_EXT        = 0x8C8C;
enum GL_SEPARATE_ATTRIBS_EXT           = 0x8C8D;
enum GL_PRIMITIVES_GENERATED_EXT       = 0x8C87;
enum GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN_EXT = 0x8C88;
enum GL_RASTERIZER_DISCARD_EXT         = 0x8C89;
enum GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS_EXT = 0x8C8A;
enum GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS_EXT = 0x8C8B;
enum GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS_EXT = 0x8C80;
enum GL_TRANSFORM_FEEDBACK_VARYINGS_EXT = 0x8C83;
enum GL_TRANSFORM_FEEDBACK_BUFFER_MODE_EXT = 0x8C7F;
enum GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH_EXT = 0x8C76;
}

version (GL_EXT_direct_state_access) {} else {
enum GL_PROGRAM_MATRIX_EXT             = 0x8E2D;
enum GL_TRANSPOSE_PROGRAM_MATRIX_EXT   = 0x8E2E;
enum GL_PROGRAM_MATRIX_STACK_DEPTH_EXT = 0x8E2F;
}

version (GL_EXT_vertex_array_bgra) {} else {
/* reuse GL_BGRA */
}

version (GL_EXT_texture_swizzle) {} else {
enum GL_TEXTURE_SWIZZLE_R_EXT          = 0x8E42;
enum GL_TEXTURE_SWIZZLE_G_EXT          = 0x8E43;
enum GL_TEXTURE_SWIZZLE_B_EXT          = 0x8E44;
enum GL_TEXTURE_SWIZZLE_A_EXT          = 0x8E45;
enum GL_TEXTURE_SWIZZLE_RGBA_EXT       = 0x8E46;
}

version (GL_NV_explicit_multisample) {} else {
enum GL_SAMPLE_POSITION_NV             = 0x8E50;
enum GL_SAMPLE_MASK_NV                 = 0x8E51;
enum GL_SAMPLE_MASK_VALUE_NV           = 0x8E52;
enum GL_TEXTURE_BINDING_RENDERBUFFER_NV = 0x8E53;
enum GL_TEXTURE_RENDERBUFFER_DATA_STORE_BINDING_NV = 0x8E54;
enum GL_TEXTURE_RENDERBUFFER_NV        = 0x8E55;
enum GL_SAMPLER_RENDERBUFFER_NV        = 0x8E56;
enum GL_INT_SAMPLER_RENDERBUFFER_NV    = 0x8E57;
enum GL_UNSIGNED_INT_SAMPLER_RENDERBUFFER_NV = 0x8E58;
enum GL_MAX_SAMPLE_MASK_WORDS_NV       = 0x8E59;
}

version (GL_NV_transform_feedback2) {} else {
enum GL_TRANSFORM_FEEDBACK_NV          = 0x8E22;
enum GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED_NV = 0x8E23;
enum GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE_NV = 0x8E24;
enum GL_TRANSFORM_FEEDBACK_BINDING_NV  = 0x8E25;
}

version (GL_ATI_meminfo) {} else {
enum GL_VBO_FREE_MEMORY_ATI            = 0x87FB;
enum GL_TEXTURE_FREE_MEMORY_ATI        = 0x87FC;
enum GL_RENDERBUFFER_FREE_MEMORY_ATI   = 0x87FD;
}

version (GL_AMD_performance_monitor) {} else {
enum GL_COUNTER_TYPE_AMD               = 0x8BC0;
enum GL_COUNTER_RANGE_AMD              = 0x8BC1;
enum GL_UNSIGNED_INT64_AMD             = 0x8BC2;
enum GL_PERCENTAGE_AMD                 = 0x8BC3;
enum GL_PERFMON_RESULT_AVAILABLE_AMD   = 0x8BC4;
enum GL_PERFMON_RESULT_SIZE_AMD        = 0x8BC5;
enum GL_PERFMON_RESULT_AMD             = 0x8BC6;
}

version (GL_AMD_texture_texture4) {} else {
}

version (GL_AMD_vertex_shader_tesselator) {} else {
enum GL_SAMPLER_BUFFER_AMD             = 0x9001;
enum GL_INT_SAMPLER_BUFFER_AMD         = 0x9002;
enum GL_UNSIGNED_INT_SAMPLER_BUFFER_AMD = 0x9003;
enum GL_TESSELLATION_MODE_AMD          = 0x9004;
enum GL_TESSELLATION_FACTOR_AMD        = 0x9005;
enum GL_DISCRETE_AMD                   = 0x9006;
enum GL_CONTINUOUS_AMD                 = 0x9007;
}

version (GL_EXT_provoking_vertex) {} else {
enum GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION_EXT = 0x8E4C;
enum GL_FIRST_VERTEX_CONVENTION_EXT    = 0x8E4D;
enum GL_LAST_VERTEX_CONVENTION_EXT     = 0x8E4E;
enum GL_PROVOKING_VERTEX_EXT           = 0x8E4F;
}

version (GL_EXT_texture_snorm) {} else {
enum GL_ALPHA_SNORM                    = 0x9010;
enum GL_LUMINANCE_SNORM                = 0x9011;
enum GL_LUMINANCE_ALPHA_SNORM          = 0x9012;
enum GL_INTENSITY_SNORM                = 0x9013;
enum GL_ALPHA8_SNORM                   = 0x9014;
enum GL_LUMINANCE8_SNORM               = 0x9015;
enum GL_LUMINANCE8_ALPHA8_SNORM        = 0x9016;
enum GL_INTENSITY8_SNORM               = 0x9017;
enum GL_ALPHA16_SNORM                  = 0x9018;
enum GL_LUMINANCE16_SNORM              = 0x9019;
enum GL_LUMINANCE16_ALPHA16_SNORM      = 0x901A;
enum GL_INTENSITY16_SNORM              = 0x901B;
/* reuse GL_RED_SNORM */
/* reuse GL_RG_SNORM */
/* reuse GL_RGB_SNORM */
/* reuse GL_RGBA_SNORM */
/* reuse GL_R8_SNORM */
/* reuse GL_RG8_SNORM */
/* reuse GL_RGB8_SNORM */
/* reuse GL_RGBA8_SNORM */
/* reuse GL_R16_SNORM */
/* reuse GL_RG16_SNORM */
/* reuse GL_RGB16_SNORM */
/* reuse GL_RGBA16_SNORM */
/* reuse GL_SIGNED_NORMALIZED */
}

version (GL_AMD_draw_buffers_blend) {} else {
}

version (GL_APPLE_texture_range) {} else {
enum GL_TEXTURE_RANGE_LENGTH_APPLE     = 0x85B7;
enum GL_TEXTURE_RANGE_POINTER_APPLE    = 0x85B8;
enum GL_TEXTURE_STORAGE_HINT_APPLE     = 0x85BC;
enum GL_STORAGE_PRIVATE_APPLE          = 0x85BD;
/* reuse GL_STORAGE_CACHED_APPLE */
/* reuse GL_STORAGE_SHARED_APPLE */
}

version (GL_APPLE_float_pixels) {} else {
enum GL_HALF_APPLE                     = 0x140B;
enum GL_RGBA_FLOAT32_APPLE             = 0x8814;
enum GL_RGB_FLOAT32_APPLE              = 0x8815;
enum GL_ALPHA_FLOAT32_APPLE            = 0x8816;
enum GL_INTENSITY_FLOAT32_APPLE        = 0x8817;
enum GL_LUMINANCE_FLOAT32_APPLE        = 0x8818;
enum GL_LUMINANCE_ALPHA_FLOAT32_APPLE  = 0x8819;
enum GL_RGBA_FLOAT16_APPLE             = 0x881A;
enum GL_RGB_FLOAT16_APPLE              = 0x881B;
enum GL_ALPHA_FLOAT16_APPLE            = 0x881C;
enum GL_INTENSITY_FLOAT16_APPLE        = 0x881D;
enum GL_LUMINANCE_FLOAT16_APPLE        = 0x881E;
enum GL_LUMINANCE_ALPHA_FLOAT16_APPLE  = 0x881F;
enum GL_COLOR_FLOAT_APPLE              = 0x8A0F;
}

version (GL_APPLE_vertex_program_evaluators) {} else {
enum GL_VERTEX_ATTRIB_MAP1_APPLE       = 0x8A00;
enum GL_VERTEX_ATTRIB_MAP2_APPLE       = 0x8A01;
enum GL_VERTEX_ATTRIB_MAP1_SIZE_APPLE  = 0x8A02;
enum GL_VERTEX_ATTRIB_MAP1_COEFF_APPLE = 0x8A03;
enum GL_VERTEX_ATTRIB_MAP1_ORDER_APPLE = 0x8A04;
enum GL_VERTEX_ATTRIB_MAP1_DOMAIN_APPLE = 0x8A05;
enum GL_VERTEX_ATTRIB_MAP2_SIZE_APPLE  = 0x8A06;
enum GL_VERTEX_ATTRIB_MAP2_COEFF_APPLE = 0x8A07;
enum GL_VERTEX_ATTRIB_MAP2_ORDER_APPLE = 0x8A08;
enum GL_VERTEX_ATTRIB_MAP2_DOMAIN_APPLE = 0x8A09;
}

version (GL_APPLE_aux_depth_stencil) {} else {
enum GL_AUX_DEPTH_STENCIL_APPLE        = 0x8A14;
}

version (GL_APPLE_object_purgeable) {} else {
enum GL_BUFFER_OBJECT_APPLE            = 0x85B3;
enum GL_RELEASED_APPLE                 = 0x8A19;
enum GL_VOLATILE_APPLE                 = 0x8A1A;
enum GL_RETAINED_APPLE                 = 0x8A1B;
enum GL_UNDEFINED_APPLE                = 0x8A1C;
enum GL_PURGEABLE_APPLE                = 0x8A1D;
}

version (GL_APPLE_row_bytes) {} else {
enum GL_PACK_ROW_BYTES_APPLE           = 0x8A15;
enum GL_UNPACK_ROW_BYTES_APPLE         = 0x8A16;
}

version (GL_APPLE_rgb_422) {} else {
enum GL_RGB_422_APPLE                  = 0x8A1F;
/* reuse GL_UNSIGNED_SHORT_8_8_APPLE */
/* reuse GL_UNSIGNED_SHORT_8_8_REV_APPLE */
}

version (GL_NV_video_capture) {} else {
enum GL_VIDEO_BUFFER_NV                = 0x9020;
enum GL_VIDEO_BUFFER_BINDING_NV        = 0x9021;
enum GL_FIELD_UPPER_NV                 = 0x9022;
enum GL_FIELD_LOWER_NV                 = 0x9023;
enum GL_NUM_VIDEO_CAPTURE_STREAMS_NV   = 0x9024;
enum GL_NEXT_VIDEO_CAPTURE_BUFFER_STATUS_NV = 0x9025;
enum GL_VIDEO_CAPTURE_TO_422_SUPPORTED_NV = 0x9026;
enum GL_LAST_VIDEO_CAPTURE_STATUS_NV   = 0x9027;
enum GL_VIDEO_BUFFER_PITCH_NV          = 0x9028;
enum GL_VIDEO_COLOR_CONVERSION_MATRIX_NV = 0x9029;
enum GL_VIDEO_COLOR_CONVERSION_MAX_NV  = 0x902A;
enum GL_VIDEO_COLOR_CONVERSION_MIN_NV  = 0x902B;
enum GL_VIDEO_COLOR_CONVERSION_OFFSET_NV = 0x902C;
enum GL_VIDEO_BUFFER_INTERNAL_FORMAT_NV = 0x902D;
enum GL_PARTIAL_SUCCESS_NV             = 0x902E;
enum GL_SUCCESS_NV                     = 0x902F;
enum GL_FAILURE_NV                     = 0x9030;
enum GL_YCBYCR8_422_NV                 = 0x9031;
enum GL_YCBAYCR8A_4224_NV              = 0x9032;
enum GL_Z6Y10Z6CB10Z6Y10Z6CR10_422_NV  = 0x9033;
enum GL_Z6Y10Z6CB10Z6A10Z6Y10Z6CR10Z6A10_4224_NV = 0x9034;
enum GL_Z4Y12Z4CB12Z4Y12Z4CR12_422_NV  = 0x9035;
enum GL_Z4Y12Z4CB12Z4A12Z4Y12Z4CR12Z4A12_4224_NV = 0x9036;
enum GL_Z4Y12Z4CB12Z4CR12_444_NV       = 0x9037;
enum GL_VIDEO_CAPTURE_FRAME_WIDTH_NV   = 0x9038;
enum GL_VIDEO_CAPTURE_FRAME_HEIGHT_NV  = 0x9039;
enum GL_VIDEO_CAPTURE_FIELD_UPPER_HEIGHT_NV = 0x903A;
enum GL_VIDEO_CAPTURE_FIELD_LOWER_HEIGHT_NV = 0x903B;
enum GL_VIDEO_CAPTURE_SURFACE_ORIGIN_NV = 0x903C;
}

version (GL_NV_copy_image) {} else {
}

version (GL_EXT_separate_shader_objects) {} else {
enum GL_ACTIVE_PROGRAM_EXT             = 0x8B8D;
}

version (GL_NV_parameter_buffer_object2) {} else {
}

version (GL_NV_shader_buffer_load) {} else {
enum GL_BUFFER_GPU_ADDRESS_NV          = 0x8F1D;
enum GL_GPU_ADDRESS_NV                 = 0x8F34;
enum GL_MAX_SHADER_BUFFER_ADDRESS_NV   = 0x8F35;
}

version (GL_NV_vertex_buffer_unified_memory) {} else {
enum GL_VERTEX_ATTRIB_ARRAY_UNIFIED_NV = 0x8F1E;
enum GL_ELEMENT_ARRAY_UNIFIED_NV       = 0x8F1F;
enum GL_VERTEX_ATTRIB_ARRAY_ADDRESS_NV = 0x8F20;
enum GL_VERTEX_ARRAY_ADDRESS_NV        = 0x8F21;
enum GL_NORMAL_ARRAY_ADDRESS_NV        = 0x8F22;
enum GL_COLOR_ARRAY_ADDRESS_NV         = 0x8F23;
enum GL_INDEX_ARRAY_ADDRESS_NV         = 0x8F24;
enum GL_TEXTURE_COORD_ARRAY_ADDRESS_NV = 0x8F25;
enum GL_EDGE_FLAG_ARRAY_ADDRESS_NV     = 0x8F26;
enum GL_SECONDARY_COLOR_ARRAY_ADDRESS_NV = 0x8F27;
enum GL_FOG_COORD_ARRAY_ADDRESS_NV     = 0x8F28;
enum GL_ELEMENT_ARRAY_ADDRESS_NV       = 0x8F29;
enum GL_VERTEX_ATTRIB_ARRAY_LENGTH_NV  = 0x8F2A;
enum GL_VERTEX_ARRAY_LENGTH_NV         = 0x8F2B;
enum GL_NORMAL_ARRAY_LENGTH_NV         = 0x8F2C;
enum GL_COLOR_ARRAY_LENGTH_NV          = 0x8F2D;
enum GL_INDEX_ARRAY_LENGTH_NV          = 0x8F2E;
enum GL_TEXTURE_COORD_ARRAY_LENGTH_NV  = 0x8F2F;
enum GL_EDGE_FLAG_ARRAY_LENGTH_NV      = 0x8F30;
enum GL_SECONDARY_COLOR_ARRAY_LENGTH_NV = 0x8F31;
enum GL_FOG_COORD_ARRAY_LENGTH_NV      = 0x8F32;
enum GL_ELEMENT_ARRAY_LENGTH_NV        = 0x8F33;
enum GL_DRAW_INDIRECT_UNIFIED_NV       = 0x8F40;
enum GL_DRAW_INDIRECT_ADDRESS_NV       = 0x8F41;
enum GL_DRAW_INDIRECT_LENGTH_NV        = 0x8F42;
}

version (GL_NV_texture_barrier) {} else {
}

version (GL_AMD_shader_stencil_export) {} else {
}

version (GL_AMD_seamless_cubemap_per_texture) {} else {
/* reuse GL_TEXTURE_CUBE_MAP_SEAMLESS */
}

version (GL_AMD_conservative_depth) {} else {
}

version (GL_EXT_shader_image_load_store) {} else {
enum GL_MAX_IMAGE_UNITS_EXT            = 0x8F38;
enum GL_MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS_EXT = 0x8F39;
enum GL_IMAGE_BINDING_NAME_EXT         = 0x8F3A;
enum GL_IMAGE_BINDING_LEVEL_EXT        = 0x8F3B;
enum GL_IMAGE_BINDING_LAYERED_EXT      = 0x8F3C;
enum GL_IMAGE_BINDING_LAYER_EXT        = 0x8F3D;
enum GL_IMAGE_BINDING_ACCESS_EXT       = 0x8F3E;
enum GL_IMAGE_1D_EXT                   = 0x904C;
enum GL_IMAGE_2D_EXT                   = 0x904D;
enum GL_IMAGE_3D_EXT                   = 0x904E;
enum GL_IMAGE_2D_RECT_EXT              = 0x904F;
enum GL_IMAGE_CUBE_EXT                 = 0x9050;
enum GL_IMAGE_BUFFER_EXT               = 0x9051;
enum GL_IMAGE_1D_ARRAY_EXT             = 0x9052;
enum GL_IMAGE_2D_ARRAY_EXT             = 0x9053;
enum GL_IMAGE_CUBE_MAP_ARRAY_EXT       = 0x9054;
enum GL_IMAGE_2D_MULTISAMPLE_EXT       = 0x9055;
enum GL_IMAGE_2D_MULTISAMPLE_ARRAY_EXT = 0x9056;
enum GL_INT_IMAGE_1D_EXT               = 0x9057;
enum GL_INT_IMAGE_2D_EXT               = 0x9058;
enum GL_INT_IMAGE_3D_EXT               = 0x9059;
enum GL_INT_IMAGE_2D_RECT_EXT          = 0x905A;
enum GL_INT_IMAGE_CUBE_EXT             = 0x905B;
enum GL_INT_IMAGE_BUFFER_EXT           = 0x905C;
enum GL_INT_IMAGE_1D_ARRAY_EXT         = 0x905D;
enum GL_INT_IMAGE_2D_ARRAY_EXT         = 0x905E;
enum GL_INT_IMAGE_CUBE_MAP_ARRAY_EXT   = 0x905F;
enum GL_INT_IMAGE_2D_MULTISAMPLE_EXT   = 0x9060;
enum GL_INT_IMAGE_2D_MULTISAMPLE_ARRAY_EXT = 0x9061;
enum GL_UNSIGNED_INT_IMAGE_1D_EXT      = 0x9062;
enum GL_UNSIGNED_INT_IMAGE_2D_EXT      = 0x9063;
enum GL_UNSIGNED_INT_IMAGE_3D_EXT      = 0x9064;
enum GL_UNSIGNED_INT_IMAGE_2D_RECT_EXT = 0x9065;
enum GL_UNSIGNED_INT_IMAGE_CUBE_EXT    = 0x9066;
enum GL_UNSIGNED_INT_IMAGE_BUFFER_EXT  = 0x9067;
enum GL_UNSIGNED_INT_IMAGE_1D_ARRAY_EXT = 0x9068;
enum GL_UNSIGNED_INT_IMAGE_2D_ARRAY_EXT = 0x9069;
enum GL_UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY_EXT = 0x906A;
enum GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_EXT = 0x906B;
enum GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY_EXT = 0x906C;
enum GL_MAX_IMAGE_SAMPLES_EXT          = 0x906D;
enum GL_IMAGE_BINDING_FORMAT_EXT       = 0x906E;
enum GL_VERTEX_ATTRIB_ARRAY_BARRIER_BIT_EXT = 0x00000001;
enum GL_ELEMENT_ARRAY_BARRIER_BIT_EXT  = 0x00000002;
enum GL_UNIFORM_BARRIER_BIT_EXT        = 0x00000004;
enum GL_TEXTURE_FETCH_BARRIER_BIT_EXT  = 0x00000008;
enum GL_SHADER_IMAGE_ACCESS_BARRIER_BIT_EXT = 0x00000020;
enum GL_COMMAND_BARRIER_BIT_EXT        = 0x00000040;
enum GL_PIXEL_BUFFER_BARRIER_BIT_EXT   = 0x00000080;
enum GL_TEXTURE_UPDATE_BARRIER_BIT_EXT = 0x00000100;
enum GL_BUFFER_UPDATE_BARRIER_BIT_EXT  = 0x00000200;
enum GL_FRAMEBUFFER_BARRIER_BIT_EXT    = 0x00000400;
enum GL_TRANSFORM_FEEDBACK_BARRIER_BIT_EXT = 0x00000800;
enum GL_ATOMIC_COUNTER_BARRIER_BIT_EXT = 0x00001000;
enum GL_ALL_BARRIER_BITS_EXT           = 0xFFFFFFFF;
}

version (GL_EXT_vertex_attrib_64bit) {} else {
/* reuse GL_DOUBLE */
enum GL_DOUBLE_VEC2_EXT                = 0x8FFC;
enum GL_DOUBLE_VEC3_EXT                = 0x8FFD;
enum GL_DOUBLE_VEC4_EXT                = 0x8FFE;
enum GL_DOUBLE_MAT2_EXT                = 0x8F46;
enum GL_DOUBLE_MAT3_EXT                = 0x8F47;
enum GL_DOUBLE_MAT4_EXT                = 0x8F48;
enum GL_DOUBLE_MAT2x3_EXT              = 0x8F49;
enum GL_DOUBLE_MAT2x4_EXT              = 0x8F4A;
enum GL_DOUBLE_MAT3x2_EXT              = 0x8F4B;
enum GL_DOUBLE_MAT3x4_EXT              = 0x8F4C;
enum GL_DOUBLE_MAT4x2_EXT              = 0x8F4D;
enum GL_DOUBLE_MAT4x3_EXT              = 0x8F4E;
}

version (GL_NV_gpu_program5) {} else {
enum GL_MAX_GEOMETRY_PROGRAM_INVOCATIONS_NV = 0x8E5A;
enum GL_MIN_FRAGMENT_INTERPOLATION_OFFSET_NV = 0x8E5B;
enum GL_MAX_FRAGMENT_INTERPOLATION_OFFSET_NV = 0x8E5C;
enum GL_FRAGMENT_PROGRAM_INTERPOLATION_OFFSET_BITS_NV = 0x8E5D;
enum GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_NV = 0x8E5E;
enum GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_NV = 0x8E5F;
enum GL_MAX_PROGRAM_SUBROUTINE_PARAMETERS_NV = 0x8F44;
enum GL_MAX_PROGRAM_SUBROUTINE_NUM_NV  = 0x8F45;
}

version (GL_NV_gpu_shader5) {} else {
enum GL_INT64_NV                       = 0x140E;
enum GL_UNSIGNED_INT64_NV              = 0x140F;
enum GL_INT8_NV                        = 0x8FE0;
enum GL_INT8_VEC2_NV                   = 0x8FE1;
enum GL_INT8_VEC3_NV                   = 0x8FE2;
enum GL_INT8_VEC4_NV                   = 0x8FE3;
enum GL_INT16_NV                       = 0x8FE4;
enum GL_INT16_VEC2_NV                  = 0x8FE5;
enum GL_INT16_VEC3_NV                  = 0x8FE6;
enum GL_INT16_VEC4_NV                  = 0x8FE7;
enum GL_INT64_VEC2_NV                  = 0x8FE9;
enum GL_INT64_VEC3_NV                  = 0x8FEA;
enum GL_INT64_VEC4_NV                  = 0x8FEB;
enum GL_UNSIGNED_INT8_NV               = 0x8FEC;
enum GL_UNSIGNED_INT8_VEC2_NV          = 0x8FED;
enum GL_UNSIGNED_INT8_VEC3_NV          = 0x8FEE;
enum GL_UNSIGNED_INT8_VEC4_NV          = 0x8FEF;
enum GL_UNSIGNED_INT16_NV              = 0x8FF0;
enum GL_UNSIGNED_INT16_VEC2_NV         = 0x8FF1;
enum GL_UNSIGNED_INT16_VEC3_NV         = 0x8FF2;
enum GL_UNSIGNED_INT16_VEC4_NV         = 0x8FF3;
enum GL_UNSIGNED_INT64_VEC2_NV         = 0x8FF5;
enum GL_UNSIGNED_INT64_VEC3_NV         = 0x8FF6;
enum GL_UNSIGNED_INT64_VEC4_NV         = 0x8FF7;
enum GL_FLOAT16_NV                     = 0x8FF8;
enum GL_FLOAT16_VEC2_NV                = 0x8FF9;
enum GL_FLOAT16_VEC3_NV                = 0x8FFA;
enum GL_FLOAT16_VEC4_NV                = 0x8FFB;
/* reuse GL_PATCHES */
}

version (GL_NV_shader_buffer_store) {} else {
enum GL_SHADER_GLOBAL_ACCESS_BARRIER_BIT_NV = 0x00000010;
/* reuse GL_READ_WRITE */
/* reuse GL_WRITE_ONLY */
}

version (GL_NV_tessellation_program5) {} else {
enum GL_MAX_PROGRAM_PATCH_ATTRIBS_NV   = 0x86D8;
enum GL_TESS_CONTROL_PROGRAM_NV        = 0x891E;
enum GL_TESS_EVALUATION_PROGRAM_NV     = 0x891F;
enum GL_TESS_CONTROL_PROGRAM_PARAMETER_BUFFER_NV = 0x8C74;
enum GL_TESS_EVALUATION_PROGRAM_PARAMETER_BUFFER_NV = 0x8C75;
}

version (GL_NV_vertex_attrib_integer_64bit) {} else {
/* reuse GL_INT64_NV */
/* reuse GL_UNSIGNED_INT64_NV */
}

version (GL_NV_multisample_coverage) {} else {
enum GL_COVERAGE_SAMPLES_NV            = 0x80A9;
enum GL_COLOR_SAMPLES_NV               = 0x8E20;
}

version (GL_AMD_name_gen_delete) {} else {
enum GL_DATA_BUFFER_AMD                = 0x9151;
enum GL_PERFORMANCE_MONITOR_AMD        = 0x9152;
enum GL_QUERY_OBJECT_AMD               = 0x9153;
enum GL_VERTEX_ARRAY_OBJECT_AMD        = 0x9154;
enum GL_SAMPLER_OBJECT_AMD             = 0x9155;
}

version (GL_AMD_debug_output) {} else {
enum GL_MAX_DEBUG_MESSAGE_LENGTH_AMD   = 0x9143;
enum GL_MAX_DEBUG_LOGGED_MESSAGES_AMD  = 0x9144;
enum GL_DEBUG_LOGGED_MESSAGES_AMD      = 0x9145;
enum GL_DEBUG_SEVERITY_HIGH_AMD        = 0x9146;
enum GL_DEBUG_SEVERITY_MEDIUM_AMD      = 0x9147;
enum GL_DEBUG_SEVERITY_LOW_AMD         = 0x9148;
enum GL_DEBUG_CATEGORY_API_ERROR_AMD   = 0x9149;
enum GL_DEBUG_CATEGORY_WINDOW_SYSTEM_AMD = 0x914A;
enum GL_DEBUG_CATEGORY_DEPRECATION_AMD = 0x914B;
enum GL_DEBUG_CATEGORY_UNDEFINED_BEHAVIOR_AMD = 0x914C;
enum GL_DEBUG_CATEGORY_PERFORMANCE_AMD = 0x914D;
enum GL_DEBUG_CATEGORY_SHADER_COMPILER_AMD = 0x914E;
enum GL_DEBUG_CATEGORY_APPLICATION_AMD = 0x914F;
enum GL_DEBUG_CATEGORY_OTHER_AMD       = 0x9150;
}

version (GL_NV_vdpau_interop) {} else {
enum GL_SURFACE_STATE_NV               = 0x86EB;
enum GL_SURFACE_REGISTERED_NV          = 0x86FD;
enum GL_SURFACE_MAPPED_NV              = 0x8700;
enum GL_WRITE_DISCARD_NV               = 0x88BE;
}

version (GL_AMD_transform_feedback3_lines_triangles) {} else {
}

version (GL_AMD_depth_clamp_separate) {} else {
enum GL_DEPTH_CLAMP_NEAR_AMD           = 0x901E;
enum GL_DEPTH_CLAMP_FAR_AMD            = 0x901F;
}

version (GL_EXT_texture_sRGB_decode) {} else {
enum GL_TEXTURE_SRGB_DECODE_EXT        = 0x8A48;
enum GL_DECODE_EXT                     = 0x8A49;
enum GL_SKIP_DECODE_EXT                = 0x8A4A;
}

version (GL_NV_texture_multisample) {} else {
enum GL_TEXTURE_COVERAGE_SAMPLES_NV    = 0x9045;
enum GL_TEXTURE_COLOR_SAMPLES_NV       = 0x9046;
}

version (GL_AMD_blend_minmax_factor) {} else {
enum GL_FACTOR_MIN_AMD                 = 0x901C;
enum GL_FACTOR_MAX_AMD                 = 0x901D;
}

version (GL_AMD_sample_positions) {} else {
enum GL_SUBSAMPLE_DISTANCE_AMD         = 0x883F;
}

version (GL_EXT_x11_sync_object) {} else {
enum GL_SYNC_X11_FENCE_EXT             = 0x90E1;
}

version (GL_AMD_multi_draw_indirect) {} else {
}

version (GL_EXT_framebuffer_multisample_blit_scaled) {} else {
enum GL_SCALED_RESOLVE_FASTEST_EXT     = 0x90BA;
enum GL_SCALED_RESOLVE_NICEST_EXT      = 0x90BB;
}

version (GL_NV_path_rendering) {} else {
enum GL_PATH_FORMAT_SVG_NV             = 0x9070;
enum GL_PATH_FORMAT_PS_NV              = 0x9071;
enum GL_STANDARD_FONT_NAME_NV          = 0x9072;
enum GL_SYSTEM_FONT_NAME_NV            = 0x9073;
enum GL_FILE_NAME_NV                   = 0x9074;
enum GL_PATH_STROKE_WIDTH_NV           = 0x9075;
enum GL_PATH_END_CAPS_NV               = 0x9076;
enum GL_PATH_INITIAL_END_CAP_NV        = 0x9077;
enum GL_PATH_TERMINAL_END_CAP_NV       = 0x9078;
enum GL_PATH_JOIN_STYLE_NV             = 0x9079;
enum GL_PATH_MITER_LIMIT_NV            = 0x907A;
enum GL_PATH_DASH_CAPS_NV              = 0x907B;
enum GL_PATH_INITIAL_DASH_CAP_NV       = 0x907C;
enum GL_PATH_TERMINAL_DASH_CAP_NV      = 0x907D;
enum GL_PATH_DASH_OFFSET_NV            = 0x907E;
enum GL_PATH_CLIENT_LENGTH_NV          = 0x907F;
enum GL_PATH_FILL_MODE_NV              = 0x9080;
enum GL_PATH_FILL_MASK_NV              = 0x9081;
enum GL_PATH_FILL_COVER_MODE_NV        = 0x9082;
enum GL_PATH_STROKE_COVER_MODE_NV      = 0x9083;
enum GL_PATH_STROKE_MASK_NV            = 0x9084;
enum GL_PATH_SAMPLE_QUALITY_NV         = 0x9085;
enum GL_PATH_STROKE_BOUND_NV           = 0x9086;
enum GL_PATH_STROKE_OVERSAMPLE_COUNT_NV = 0x9087;
enum GL_COUNT_UP_NV                    = 0x9088;
enum GL_COUNT_DOWN_NV                  = 0x9089;
enum GL_PATH_OBJECT_BOUNDING_BOX_NV    = 0x908A;
enum GL_CONVEX_HULL_NV                 = 0x908B;
enum GL_MULTI_HULLS_NV                 = 0x908C;
enum GL_BOUNDING_BOX_NV                = 0x908D;
enum GL_TRANSLATE_X_NV                 = 0x908E;
enum GL_TRANSLATE_Y_NV                 = 0x908F;
enum GL_TRANSLATE_2D_NV                = 0x9090;
enum GL_TRANSLATE_3D_NV                = 0x9091;
enum GL_AFFINE_2D_NV                   = 0x9092;
enum GL_PROJECTIVE_2D_NV               = 0x9093;
enum GL_AFFINE_3D_NV                   = 0x9094;
enum GL_PROJECTIVE_3D_NV               = 0x9095;
enum GL_TRANSPOSE_AFFINE_2D_NV         = 0x9096;
enum GL_TRANSPOSE_PROJECTIVE_2D_NV     = 0x9097;
enum GL_TRANSPOSE_AFFINE_3D_NV         = 0x9098;
enum GL_TRANSPOSE_PROJECTIVE_3D_NV     = 0x9099;
enum GL_UTF8_NV                        = 0x909A;
enum GL_UTF16_NV                       = 0x909B;
enum GL_BOUNDING_BOX_OF_BOUNDING_BOXES_NV = 0x909C;
enum GL_PATH_COMMAND_COUNT_NV          = 0x909D;
enum GL_PATH_COORD_COUNT_NV            = 0x909E;
enum GL_PATH_DASH_ARRAY_COUNT_NV       = 0x909F;
enum GL_PATH_COMPUTED_LENGTH_NV        = 0x90A0;
enum GL_PATH_FILL_BOUNDING_BOX_NV      = 0x90A1;
enum GL_PATH_STROKE_BOUNDING_BOX_NV    = 0x90A2;
enum GL_SQUARE_NV                      = 0x90A3;
enum GL_ROUND_NV                       = 0x90A4;
enum GL_TRIANGULAR_NV                  = 0x90A5;
enum GL_BEVEL_NV                       = 0x90A6;
enum GL_MITER_REVERT_NV                = 0x90A7;
enum GL_MITER_TRUNCATE_NV              = 0x90A8;
enum GL_SKIP_MISSING_GLYPH_NV          = 0x90A9;
enum GL_USE_MISSING_GLYPH_NV           = 0x90AA;
enum GL_PATH_ERROR_POSITION_NV         = 0x90AB;
enum GL_PATH_FOG_GEN_MODE_NV           = 0x90AC;
enum GL_ACCUM_ADJACENT_PAIRS_NV        = 0x90AD;
enum GL_ADJACENT_PAIRS_NV              = 0x90AE;
enum GL_FIRST_TO_REST_NV               = 0x90AF;
enum GL_PATH_GEN_MODE_NV               = 0x90B0;
enum GL_PATH_GEN_COEFF_NV              = 0x90B1;
enum GL_PATH_GEN_COLOR_FORMAT_NV       = 0x90B2;
enum GL_PATH_GEN_COMPONENTS_NV         = 0x90B3;
enum GL_PATH_STENCIL_FUNC_NV           = 0x90B7;
enum GL_PATH_STENCIL_REF_NV            = 0x90B8;
enum GL_PATH_STENCIL_VALUE_MASK_NV     = 0x90B9;
enum GL_PATH_STENCIL_DEPTH_OFFSET_FACTOR_NV = 0x90BD;
enum GL_PATH_STENCIL_DEPTH_OFFSET_UNITS_NV = 0x90BE;
enum GL_PATH_COVER_DEPTH_FUNC_NV       = 0x90BF;
enum GL_PATH_DASH_OFFSET_RESET_NV      = 0x90B4;
enum GL_MOVE_TO_RESETS_NV              = 0x90B5;
enum GL_MOVE_TO_CONTINUES_NV           = 0x90B6;
enum GL_CLOSE_PATH_NV                  = 0x00;
enum GL_MOVE_TO_NV                     = 0x02;
enum GL_RELATIVE_MOVE_TO_NV            = 0x03;
enum GL_LINE_TO_NV                     = 0x04;
enum GL_RELATIVE_LINE_TO_NV            = 0x05;
enum GL_HORIZONTAL_LINE_TO_NV          = 0x06;
enum GL_RELATIVE_HORIZONTAL_LINE_TO_NV = 0x07;
enum GL_VERTICAL_LINE_TO_NV            = 0x08;
enum GL_RELATIVE_VERTICAL_LINE_TO_NV   = 0x09;
enum GL_QUADRATIC_CURVE_TO_NV          = 0x0A;
enum GL_RELATIVE_QUADRATIC_CURVE_TO_NV = 0x0B;
enum GL_CUBIC_CURVE_TO_NV              = 0x0C;
enum GL_RELATIVE_CUBIC_CURVE_TO_NV     = 0x0D;
enum GL_SMOOTH_QUADRATIC_CURVE_TO_NV   = 0x0E;
enum GL_RELATIVE_SMOOTH_QUADRATIC_CURVE_TO_NV = 0x0F;
enum GL_SMOOTH_CUBIC_CURVE_TO_NV       = 0x10;
enum GL_RELATIVE_SMOOTH_CUBIC_CURVE_TO_NV = 0x11;
enum GL_SMALL_CCW_ARC_TO_NV            = 0x12;
enum GL_RELATIVE_SMALL_CCW_ARC_TO_NV   = 0x13;
enum GL_SMALL_CW_ARC_TO_NV             = 0x14;
enum GL_RELATIVE_SMALL_CW_ARC_TO_NV    = 0x15;
enum GL_LARGE_CCW_ARC_TO_NV            = 0x16;
enum GL_RELATIVE_LARGE_CCW_ARC_TO_NV   = 0x17;
enum GL_LARGE_CW_ARC_TO_NV             = 0x18;
enum GL_RELATIVE_LARGE_CW_ARC_TO_NV    = 0x19;
enum GL_RESTART_PATH_NV                = 0xF0;
enum GL_DUP_FIRST_CUBIC_CURVE_TO_NV    = 0xF2;
enum GL_DUP_LAST_CUBIC_CURVE_TO_NV     = 0xF4;
enum GL_RECT_NV                        = 0xF6;
enum GL_CIRCULAR_CCW_ARC_TO_NV         = 0xF8;
enum GL_CIRCULAR_CW_ARC_TO_NV          = 0xFA;
enum GL_CIRCULAR_TANGENT_ARC_TO_NV     = 0xFC;
enum GL_ARC_TO_NV                      = 0xFE;
enum GL_RELATIVE_ARC_TO_NV             = 0xFF;
enum GL_BOLD_BIT_NV                    = 0x01;
enum GL_ITALIC_BIT_NV                  = 0x02;
enum GL_GLYPH_WIDTH_BIT_NV             = 0x01;
enum GL_GLYPH_HEIGHT_BIT_NV            = 0x02;
enum GL_GLYPH_HORIZONTAL_BEARING_X_BIT_NV = 0x04;
enum GL_GLYPH_HORIZONTAL_BEARING_Y_BIT_NV = 0x08;
enum GL_GLYPH_HORIZONTAL_BEARING_ADVANCE_BIT_NV = 0x10;
enum GL_GLYPH_VERTICAL_BEARING_X_BIT_NV = 0x20;
enum GL_GLYPH_VERTICAL_BEARING_Y_BIT_NV = 0x40;
enum GL_GLYPH_VERTICAL_BEARING_ADVANCE_BIT_NV = 0x80;
enum GL_GLYPH_HAS_KERNING_NV           = 0x100;
enum GL_FONT_X_MIN_BOUNDS_NV           = 0x00010000;
enum GL_FONT_Y_MIN_BOUNDS_NV           = 0x00020000;
enum GL_FONT_X_MAX_BOUNDS_NV           = 0x00040000;
enum GL_FONT_Y_MAX_BOUNDS_NV           = 0x00080000;
enum GL_FONT_UNITS_PER_EM_NV           = 0x00100000;
enum GL_FONT_ASCENDER_NV               = 0x00200000;
enum GL_FONT_DESCENDER_NV              = 0x00400000;
enum GL_FONT_HEIGHT_NV                 = 0x00800000;
enum GL_FONT_MAX_ADVANCE_WIDTH_NV      = 0x01000000;
enum GL_FONT_MAX_ADVANCE_HEIGHT_NV     = 0x02000000;
enum GL_FONT_UNDERLINE_POSITION_NV     = 0x04000000;
enum GL_FONT_UNDERLINE_THICKNESS_NV    = 0x08000000;
enum GL_FONT_HAS_KERNING_NV            = 0x10000000;
}

version (GL_AMD_pinned_memory) {} else {
enum GL_EXTERNAL_VIRTUAL_MEMORY_BUFFER_AMD = 0x9160;
}

version (GL_AMD_stencil_operation_extended) {} else {
enum GL_SET_AMD                        = 0x874A;
enum GL_REPLACE_VALUE_AMD              = 0x874B;
enum GL_STENCIL_OP_VALUE_AMD           = 0x874C;
enum GL_STENCIL_BACK_OP_VALUE_AMD      = 0x874D;
}

version (GL_AMD_vertex_shader_viewport_index) {} else {
}

version (GL_AMD_vertex_shader_layer) {} else {
}

version (GL_NV_bindless_texture) {} else {
}

version (GL_NV_shader_atomic_float) {} else {
}

version (GL_AMD_query_buffer_object) {} else {
enum GL_QUERY_BUFFER_AMD               = 0x9192;
enum GL_QUERY_BUFFER_BINDING_AMD       = 0x9193;
enum GL_QUERY_RESULT_NO_WAIT_AMD       = 0x9194;
}

version (GL_AMD_sparse_texture) {} else {
enum GL_VIRTUAL_PAGE_SIZE_X_AMD        = 0x9195;
enum GL_VIRTUAL_PAGE_SIZE_Y_AMD        = 0x9196;
enum GL_VIRTUAL_PAGE_SIZE_Z_AMD        = 0x9197;
enum GL_MAX_SPARSE_TEXTURE_SIZE_AMD    = 0x9198;
enum GL_MAX_SPARSE_3D_TEXTURE_SIZE_AMD = 0x9199;
enum GL_MAX_SPARSE_ARRAY_TEXTURE_LAYERS = 0x919A;
enum GL_MIN_SPARSE_LEVEL_AMD           = 0x919B;
enum GL_MIN_LOD_WARNING_AMD            = 0x919C;
enum GL_TEXTURE_STORAGE_SPARSE_BIT_AMD = 0x00000001;
}


/*************************************************************/

version (GL_VERSION_2_0) {} else {
/* GL type for program/shader text */
alias char GLchar;
}

version (GL_VERSION_1_5) {} else {
/* GL types for handling large vertex buffer objects */
alias ptrdiff_t GLintptr;
alias ptrdiff_t GLsizeiptr;
}

version (GL_ARB_vertex_buffer_object) {} else {
/* GL types for handling large vertex buffer objects */
alias ptrdiff_t GLintptrARB;
alias ptrdiff_t GLsizeiptrARB;
}

version (GL_ARB_shader_objects) {} else {
/* GL types for program/shader text and shader object handles */
alias char GLcharARB;
alias uint GLhandleARB;
}

/* GL type for "half" precision (s10e5) float data in host memory */
version (GL_ARB_half_float_pixel) {} else {
alias ushort GLhalfARB;
}

version (GL_NV_half_float) {} else {
alias ushort GLhalfNV;
}

version (GLEXT_64_TYPES_DEFINED) {} else {
}

version (GL_EXT_timer_query) {} else {
alias int64_t GLint64EXT;
alias uint64_t GLuint64EXT;
}

version (GL_ARB_sync) {} else {
struct __GLsync;
alias int64_t GLint64;
alias uint64_t GLuint64;
alias __GLsync *GLsync;
}

version (GL_ARB_cl_event) {} else {
/* These incomplete types let us declare types compatible with OpenCL's cl_context and cl_event */
struct _cl_context;
struct _cl_event;
}

version (GL_ARB_debug_output) {} else {
alias void function(GLenum source,GLenum type,GLuint id,GLenum severity,GLsizei length,const(GLchar)*message,GLvoid *userParam)GLDEBUGPROCARB;
}

version (GL_AMD_debug_output) {} else {
alias void function(GLuint id,GLenum category,GLenum severity,GLsizei length,const(GLchar)*message,GLvoid *userParam)GLDEBUGPROCAMD;
}

version (GL_KHR_debug) {} else {
alias void function(GLenum source,GLenum type,GLuint id,GLenum severity,GLsizei length,const(GLchar)*message,GLvoid *userParam)GLDEBUGPROC;
}

version (GL_NV_vdpau_interop) {} else {
alias GLintptr GLvdpauSurfaceNV;
}

extern (System):

version (GL_VERSION_1_2) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBlendColor (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
void glBlendEquation (GLenum mode);
void glDrawRangeElements (GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const(GLvoid)*indices);
void glTexImage3D (GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels);
void glTexSubImage3D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const(GLvoid)*pixels);
void glCopyTexSubImage3D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
void glColorTable (GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const(GLvoid)*table);
void glColorTableParameterfv (GLenum target, GLenum pname, const(GLfloat)*params);
void glColorTableParameteriv (GLenum target, GLenum pname, const(GLint)*params);
void glCopyColorTable (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width);
void glGetColorTable (GLenum target, GLenum format, GLenum type, GLvoid *table);
void glGetColorTableParameterfv (GLenum target, GLenum pname, GLfloat *params);
void glGetColorTableParameteriv (GLenum target, GLenum pname, GLint *params);
void glColorSubTable (GLenum target, GLsizei start, GLsizei count, GLenum format, GLenum type, const(GLvoid)*data);
void glCopyColorSubTable (GLenum target, GLsizei start, GLint x, GLint y, GLsizei width);
void glConvolutionFilter1D (GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const(GLvoid)*image);
void glConvolutionFilter2D (GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const(GLvoid)*image);
void glConvolutionParameterf (GLenum target, GLenum pname, GLfloat params);
void glConvolutionParameterfv (GLenum target, GLenum pname, const(GLfloat)*params);
void glConvolutionParameteri (GLenum target, GLenum pname, GLint params);
void glConvolutionParameteriv (GLenum target, GLenum pname, const(GLint)*params);
void glCopyConvolutionFilter1D (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width);
void glCopyConvolutionFilter2D (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height);
void glGetConvolutionFilter (GLenum target, GLenum format, GLenum type, GLvoid *image);
void glGetConvolutionParameterfv (GLenum target, GLenum pname, GLfloat *params);
void glGetConvolutionParameteriv (GLenum target, GLenum pname, GLint *params);
void glGetSeparableFilter (GLenum target, GLenum format, GLenum type, GLvoid *row, GLvoid *column, GLvoid *span);
void glSeparableFilter2D (GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const(GLvoid)*row, const(GLvoid)*column);
void glGetHistogram (GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values);
void glGetHistogramParameterfv (GLenum target, GLenum pname, GLfloat *params);
void glGetHistogramParameteriv (GLenum target, GLenum pname, GLint *params);
void glGetMinmax (GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values);
void glGetMinmaxParameterfv (GLenum target, GLenum pname, GLfloat *params);
void glGetMinmaxParameteriv (GLenum target, GLenum pname, GLint *params);
void glHistogram (GLenum target, GLsizei width, GLenum internalformat, GLboolean sink);
void glMinmax (GLenum target, GLenum internalformat, GLboolean sink);
void glResetHistogram (GLenum target);
void glResetMinmax (GLenum target);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha) PFNGLBLENDCOLORPROC;
alias void function (GLenum mode) PFNGLBLENDEQUATIONPROC;
alias void function (GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const(GLvoid)*indices) PFNGLDRAWRANGEELEMENTSPROC;
alias void function (GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLTEXIMAGE3DPROC;
alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLTEXSUBIMAGE3DPROC;
alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height) PFNGLCOPYTEXSUBIMAGE3DPROC;
alias void function (GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const(GLvoid)*table) PFNGLCOLORTABLEPROC;
alias void function (GLenum target, GLenum pname, const(GLfloat)*params) PFNGLCOLORTABLEPARAMETERFVPROC;
alias void function (GLenum target, GLenum pname, const(GLint)*params) PFNGLCOLORTABLEPARAMETERIVPROC;
alias void function (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width) PFNGLCOPYCOLORTABLEPROC;
alias void function (GLenum target, GLenum format, GLenum type, GLvoid *table) PFNGLGETCOLORTABLEPROC;
alias void function (GLenum target, GLenum pname, GLfloat *params) PFNGLGETCOLORTABLEPARAMETERFVPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETCOLORTABLEPARAMETERIVPROC;
alias void function (GLenum target, GLsizei start, GLsizei count, GLenum format, GLenum type, const(GLvoid)*data) PFNGLCOLORSUBTABLEPROC;
alias void function (GLenum target, GLsizei start, GLint x, GLint y, GLsizei width) PFNGLCOPYCOLORSUBTABLEPROC;
alias void function (GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const(GLvoid)*image) PFNGLCONVOLUTIONFILTER1DPROC;
alias void function (GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const(GLvoid)*image) PFNGLCONVOLUTIONFILTER2DPROC;
alias void function (GLenum target, GLenum pname, GLfloat params) PFNGLCONVOLUTIONPARAMETERFPROC;
alias void function (GLenum target, GLenum pname, const(GLfloat)*params) PFNGLCONVOLUTIONPARAMETERFVPROC;
alias void function (GLenum target, GLenum pname, GLint params) PFNGLCONVOLUTIONPARAMETERIPROC;
alias void function (GLenum target, GLenum pname, const(GLint)*params) PFNGLCONVOLUTIONPARAMETERIVPROC;
alias void function (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width) PFNGLCOPYCONVOLUTIONFILTER1DPROC;
alias void function (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height) PFNGLCOPYCONVOLUTIONFILTER2DPROC;
alias void function (GLenum target, GLenum format, GLenum type, GLvoid *image) PFNGLGETCONVOLUTIONFILTERPROC;
alias void function (GLenum target, GLenum pname, GLfloat *params) PFNGLGETCONVOLUTIONPARAMETERFVPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETCONVOLUTIONPARAMETERIVPROC;
alias void function (GLenum target, GLenum format, GLenum type, GLvoid *row, GLvoid *column, GLvoid *span) PFNGLGETSEPARABLEFILTERPROC;
alias void function (GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const(GLvoid)*row, const(GLvoid)*column) PFNGLSEPARABLEFILTER2DPROC;
alias void function (GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values) PFNGLGETHISTOGRAMPROC;
alias void function (GLenum target, GLenum pname, GLfloat *params) PFNGLGETHISTOGRAMPARAMETERFVPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETHISTOGRAMPARAMETERIVPROC;
alias void function (GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values) PFNGLGETMINMAXPROC;
alias void function (GLenum target, GLenum pname, GLfloat *params) PFNGLGETMINMAXPARAMETERFVPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETMINMAXPARAMETERIVPROC;
alias void function (GLenum target, GLsizei width, GLenum internalformat, GLboolean sink) PFNGLHISTOGRAMPROC;
alias void function (GLenum target, GLenum internalformat, GLboolean sink) PFNGLMINMAXPROC;
alias void function (GLenum target) PFNGLRESETHISTOGRAMPROC;
alias void function (GLenum target) PFNGLRESETMINMAXPROC;
}

version (GL_VERSION_1_3) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glActiveTexture (GLenum texture);
void glSampleCoverage (GLfloat value, GLboolean invert);
void glCompressedTexImage3D (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const(GLvoid)*data);
void glCompressedTexImage2D (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const(GLvoid)*data);
void glCompressedTexImage1D (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const(GLvoid)*data);
void glCompressedTexSubImage3D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const(GLvoid)*data);
void glCompressedTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const(GLvoid)*data);
void glCompressedTexSubImage1D (GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const(GLvoid)*data);
void glGetCompressedTexImage (GLenum target, GLint level, GLvoid *img);
void glClientActiveTexture (GLenum texture);
void glMultiTexCoord1d (GLenum target, GLdouble s);
void glMultiTexCoord1dv (GLenum target, const(GLdouble)*v);
void glMultiTexCoord1f (GLenum target, GLfloat s);
void glMultiTexCoord1fv (GLenum target, const(GLfloat)*v);
void glMultiTexCoord1i (GLenum target, GLint s);
void glMultiTexCoord1iv (GLenum target, const(GLint)*v);
void glMultiTexCoord1s (GLenum target, GLshort s);
void glMultiTexCoord1sv (GLenum target, const(GLshort)*v);
void glMultiTexCoord2d (GLenum target, GLdouble s, GLdouble t);
void glMultiTexCoord2dv (GLenum target, const(GLdouble)*v);
void glMultiTexCoord2f (GLenum target, GLfloat s, GLfloat t);
void glMultiTexCoord2fv (GLenum target, const(GLfloat)*v);
void glMultiTexCoord2i (GLenum target, GLint s, GLint t);
void glMultiTexCoord2iv (GLenum target, const(GLint)*v);
void glMultiTexCoord2s (GLenum target, GLshort s, GLshort t);
void glMultiTexCoord2sv (GLenum target, const(GLshort)*v);
void glMultiTexCoord3d (GLenum target, GLdouble s, GLdouble t, GLdouble r);
void glMultiTexCoord3dv (GLenum target, const(GLdouble)*v);
void glMultiTexCoord3f (GLenum target, GLfloat s, GLfloat t, GLfloat r);
void glMultiTexCoord3fv (GLenum target, const(GLfloat)*v);
void glMultiTexCoord3i (GLenum target, GLint s, GLint t, GLint r);
void glMultiTexCoord3iv (GLenum target, const(GLint)*v);
void glMultiTexCoord3s (GLenum target, GLshort s, GLshort t, GLshort r);
void glMultiTexCoord3sv (GLenum target, const(GLshort)*v);
void glMultiTexCoord4d (GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q);
void glMultiTexCoord4dv (GLenum target, const(GLdouble)*v);
void glMultiTexCoord4f (GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q);
void glMultiTexCoord4fv (GLenum target, const(GLfloat)*v);
void glMultiTexCoord4i (GLenum target, GLint s, GLint t, GLint r, GLint q);
void glMultiTexCoord4iv (GLenum target, const(GLint)*v);
void glMultiTexCoord4s (GLenum target, GLshort s, GLshort t, GLshort r, GLshort q);
void glMultiTexCoord4sv (GLenum target, const(GLshort)*v);
void glLoadTransposeMatrixf (const(GLfloat)*m);
void glLoadTransposeMatrixd (const(GLdouble)*m);
void glMultTransposeMatrixf (const(GLfloat)*m);
void glMultTransposeMatrixd (const(GLdouble)*m);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum texture) PFNGLACTIVETEXTUREPROC;
alias void function (GLfloat value, GLboolean invert) PFNGLSAMPLECOVERAGEPROC;
alias void function (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const(GLvoid)*data) PFNGLCOMPRESSEDTEXIMAGE3DPROC;
alias void function (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const(GLvoid)*data) PFNGLCOMPRESSEDTEXIMAGE2DPROC;
alias void function (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const(GLvoid)*data) PFNGLCOMPRESSEDTEXIMAGE1DPROC;
alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const(GLvoid)*data) PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC;
alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const(GLvoid)*data) PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC;
alias void function (GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const(GLvoid)*data) PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC;
alias void function (GLenum target, GLint level, GLvoid *img) PFNGLGETCOMPRESSEDTEXIMAGEPROC;
alias void function (GLenum texture) PFNGLCLIENTACTIVETEXTUREPROC;
alias void function (GLenum target, GLdouble s) PFNGLMULTITEXCOORD1DPROC;
alias void function (GLenum target, const(GLdouble)*v) PFNGLMULTITEXCOORD1DVPROC;
alias void function (GLenum target, GLfloat s) PFNGLMULTITEXCOORD1FPROC;
alias void function (GLenum target, const(GLfloat)*v) PFNGLMULTITEXCOORD1FVPROC;
alias void function (GLenum target, GLint s) PFNGLMULTITEXCOORD1IPROC;
alias void function (GLenum target, const(GLint)*v) PFNGLMULTITEXCOORD1IVPROC;
alias void function (GLenum target, GLshort s) PFNGLMULTITEXCOORD1SPROC;
alias void function (GLenum target, const(GLshort)*v) PFNGLMULTITEXCOORD1SVPROC;
alias void function (GLenum target, GLdouble s, GLdouble t) PFNGLMULTITEXCOORD2DPROC;
alias void function (GLenum target, const(GLdouble)*v) PFNGLMULTITEXCOORD2DVPROC;
alias void function (GLenum target, GLfloat s, GLfloat t) PFNGLMULTITEXCOORD2FPROC;
alias void function (GLenum target, const(GLfloat)*v) PFNGLMULTITEXCOORD2FVPROC;
alias void function (GLenum target, GLint s, GLint t) PFNGLMULTITEXCOORD2IPROC;
alias void function (GLenum target, const(GLint)*v) PFNGLMULTITEXCOORD2IVPROC;
alias void function (GLenum target, GLshort s, GLshort t) PFNGLMULTITEXCOORD2SPROC;
alias void function (GLenum target, const(GLshort)*v) PFNGLMULTITEXCOORD2SVPROC;
alias void function (GLenum target, GLdouble s, GLdouble t, GLdouble r) PFNGLMULTITEXCOORD3DPROC;
alias void function (GLenum target, const(GLdouble)*v) PFNGLMULTITEXCOORD3DVPROC;
alias void function (GLenum target, GLfloat s, GLfloat t, GLfloat r) PFNGLMULTITEXCOORD3FPROC;
alias void function (GLenum target, const(GLfloat)*v) PFNGLMULTITEXCOORD3FVPROC;
alias void function (GLenum target, GLint s, GLint t, GLint r) PFNGLMULTITEXCOORD3IPROC;
alias void function (GLenum target, const(GLint)*v) PFNGLMULTITEXCOORD3IVPROC;
alias void function (GLenum target, GLshort s, GLshort t, GLshort r) PFNGLMULTITEXCOORD3SPROC;
alias void function (GLenum target, const(GLshort)*v) PFNGLMULTITEXCOORD3SVPROC;
alias void function (GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q) PFNGLMULTITEXCOORD4DPROC;
alias void function (GLenum target, const(GLdouble)*v) PFNGLMULTITEXCOORD4DVPROC;
alias void function (GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q) PFNGLMULTITEXCOORD4FPROC;
alias void function (GLenum target, const(GLfloat)*v) PFNGLMULTITEXCOORD4FVPROC;
alias void function (GLenum target, GLint s, GLint t, GLint r, GLint q) PFNGLMULTITEXCOORD4IPROC;
alias void function (GLenum target, const(GLint)*v) PFNGLMULTITEXCOORD4IVPROC;
alias void function (GLenum target, GLshort s, GLshort t, GLshort r, GLshort q) PFNGLMULTITEXCOORD4SPROC;
alias void function (GLenum target, const(GLshort)*v) PFNGLMULTITEXCOORD4SVPROC;
alias void function (const(GLfloat)*m) PFNGLLOADTRANSPOSEMATRIXFPROC;
alias void function (const(GLdouble)*m) PFNGLLOADTRANSPOSEMATRIXDPROC;
alias void function (const(GLfloat)*m) PFNGLMULTTRANSPOSEMATRIXFPROC;
alias void function (const(GLdouble)*m) PFNGLMULTTRANSPOSEMATRIXDPROC;
}

version (GL_VERSION_1_4) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBlendFuncSeparate (GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha);
void glMultiDrawArrays (GLenum mode, const(GLint)*first, const(GLsizei)*count, GLsizei drawcount);
void glMultiDrawElements (GLenum mode, const(GLsizei)*count, GLenum type, const(GLvoid*)*indices, GLsizei drawcount);
void glPointParameterf (GLenum pname, GLfloat param);
void glPointParameterfv (GLenum pname, const(GLfloat)*params);
void glPointParameteri (GLenum pname, GLint param);
void glPointParameteriv (GLenum pname, const(GLint)*params);
void glFogCoordf (GLfloat coord);
void glFogCoordfv (const(GLfloat)*coord);
void glFogCoordd (GLdouble coord);
void glFogCoorddv (const(GLdouble)*coord);
void glFogCoordPointer (GLenum type, GLsizei stride, const(GLvoid)*pointer);
void glSecondaryColor3b (GLbyte red, GLbyte green, GLbyte blue);
void glSecondaryColor3bv (const(GLbyte)*v);
void glSecondaryColor3d (GLdouble red, GLdouble green, GLdouble blue);
void glSecondaryColor3dv (const(GLdouble)*v);
void glSecondaryColor3f (GLfloat red, GLfloat green, GLfloat blue);
void glSecondaryColor3fv (const(GLfloat)*v);
void glSecondaryColor3i (GLint red, GLint green, GLint blue);
void glSecondaryColor3iv (const(GLint)*v);
void glSecondaryColor3s (GLshort red, GLshort green, GLshort blue);
void glSecondaryColor3sv (const(GLshort)*v);
void glSecondaryColor3ub (GLubyte red, GLubyte green, GLubyte blue);
void glSecondaryColor3ubv (const(GLubyte)*v);
void glSecondaryColor3ui (GLuint red, GLuint green, GLuint blue);
void glSecondaryColor3uiv (const(GLuint)*v);
void glSecondaryColor3us (GLushort red, GLushort green, GLushort blue);
void glSecondaryColor3usv (const(GLushort)*v);
void glSecondaryColorPointer (GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer);
void glWindowPos2d (GLdouble x, GLdouble y);
void glWindowPos2dv (const(GLdouble)*v);
void glWindowPos2f (GLfloat x, GLfloat y);
void glWindowPos2fv (const(GLfloat)*v);
void glWindowPos2i (GLint x, GLint y);
void glWindowPos2iv (const(GLint)*v);
void glWindowPos2s (GLshort x, GLshort y);
void glWindowPos2sv (const(GLshort)*v);
void glWindowPos3d (GLdouble x, GLdouble y, GLdouble z);
void glWindowPos3dv (const(GLdouble)*v);
void glWindowPos3f (GLfloat x, GLfloat y, GLfloat z);
void glWindowPos3fv (const(GLfloat)*v);
void glWindowPos3i (GLint x, GLint y, GLint z);
void glWindowPos3iv (const(GLint)*v);
void glWindowPos3s (GLshort x, GLshort y, GLshort z);
void glWindowPos3sv (const(GLshort)*v);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha) PFNGLBLENDFUNCSEPARATEPROC;
alias void function (GLenum mode, const(GLint)*first, const(GLsizei)*count, GLsizei drawcount) PFNGLMULTIDRAWARRAYSPROC;
alias void function (GLenum mode, const(GLsizei)*count, GLenum type, const(GLvoid*)*indices, GLsizei drawcount) PFNGLMULTIDRAWELEMENTSPROC;
alias void function (GLenum pname, GLfloat param) PFNGLPOINTPARAMETERFPROC;
alias void function (GLenum pname, const(GLfloat)*params) PFNGLPOINTPARAMETERFVPROC;
alias void function (GLenum pname, GLint param) PFNGLPOINTPARAMETERIPROC;
alias void function (GLenum pname, const(GLint)*params) PFNGLPOINTPARAMETERIVPROC;
alias void function (GLfloat coord) PFNGLFOGCOORDFPROC;
alias void function (const(GLfloat)*coord) PFNGLFOGCOORDFVPROC;
alias void function (GLdouble coord) PFNGLFOGCOORDDPROC;
alias void function (const(GLdouble)*coord) PFNGLFOGCOORDDVPROC;
alias void function (GLenum type, GLsizei stride, const(GLvoid)*pointer) PFNGLFOGCOORDPOINTERPROC;
alias void function (GLbyte red, GLbyte green, GLbyte blue) PFNGLSECONDARYCOLOR3BPROC;
alias void function (const(GLbyte)*v) PFNGLSECONDARYCOLOR3BVPROC;
alias void function (GLdouble red, GLdouble green, GLdouble blue) PFNGLSECONDARYCOLOR3DPROC;
alias void function (const(GLdouble)*v) PFNGLSECONDARYCOLOR3DVPROC;
alias void function (GLfloat red, GLfloat green, GLfloat blue) PFNGLSECONDARYCOLOR3FPROC;
alias void function (const(GLfloat)*v) PFNGLSECONDARYCOLOR3FVPROC;
alias void function (GLint red, GLint green, GLint blue) PFNGLSECONDARYCOLOR3IPROC;
alias void function (const(GLint)*v) PFNGLSECONDARYCOLOR3IVPROC;
alias void function (GLshort red, GLshort green, GLshort blue) PFNGLSECONDARYCOLOR3SPROC;
alias void function (const(GLshort)*v) PFNGLSECONDARYCOLOR3SVPROC;
alias void function (GLubyte red, GLubyte green, GLubyte blue) PFNGLSECONDARYCOLOR3UBPROC;
alias void function (const(GLubyte)*v) PFNGLSECONDARYCOLOR3UBVPROC;
alias void function (GLuint red, GLuint green, GLuint blue) PFNGLSECONDARYCOLOR3UIPROC;
alias void function (const(GLuint)*v) PFNGLSECONDARYCOLOR3UIVPROC;
alias void function (GLushort red, GLushort green, GLushort blue) PFNGLSECONDARYCOLOR3USPROC;
alias void function (const(GLushort)*v) PFNGLSECONDARYCOLOR3USVPROC;
alias void function (GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer) PFNGLSECONDARYCOLORPOINTERPROC;
alias void function (GLdouble x, GLdouble y) PFNGLWINDOWPOS2DPROC;
alias void function (const(GLdouble)*v) PFNGLWINDOWPOS2DVPROC;
alias void function (GLfloat x, GLfloat y) PFNGLWINDOWPOS2FPROC;
alias void function (const(GLfloat)*v) PFNGLWINDOWPOS2FVPROC;
alias void function (GLint x, GLint y) PFNGLWINDOWPOS2IPROC;
alias void function (const(GLint)*v) PFNGLWINDOWPOS2IVPROC;
alias void function (GLshort x, GLshort y) PFNGLWINDOWPOS2SPROC;
alias void function (const(GLshort)*v) PFNGLWINDOWPOS2SVPROC;
alias void function (GLdouble x, GLdouble y, GLdouble z) PFNGLWINDOWPOS3DPROC;
alias void function (const(GLdouble)*v) PFNGLWINDOWPOS3DVPROC;
alias void function (GLfloat x, GLfloat y, GLfloat z) PFNGLWINDOWPOS3FPROC;
alias void function (const(GLfloat)*v) PFNGLWINDOWPOS3FVPROC;
alias void function (GLint x, GLint y, GLint z) PFNGLWINDOWPOS3IPROC;
alias void function (const(GLint)*v) PFNGLWINDOWPOS3IVPROC;
alias void function (GLshort x, GLshort y, GLshort z) PFNGLWINDOWPOS3SPROC;
alias void function (const(GLshort)*v) PFNGLWINDOWPOS3SVPROC;
}

version (GL_VERSION_1_5) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGenQueries (GLsizei n, GLuint *ids);
void glDeleteQueries (GLsizei n, const(GLuint)*ids);
GLboolean glIsQuery (GLuint id);
void glBeginQuery (GLenum target, GLuint id);
void glEndQuery (GLenum target);
void glGetQueryiv (GLenum target, GLenum pname, GLint *params);
void glGetQueryObjectiv (GLuint id, GLenum pname, GLint *params);
void glGetQueryObjectuiv (GLuint id, GLenum pname, GLuint *params);
void glBindBuffer (GLenum target, GLuint buffer);
void glDeleteBuffers (GLsizei n, const(GLuint)*buffers);
void glGenBuffers (GLsizei n, GLuint *buffers);
GLboolean glIsBuffer (GLuint buffer);
void glBufferData (GLenum target, GLsizeiptr size, const(GLvoid)*data, GLenum usage);
void glBufferSubData (GLenum target, GLintptr offset, GLsizeiptr size, const(GLvoid)*data);
void glGetBufferSubData (GLenum target, GLintptr offset, GLsizeiptr size, GLvoid *data);
GLvoid* glMapBuffer (GLenum target, GLenum access);
GLboolean glUnmapBuffer (GLenum target);
void glGetBufferParameteriv (GLenum target, GLenum pname, GLint *params);
void glGetBufferPointerv (GLenum target, GLenum pname, GLvoid* *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLsizei n, GLuint *ids) PFNGLGENQUERIESPROC;
alias void function (GLsizei n, const(GLuint)*ids) PFNGLDELETEQUERIESPROC;
alias GLboolean function (GLuint id) PFNGLISQUERYPROC;
alias void function (GLenum target, GLuint id) PFNGLBEGINQUERYPROC;
alias void function (GLenum target) PFNGLENDQUERYPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETQUERYIVPROC;
alias void function (GLuint id, GLenum pname, GLint *params) PFNGLGETQUERYOBJECTIVPROC;
alias void function (GLuint id, GLenum pname, GLuint *params) PFNGLGETQUERYOBJECTUIVPROC;
alias void function (GLenum target, GLuint buffer) PFNGLBINDBUFFERPROC;
alias void function (GLsizei n, const(GLuint)*buffers) PFNGLDELETEBUFFERSPROC;
alias void function (GLsizei n, GLuint *buffers) PFNGLGENBUFFERSPROC;
alias GLboolean function (GLuint buffer) PFNGLISBUFFERPROC;
alias void function (GLenum target, GLsizeiptr size, const(GLvoid)*data, GLenum usage) PFNGLBUFFERDATAPROC;
alias void function (GLenum target, GLintptr offset, GLsizeiptr size, const(GLvoid)*data) PFNGLBUFFERSUBDATAPROC;
alias void function (GLenum target, GLintptr offset, GLsizeiptr size, GLvoid *data) PFNGLGETBUFFERSUBDATAPROC;
alias GLvoid* function (GLenum target, GLenum access) PFNGLMAPBUFFERPROC;
alias GLboolean function (GLenum target) PFNGLUNMAPBUFFERPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETBUFFERPARAMETERIVPROC;
alias void function (GLenum target, GLenum pname, GLvoid* *params) PFNGLGETBUFFERPOINTERVPROC;
}

version (GL_VERSION_2_0) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBlendEquationSeparate (GLenum modeRGB, GLenum modeAlpha);
void glDrawBuffers (GLsizei n, const(GLenum)*bufs);
void glStencilOpSeparate (GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass);
void glStencilFuncSeparate (GLenum, GLenum, GLint, GLuint); // face, func, ref, mask
void glStencilMaskSeparate (GLenum face, GLuint mask);
void glAttachShader (GLuint program, GLuint shader);
void glBindAttribLocation (GLuint program, GLuint index, const(GLchar)*name);
void glCompileShader (GLuint shader);
GLuint glCreateProgram ();
GLuint glCreateShader (GLenum type);
void glDeleteProgram (GLuint program);
void glDeleteShader (GLuint shader);
void glDetachShader (GLuint program, GLuint shader);
void glDisableVertexAttribArray (GLuint index);
void glEnableVertexAttribArray (GLuint index);
void glGetActiveAttrib (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name);
void glGetActiveUniform (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name);
void glGetAttachedShaders (GLuint program, GLsizei maxCount, GLsizei *count, GLuint *obj);
GLint glGetAttribLocation (GLuint program, const(GLchar)*name);
void glGetProgramiv (GLuint program, GLenum pname, GLint *params);
void glGetProgramInfoLog (GLuint program, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
void glGetShaderiv (GLuint shader, GLenum pname, GLint *params);
void glGetShaderInfoLog (GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
void glGetShaderSource (GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *source);
GLint glGetUniformLocation (GLuint program, const(GLchar)*name);
void glGetUniformfv (GLuint program, GLint location, GLfloat *params);
void glGetUniformiv (GLuint program, GLint location, GLint *params);
void glGetVertexAttribdv (GLuint index, GLenum pname, GLdouble *params);
void glGetVertexAttribfv (GLuint index, GLenum pname, GLfloat *params);
void glGetVertexAttribiv (GLuint index, GLenum pname, GLint *params);
void glGetVertexAttribPointerv (GLuint index, GLenum pname, GLvoid* *pointer);
GLboolean glIsProgram (GLuint program);
GLboolean glIsShader (GLuint shader);
void glLinkProgram (GLuint program);
void glShaderSource (GLuint shader, GLsizei count, const(GLchar*)* string_, const(GLint)*length);
void glUseProgram (GLuint program);
void glUniform1f (GLint location, GLfloat v0);
void glUniform2f (GLint location, GLfloat v0, GLfloat v1);
void glUniform3f (GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
void glUniform4f (GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
void glUniform1i (GLint location, GLint v0);
void glUniform2i (GLint location, GLint v0, GLint v1);
void glUniform3i (GLint location, GLint v0, GLint v1, GLint v2);
void glUniform4i (GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
void glUniform1fv (GLint location, GLsizei count, const(GLfloat)*value);
void glUniform2fv (GLint location, GLsizei count, const(GLfloat)*value);
void glUniform3fv (GLint location, GLsizei count, const(GLfloat)*value);
void glUniform4fv (GLint location, GLsizei count, const(GLfloat)*value);
void glUniform1iv (GLint location, GLsizei count, const(GLint)*value);
void glUniform2iv (GLint location, GLsizei count, const(GLint)*value);
void glUniform3iv (GLint location, GLsizei count, const(GLint)*value);
void glUniform4iv (GLint location, GLsizei count, const(GLint)*value);
void glUniformMatrix2fv (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glUniformMatrix3fv (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glUniformMatrix4fv (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glValidateProgram (GLuint program);
void glVertexAttrib1d (GLuint index, GLdouble x);
void glVertexAttrib1dv (GLuint index, const(GLdouble)*v);
void glVertexAttrib1f (GLuint index, GLfloat x);
void glVertexAttrib1fv (GLuint index, const(GLfloat)*v);
void glVertexAttrib1s (GLuint index, GLshort x);
void glVertexAttrib1sv (GLuint index, const(GLshort)*v);
void glVertexAttrib2d (GLuint index, GLdouble x, GLdouble y);
void glVertexAttrib2dv (GLuint index, const(GLdouble)*v);
void glVertexAttrib2f (GLuint index, GLfloat x, GLfloat y);
void glVertexAttrib2fv (GLuint index, const(GLfloat)*v);
void glVertexAttrib2s (GLuint index, GLshort x, GLshort y);
void glVertexAttrib2sv (GLuint index, const(GLshort)*v);
void glVertexAttrib3d (GLuint index, GLdouble x, GLdouble y, GLdouble z);
void glVertexAttrib3dv (GLuint index, const(GLdouble)*v);
void glVertexAttrib3f (GLuint index, GLfloat x, GLfloat y, GLfloat z);
void glVertexAttrib3fv (GLuint index, const(GLfloat)*v);
void glVertexAttrib3s (GLuint index, GLshort x, GLshort y, GLshort z);
void glVertexAttrib3sv (GLuint index, const(GLshort)*v);
void glVertexAttrib4Nbv (GLuint index, const(GLbyte)*v);
void glVertexAttrib4Niv (GLuint index, const(GLint)*v);
void glVertexAttrib4Nsv (GLuint index, const(GLshort)*v);
void glVertexAttrib4Nub (GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w);
void glVertexAttrib4Nubv (GLuint index, const(GLubyte)*v);
void glVertexAttrib4Nuiv (GLuint index, const(GLuint)*v);
void glVertexAttrib4Nusv (GLuint index, const(GLushort)*v);
void glVertexAttrib4bv (GLuint index, const(GLbyte)*v);
void glVertexAttrib4d (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glVertexAttrib4dv (GLuint index, const(GLdouble)*v);
void glVertexAttrib4f (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glVertexAttrib4fv (GLuint index, const(GLfloat)*v);
void glVertexAttrib4iv (GLuint index, const(GLint)*v);
void glVertexAttrib4s (GLuint index, GLshort x, GLshort y, GLshort z, GLshort w);
void glVertexAttrib4sv (GLuint index, const(GLshort)*v);
void glVertexAttrib4ubv (GLuint index, const(GLubyte)*v);
void glVertexAttrib4uiv (GLuint index, const(GLuint)*v);
void glVertexAttrib4usv (GLuint index, const(GLushort)*v);
void glVertexAttribPointer (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const(GLvoid)*pointer);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum modeRGB, GLenum modeAlpha) PFNGLBLENDEQUATIONSEPARATEPROC;
alias void function (GLsizei n, const(GLenum)*bufs) PFNGLDRAWBUFFERSPROC;
alias void function (GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass) PFNGLSTENCILOPSEPARATEPROC;
alias void function (GLenum, GLenum, GLint, GLuint /*face,func,ref,mask*/) PFNGLSTENCILFUNCSEPARATEPROC;
alias void function (GLenum face, GLuint mask) PFNGLSTENCILMASKSEPARATEPROC;
alias void function (GLuint program, GLuint shader) PFNGLATTACHSHADERPROC;
alias void function (GLuint program, GLuint index, const(GLchar)*name) PFNGLBINDATTRIBLOCATIONPROC;
alias void function (GLuint shader) PFNGLCOMPILESHADERPROC;
alias GLuint function () PFNGLCREATEPROGRAMPROC;
alias GLuint function (GLenum type) PFNGLCREATESHADERPROC;
alias void function (GLuint program) PFNGLDELETEPROGRAMPROC;
alias void function (GLuint shader) PFNGLDELETESHADERPROC;
alias void function (GLuint program, GLuint shader) PFNGLDETACHSHADERPROC;
alias void function (GLuint index) PFNGLDISABLEVERTEXATTRIBARRAYPROC;
alias void function (GLuint index) PFNGLENABLEVERTEXATTRIBARRAYPROC;
alias void function (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name) PFNGLGETACTIVEATTRIBPROC;
alias void function (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name) PFNGLGETACTIVEUNIFORMPROC;
alias void function (GLuint program, GLsizei maxCount, GLsizei *count, GLuint *obj) PFNGLGETATTACHEDSHADERSPROC;
alias GLint function (GLuint program, const(GLchar)*name) PFNGLGETATTRIBLOCATIONPROC;
alias void function (GLuint program, GLenum pname, GLint *params) PFNGLGETPROGRAMIVPROC;
alias void function (GLuint program, GLsizei bufSize, GLsizei *length, GLchar *infoLog) PFNGLGETPROGRAMINFOLOGPROC;
alias void function (GLuint shader, GLenum pname, GLint *params) PFNGLGETSHADERIVPROC;
alias void function (GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *infoLog) PFNGLGETSHADERINFOLOGPROC;
alias void function (GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *source) PFNGLGETSHADERSOURCEPROC;
alias GLint function (GLuint program, const(GLchar)*name) PFNGLGETUNIFORMLOCATIONPROC;
alias void function (GLuint program, GLint location, GLfloat *params) PFNGLGETUNIFORMFVPROC;
alias void function (GLuint program, GLint location, GLint *params) PFNGLGETUNIFORMIVPROC;
alias void function (GLuint index, GLenum pname, GLdouble *params) PFNGLGETVERTEXATTRIBDVPROC;
alias void function (GLuint index, GLenum pname, GLfloat *params) PFNGLGETVERTEXATTRIBFVPROC;
alias void function (GLuint index, GLenum pname, GLint *params) PFNGLGETVERTEXATTRIBIVPROC;
alias void function (GLuint index, GLenum pname, GLvoid* *pointer) PFNGLGETVERTEXATTRIBPOINTERVPROC;
alias GLboolean function (GLuint program) PFNGLISPROGRAMPROC;
alias GLboolean function (GLuint shader) PFNGLISSHADERPROC;
alias void function (GLuint program) PFNGLLINKPROGRAMPROC;
alias void function (GLuint shader, GLsizei count, const(GLchar*)*string_, const(GLint)*length) PFNGLSHADERSOURCEPROC;
alias void function (GLuint program) PFNGLUSEPROGRAMPROC;
alias void function (GLint location, GLfloat v0) PFNGLUNIFORM1FPROC;
alias void function (GLint location, GLfloat v0, GLfloat v1) PFNGLUNIFORM2FPROC;
alias void function (GLint location, GLfloat v0, GLfloat v1, GLfloat v2) PFNGLUNIFORM3FPROC;
alias void function (GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3) PFNGLUNIFORM4FPROC;
alias void function (GLint location, GLint v0) PFNGLUNIFORM1IPROC;
alias void function (GLint location, GLint v0, GLint v1) PFNGLUNIFORM2IPROC;
alias void function (GLint location, GLint v0, GLint v1, GLint v2) PFNGLUNIFORM3IPROC;
alias void function (GLint location, GLint v0, GLint v1, GLint v2, GLint v3) PFNGLUNIFORM4IPROC;
alias void function (GLint location, GLsizei count, const(GLfloat)*value) PFNGLUNIFORM1FVPROC;
alias void function (GLint location, GLsizei count, const(GLfloat)*value) PFNGLUNIFORM2FVPROC;
alias void function (GLint location, GLsizei count, const(GLfloat)*value) PFNGLUNIFORM3FVPROC;
alias void function (GLint location, GLsizei count, const(GLfloat)*value) PFNGLUNIFORM4FVPROC;
alias void function (GLint location, GLsizei count, const(GLint)*value) PFNGLUNIFORM1IVPROC;
alias void function (GLint location, GLsizei count, const(GLint)*value) PFNGLUNIFORM2IVPROC;
alias void function (GLint location, GLsizei count, const(GLint)*value) PFNGLUNIFORM3IVPROC;
alias void function (GLint location, GLsizei count, const(GLint)*value) PFNGLUNIFORM4IVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLUNIFORMMATRIX2FVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLUNIFORMMATRIX3FVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLUNIFORMMATRIX4FVPROC;
alias void function (GLuint program) PFNGLVALIDATEPROGRAMPROC;
alias void function (GLuint index, GLdouble x) PFNGLVERTEXATTRIB1DPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIB1DVPROC;
alias void function (GLuint index, GLfloat x) PFNGLVERTEXATTRIB1FPROC;
alias void function (GLuint index, const(GLfloat)*v) PFNGLVERTEXATTRIB1FVPROC;
alias void function (GLuint index, GLshort x) PFNGLVERTEXATTRIB1SPROC;
alias void function (GLuint index, const(GLshort)*v) PFNGLVERTEXATTRIB1SVPROC;
alias void function (GLuint index, GLdouble x, GLdouble y) PFNGLVERTEXATTRIB2DPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIB2DVPROC;
alias void function (GLuint index, GLfloat x, GLfloat y) PFNGLVERTEXATTRIB2FPROC;
alias void function (GLuint index, const(GLfloat)*v) PFNGLVERTEXATTRIB2FVPROC;
alias void function (GLuint index, GLshort x, GLshort y) PFNGLVERTEXATTRIB2SPROC;
alias void function (GLuint index, const(GLshort)*v) PFNGLVERTEXATTRIB2SVPROC;
alias void function (GLuint index, GLdouble x, GLdouble y, GLdouble z) PFNGLVERTEXATTRIB3DPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIB3DVPROC;
alias void function (GLuint index, GLfloat x, GLfloat y, GLfloat z) PFNGLVERTEXATTRIB3FPROC;
alias void function (GLuint index, const(GLfloat)*v) PFNGLVERTEXATTRIB3FVPROC;
alias void function (GLuint index, GLshort x, GLshort y, GLshort z) PFNGLVERTEXATTRIB3SPROC;
alias void function (GLuint index, const(GLshort)*v) PFNGLVERTEXATTRIB3SVPROC;
alias void function (GLuint index, const(GLbyte)*v) PFNGLVERTEXATTRIB4NBVPROC;
alias void function (GLuint index, const(GLint)*v) PFNGLVERTEXATTRIB4NIVPROC;
alias void function (GLuint index, const(GLshort)*v) PFNGLVERTEXATTRIB4NSVPROC;
alias void function (GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w) PFNGLVERTEXATTRIB4NUBPROC;
alias void function (GLuint index, const(GLubyte)*v) PFNGLVERTEXATTRIB4NUBVPROC;
alias void function (GLuint index, const(GLuint)*v) PFNGLVERTEXATTRIB4NUIVPROC;
alias void function (GLuint index, const(GLushort)*v) PFNGLVERTEXATTRIB4NUSVPROC;
alias void function (GLuint index, const(GLbyte)*v) PFNGLVERTEXATTRIB4BVPROC;
alias void function (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w) PFNGLVERTEXATTRIB4DPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIB4DVPROC;
alias void function (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w) PFNGLVERTEXATTRIB4FPROC;
alias void function (GLuint index, const(GLfloat)*v) PFNGLVERTEXATTRIB4FVPROC;
alias void function (GLuint index, const(GLint)*v) PFNGLVERTEXATTRIB4IVPROC;
alias void function (GLuint index, GLshort x, GLshort y, GLshort z, GLshort w) PFNGLVERTEXATTRIB4SPROC;
alias void function (GLuint index, const(GLshort)*v) PFNGLVERTEXATTRIB4SVPROC;
alias void function (GLuint index, const(GLubyte)*v) PFNGLVERTEXATTRIB4UBVPROC;
alias void function (GLuint index, const(GLuint)*v) PFNGLVERTEXATTRIB4UIVPROC;
alias void function (GLuint index, const(GLushort)*v) PFNGLVERTEXATTRIB4USVPROC;
alias void function (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const(GLvoid)*pointer) PFNGLVERTEXATTRIBPOINTERPROC;
}

version (GL_VERSION_2_1) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glUniformMatrix2x3fv (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glUniformMatrix3x2fv (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glUniformMatrix2x4fv (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glUniformMatrix4x2fv (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glUniformMatrix3x4fv (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glUniformMatrix4x3fv (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLUNIFORMMATRIX2X3FVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLUNIFORMMATRIX3X2FVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLUNIFORMMATRIX2X4FVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLUNIFORMMATRIX4X2FVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLUNIFORMMATRIX3X4FVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLUNIFORMMATRIX4X3FVPROC;
}

version (GL_VERSION_3_0) {} else {
/* OpenGL 3.0 also reuses entry points from these extensions: */
/* ARB_framebuffer_object */
/* ARB_map_buffer_range */
/* ARB_vertex_array_object */
version (GL_GLEXT_PROTOTYPES) {
void glColorMaski (GLuint index, GLboolean r, GLboolean g, GLboolean b, GLboolean a);
void glGetBooleani_v (GLenum target, GLuint index, GLboolean *data);
void glGetIntegeri_v (GLenum target, GLuint index, GLint *data);
void glEnablei (GLenum target, GLuint index);
void glDisablei (GLenum target, GLuint index);
GLboolean glIsEnabledi (GLenum target, GLuint index);
void glBeginTransformFeedback (GLenum primitiveMode);
void glEndTransformFeedback ();
void glBindBufferRange (GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size);
void glBindBufferBase (GLenum target, GLuint index, GLuint buffer);
void glTransformFeedbackVaryings (GLuint program, GLsizei count, const(GLchar*)*varyings, GLenum bufferMode);
void glGetTransformFeedbackVarying (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLsizei *size, GLenum *type, GLchar *name);
void glClampColor (GLenum target, GLenum clamp);
void glBeginConditionalRender (GLuint id, GLenum mode);
void glEndConditionalRender ();
void glVertexAttribIPointer (GLuint index, GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer);
void glGetVertexAttribIiv (GLuint index, GLenum pname, GLint *params);
void glGetVertexAttribIuiv (GLuint index, GLenum pname, GLuint *params);
void glVertexAttribI1i (GLuint index, GLint x);
void glVertexAttribI2i (GLuint index, GLint x, GLint y);
void glVertexAttribI3i (GLuint index, GLint x, GLint y, GLint z);
void glVertexAttribI4i (GLuint index, GLint x, GLint y, GLint z, GLint w);
void glVertexAttribI1ui (GLuint index, GLuint x);
void glVertexAttribI2ui (GLuint index, GLuint x, GLuint y);
void glVertexAttribI3ui (GLuint index, GLuint x, GLuint y, GLuint z);
void glVertexAttribI4ui (GLuint index, GLuint x, GLuint y, GLuint z, GLuint w);
void glVertexAttribI1iv (GLuint index, const(GLint)*v);
void glVertexAttribI2iv (GLuint index, const(GLint)*v);
void glVertexAttribI3iv (GLuint index, const(GLint)*v);
void glVertexAttribI4iv (GLuint index, const(GLint)*v);
void glVertexAttribI1uiv (GLuint index, const(GLuint)*v);
void glVertexAttribI2uiv (GLuint index, const(GLuint)*v);
void glVertexAttribI3uiv (GLuint index, const(GLuint)*v);
void glVertexAttribI4uiv (GLuint index, const(GLuint)*v);
void glVertexAttribI4bv (GLuint index, const(GLbyte)*v);
void glVertexAttribI4sv (GLuint index, const(GLshort)*v);
void glVertexAttribI4ubv (GLuint index, const(GLubyte)*v);
void glVertexAttribI4usv (GLuint index, const(GLushort)*v);
void glGetUniformuiv (GLuint program, GLint location, GLuint *params);
void glBindFragDataLocation (GLuint program, GLuint color, const(GLchar)*name);
GLint glGetFragDataLocation (GLuint program, const(GLchar)*name);
void glUniform1ui (GLint location, GLuint v0);
void glUniform2ui (GLint location, GLuint v0, GLuint v1);
void glUniform3ui (GLint location, GLuint v0, GLuint v1, GLuint v2);
void glUniform4ui (GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3);
void glUniform1uiv (GLint location, GLsizei count, const(GLuint)*value);
void glUniform2uiv (GLint location, GLsizei count, const(GLuint)*value);
void glUniform3uiv (GLint location, GLsizei count, const(GLuint)*value);
void glUniform4uiv (GLint location, GLsizei count, const(GLuint)*value);
void glTexParameterIiv (GLenum target, GLenum pname, const(GLint)*params);
void glTexParameterIuiv (GLenum target, GLenum pname, const(GLuint)*params);
void glGetTexParameterIiv (GLenum target, GLenum pname, GLint *params);
void glGetTexParameterIuiv (GLenum target, GLenum pname, GLuint *params);
void glClearBufferiv (GLenum buffer, GLint drawbuffer, const(GLint)*value);
void glClearBufferuiv (GLenum buffer, GLint drawbuffer, const(GLuint)*value);
void glClearBufferfv (GLenum buffer, GLint drawbuffer, const(GLfloat)*value);
void glClearBufferfi (GLenum buffer, GLint drawbuffer, GLfloat depth, GLint stencil);
const(char)* glGetStringi (GLenum name, GLuint index);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint index, GLboolean r, GLboolean g, GLboolean b, GLboolean a) PFNGLCOLORMASKIPROC;
alias void function (GLenum target, GLuint index, GLboolean *data) PFNGLGETBOOLEANI_VPROC;
alias void function (GLenum target, GLuint index, GLint *data) PFNGLGETINTEGERI_VPROC;
alias void function (GLenum target, GLuint index) PFNGLENABLEIPROC;
alias void function (GLenum target, GLuint index) PFNGLDISABLEIPROC;
alias GLboolean function (GLenum target, GLuint index) PFNGLISENABLEDIPROC;
alias void function (GLenum primitiveMode) PFNGLBEGINTRANSFORMFEEDBACKPROC;
alias void function () PFNGLENDTRANSFORMFEEDBACKPROC;
alias void function (GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size) PFNGLBINDBUFFERRANGEPROC;
alias void function (GLenum target, GLuint index, GLuint buffer) PFNGLBINDBUFFERBASEPROC;
alias void function (GLuint program, GLsizei count, const(GLchar*)*varyings, GLenum bufferMode) PFNGLTRANSFORMFEEDBACKVARYINGSPROC;
alias void function (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLsizei *size, GLenum *type, GLchar *name) PFNGLGETTRANSFORMFEEDBACKVARYINGPROC;
alias void function (GLenum target, GLenum clamp) PFNGLCLAMPCOLORPROC;
alias void function (GLuint id, GLenum mode) PFNGLBEGINCONDITIONALRENDERPROC;
alias void function () PFNGLENDCONDITIONALRENDERPROC;
alias void function (GLuint index, GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer) PFNGLVERTEXATTRIBIPOINTERPROC;
alias void function (GLuint index, GLenum pname, GLint *params) PFNGLGETVERTEXATTRIBIIVPROC;
alias void function (GLuint index, GLenum pname, GLuint *params) PFNGLGETVERTEXATTRIBIUIVPROC;
alias void function (GLuint index, GLint x) PFNGLVERTEXATTRIBI1IPROC;
alias void function (GLuint index, GLint x, GLint y) PFNGLVERTEXATTRIBI2IPROC;
alias void function (GLuint index, GLint x, GLint y, GLint z) PFNGLVERTEXATTRIBI3IPROC;
alias void function (GLuint index, GLint x, GLint y, GLint z, GLint w) PFNGLVERTEXATTRIBI4IPROC;
alias void function (GLuint index, GLuint x) PFNGLVERTEXATTRIBI1UIPROC;
alias void function (GLuint index, GLuint x, GLuint y) PFNGLVERTEXATTRIBI2UIPROC;
alias void function (GLuint index, GLuint x, GLuint y, GLuint z) PFNGLVERTEXATTRIBI3UIPROC;
alias void function (GLuint index, GLuint x, GLuint y, GLuint z, GLuint w) PFNGLVERTEXATTRIBI4UIPROC;
alias void function (GLuint index, const(GLint)*v) PFNGLVERTEXATTRIBI1IVPROC;
alias void function (GLuint index, const(GLint)*v) PFNGLVERTEXATTRIBI2IVPROC;
alias void function (GLuint index, const(GLint)*v) PFNGLVERTEXATTRIBI3IVPROC;
alias void function (GLuint index, const(GLint)*v) PFNGLVERTEXATTRIBI4IVPROC;
alias void function (GLuint index, const(GLuint)*v) PFNGLVERTEXATTRIBI1UIVPROC;
alias void function (GLuint index, const(GLuint)*v) PFNGLVERTEXATTRIBI2UIVPROC;
alias void function (GLuint index, const(GLuint)*v) PFNGLVERTEXATTRIBI3UIVPROC;
alias void function (GLuint index, const(GLuint)*v) PFNGLVERTEXATTRIBI4UIVPROC;
alias void function (GLuint index, const(GLbyte)*v) PFNGLVERTEXATTRIBI4BVPROC;
alias void function (GLuint index, const(GLshort)*v) PFNGLVERTEXATTRIBI4SVPROC;
alias void function (GLuint index, const(GLubyte)*v) PFNGLVERTEXATTRIBI4UBVPROC;
alias void function (GLuint index, const(GLushort)*v) PFNGLVERTEXATTRIBI4USVPROC;
alias void function (GLuint program, GLint location, GLuint *params) PFNGLGETUNIFORMUIVPROC;
alias void function (GLuint program, GLuint color, const(GLchar)*name) PFNGLBINDFRAGDATALOCATIONPROC;
alias GLint function (GLuint program, const(GLchar)*name) PFNGLGETFRAGDATALOCATIONPROC;
alias void function (GLint location, GLuint v0) PFNGLUNIFORM1UIPROC;
alias void function (GLint location, GLuint v0, GLuint v1) PFNGLUNIFORM2UIPROC;
alias void function (GLint location, GLuint v0, GLuint v1, GLuint v2) PFNGLUNIFORM3UIPROC;
alias void function (GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3) PFNGLUNIFORM4UIPROC;
alias void function (GLint location, GLsizei count, const(GLuint)*value) PFNGLUNIFORM1UIVPROC;
alias void function (GLint location, GLsizei count, const(GLuint)*value) PFNGLUNIFORM2UIVPROC;
alias void function (GLint location, GLsizei count, const(GLuint)*value) PFNGLUNIFORM3UIVPROC;
alias void function (GLint location, GLsizei count, const(GLuint)*value) PFNGLUNIFORM4UIVPROC;
alias void function (GLenum target, GLenum pname, const(GLint)*params) PFNGLTEXPARAMETERIIVPROC;
alias void function (GLenum target, GLenum pname, const(GLuint)*params) PFNGLTEXPARAMETERIUIVPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETTEXPARAMETERIIVPROC;
alias void function (GLenum target, GLenum pname, GLuint *params) PFNGLGETTEXPARAMETERIUIVPROC;
alias void function (GLenum buffer, GLint drawbuffer, const(GLint)*value) PFNGLCLEARBUFFERIVPROC;
alias void function (GLenum buffer, GLint drawbuffer, const(GLuint)*value) PFNGLCLEARBUFFERUIVPROC;
alias void function (GLenum buffer, GLint drawbuffer, const(GLfloat)*value) PFNGLCLEARBUFFERFVPROC;
alias void function (GLenum buffer, GLint drawbuffer, GLfloat depth, GLint stencil) PFNGLCLEARBUFFERFIPROC;
alias const(char)* function (GLenum name, GLuint index)PFNGLGETSTRINGIPROC;
}

version (GL_VERSION_3_1) {} else {
/* OpenGL 3.1 also reuses entry points from these extensions: */
/* ARB_copy_buffer */
/* ARB_uniform_buffer_object */
version (GL_GLEXT_PROTOTYPES) {
void glDrawArraysInstanced (GLenum mode, GLint first, GLsizei count, GLsizei instancecount);
void glDrawElementsInstanced (GLenum mode, GLsizei count, GLenum type, const(GLvoid)*indices, GLsizei instancecount);
void glTexBuffer (GLenum target, GLenum internalformat, GLuint buffer);
void glPrimitiveRestartIndex (GLuint index);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode, GLint first, GLsizei count, GLsizei instancecount) PFNGLDRAWARRAYSINSTANCEDPROC;
alias void function (GLenum mode, GLsizei count, GLenum type, const(GLvoid)*indices, GLsizei instancecount) PFNGLDRAWELEMENTSINSTANCEDPROC;
alias void function (GLenum target, GLenum internalformat, GLuint buffer) PFNGLTEXBUFFERPROC;
alias void function (GLuint index) PFNGLPRIMITIVERESTARTINDEXPROC;
}

version (GL_VERSION_3_2) {} else {
/* OpenGL 3.2 also reuses entry points from these extensions: */
/* ARB_draw_elements_base_vertex */
/* ARB_provoking_vertex */
/* ARB_sync */
/* ARB_texture_multisample */
version (GL_GLEXT_PROTOTYPES) {
void glGetInteger64i_v (GLenum target, GLuint index, GLint64 *data);
void glGetBufferParameteri64v (GLenum target, GLenum pname, GLint64 *params);
void glFramebufferTexture (GLenum target, GLenum attachment, GLuint texture, GLint level);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLuint index, GLint64 *data) PFNGLGETINTEGER64I_VPROC;
alias void function (GLenum target, GLenum pname, GLint64 *params) PFNGLGETBUFFERPARAMETERI64VPROC;
alias void function (GLenum target, GLenum attachment, GLuint texture, GLint level) PFNGLFRAMEBUFFERTEXTUREPROC;
}

version (GL_VERSION_3_3) {} else {
/* OpenGL 3.3 also reuses entry points from these extensions: */
/* ARB_blend_func_extended */
/* ARB_sampler_objects */
/* ARB_explicit_attrib_location, but it has none */
/* ARB_occlusion_query2 (no entry points) */
/* ARB_shader_bit_encoding (no entry points) */
/* ARB_texture_rgb10_a2ui (no entry points) */
/* ARB_texture_swizzle (no entry points) */
/* ARB_timer_query */
/* ARB_vertex_type_2_10_10_10_rev */
version (GL_GLEXT_PROTOTYPES) {
void glVertexAttribDivisor (GLuint index, GLuint divisor);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint index, GLuint divisor) PFNGLVERTEXATTRIBDIVISORPROC;
}

version (GL_VERSION_4_0) {} else {
/* OpenGL 4.0 also reuses entry points from these extensions: */
/* ARB_texture_query_lod (no entry points) */
/* ARB_draw_indirect */
/* ARB_gpu_shader5 (no entry points) */
/* ARB_gpu_shader_fp64 */
/* ARB_shader_subroutine */
/* ARB_tessellation_shader */
/* ARB_texture_buffer_object_rgb32 (no entry points) */
/* ARB_texture_cube_map_array (no entry points) */
/* ARB_texture_gather (no entry points) */
/* ARB_transform_feedback2 */
/* ARB_transform_feedback3 */
version (GL_GLEXT_PROTOTYPES) {
void glMinSampleShading (GLfloat value);
void glBlendEquationi (GLuint buf, GLenum mode);
void glBlendEquationSeparatei (GLuint buf, GLenum modeRGB, GLenum modeAlpha);
void glBlendFunci (GLuint buf, GLenum src, GLenum dst);
void glBlendFuncSeparatei (GLuint buf, GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLfloat value) PFNGLMINSAMPLESHADINGPROC;
alias void function (GLuint buf, GLenum mode) PFNGLBLENDEQUATIONIPROC;
alias void function (GLuint buf, GLenum modeRGB, GLenum modeAlpha) PFNGLBLENDEQUATIONSEPARATEIPROC;
alias void function (GLuint buf, GLenum src, GLenum dst) PFNGLBLENDFUNCIPROC;
alias void function (GLuint buf, GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha) PFNGLBLENDFUNCSEPARATEIPROC;
}

version (GL_VERSION_4_1) {} else {
/* OpenGL 4.1 reuses entry points from these extensions: */
/* ARB_ES2_compatibility */
/* ARB_get_program_binary */
/* ARB_separate_shader_objects */
/* ARB_shader_precision (no entry points) */
/* ARB_vertex_attrib_64bit */
/* ARB_viewport_array */
}

version (GL_VERSION_4_2) {} else {
/* OpenGL 4.2 reuses entry points from these extensions: */
/* ARB_base_instance */
/* ARB_shading_language_420pack (no entry points) */
/* ARB_transform_feedback_instanced */
/* ARB_compressed_texture_pixel_storage (no entry points) */
/* ARB_conservative_depth (no entry points) */
/* ARB_internalformat_query */
/* ARB_map_buffer_alignment (no entry points) */
/* ARB_shader_atomic_counters */
/* ARB_shader_image_load_store */
/* ARB_shading_language_packing (no entry points) */
/* ARB_texture_storage */
}

version (GL_VERSION_4_3) {} else {
/* OpenGL 4.3 reuses entry points from these extensions: */
/* ARB_arrays_of_arrays (no entry points, GLSL only) */
/* ARB_fragment_layer_viewport (no entry points, GLSL only) */
/* ARB_shader_image_size (no entry points, GLSL only) */
/* ARB_ES3_compatibility (no entry points) */
/* ARB_clear_buffer_object */
/* ARB_compute_shader */
/* ARB_copy_image */
/* KHR_debug (includes ARB_debug_output commands promoted to KHR without suffixes) */
/* ARB_explicit_uniform_location (no entry points) */
/* ARB_framebuffer_no_attachments */
/* ARB_internalformat_query2 */
/* ARB_invalidate_subdata */
/* ARB_multi_draw_indirect */
/* ARB_program_interface_query */
/* ARB_robust_buffer_access_behavior (no entry points) */
/* ARB_shader_storage_buffer_object */
/* ARB_stencil_texturing (no entry points) */
/* ARB_texture_buffer_range */
/* ARB_texture_query_levels (no entry points) */
/* ARB_texture_storage_multisample */
/* ARB_texture_view */
/* ARB_vertex_attrib_binding */
}

version (GL_ARB_multitexture) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glActiveTextureARB (GLenum texture);
void glClientActiveTextureARB (GLenum texture);
void glMultiTexCoord1dARB (GLenum target, GLdouble s);
void glMultiTexCoord1dvARB (GLenum target, const(GLdouble)*v);
void glMultiTexCoord1fARB (GLenum target, GLfloat s);
void glMultiTexCoord1fvARB (GLenum target, const(GLfloat)*v);
void glMultiTexCoord1iARB (GLenum target, GLint s);
void glMultiTexCoord1ivARB (GLenum target, const(GLint)*v);
void glMultiTexCoord1sARB (GLenum target, GLshort s);
void glMultiTexCoord1svARB (GLenum target, const(GLshort)*v);
void glMultiTexCoord2dARB (GLenum target, GLdouble s, GLdouble t);
void glMultiTexCoord2dvARB (GLenum target, const(GLdouble)*v);
void glMultiTexCoord2fARB (GLenum target, GLfloat s, GLfloat t);
void glMultiTexCoord2fvARB (GLenum target, const(GLfloat)*v);
void glMultiTexCoord2iARB (GLenum target, GLint s, GLint t);
void glMultiTexCoord2ivARB (GLenum target, const(GLint)*v);
void glMultiTexCoord2sARB (GLenum target, GLshort s, GLshort t);
void glMultiTexCoord2svARB (GLenum target, const(GLshort)*v);
void glMultiTexCoord3dARB (GLenum target, GLdouble s, GLdouble t, GLdouble r);
void glMultiTexCoord3dvARB (GLenum target, const(GLdouble)*v);
void glMultiTexCoord3fARB (GLenum target, GLfloat s, GLfloat t, GLfloat r);
void glMultiTexCoord3fvARB (GLenum target, const(GLfloat)*v);
void glMultiTexCoord3iARB (GLenum target, GLint s, GLint t, GLint r);
void glMultiTexCoord3ivARB (GLenum target, const(GLint)*v);
void glMultiTexCoord3sARB (GLenum target, GLshort s, GLshort t, GLshort r);
void glMultiTexCoord3svARB (GLenum target, const(GLshort)*v);
void glMultiTexCoord4dARB (GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q);
void glMultiTexCoord4dvARB (GLenum target, const(GLdouble)*v);
void glMultiTexCoord4fARB (GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q);
void glMultiTexCoord4fvARB (GLenum target, const(GLfloat)*v);
void glMultiTexCoord4iARB (GLenum target, GLint s, GLint t, GLint r, GLint q);
void glMultiTexCoord4ivARB (GLenum target, const(GLint)*v);
void glMultiTexCoord4sARB (GLenum target, GLshort s, GLshort t, GLshort r, GLshort q);
void glMultiTexCoord4svARB (GLenum target, const(GLshort)*v);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum texture) PFNGLACTIVETEXTUREARBPROC;
alias void function (GLenum texture) PFNGLCLIENTACTIVETEXTUREARBPROC;
alias void function (GLenum target, GLdouble s) PFNGLMULTITEXCOORD1DARBPROC;
alias void function (GLenum target, const(GLdouble)*v) PFNGLMULTITEXCOORD1DVARBPROC;
alias void function (GLenum target, GLfloat s) PFNGLMULTITEXCOORD1FARBPROC;
alias void function (GLenum target, const(GLfloat)*v) PFNGLMULTITEXCOORD1FVARBPROC;
alias void function (GLenum target, GLint s) PFNGLMULTITEXCOORD1IARBPROC;
alias void function (GLenum target, const(GLint)*v) PFNGLMULTITEXCOORD1IVARBPROC;
alias void function (GLenum target, GLshort s) PFNGLMULTITEXCOORD1SARBPROC;
alias void function (GLenum target, const(GLshort)*v) PFNGLMULTITEXCOORD1SVARBPROC;
alias void function (GLenum target, GLdouble s, GLdouble t) PFNGLMULTITEXCOORD2DARBPROC;
alias void function (GLenum target, const(GLdouble)*v) PFNGLMULTITEXCOORD2DVARBPROC;
alias void function (GLenum target, GLfloat s, GLfloat t) PFNGLMULTITEXCOORD2FARBPROC;
alias void function (GLenum target, const(GLfloat)*v) PFNGLMULTITEXCOORD2FVARBPROC;
alias void function (GLenum target, GLint s, GLint t) PFNGLMULTITEXCOORD2IARBPROC;
alias void function (GLenum target, const(GLint)*v) PFNGLMULTITEXCOORD2IVARBPROC;
alias void function (GLenum target, GLshort s, GLshort t) PFNGLMULTITEXCOORD2SARBPROC;
alias void function (GLenum target, const(GLshort)*v) PFNGLMULTITEXCOORD2SVARBPROC;
alias void function (GLenum target, GLdouble s, GLdouble t, GLdouble r) PFNGLMULTITEXCOORD3DARBPROC;
alias void function (GLenum target, const(GLdouble)*v) PFNGLMULTITEXCOORD3DVARBPROC;
alias void function (GLenum target, GLfloat s, GLfloat t, GLfloat r) PFNGLMULTITEXCOORD3FARBPROC;
alias void function (GLenum target, const(GLfloat)*v) PFNGLMULTITEXCOORD3FVARBPROC;
alias void function (GLenum target, GLint s, GLint t, GLint r) PFNGLMULTITEXCOORD3IARBPROC;
alias void function (GLenum target, const(GLint)*v) PFNGLMULTITEXCOORD3IVARBPROC;
alias void function (GLenum target, GLshort s, GLshort t, GLshort r) PFNGLMULTITEXCOORD3SARBPROC;
alias void function (GLenum target, const(GLshort)*v) PFNGLMULTITEXCOORD3SVARBPROC;
alias void function (GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q) PFNGLMULTITEXCOORD4DARBPROC;
alias void function (GLenum target, const(GLdouble)*v) PFNGLMULTITEXCOORD4DVARBPROC;
alias void function (GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q) PFNGLMULTITEXCOORD4FARBPROC;
alias void function (GLenum target, const(GLfloat)*v) PFNGLMULTITEXCOORD4FVARBPROC;
alias void function (GLenum target, GLint s, GLint t, GLint r, GLint q) PFNGLMULTITEXCOORD4IARBPROC;
alias void function (GLenum target, const(GLint)*v) PFNGLMULTITEXCOORD4IVARBPROC;
alias void function (GLenum target, GLshort s, GLshort t, GLshort r, GLshort q) PFNGLMULTITEXCOORD4SARBPROC;
alias void function (GLenum target, const(GLshort)*v) PFNGLMULTITEXCOORD4SVARBPROC;
}

version (GL_ARB_transpose_matrix) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glLoadTransposeMatrixfARB (const(GLfloat)*m);
void glLoadTransposeMatrixdARB (const(GLdouble)*m);
void glMultTransposeMatrixfARB (const(GLfloat)*m);
void glMultTransposeMatrixdARB (const(GLdouble)*m);
} /* GL_GLEXT_PROTOTYPES */
alias void function (const(GLfloat)*m) PFNGLLOADTRANSPOSEMATRIXFARBPROC;
alias void function (const(GLdouble)*m) PFNGLLOADTRANSPOSEMATRIXDARBPROC;
alias void function (const(GLfloat)*m) PFNGLMULTTRANSPOSEMATRIXFARBPROC;
alias void function (const(GLdouble)*m) PFNGLMULTTRANSPOSEMATRIXDARBPROC;
}

version (GL_ARB_multisample) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glSampleCoverageARB (GLfloat value, GLboolean invert);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLfloat value, GLboolean invert) PFNGLSAMPLECOVERAGEARBPROC;
}

version (GL_ARB_texture_env_add) {} else {
}

version (GL_ARB_texture_cube_map) {} else {
}

version (GL_ARB_texture_compression) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glCompressedTexImage3DARB (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const(GLvoid)*data);
void glCompressedTexImage2DARB (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const(GLvoid)*data);
void glCompressedTexImage1DARB (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const(GLvoid)*data);
void glCompressedTexSubImage3DARB (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const(GLvoid)*data);
void glCompressedTexSubImage2DARB (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const(GLvoid)*data);
void glCompressedTexSubImage1DARB (GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const(GLvoid)*data);
void glGetCompressedTexImageARB (GLenum target, GLint level, GLvoid *img);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const(GLvoid)*data) PFNGLCOMPRESSEDTEXIMAGE3DARBPROC;
alias void function (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const(GLvoid)*data) PFNGLCOMPRESSEDTEXIMAGE2DARBPROC;
alias void function (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const(GLvoid)*data) PFNGLCOMPRESSEDTEXIMAGE1DARBPROC;
alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const(GLvoid)*data) PFNGLCOMPRESSEDTEXSUBIMAGE3DARBPROC;
alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const(GLvoid)*data) PFNGLCOMPRESSEDTEXSUBIMAGE2DARBPROC;
alias void function (GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const(GLvoid)*data) PFNGLCOMPRESSEDTEXSUBIMAGE1DARBPROC;
alias void function (GLenum target, GLint level, GLvoid *img) PFNGLGETCOMPRESSEDTEXIMAGEARBPROC;
}

version (GL_ARB_texture_border_clamp) {} else {
}

version (GL_ARB_point_parameters) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glPointParameterfARB (GLenum pname, GLfloat param);
void glPointParameterfvARB (GLenum pname, const(GLfloat)*params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum pname, GLfloat param) PFNGLPOINTPARAMETERFARBPROC;
alias void function (GLenum pname, const(GLfloat)*params) PFNGLPOINTPARAMETERFVARBPROC;
}

version (GL_ARB_vertex_blend) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glWeightbvARB (GLint size, const(GLbyte)*weights);
void glWeightsvARB (GLint size, const(GLshort)*weights);
void glWeightivARB (GLint size, const(GLint)*weights);
void glWeightfvARB (GLint size, const(GLfloat)*weights);
void glWeightdvARB (GLint size, const(GLdouble)*weights);
void glWeightubvARB (GLint size, const(GLubyte)*weights);
void glWeightusvARB (GLint size, const(GLushort)*weights);
void glWeightuivARB (GLint size, const(GLuint)*weights);
void glWeightPointerARB (GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer);
void glVertexBlendARB (GLint count);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLint size, const(GLbyte)*weights) PFNGLWEIGHTBVARBPROC;
alias void function (GLint size, const(GLshort)*weights) PFNGLWEIGHTSVARBPROC;
alias void function (GLint size, const(GLint)*weights) PFNGLWEIGHTIVARBPROC;
alias void function (GLint size, const(GLfloat)*weights) PFNGLWEIGHTFVARBPROC;
alias void function (GLint size, const(GLdouble)*weights) PFNGLWEIGHTDVARBPROC;
alias void function (GLint size, const(GLubyte)*weights) PFNGLWEIGHTUBVARBPROC;
alias void function (GLint size, const(GLushort)*weights) PFNGLWEIGHTUSVARBPROC;
alias void function (GLint size, const(GLuint)*weights) PFNGLWEIGHTUIVARBPROC;
alias void function (GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer) PFNGLWEIGHTPOINTERARBPROC;
alias void function (GLint count) PFNGLVERTEXBLENDARBPROC;
}

version (GL_ARB_matrix_palette) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glCurrentPaletteMatrixARB (GLint index);
void glMatrixIndexubvARB (GLint size, const(GLubyte)*indices);
void glMatrixIndexusvARB (GLint size, const(GLushort)*indices);
void glMatrixIndexuivARB (GLint size, const(GLuint)*indices);
void glMatrixIndexPointerARB (GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLint index) PFNGLCURRENTPALETTEMATRIXARBPROC;
alias void function (GLint size, const(GLubyte)*indices) PFNGLMATRIXINDEXUBVARBPROC;
alias void function (GLint size, const(GLushort)*indices) PFNGLMATRIXINDEXUSVARBPROC;
alias void function (GLint size, const(GLuint)*indices) PFNGLMATRIXINDEXUIVARBPROC;
alias void function (GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer) PFNGLMATRIXINDEXPOINTERARBPROC;
}

version (GL_ARB_texture_env_combine) {} else {
}

version (GL_ARB_texture_env_crossbar) {} else {
}

version (GL_ARB_texture_env_dot3) {} else {
}

version (GL_ARB_texture_mirrored_repeat) {} else {
}

version (GL_ARB_depth_texture) {} else {
}

version (GL_ARB_shadow) {} else {
}

version (GL_ARB_shadow_ambient) {} else {
}

version (GL_ARB_window_pos) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glWindowPos2dARB (GLdouble x, GLdouble y);
void glWindowPos2dvARB (const(GLdouble)*v);
void glWindowPos2fARB (GLfloat x, GLfloat y);
void glWindowPos2fvARB (const(GLfloat)*v);
void glWindowPos2iARB (GLint x, GLint y);
void glWindowPos2ivARB (const(GLint)*v);
void glWindowPos2sARB (GLshort x, GLshort y);
void glWindowPos2svARB (const(GLshort)*v);
void glWindowPos3dARB (GLdouble x, GLdouble y, GLdouble z);
void glWindowPos3dvARB (const(GLdouble)*v);
void glWindowPos3fARB (GLfloat x, GLfloat y, GLfloat z);
void glWindowPos3fvARB (const(GLfloat)*v);
void glWindowPos3iARB (GLint x, GLint y, GLint z);
void glWindowPos3ivARB (const(GLint)*v);
void glWindowPos3sARB (GLshort x, GLshort y, GLshort z);
void glWindowPos3svARB (const(GLshort)*v);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLdouble x, GLdouble y) PFNGLWINDOWPOS2DARBPROC;
alias void function (const(GLdouble)*v) PFNGLWINDOWPOS2DVARBPROC;
alias void function (GLfloat x, GLfloat y) PFNGLWINDOWPOS2FARBPROC;
alias void function (const(GLfloat)*v) PFNGLWINDOWPOS2FVARBPROC;
alias void function (GLint x, GLint y) PFNGLWINDOWPOS2IARBPROC;
alias void function (const(GLint)*v) PFNGLWINDOWPOS2IVARBPROC;
alias void function (GLshort x, GLshort y) PFNGLWINDOWPOS2SARBPROC;
alias void function (const(GLshort)*v) PFNGLWINDOWPOS2SVARBPROC;
alias void function (GLdouble x, GLdouble y, GLdouble z) PFNGLWINDOWPOS3DARBPROC;
alias void function (const(GLdouble)*v) PFNGLWINDOWPOS3DVARBPROC;
alias void function (GLfloat x, GLfloat y, GLfloat z) PFNGLWINDOWPOS3FARBPROC;
alias void function (const(GLfloat)*v) PFNGLWINDOWPOS3FVARBPROC;
alias void function (GLint x, GLint y, GLint z) PFNGLWINDOWPOS3IARBPROC;
alias void function (const(GLint)*v) PFNGLWINDOWPOS3IVARBPROC;
alias void function (GLshort x, GLshort y, GLshort z) PFNGLWINDOWPOS3SARBPROC;
alias void function (const(GLshort)*v) PFNGLWINDOWPOS3SVARBPROC;
}

version (GL_ARB_vertex_program) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glVertexAttrib1dARB (GLuint index, GLdouble x);
void glVertexAttrib1dvARB (GLuint index, const(GLdouble)*v);
void glVertexAttrib1fARB (GLuint index, GLfloat x);
void glVertexAttrib1fvARB (GLuint index, const(GLfloat)*v);
void glVertexAttrib1sARB (GLuint index, GLshort x);
void glVertexAttrib1svARB (GLuint index, const(GLshort)*v);
void glVertexAttrib2dARB (GLuint index, GLdouble x, GLdouble y);
void glVertexAttrib2dvARB (GLuint index, const(GLdouble)*v);
void glVertexAttrib2fARB (GLuint index, GLfloat x, GLfloat y);
void glVertexAttrib2fvARB (GLuint index, const(GLfloat)*v);
void glVertexAttrib2sARB (GLuint index, GLshort x, GLshort y);
void glVertexAttrib2svARB (GLuint index, const(GLshort)*v);
void glVertexAttrib3dARB (GLuint index, GLdouble x, GLdouble y, GLdouble z);
void glVertexAttrib3dvARB (GLuint index, const(GLdouble)*v);
void glVertexAttrib3fARB (GLuint index, GLfloat x, GLfloat y, GLfloat z);
void glVertexAttrib3fvARB (GLuint index, const(GLfloat)*v);
void glVertexAttrib3sARB (GLuint index, GLshort x, GLshort y, GLshort z);
void glVertexAttrib3svARB (GLuint index, const(GLshort)*v);
void glVertexAttrib4NbvARB (GLuint index, const(GLbyte)*v);
void glVertexAttrib4NivARB (GLuint index, const(GLint)*v);
void glVertexAttrib4NsvARB (GLuint index, const(GLshort)*v);
void glVertexAttrib4NubARB (GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w);
void glVertexAttrib4NubvARB (GLuint index, const(GLubyte)*v);
void glVertexAttrib4NuivARB (GLuint index, const(GLuint)*v);
void glVertexAttrib4NusvARB (GLuint index, const(GLushort)*v);
void glVertexAttrib4bvARB (GLuint index, const(GLbyte)*v);
void glVertexAttrib4dARB (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glVertexAttrib4dvARB (GLuint index, const(GLdouble)*v);
void glVertexAttrib4fARB (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glVertexAttrib4fvARB (GLuint index, const(GLfloat)*v);
void glVertexAttrib4ivARB (GLuint index, const(GLint)*v);
void glVertexAttrib4sARB (GLuint index, GLshort x, GLshort y, GLshort z, GLshort w);
void glVertexAttrib4svARB (GLuint index, const(GLshort)*v);
void glVertexAttrib4ubvARB (GLuint index, const(GLubyte)*v);
void glVertexAttrib4uivARB (GLuint index, const(GLuint)*v);
void glVertexAttrib4usvARB (GLuint index, const(GLushort)*v);
void glVertexAttribPointerARB (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const(GLvoid)*pointer);
void glEnableVertexAttribArrayARB (GLuint index);
void glDisableVertexAttribArrayARB (GLuint index);
void glProgramStringARB (GLenum target, GLenum format, GLsizei len, const(GLvoid)*string_);
void glBindProgramARB (GLenum target, GLuint program);
void glDeleteProgramsARB (GLsizei n, const(GLuint)*programs);
void glGenProgramsARB (GLsizei n, GLuint *programs);
void glProgramEnvParameter4dARB (GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glProgramEnvParameter4dvARB (GLenum target, GLuint index, const(GLdouble)*params);
void glProgramEnvParameter4fARB (GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glProgramEnvParameter4fvARB (GLenum target, GLuint index, const(GLfloat)*params);
void glProgramLocalParameter4dARB (GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glProgramLocalParameter4dvARB (GLenum target, GLuint index, const(GLdouble)*params);
void glProgramLocalParameter4fARB (GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glProgramLocalParameter4fvARB (GLenum target, GLuint index, const(GLfloat)*params);
void glGetProgramEnvParameterdvARB (GLenum target, GLuint index, GLdouble *params);
void glGetProgramEnvParameterfvARB (GLenum target, GLuint index, GLfloat *params);
void glGetProgramLocalParameterdvARB (GLenum target, GLuint index, GLdouble *params);
void glGetProgramLocalParameterfvARB (GLenum target, GLuint index, GLfloat *params);
void glGetProgramivARB (GLenum target, GLenum pname, GLint *params);
void glGetProgramStringARB (GLenum target, GLenum pname, GLvoid *string_);
void glGetVertexAttribdvARB (GLuint index, GLenum pname, GLdouble *params);
void glGetVertexAttribfvARB (GLuint index, GLenum pname, GLfloat *params);
void glGetVertexAttribivARB (GLuint index, GLenum pname, GLint *params);
void glGetVertexAttribPointervARB (GLuint index, GLenum pname, GLvoid* *pointer);
GLboolean glIsProgramARB (GLuint program);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint index, GLdouble x) PFNGLVERTEXATTRIB1DARBPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIB1DVARBPROC;
alias void function (GLuint index, GLfloat x) PFNGLVERTEXATTRIB1FARBPROC;
alias void function (GLuint index, const(GLfloat)*v) PFNGLVERTEXATTRIB1FVARBPROC;
alias void function (GLuint index, GLshort x) PFNGLVERTEXATTRIB1SARBPROC;
alias void function (GLuint index, const(GLshort)*v) PFNGLVERTEXATTRIB1SVARBPROC;
alias void function (GLuint index, GLdouble x, GLdouble y) PFNGLVERTEXATTRIB2DARBPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIB2DVARBPROC;
alias void function (GLuint index, GLfloat x, GLfloat y) PFNGLVERTEXATTRIB2FARBPROC;
alias void function (GLuint index, const(GLfloat)*v) PFNGLVERTEXATTRIB2FVARBPROC;
alias void function (GLuint index, GLshort x, GLshort y) PFNGLVERTEXATTRIB2SARBPROC;
alias void function (GLuint index, const(GLshort)*v) PFNGLVERTEXATTRIB2SVARBPROC;
alias void function (GLuint index, GLdouble x, GLdouble y, GLdouble z) PFNGLVERTEXATTRIB3DARBPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIB3DVARBPROC;
alias void function (GLuint index, GLfloat x, GLfloat y, GLfloat z) PFNGLVERTEXATTRIB3FARBPROC;
alias void function (GLuint index, const(GLfloat)*v) PFNGLVERTEXATTRIB3FVARBPROC;
alias void function (GLuint index, GLshort x, GLshort y, GLshort z) PFNGLVERTEXATTRIB3SARBPROC;
alias void function (GLuint index, const(GLshort)*v) PFNGLVERTEXATTRIB3SVARBPROC;
alias void function (GLuint index, const(GLbyte)*v) PFNGLVERTEXATTRIB4NBVARBPROC;
alias void function (GLuint index, const(GLint)*v) PFNGLVERTEXATTRIB4NIVARBPROC;
alias void function (GLuint index, const(GLshort)*v) PFNGLVERTEXATTRIB4NSVARBPROC;
alias void function (GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w) PFNGLVERTEXATTRIB4NUBARBPROC;
alias void function (GLuint index, const(GLubyte)*v) PFNGLVERTEXATTRIB4NUBVARBPROC;
alias void function (GLuint index, const(GLuint)*v) PFNGLVERTEXATTRIB4NUIVARBPROC;
alias void function (GLuint index, const(GLushort)*v) PFNGLVERTEXATTRIB4NUSVARBPROC;
alias void function (GLuint index, const(GLbyte)*v) PFNGLVERTEXATTRIB4BVARBPROC;
alias void function (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w) PFNGLVERTEXATTRIB4DARBPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIB4DVARBPROC;
alias void function (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w) PFNGLVERTEXATTRIB4FARBPROC;
alias void function (GLuint index, const(GLfloat)*v) PFNGLVERTEXATTRIB4FVARBPROC;
alias void function (GLuint index, const(GLint)*v) PFNGLVERTEXATTRIB4IVARBPROC;
alias void function (GLuint index, GLshort x, GLshort y, GLshort z, GLshort w) PFNGLVERTEXATTRIB4SARBPROC;
alias void function (GLuint index, const(GLshort)*v) PFNGLVERTEXATTRIB4SVARBPROC;
alias void function (GLuint index, const(GLubyte)*v) PFNGLVERTEXATTRIB4UBVARBPROC;
alias void function (GLuint index, const(GLuint)*v) PFNGLVERTEXATTRIB4UIVARBPROC;
alias void function (GLuint index, const(GLushort)*v) PFNGLVERTEXATTRIB4USVARBPROC;
alias void function (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const(GLvoid)*pointer) PFNGLVERTEXATTRIBPOINTERARBPROC;
alias void function (GLuint index) PFNGLENABLEVERTEXATTRIBARRAYARBPROC;
alias void function (GLuint index) PFNGLDISABLEVERTEXATTRIBARRAYARBPROC;
alias void function (GLenum target, GLenum format, GLsizei len, const(GLvoid)*string_) PFNGLPROGRAMSTRINGARBPROC;
alias void function (GLenum target, GLuint program) PFNGLBINDPROGRAMARBPROC;
alias void function (GLsizei n, const(GLuint)*programs) PFNGLDELETEPROGRAMSARBPROC;
alias void function (GLsizei n, GLuint *programs) PFNGLGENPROGRAMSARBPROC;
alias void function (GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w) PFNGLPROGRAMENVPARAMETER4DARBPROC;
alias void function (GLenum target, GLuint index, const(GLdouble)*params) PFNGLPROGRAMENVPARAMETER4DVARBPROC;
alias void function (GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w) PFNGLPROGRAMENVPARAMETER4FARBPROC;
alias void function (GLenum target, GLuint index, const(GLfloat)*params) PFNGLPROGRAMENVPARAMETER4FVARBPROC;
alias void function (GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w) PFNGLPROGRAMLOCALPARAMETER4DARBPROC;
alias void function (GLenum target, GLuint index, const(GLdouble)*params) PFNGLPROGRAMLOCALPARAMETER4DVARBPROC;
alias void function (GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w) PFNGLPROGRAMLOCALPARAMETER4FARBPROC;
alias void function (GLenum target, GLuint index, const(GLfloat)*params) PFNGLPROGRAMLOCALPARAMETER4FVARBPROC;
alias void function (GLenum target, GLuint index, GLdouble *params) PFNGLGETPROGRAMENVPARAMETERDVARBPROC;
alias void function (GLenum target, GLuint index, GLfloat *params) PFNGLGETPROGRAMENVPARAMETERFVARBPROC;
alias void function (GLenum target, GLuint index, GLdouble *params) PFNGLGETPROGRAMLOCALPARAMETERDVARBPROC;
alias void function (GLenum target, GLuint index, GLfloat *params) PFNGLGETPROGRAMLOCALPARAMETERFVARBPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETPROGRAMIVARBPROC;
alias void function (GLenum target, GLenum pname, GLvoid *string_) PFNGLGETPROGRAMSTRINGARBPROC;
alias void function (GLuint index, GLenum pname, GLdouble *params) PFNGLGETVERTEXATTRIBDVARBPROC;
alias void function (GLuint index, GLenum pname, GLfloat *params) PFNGLGETVERTEXATTRIBFVARBPROC;
alias void function (GLuint index, GLenum pname, GLint *params) PFNGLGETVERTEXATTRIBIVARBPROC;
alias void function (GLuint index, GLenum pname, GLvoid* *pointer) PFNGLGETVERTEXATTRIBPOINTERVARBPROC;
alias GLboolean function (GLuint program) PFNGLISPROGRAMARBPROC;
}

version (GL_ARB_fragment_program) {} else {
/* All ARB_fragment_program entry points are shared with ARB_vertex_program. */
}

version (GL_ARB_vertex_buffer_object) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBindBufferARB (GLenum target, GLuint buffer);
void glDeleteBuffersARB (GLsizei n, const(GLuint)*buffers);
void glGenBuffersARB (GLsizei n, GLuint *buffers);
GLboolean glIsBufferARB (GLuint buffer);
void glBufferDataARB (GLenum target, GLsizeiptrARB size, const(GLvoid)*data, GLenum usage);
void glBufferSubDataARB (GLenum target, GLintptrARB offset, GLsizeiptrARB size, const(GLvoid)*data);
void glGetBufferSubDataARB (GLenum target, GLintptrARB offset, GLsizeiptrARB size, GLvoid *data);
GLvoid* glMapBufferARB (GLenum target, GLenum access);
GLboolean glUnmapBufferARB (GLenum target);
void glGetBufferParameterivARB (GLenum target, GLenum pname, GLint *params);
void glGetBufferPointervARB (GLenum target, GLenum pname, GLvoid* *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLuint buffer) PFNGLBINDBUFFERARBPROC;
alias void function (GLsizei n, const(GLuint)*buffers) PFNGLDELETEBUFFERSARBPROC;
alias void function (GLsizei n, GLuint *buffers) PFNGLGENBUFFERSARBPROC;
alias GLboolean function (GLuint buffer) PFNGLISBUFFERARBPROC;
alias void function (GLenum target, GLsizeiptrARB size, const(GLvoid)*data, GLenum usage) PFNGLBUFFERDATAARBPROC;
alias void function (GLenum target, GLintptrARB offset, GLsizeiptrARB size, const(GLvoid)*data) PFNGLBUFFERSUBDATAARBPROC;
alias void function (GLenum target, GLintptrARB offset, GLsizeiptrARB size, GLvoid *data) PFNGLGETBUFFERSUBDATAARBPROC;
alias GLvoid* function (GLenum target, GLenum access) PFNGLMAPBUFFERARBPROC;
alias GLboolean function (GLenum target) PFNGLUNMAPBUFFERARBPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETBUFFERPARAMETERIVARBPROC;
alias void function (GLenum target, GLenum pname, GLvoid* *params) PFNGLGETBUFFERPOINTERVARBPROC;
}

version (GL_ARB_occlusion_query) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGenQueriesARB (GLsizei n, GLuint *ids);
void glDeleteQueriesARB (GLsizei n, const(GLuint)*ids);
GLboolean glIsQueryARB (GLuint id);
void glBeginQueryARB (GLenum target, GLuint id);
void glEndQueryARB (GLenum target);
void glGetQueryivARB (GLenum target, GLenum pname, GLint *params);
void glGetQueryObjectivARB (GLuint id, GLenum pname, GLint *params);
void glGetQueryObjectuivARB (GLuint id, GLenum pname, GLuint *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLsizei n, GLuint *ids) PFNGLGENQUERIESARBPROC;
alias void function (GLsizei n, const(GLuint)*ids) PFNGLDELETEQUERIESARBPROC;
alias GLboolean function (GLuint id) PFNGLISQUERYARBPROC;
alias void function (GLenum target, GLuint id) PFNGLBEGINQUERYARBPROC;
alias void function (GLenum target) PFNGLENDQUERYARBPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETQUERYIVARBPROC;
alias void function (GLuint id, GLenum pname, GLint *params) PFNGLGETQUERYOBJECTIVARBPROC;
alias void function (GLuint id, GLenum pname, GLuint *params) PFNGLGETQUERYOBJECTUIVARBPROC;
}

version (GL_ARB_shader_objects) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDeleteObjectARB (GLhandleARB obj);
GLhandleARB glGetHandleARB (GLenum pname);
void glDetachObjectARB (GLhandleARB containerObj, GLhandleARB attachedObj);
GLhandleARB glCreateShaderObjectARB (GLenum shaderType);
void glShaderSourceARB (GLhandleARB shaderObj, GLsizei count, const(GLcharARB)* *string_, const(GLint)*length);
void glCompileShaderARB (GLhandleARB shaderObj);
GLhandleARB glCreateProgramObjectARB ();
void glAttachObjectARB (GLhandleARB containerObj, GLhandleARB obj);
void glLinkProgramARB (GLhandleARB programObj);
void glUseProgramObjectARB (GLhandleARB programObj);
void glValidateProgramARB (GLhandleARB programObj);
void glUniform1fARB (GLint location, GLfloat v0);
void glUniform2fARB (GLint location, GLfloat v0, GLfloat v1);
void glUniform3fARB (GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
void glUniform4fARB (GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
void glUniform1iARB (GLint location, GLint v0);
void glUniform2iARB (GLint location, GLint v0, GLint v1);
void glUniform3iARB (GLint location, GLint v0, GLint v1, GLint v2);
void glUniform4iARB (GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
void glUniform1fvARB (GLint location, GLsizei count, const(GLfloat)*value);
void glUniform2fvARB (GLint location, GLsizei count, const(GLfloat)*value);
void glUniform3fvARB (GLint location, GLsizei count, const(GLfloat)*value);
void glUniform4fvARB (GLint location, GLsizei count, const(GLfloat)*value);
void glUniform1ivARB (GLint location, GLsizei count, const(GLint)*value);
void glUniform2ivARB (GLint location, GLsizei count, const(GLint)*value);
void glUniform3ivARB (GLint location, GLsizei count, const(GLint)*value);
void glUniform4ivARB (GLint location, GLsizei count, const(GLint)*value);
void glUniformMatrix2fvARB (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glUniformMatrix3fvARB (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glUniformMatrix4fvARB (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glGetObjectParameterfvARB (GLhandleARB obj, GLenum pname, GLfloat *params);
void glGetObjectParameterivARB (GLhandleARB obj, GLenum pname, GLint *params);
void glGetInfoLogARB (GLhandleARB obj, GLsizei maxLength, GLsizei *length, GLcharARB *infoLog);
void glGetAttachedObjectsARB (GLhandleARB containerObj, GLsizei maxCount, GLsizei *count, GLhandleARB *obj);
GLint glGetUniformLocationARB (GLhandleARB programObj, const(GLcharARB)*name);
void glGetActiveUniformARB (GLhandleARB programObj, GLuint index, GLsizei maxLength, GLsizei *length, GLint *size, GLenum *type, GLcharARB *name);
void glGetUniformfvARB (GLhandleARB programObj, GLint location, GLfloat *params);
void glGetUniformivARB (GLhandleARB programObj, GLint location, GLint *params);
void glGetShaderSourceARB (GLhandleARB obj, GLsizei maxLength, GLsizei *length, GLcharARB *source);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLhandleARB obj) PFNGLDELETEOBJECTARBPROC;
alias GLhandleARB function (GLenum pname) PFNGLGETHANDLEARBPROC;
alias void function (GLhandleARB containerObj, GLhandleARB attachedObj) PFNGLDETACHOBJECTARBPROC;
alias GLhandleARB function (GLenum shaderType) PFNGLCREATESHADEROBJECTARBPROC;
alias void function (GLhandleARB shaderObj, GLsizei count, const(GLcharARB)* *string_, const(GLint)*length) PFNGLSHADERSOURCEARBPROC;
alias void function (GLhandleARB shaderObj) PFNGLCOMPILESHADERARBPROC;
alias GLhandleARB function () PFNGLCREATEPROGRAMOBJECTARBPROC;
alias void function (GLhandleARB containerObj, GLhandleARB obj) PFNGLATTACHOBJECTARBPROC;
alias void function (GLhandleARB programObj) PFNGLLINKPROGRAMARBPROC;
alias void function (GLhandleARB programObj) PFNGLUSEPROGRAMOBJECTARBPROC;
alias void function (GLhandleARB programObj) PFNGLVALIDATEPROGRAMARBPROC;
alias void function (GLint location, GLfloat v0) PFNGLUNIFORM1FARBPROC;
alias void function (GLint location, GLfloat v0, GLfloat v1) PFNGLUNIFORM2FARBPROC;
alias void function (GLint location, GLfloat v0, GLfloat v1, GLfloat v2) PFNGLUNIFORM3FARBPROC;
alias void function (GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3) PFNGLUNIFORM4FARBPROC;
alias void function (GLint location, GLint v0) PFNGLUNIFORM1IARBPROC;
alias void function (GLint location, GLint v0, GLint v1) PFNGLUNIFORM2IARBPROC;
alias void function (GLint location, GLint v0, GLint v1, GLint v2) PFNGLUNIFORM3IARBPROC;
alias void function (GLint location, GLint v0, GLint v1, GLint v2, GLint v3) PFNGLUNIFORM4IARBPROC;
alias void function (GLint location, GLsizei count, const(GLfloat)*value) PFNGLUNIFORM1FVARBPROC;
alias void function (GLint location, GLsizei count, const(GLfloat)*value) PFNGLUNIFORM2FVARBPROC;
alias void function (GLint location, GLsizei count, const(GLfloat)*value) PFNGLUNIFORM3FVARBPROC;
alias void function (GLint location, GLsizei count, const(GLfloat)*value) PFNGLUNIFORM4FVARBPROC;
alias void function (GLint location, GLsizei count, const(GLint)*value) PFNGLUNIFORM1IVARBPROC;
alias void function (GLint location, GLsizei count, const(GLint)*value) PFNGLUNIFORM2IVARBPROC;
alias void function (GLint location, GLsizei count, const(GLint)*value) PFNGLUNIFORM3IVARBPROC;
alias void function (GLint location, GLsizei count, const(GLint)*value) PFNGLUNIFORM4IVARBPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLUNIFORMMATRIX2FVARBPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLUNIFORMMATRIX3FVARBPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLUNIFORMMATRIX4FVARBPROC;
alias void function (GLhandleARB obj, GLenum pname, GLfloat *params) PFNGLGETOBJECTPARAMETERFVARBPROC;
alias void function (GLhandleARB obj, GLenum pname, GLint *params) PFNGLGETOBJECTPARAMETERIVARBPROC;
alias void function (GLhandleARB obj, GLsizei maxLength, GLsizei *length, GLcharARB *infoLog) PFNGLGETINFOLOGARBPROC;
alias void function (GLhandleARB containerObj, GLsizei maxCount, GLsizei *count, GLhandleARB *obj) PFNGLGETATTACHEDOBJECTSARBPROC;
alias GLint function (GLhandleARB programObj, const(GLcharARB)*name) PFNGLGETUNIFORMLOCATIONARBPROC;
alias void function (GLhandleARB programObj, GLuint index, GLsizei maxLength, GLsizei *length, GLint *size, GLenum *type, GLcharARB *name) PFNGLGETACTIVEUNIFORMARBPROC;
alias void function (GLhandleARB programObj, GLint location, GLfloat *params) PFNGLGETUNIFORMFVARBPROC;
alias void function (GLhandleARB programObj, GLint location, GLint *params) PFNGLGETUNIFORMIVARBPROC;
alias void function (GLhandleARB obj, GLsizei maxLength, GLsizei *length, GLcharARB *source) PFNGLGETSHADERSOURCEARBPROC;
}

version (GL_ARB_vertex_shader) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBindAttribLocationARB (GLhandleARB programObj, GLuint index, const(GLcharARB)*name);
void glGetActiveAttribARB (GLhandleARB programObj, GLuint index, GLsizei maxLength, GLsizei *length, GLint *size, GLenum *type, GLcharARB *name);
GLint glGetAttribLocationARB (GLhandleARB programObj, const(GLcharARB)*name);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLhandleARB programObj, GLuint index, const(GLcharARB)*name) PFNGLBINDATTRIBLOCATIONARBPROC;
alias void function (GLhandleARB programObj, GLuint index, GLsizei maxLength, GLsizei *length, GLint *size, GLenum *type, GLcharARB *name) PFNGLGETACTIVEATTRIBARBPROC;
alias GLint function (GLhandleARB programObj, const(GLcharARB)*name) PFNGLGETATTRIBLOCATIONARBPROC;
}

version (GL_ARB_fragment_shader) {} else {
}

version (GL_ARB_shading_language_100) {} else {
}

version (GL_ARB_texture_non_power_of_two) {} else {
}

version (GL_ARB_point_sprite) {} else {
}

version (GL_ARB_fragment_program_shadow) {} else {
}

version (GL_ARB_draw_buffers) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDrawBuffersARB (GLsizei n, const(GLenum)*bufs);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLsizei n, const(GLenum)*bufs) PFNGLDRAWBUFFERSARBPROC;
}

version (GL_ARB_texture_rectangle) {} else {
}

version (GL_ARB_color_buffer_float) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glClampColorARB (GLenum target, GLenum clamp);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum clamp) PFNGLCLAMPCOLORARBPROC;
}

version (GL_ARB_half_float_pixel) {} else {
}

version (GL_ARB_texture_float) {} else {
}

version (GL_ARB_pixel_buffer_object) {} else {
}

version (GL_ARB_depth_buffer_float) {} else {
}

version (GL_ARB_draw_instanced) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDrawArraysInstancedARB (GLenum mode, GLint first, GLsizei count, GLsizei primcount);
void glDrawElementsInstancedARB (GLenum mode, GLsizei count, GLenum type, const(GLvoid)*indices, GLsizei primcount);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode, GLint first, GLsizei count, GLsizei primcount) PFNGLDRAWARRAYSINSTANCEDARBPROC;
alias void function (GLenum mode, GLsizei count, GLenum type, const(GLvoid)*indices, GLsizei primcount) PFNGLDRAWELEMENTSINSTANCEDARBPROC;
}

version (GL_ARB_framebuffer_object) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLboolean glIsRenderbuffer (GLuint renderbuffer);
void glBindRenderbuffer (GLenum target, GLuint renderbuffer);
void glDeleteRenderbuffers (GLsizei n, const(GLuint)*renderbuffers);
void glGenRenderbuffers (GLsizei n, GLuint *renderbuffers);
void glRenderbufferStorage (GLenum target, GLenum internalformat, GLsizei width, GLsizei height);
void glGetRenderbufferParameteriv (GLenum target, GLenum pname, GLint *params);
GLboolean glIsFramebuffer (GLuint framebuffer);
void glBindFramebuffer (GLenum target, GLuint framebuffer);
void glDeleteFramebuffers (GLsizei n, const(GLuint)*framebuffers);
void glGenFramebuffers (GLsizei n, GLuint *framebuffers);
GLenum glCheckFramebufferStatus (GLenum target);
void glFramebufferTexture1D (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
void glFramebufferTexture2D (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
void glFramebufferTexture3D (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset);
void glFramebufferRenderbuffer (GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer);
void glGetFramebufferAttachmentParameteriv (GLenum target, GLenum attachment, GLenum pname, GLint *params);
void glGenerateMipmap (GLenum target);
void glBlitFramebuffer (GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter);
void glRenderbufferStorageMultisample (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
void glFramebufferTextureLayer (GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer);
} /* GL_GLEXT_PROTOTYPES */
alias GLboolean function (GLuint renderbuffer) PFNGLISRENDERBUFFERPROC;
alias void function (GLenum target, GLuint renderbuffer) PFNGLBINDRENDERBUFFERPROC;
alias void function (GLsizei n, const(GLuint)*renderbuffers) PFNGLDELETERENDERBUFFERSPROC;
alias void function (GLsizei n, GLuint *renderbuffers) PFNGLGENRENDERBUFFERSPROC;
alias void function (GLenum target, GLenum internalformat, GLsizei width, GLsizei height) PFNGLRENDERBUFFERSTORAGEPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETRENDERBUFFERPARAMETERIVPROC;
alias GLboolean function (GLuint framebuffer) PFNGLISFRAMEBUFFERPROC;
alias void function (GLenum target, GLuint framebuffer) PFNGLBINDFRAMEBUFFERPROC;
alias void function (GLsizei n, const(GLuint)*framebuffers) PFNGLDELETEFRAMEBUFFERSPROC;
alias void function (GLsizei n, GLuint *framebuffers) PFNGLGENFRAMEBUFFERSPROC;
alias GLenum function (GLenum target) PFNGLCHECKFRAMEBUFFERSTATUSPROC;
alias void function (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level) PFNGLFRAMEBUFFERTEXTURE1DPROC;
alias void function (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level) PFNGLFRAMEBUFFERTEXTURE2DPROC;
alias void function (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset) PFNGLFRAMEBUFFERTEXTURE3DPROC;
alias void function (GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer) PFNGLFRAMEBUFFERRENDERBUFFERPROC;
alias void function (GLenum target, GLenum attachment, GLenum pname, GLint *params) PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC;
alias void function (GLenum target) PFNGLGENERATEMIPMAPPROC;
alias void function (GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter) PFNGLBLITFRAMEBUFFERPROC;
alias void function (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height) PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC;
alias void function (GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer) PFNGLFRAMEBUFFERTEXTURELAYERPROC;
}

version (GL_ARB_framebuffer_sRGB) {} else {
}

version (GL_ARB_geometry_shader4) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glProgramParameteriARB (GLuint program, GLenum pname, GLint value);
void glFramebufferTextureARB (GLenum target, GLenum attachment, GLuint texture, GLint level);
void glFramebufferTextureLayerARB (GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer);
void glFramebufferTextureFaceARB (GLenum target, GLenum attachment, GLuint texture, GLint level, GLenum face);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint program, GLenum pname, GLint value) PFNGLPROGRAMPARAMETERIARBPROC;
alias void function (GLenum target, GLenum attachment, GLuint texture, GLint level) PFNGLFRAMEBUFFERTEXTUREARBPROC;
alias void function (GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer) PFNGLFRAMEBUFFERTEXTURELAYERARBPROC;
alias void function (GLenum target, GLenum attachment, GLuint texture, GLint level, GLenum face) PFNGLFRAMEBUFFERTEXTUREFACEARBPROC;
}

version (GL_ARB_half_float_vertex) {} else {
}

version (GL_ARB_instanced_arrays) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glVertexAttribDivisorARB (GLuint index, GLuint divisor);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint index, GLuint divisor) PFNGLVERTEXATTRIBDIVISORARBPROC;
}

version (GL_ARB_map_buffer_range) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLvoid* glMapBufferRange (GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access);
void glFlushMappedBufferRange (GLenum target, GLintptr offset, GLsizeiptr length);
} /* GL_GLEXT_PROTOTYPES */
alias GLvoid* function (GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access) PFNGLMAPBUFFERRANGEPROC;
alias void function (GLenum target, GLintptr offset, GLsizeiptr length) PFNGLFLUSHMAPPEDBUFFERRANGEPROC;
}

version (GL_ARB_texture_buffer_object) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTexBufferARB (GLenum target, GLenum internalformat, GLuint buffer);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum internalformat, GLuint buffer) PFNGLTEXBUFFERARBPROC;
}

version (GL_ARB_texture_compression_rgtc) {} else {
}

version (GL_ARB_texture_rg) {} else {
}

version (GL_ARB_vertex_array_object) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBindVertexArray (GLuint array);
void glDeleteVertexArrays (GLsizei n, const(GLuint)*arrays);
void glGenVertexArrays (GLsizei n, GLuint *arrays);
GLboolean glIsVertexArray (GLuint array);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint array) PFNGLBINDVERTEXARRAYPROC;
alias void function (GLsizei n, const(GLuint)*arrays) PFNGLDELETEVERTEXARRAYSPROC;
alias void function (GLsizei n, GLuint *arrays) PFNGLGENVERTEXARRAYSPROC;
alias GLboolean function (GLuint array) PFNGLISVERTEXARRAYPROC;
}

version (GL_ARB_uniform_buffer_object) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGetUniformIndices (GLuint program, GLsizei uniformCount, const(GLchar*)*uniformNames, GLuint *uniformIndices);
void glGetActiveUniformsiv (GLuint program, GLsizei uniformCount, const(GLuint)*uniformIndices, GLenum pname, GLint *params);
void glGetActiveUniformName (GLuint program, GLuint uniformIndex, GLsizei bufSize, GLsizei *length, GLchar *uniformName);
GLuint glGetUniformBlockIndex (GLuint program, const(GLchar)*uniformBlockName);
void glGetActiveUniformBlockiv (GLuint program, GLuint uniformBlockIndex, GLenum pname, GLint *params);
void glGetActiveUniformBlockName (GLuint program, GLuint uniformBlockIndex, GLsizei bufSize, GLsizei *length, GLchar *uniformBlockName);
void glUniformBlockBinding (GLuint program, GLuint uniformBlockIndex, GLuint uniformBlockBinding);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint program, GLsizei uniformCount, const(GLchar*)*uniformNames, GLuint *uniformIndices) PFNGLGETUNIFORMINDICESPROC;
alias void function (GLuint program, GLsizei uniformCount, const(GLuint)*uniformIndices, GLenum pname, GLint *params) PFNGLGETACTIVEUNIFORMSIVPROC;
alias void function (GLuint program, GLuint uniformIndex, GLsizei bufSize, GLsizei *length, GLchar *uniformName) PFNGLGETACTIVEUNIFORMNAMEPROC;
alias GLuint function (GLuint program, const(GLchar)*uniformBlockName) PFNGLGETUNIFORMBLOCKINDEXPROC;
alias void function (GLuint program, GLuint uniformBlockIndex, GLenum pname, GLint *params) PFNGLGETACTIVEUNIFORMBLOCKIVPROC;
alias void function (GLuint program, GLuint uniformBlockIndex, GLsizei bufSize, GLsizei *length, GLchar *uniformBlockName) PFNGLGETACTIVEUNIFORMBLOCKNAMEPROC;
alias void function (GLuint program, GLuint uniformBlockIndex, GLuint uniformBlockBinding) PFNGLUNIFORMBLOCKBINDINGPROC;
}

version (GL_ARB_compatibility) {} else {
}

version (GL_ARB_copy_buffer) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glCopyBufferSubData (GLenum readTarget, GLenum writeTarget, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum readTarget, GLenum writeTarget, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size) PFNGLCOPYBUFFERSUBDATAPROC;
}

version (GL_ARB_shader_texture_lod) {} else {
}

version (GL_ARB_depth_clamp) {} else {
}

version (GL_ARB_draw_elements_base_vertex) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDrawElementsBaseVertex (GLenum mode, GLsizei count, GLenum type, const(GLvoid)*indices, GLint basevertex);
void glDrawRangeElementsBaseVertex (GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const(GLvoid)*indices, GLint basevertex);
void glDrawElementsInstancedBaseVertex (GLenum mode, GLsizei count, GLenum type, const(GLvoid)*indices, GLsizei instancecount, GLint basevertex);
void glMultiDrawElementsBaseVertex (GLenum mode, const(GLsizei)*count, GLenum type, const(GLvoid*)*indices, GLsizei drawcount, const(GLint)*basevertex);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode, GLsizei count, GLenum type, const(GLvoid)*indices, GLint basevertex) PFNGLDRAWELEMENTSBASEVERTEXPROC;
alias void function (GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const(GLvoid)*indices, GLint basevertex) PFNGLDRAWRANGEELEMENTSBASEVERTEXPROC;
alias void function (GLenum mode, GLsizei count, GLenum type, const(GLvoid)*indices, GLsizei instancecount, GLint basevertex) PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXPROC;
alias void function (GLenum mode, const(GLsizei)*count, GLenum type, const(GLvoid*)*indices, GLsizei drawcount, const(GLint)*basevertex) PFNGLMULTIDRAWELEMENTSBASEVERTEXPROC;
}

version (GL_ARB_fragment_coord_conventions) {} else {
}

version (GL_ARB_provoking_vertex) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glProvokingVertex (GLenum mode);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode) PFNGLPROVOKINGVERTEXPROC;
}

version (GL_ARB_seamless_cube_map) {} else {
}

version (GL_ARB_sync) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLsync glFenceSync (GLenum condition, GLbitfield flags);
GLboolean glIsSync (GLsync sync);
void glDeleteSync (GLsync sync);
GLenum glClientWaitSync (GLsync sync, GLbitfield flags, GLuint64 timeout);
void glWaitSync (GLsync sync, GLbitfield flags, GLuint64 timeout);
void glGetInteger64v (GLenum pname, GLint64 *params);
void glGetSynciv (GLsync sync, GLenum pname, GLsizei bufSize, GLsizei *length, GLint *values);
} /* GL_GLEXT_PROTOTYPES */
alias GLsync function (GLenum condition, GLbitfield flags) PFNGLFENCESYNCPROC;
alias GLboolean function (GLsync sync) PFNGLISSYNCPROC;
alias void function (GLsync sync) PFNGLDELETESYNCPROC;
alias GLenum function (GLsync sync, GLbitfield flags, GLuint64 timeout) PFNGLCLIENTWAITSYNCPROC;
alias void function (GLsync sync, GLbitfield flags, GLuint64 timeout) PFNGLWAITSYNCPROC;
alias void function (GLenum pname, GLint64 *params) PFNGLGETINTEGER64VPROC;
alias void function (GLsync sync, GLenum pname, GLsizei bufSize, GLsizei *length, GLint *values) PFNGLGETSYNCIVPROC;
}

version (GL_ARB_texture_multisample) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTexImage2DMultisample (GLenum target, GLsizei samples, GLint internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations);
void glTexImage3DMultisample (GLenum target, GLsizei samples, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations);
void glGetMultisamplefv (GLenum pname, GLuint index, GLfloat *val);
void glSampleMaski (GLuint index, GLbitfield mask);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLsizei samples, GLint internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations) PFNGLTEXIMAGE2DMULTISAMPLEPROC;
alias void function (GLenum target, GLsizei samples, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations) PFNGLTEXIMAGE3DMULTISAMPLEPROC;
alias void function (GLenum pname, GLuint index, GLfloat *val) PFNGLGETMULTISAMPLEFVPROC;
alias void function (GLuint index, GLbitfield mask) PFNGLSAMPLEMASKIPROC;
}

version (GL_ARB_vertex_array_bgra) {} else {
}

version (GL_ARB_draw_buffers_blend) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBlendEquationiARB (GLuint buf, GLenum mode);
void glBlendEquationSeparateiARB (GLuint buf, GLenum modeRGB, GLenum modeAlpha);
void glBlendFunciARB (GLuint buf, GLenum src, GLenum dst);
void glBlendFuncSeparateiARB (GLuint buf, GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint buf, GLenum mode) PFNGLBLENDEQUATIONIARBPROC;
alias void function (GLuint buf, GLenum modeRGB, GLenum modeAlpha) PFNGLBLENDEQUATIONSEPARATEIARBPROC;
alias void function (GLuint buf, GLenum src, GLenum dst) PFNGLBLENDFUNCIARBPROC;
alias void function (GLuint buf, GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha) PFNGLBLENDFUNCSEPARATEIARBPROC;
}

version (GL_ARB_sample_shading) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glMinSampleShadingARB (GLfloat value);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLfloat value) PFNGLMINSAMPLESHADINGARBPROC;
}

version (GL_ARB_texture_cube_map_array) {} else {
}

version (GL_ARB_texture_gather) {} else {
}

version (GL_ARB_texture_query_lod) {} else {
}

version (GL_ARB_shading_language_include) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glNamedStringARB (GLenum type, GLint namelen, const(GLchar)*name, GLint stringlen, const(GLchar)*string_);
void glDeleteNamedStringARB (GLint namelen, const(GLchar)*name);
void glCompileShaderIncludeARB (GLuint shader, GLsizei count, const(GLchar)* *path, const(GLint)*length);
GLboolean glIsNamedStringARB (GLint namelen, const(GLchar)*name);
void glGetNamedStringARB (GLint namelen, const(GLchar)*name, GLsizei bufSize, GLint *stringlen, GLchar *string_);
void glGetNamedStringivARB (GLint namelen, const(GLchar)*name, GLenum pname, GLint *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum type, GLint namelen, const(GLchar)*name, GLint stringlen, const(GLchar)*string_) PFNGLNAMEDSTRINGARBPROC;
alias void function (GLint namelen, const(GLchar)*name) PFNGLDELETENAMEDSTRINGARBPROC;
alias void function (GLuint shader, GLsizei count, const(GLchar)* *path, const(GLint)*length) PFNGLCOMPILESHADERINCLUDEARBPROC;
alias GLboolean function (GLint namelen, const(GLchar)*name) PFNGLISNAMEDSTRINGARBPROC;
alias void function (GLint namelen, const(GLchar)*name, GLsizei bufSize, GLint *stringlen, GLchar *string_) PFNGLGETNAMEDSTRINGARBPROC;
alias void function (GLint namelen, const(GLchar)*name, GLenum pname, GLint *params) PFNGLGETNAMEDSTRINGIVARBPROC;
}

version (GL_ARB_texture_compression_bptc) {} else {
}

version (GL_ARB_blend_func_extended) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBindFragDataLocationIndexed (GLuint program, GLuint colorNumber, GLuint index, const(GLchar)*name);
GLint glGetFragDataIndex (GLuint program, const(GLchar)*name);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint program, GLuint colorNumber, GLuint index, const(GLchar)*name) PFNGLBINDFRAGDATALOCATIONINDEXEDPROC;
alias GLint function (GLuint program, const(GLchar)*name) PFNGLGETFRAGDATAINDEXPROC;
}

version (GL_ARB_explicit_attrib_location) {} else {
}

version (GL_ARB_occlusion_query2) {} else {
}

version (GL_ARB_sampler_objects) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGenSamplers (GLsizei count, GLuint *samplers);
void glDeleteSamplers (GLsizei count, const(GLuint)*samplers);
GLboolean glIsSampler (GLuint sampler);
void glBindSampler (GLuint unit, GLuint sampler);
void glSamplerParameteri (GLuint sampler, GLenum pname, GLint param);
void glSamplerParameteriv (GLuint sampler, GLenum pname, const(GLint)*param);
void glSamplerParameterf (GLuint sampler, GLenum pname, GLfloat param);
void glSamplerParameterfv (GLuint sampler, GLenum pname, const(GLfloat)*param);
void glSamplerParameterIiv (GLuint sampler, GLenum pname, const(GLint)*param);
void glSamplerParameterIuiv (GLuint sampler, GLenum pname, const(GLuint)*param);
void glGetSamplerParameteriv (GLuint sampler, GLenum pname, GLint *params);
void glGetSamplerParameterIiv (GLuint sampler, GLenum pname, GLint *params);
void glGetSamplerParameterfv (GLuint sampler, GLenum pname, GLfloat *params);
void glGetSamplerParameterIuiv (GLuint sampler, GLenum pname, GLuint *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLsizei count, GLuint *samplers) PFNGLGENSAMPLERSPROC;
alias void function (GLsizei count, const(GLuint)*samplers) PFNGLDELETESAMPLERSPROC;
alias GLboolean function (GLuint sampler) PFNGLISSAMPLERPROC;
alias void function (GLuint unit, GLuint sampler) PFNGLBINDSAMPLERPROC;
alias void function (GLuint sampler, GLenum pname, GLint param) PFNGLSAMPLERPARAMETERIPROC;
alias void function (GLuint sampler, GLenum pname, const(GLint)*param) PFNGLSAMPLERPARAMETERIVPROC;
alias void function (GLuint sampler, GLenum pname, GLfloat param) PFNGLSAMPLERPARAMETERFPROC;
alias void function (GLuint sampler, GLenum pname, const(GLfloat)*param) PFNGLSAMPLERPARAMETERFVPROC;
alias void function (GLuint sampler, GLenum pname, const(GLint)*param) PFNGLSAMPLERPARAMETERIIVPROC;
alias void function (GLuint sampler, GLenum pname, const(GLuint)*param) PFNGLSAMPLERPARAMETERIUIVPROC;
alias void function (GLuint sampler, GLenum pname, GLint *params) PFNGLGETSAMPLERPARAMETERIVPROC;
alias void function (GLuint sampler, GLenum pname, GLint *params) PFNGLGETSAMPLERPARAMETERIIVPROC;
alias void function (GLuint sampler, GLenum pname, GLfloat *params) PFNGLGETSAMPLERPARAMETERFVPROC;
alias void function (GLuint sampler, GLenum pname, GLuint *params) PFNGLGETSAMPLERPARAMETERIUIVPROC;
}

version (GL_ARB_shader_bit_encoding) {} else {
}

version (GL_ARB_texture_rgb10_a2ui) {} else {
}

version (GL_ARB_texture_swizzle) {} else {
}

version (GL_ARB_timer_query) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glQueryCounter (GLuint id, GLenum target);
void glGetQueryObjecti64v (GLuint id, GLenum pname, GLint64 *params);
void glGetQueryObjectui64v (GLuint id, GLenum pname, GLuint64 *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint id, GLenum target) PFNGLQUERYCOUNTERPROC;
alias void function (GLuint id, GLenum pname, GLint64 *params) PFNGLGETQUERYOBJECTI64VPROC;
alias void function (GLuint id, GLenum pname, GLuint64 *params) PFNGLGETQUERYOBJECTUI64VPROC;
}

version (GL_ARB_vertex_type_2_10_10_10_rev) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glVertexP2ui (GLenum type, GLuint value);
void glVertexP2uiv (GLenum type, const(GLuint)*value);
void glVertexP3ui (GLenum type, GLuint value);
void glVertexP3uiv (GLenum type, const(GLuint)*value);
void glVertexP4ui (GLenum type, GLuint value);
void glVertexP4uiv (GLenum type, const(GLuint)*value);
void glTexCoordP1ui (GLenum type, GLuint coords);
void glTexCoordP1uiv (GLenum type, const(GLuint)*coords);
void glTexCoordP2ui (GLenum type, GLuint coords);
void glTexCoordP2uiv (GLenum type, const(GLuint)*coords);
void glTexCoordP3ui (GLenum type, GLuint coords);
void glTexCoordP3uiv (GLenum type, const(GLuint)*coords);
void glTexCoordP4ui (GLenum type, GLuint coords);
void glTexCoordP4uiv (GLenum type, const(GLuint)*coords);
void glMultiTexCoordP1ui (GLenum texture, GLenum type, GLuint coords);
void glMultiTexCoordP1uiv (GLenum texture, GLenum type, const(GLuint)*coords);
void glMultiTexCoordP2ui (GLenum texture, GLenum type, GLuint coords);
void glMultiTexCoordP2uiv (GLenum texture, GLenum type, const(GLuint)*coords);
void glMultiTexCoordP3ui (GLenum texture, GLenum type, GLuint coords);
void glMultiTexCoordP3uiv (GLenum texture, GLenum type, const(GLuint)*coords);
void glMultiTexCoordP4ui (GLenum texture, GLenum type, GLuint coords);
void glMultiTexCoordP4uiv (GLenum texture, GLenum type, const(GLuint)*coords);
void glNormalP3ui (GLenum type, GLuint coords);
void glNormalP3uiv (GLenum type, const(GLuint)*coords);
void glColorP3ui (GLenum type, GLuint color);
void glColorP3uiv (GLenum type, const(GLuint)*color);
void glColorP4ui (GLenum type, GLuint color);
void glColorP4uiv (GLenum type, const(GLuint)*color);
void glSecondaryColorP3ui (GLenum type, GLuint color);
void glSecondaryColorP3uiv (GLenum type, const(GLuint)*color);
void glVertexAttribP1ui (GLuint index, GLenum type, GLboolean normalized, GLuint value);
void glVertexAttribP1uiv (GLuint index, GLenum type, GLboolean normalized, const(GLuint)*value);
void glVertexAttribP2ui (GLuint index, GLenum type, GLboolean normalized, GLuint value);
void glVertexAttribP2uiv (GLuint index, GLenum type, GLboolean normalized, const(GLuint)*value);
void glVertexAttribP3ui (GLuint index, GLenum type, GLboolean normalized, GLuint value);
void glVertexAttribP3uiv (GLuint index, GLenum type, GLboolean normalized, const(GLuint)*value);
void glVertexAttribP4ui (GLuint index, GLenum type, GLboolean normalized, GLuint value);
void glVertexAttribP4uiv (GLuint index, GLenum type, GLboolean normalized, const(GLuint)*value);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum type, GLuint value) PFNGLVERTEXP2UIPROC;
alias void function (GLenum type, const(GLuint)*value) PFNGLVERTEXP2UIVPROC;
alias void function (GLenum type, GLuint value) PFNGLVERTEXP3UIPROC;
alias void function (GLenum type, const(GLuint)*value) PFNGLVERTEXP3UIVPROC;
alias void function (GLenum type, GLuint value) PFNGLVERTEXP4UIPROC;
alias void function (GLenum type, const(GLuint)*value) PFNGLVERTEXP4UIVPROC;
alias void function (GLenum type, GLuint coords) PFNGLTEXCOORDP1UIPROC;
alias void function (GLenum type, const(GLuint)*coords) PFNGLTEXCOORDP1UIVPROC;
alias void function (GLenum type, GLuint coords) PFNGLTEXCOORDP2UIPROC;
alias void function (GLenum type, const(GLuint)*coords) PFNGLTEXCOORDP2UIVPROC;
alias void function (GLenum type, GLuint coords) PFNGLTEXCOORDP3UIPROC;
alias void function (GLenum type, const(GLuint)*coords) PFNGLTEXCOORDP3UIVPROC;
alias void function (GLenum type, GLuint coords) PFNGLTEXCOORDP4UIPROC;
alias void function (GLenum type, const(GLuint)*coords) PFNGLTEXCOORDP4UIVPROC;
alias void function (GLenum texture, GLenum type, GLuint coords) PFNGLMULTITEXCOORDP1UIPROC;
alias void function (GLenum texture, GLenum type, const(GLuint)*coords) PFNGLMULTITEXCOORDP1UIVPROC;
alias void function (GLenum texture, GLenum type, GLuint coords) PFNGLMULTITEXCOORDP2UIPROC;
alias void function (GLenum texture, GLenum type, const(GLuint)*coords) PFNGLMULTITEXCOORDP2UIVPROC;
alias void function (GLenum texture, GLenum type, GLuint coords) PFNGLMULTITEXCOORDP3UIPROC;
alias void function (GLenum texture, GLenum type, const(GLuint)*coords) PFNGLMULTITEXCOORDP3UIVPROC;
alias void function (GLenum texture, GLenum type, GLuint coords) PFNGLMULTITEXCOORDP4UIPROC;
alias void function (GLenum texture, GLenum type, const(GLuint)*coords) PFNGLMULTITEXCOORDP4UIVPROC;
alias void function (GLenum type, GLuint coords) PFNGLNORMALP3UIPROC;
alias void function (GLenum type, const(GLuint)*coords) PFNGLNORMALP3UIVPROC;
alias void function (GLenum type, GLuint color) PFNGLCOLORP3UIPROC;
alias void function (GLenum type, const(GLuint)*color) PFNGLCOLORP3UIVPROC;
alias void function (GLenum type, GLuint color) PFNGLCOLORP4UIPROC;
alias void function (GLenum type, const(GLuint)*color) PFNGLCOLORP4UIVPROC;
alias void function (GLenum type, GLuint color) PFNGLSECONDARYCOLORP3UIPROC;
alias void function (GLenum type, const(GLuint)*color) PFNGLSECONDARYCOLORP3UIVPROC;
alias void function (GLuint index, GLenum type, GLboolean normalized, GLuint value) PFNGLVERTEXATTRIBP1UIPROC;
alias void function (GLuint index, GLenum type, GLboolean normalized, const(GLuint)*value) PFNGLVERTEXATTRIBP1UIVPROC;
alias void function (GLuint index, GLenum type, GLboolean normalized, GLuint value) PFNGLVERTEXATTRIBP2UIPROC;
alias void function (GLuint index, GLenum type, GLboolean normalized, const(GLuint)*value) PFNGLVERTEXATTRIBP2UIVPROC;
alias void function (GLuint index, GLenum type, GLboolean normalized, GLuint value) PFNGLVERTEXATTRIBP3UIPROC;
alias void function (GLuint index, GLenum type, GLboolean normalized, const(GLuint)*value) PFNGLVERTEXATTRIBP3UIVPROC;
alias void function (GLuint index, GLenum type, GLboolean normalized, GLuint value) PFNGLVERTEXATTRIBP4UIPROC;
alias void function (GLuint index, GLenum type, GLboolean normalized, const(GLuint)*value) PFNGLVERTEXATTRIBP4UIVPROC;
}

version (GL_ARB_draw_indirect) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDrawArraysIndirect (GLenum mode, const(GLvoid)*indirect);
void glDrawElementsIndirect (GLenum mode, GLenum type, const(GLvoid)*indirect);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode, const(GLvoid)*indirect) PFNGLDRAWARRAYSINDIRECTPROC;
alias void function (GLenum mode, GLenum type, const(GLvoid)*indirect) PFNGLDRAWELEMENTSINDIRECTPROC;
}

version (GL_ARB_gpu_shader5) {} else {
}

version (GL_ARB_gpu_shader_fp64) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glUniform1d (GLint location, GLdouble x);
void glUniform2d (GLint location, GLdouble x, GLdouble y);
void glUniform3d (GLint location, GLdouble x, GLdouble y, GLdouble z);
void glUniform4d (GLint location, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glUniform1dv (GLint location, GLsizei count, const(GLdouble)*value);
void glUniform2dv (GLint location, GLsizei count, const(GLdouble)*value);
void glUniform3dv (GLint location, GLsizei count, const(GLdouble)*value);
void glUniform4dv (GLint location, GLsizei count, const(GLdouble)*value);
void glUniformMatrix2dv (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glUniformMatrix3dv (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glUniformMatrix4dv (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glUniformMatrix2x3dv (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glUniformMatrix2x4dv (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glUniformMatrix3x2dv (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glUniformMatrix3x4dv (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glUniformMatrix4x2dv (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glUniformMatrix4x3dv (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glGetUniformdv (GLuint program, GLint location, GLdouble *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLint location, GLdouble x) PFNGLUNIFORM1DPROC;
alias void function (GLint location, GLdouble x, GLdouble y) PFNGLUNIFORM2DPROC;
alias void function (GLint location, GLdouble x, GLdouble y, GLdouble z) PFNGLUNIFORM3DPROC;
alias void function (GLint location, GLdouble x, GLdouble y, GLdouble z, GLdouble w) PFNGLUNIFORM4DPROC;
alias void function (GLint location, GLsizei count, const(GLdouble)*value) PFNGLUNIFORM1DVPROC;
alias void function (GLint location, GLsizei count, const(GLdouble)*value) PFNGLUNIFORM2DVPROC;
alias void function (GLint location, GLsizei count, const(GLdouble)*value) PFNGLUNIFORM3DVPROC;
alias void function (GLint location, GLsizei count, const(GLdouble)*value) PFNGLUNIFORM4DVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLUNIFORMMATRIX2DVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLUNIFORMMATRIX3DVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLUNIFORMMATRIX4DVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLUNIFORMMATRIX2X3DVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLUNIFORMMATRIX2X4DVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLUNIFORMMATRIX3X2DVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLUNIFORMMATRIX3X4DVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLUNIFORMMATRIX4X2DVPROC;
alias void function (GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLUNIFORMMATRIX4X3DVPROC;
alias void function (GLuint program, GLint location, GLdouble *params) PFNGLGETUNIFORMDVPROC;
}

version (GL_ARB_shader_subroutine) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLint glGetSubroutineUniformLocation (GLuint program, GLenum shadertype, const(GLchar)*name);
GLuint glGetSubroutineIndex (GLuint program, GLenum shadertype, const(GLchar)*name);
void glGetActiveSubroutineUniformiv (GLuint program, GLenum shadertype, GLuint index, GLenum pname, GLint *values);
void glGetActiveSubroutineUniformName (GLuint program, GLenum shadertype, GLuint index, GLsizei bufsize, GLsizei *length, GLchar *name);
void glGetActiveSubroutineName (GLuint program, GLenum shadertype, GLuint index, GLsizei bufsize, GLsizei *length, GLchar *name);
void glUniformSubroutinesuiv (GLenum shadertype, GLsizei count, const(GLuint)*indices);
void glGetUniformSubroutineuiv (GLenum shadertype, GLint location, GLuint *params);
void glGetProgramStageiv (GLuint program, GLenum shadertype, GLenum pname, GLint *values);
} /* GL_GLEXT_PROTOTYPES */
alias GLint function (GLuint program, GLenum shadertype, const(GLchar)*name) PFNGLGETSUBROUTINEUNIFORMLOCATIONPROC;
alias GLuint function (GLuint program, GLenum shadertype, const(GLchar)*name) PFNGLGETSUBROUTINEINDEXPROC;
alias void function (GLuint program, GLenum shadertype, GLuint index, GLenum pname, GLint *values) PFNGLGETACTIVESUBROUTINEUNIFORMIVPROC;
alias void function (GLuint program, GLenum shadertype, GLuint index, GLsizei bufsize, GLsizei *length, GLchar *name) PFNGLGETACTIVESUBROUTINEUNIFORMNAMEPROC;
alias void function (GLuint program, GLenum shadertype, GLuint index, GLsizei bufsize, GLsizei *length, GLchar *name) PFNGLGETACTIVESUBROUTINENAMEPROC;
alias void function (GLenum shadertype, GLsizei count, const(GLuint)*indices) PFNGLUNIFORMSUBROUTINESUIVPROC;
alias void function (GLenum shadertype, GLint location, GLuint *params) PFNGLGETUNIFORMSUBROUTINEUIVPROC;
alias void function (GLuint program, GLenum shadertype, GLenum pname, GLint *values) PFNGLGETPROGRAMSTAGEIVPROC;
}

version (GL_ARB_tessellation_shader) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glPatchParameteri (GLenum pname, GLint value);
void glPatchParameterfv (GLenum pname, const(GLfloat)*values);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum pname, GLint value) PFNGLPATCHPARAMETERIPROC;
alias void function (GLenum pname, const(GLfloat)*values) PFNGLPATCHPARAMETERFVPROC;
}

version (GL_ARB_texture_buffer_object_rgb32) {} else {
}

version (GL_ARB_transform_feedback2) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBindTransformFeedback (GLenum target, GLuint id);
void glDeleteTransformFeedbacks (GLsizei n, const(GLuint)*ids);
void glGenTransformFeedbacks (GLsizei n, GLuint *ids);
GLboolean glIsTransformFeedback (GLuint id);
void glPauseTransformFeedback ();
void glResumeTransformFeedback ();
void glDrawTransformFeedback (GLenum mode, GLuint id);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLuint id) PFNGLBINDTRANSFORMFEEDBACKPROC;
alias void function (GLsizei n, const(GLuint)*ids) PFNGLDELETETRANSFORMFEEDBACKSPROC;
alias void function (GLsizei n, GLuint *ids) PFNGLGENTRANSFORMFEEDBACKSPROC;
alias GLboolean function (GLuint id) PFNGLISTRANSFORMFEEDBACKPROC;
alias void function () PFNGLPAUSETRANSFORMFEEDBACKPROC;
alias void function () PFNGLRESUMETRANSFORMFEEDBACKPROC;
alias void function (GLenum mode, GLuint id) PFNGLDRAWTRANSFORMFEEDBACKPROC;
}

version (GL_ARB_transform_feedback3) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDrawTransformFeedbackStream (GLenum mode, GLuint id, GLuint stream);
void glBeginQueryIndexed (GLenum target, GLuint index, GLuint id);
void glEndQueryIndexed (GLenum target, GLuint index);
void glGetQueryIndexediv (GLenum target, GLuint index, GLenum pname, GLint *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode, GLuint id, GLuint stream) PFNGLDRAWTRANSFORMFEEDBACKSTREAMPROC;
alias void function (GLenum target, GLuint index, GLuint id) PFNGLBEGINQUERYINDEXEDPROC;
alias void function (GLenum target, GLuint index) PFNGLENDQUERYINDEXEDPROC;
alias void function (GLenum target, GLuint index, GLenum pname, GLint *params) PFNGLGETQUERYINDEXEDIVPROC;
}

version (GL_ARB_ES2_compatibility) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glReleaseShaderCompiler ();
void glShaderBinary (GLsizei count, const(GLuint)*shaders, GLenum binaryformat, const(GLvoid)*binary, GLsizei length);
void glGetShaderPrecisionFormat (GLenum shadertype, GLenum precisiontype, GLint *range, GLint *precision);
void glDepthRangef (GLfloat n, GLfloat f);
void glClearDepthf (GLfloat d);
} /* GL_GLEXT_PROTOTYPES */
alias void function () PFNGLRELEASESHADERCOMPILERPROC;
alias void function (GLsizei count, const(GLuint)*shaders, GLenum binaryformat, const(GLvoid)*binary, GLsizei length) PFNGLSHADERBINARYPROC;
alias void function (GLenum shadertype, GLenum precisiontype, GLint *range, GLint *precision) PFNGLGETSHADERPRECISIONFORMATPROC;
alias void function (GLfloat n, GLfloat f) PFNGLDEPTHRANGEFPROC;
alias void function (GLfloat d) PFNGLCLEARDEPTHFPROC;
}

version (GL_ARB_get_program_binary) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGetProgramBinary (GLuint program, GLsizei bufSize, GLsizei *length, GLenum *binaryFormat, GLvoid *binary);
void glProgramBinary (GLuint program, GLenum binaryFormat, const(GLvoid)*binary, GLsizei length);
void glProgramParameteri (GLuint program, GLenum pname, GLint value);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint program, GLsizei bufSize, GLsizei *length, GLenum *binaryFormat, GLvoid *binary) PFNGLGETPROGRAMBINARYPROC;
alias void function (GLuint program, GLenum binaryFormat, const(GLvoid)*binary, GLsizei length) PFNGLPROGRAMBINARYPROC;
alias void function (GLuint program, GLenum pname, GLint value) PFNGLPROGRAMPARAMETERIPROC;
}

version (GL_ARB_separate_shader_objects) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glUseProgramStages (GLuint pipeline, GLbitfield stages, GLuint program);
void glActiveShaderProgram (GLuint pipeline, GLuint program);
GLuint glCreateShaderProgramv (GLenum type, GLsizei count, const(GLchar*)*strings);
void glBindProgramPipeline (GLuint pipeline);
void glDeleteProgramPipelines (GLsizei n, const(GLuint)*pipelines);
void glGenProgramPipelines (GLsizei n, GLuint *pipelines);
GLboolean glIsProgramPipeline (GLuint pipeline);
void glGetProgramPipelineiv (GLuint pipeline, GLenum pname, GLint *params);
void glProgramUniform1i (GLuint program, GLint location, GLint v0);
void glProgramUniform1iv (GLuint program, GLint location, GLsizei count, const(GLint)*value);
void glProgramUniform1f (GLuint program, GLint location, GLfloat v0);
void glProgramUniform1fv (GLuint program, GLint location, GLsizei count, const(GLfloat)*value);
void glProgramUniform1d (GLuint program, GLint location, GLdouble v0);
void glProgramUniform1dv (GLuint program, GLint location, GLsizei count, const(GLdouble)*value);
void glProgramUniform1ui (GLuint program, GLint location, GLuint v0);
void glProgramUniform1uiv (GLuint program, GLint location, GLsizei count, const(GLuint)*value);
void glProgramUniform2i (GLuint program, GLint location, GLint v0, GLint v1);
void glProgramUniform2iv (GLuint program, GLint location, GLsizei count, const(GLint)*value);
void glProgramUniform2f (GLuint program, GLint location, GLfloat v0, GLfloat v1);
void glProgramUniform2fv (GLuint program, GLint location, GLsizei count, const(GLfloat)*value);
void glProgramUniform2d (GLuint program, GLint location, GLdouble v0, GLdouble v1);
void glProgramUniform2dv (GLuint program, GLint location, GLsizei count, const(GLdouble)*value);
void glProgramUniform2ui (GLuint program, GLint location, GLuint v0, GLuint v1);
void glProgramUniform2uiv (GLuint program, GLint location, GLsizei count, const(GLuint)*value);
void glProgramUniform3i (GLuint program, GLint location, GLint v0, GLint v1, GLint v2);
void glProgramUniform3iv (GLuint program, GLint location, GLsizei count, const(GLint)*value);
void glProgramUniform3f (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
void glProgramUniform3fv (GLuint program, GLint location, GLsizei count, const(GLfloat)*value);
void glProgramUniform3d (GLuint program, GLint location, GLdouble v0, GLdouble v1, GLdouble v2);
void glProgramUniform3dv (GLuint program, GLint location, GLsizei count, const(GLdouble)*value);
void glProgramUniform3ui (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2);
void glProgramUniform3uiv (GLuint program, GLint location, GLsizei count, const(GLuint)*value);
void glProgramUniform4i (GLuint program, GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
void glProgramUniform4iv (GLuint program, GLint location, GLsizei count, const(GLint)*value);
void glProgramUniform4f (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
void glProgramUniform4fv (GLuint program, GLint location, GLsizei count, const(GLfloat)*value);
void glProgramUniform4d (GLuint program, GLint location, GLdouble v0, GLdouble v1, GLdouble v2, GLdouble v3);
void glProgramUniform4dv (GLuint program, GLint location, GLsizei count, const(GLdouble)*value);
void glProgramUniform4ui (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3);
void glProgramUniform4uiv (GLuint program, GLint location, GLsizei count, const(GLuint)*value);
void glProgramUniformMatrix2fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix3fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix4fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix2dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glProgramUniformMatrix3dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glProgramUniformMatrix4dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glProgramUniformMatrix2x3fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix3x2fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix2x4fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix4x2fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix3x4fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix4x3fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix2x3dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glProgramUniformMatrix3x2dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glProgramUniformMatrix2x4dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glProgramUniformMatrix4x2dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glProgramUniformMatrix3x4dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glProgramUniformMatrix4x3dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glValidateProgramPipeline (GLuint pipeline);
void glGetProgramPipelineInfoLog (GLuint pipeline, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint pipeline, GLbitfield stages, GLuint program) PFNGLUSEPROGRAMSTAGESPROC;
alias void function (GLuint pipeline, GLuint program) PFNGLACTIVESHADERPROGRAMPROC;
alias GLuint function (GLenum type, GLsizei count, const(GLchar*)*strings) PFNGLCREATESHADERPROGRAMVPROC;
alias void function (GLuint pipeline) PFNGLBINDPROGRAMPIPELINEPROC;
alias void function (GLsizei n, const(GLuint)*pipelines) PFNGLDELETEPROGRAMPIPELINESPROC;
alias void function (GLsizei n, GLuint *pipelines) PFNGLGENPROGRAMPIPELINESPROC;
alias GLboolean function (GLuint pipeline) PFNGLISPROGRAMPIPELINEPROC;
alias void function (GLuint pipeline, GLenum pname, GLint *params) PFNGLGETPROGRAMPIPELINEIVPROC;
alias void function (GLuint program, GLint location, GLint v0) PFNGLPROGRAMUNIFORM1IPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLint)*value) PFNGLPROGRAMUNIFORM1IVPROC;
alias void function (GLuint program, GLint location, GLfloat v0) PFNGLPROGRAMUNIFORM1FPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLfloat)*value) PFNGLPROGRAMUNIFORM1FVPROC;
alias void function (GLuint program, GLint location, GLdouble v0) PFNGLPROGRAMUNIFORM1DPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLdouble)*value) PFNGLPROGRAMUNIFORM1DVPROC;
alias void function (GLuint program, GLint location, GLuint v0) PFNGLPROGRAMUNIFORM1UIPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLuint)*value) PFNGLPROGRAMUNIFORM1UIVPROC;
alias void function (GLuint program, GLint location, GLint v0, GLint v1) PFNGLPROGRAMUNIFORM2IPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLint)*value) PFNGLPROGRAMUNIFORM2IVPROC;
alias void function (GLuint program, GLint location, GLfloat v0, GLfloat v1) PFNGLPROGRAMUNIFORM2FPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLfloat)*value) PFNGLPROGRAMUNIFORM2FVPROC;
alias void function (GLuint program, GLint location, GLdouble v0, GLdouble v1) PFNGLPROGRAMUNIFORM2DPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLdouble)*value) PFNGLPROGRAMUNIFORM2DVPROC;
alias void function (GLuint program, GLint location, GLuint v0, GLuint v1) PFNGLPROGRAMUNIFORM2UIPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLuint)*value) PFNGLPROGRAMUNIFORM2UIVPROC;
alias void function (GLuint program, GLint location, GLint v0, GLint v1, GLint v2) PFNGLPROGRAMUNIFORM3IPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLint)*value) PFNGLPROGRAMUNIFORM3IVPROC;
alias void function (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2) PFNGLPROGRAMUNIFORM3FPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLfloat)*value) PFNGLPROGRAMUNIFORM3FVPROC;
alias void function (GLuint program, GLint location, GLdouble v0, GLdouble v1, GLdouble v2) PFNGLPROGRAMUNIFORM3DPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLdouble)*value) PFNGLPROGRAMUNIFORM3DVPROC;
alias void function (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2) PFNGLPROGRAMUNIFORM3UIPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLuint)*value) PFNGLPROGRAMUNIFORM3UIVPROC;
alias void function (GLuint program, GLint location, GLint v0, GLint v1, GLint v2, GLint v3) PFNGLPROGRAMUNIFORM4IPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLint)*value) PFNGLPROGRAMUNIFORM4IVPROC;
alias void function (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3) PFNGLPROGRAMUNIFORM4FPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLfloat)*value) PFNGLPROGRAMUNIFORM4FVPROC;
alias void function (GLuint program, GLint location, GLdouble v0, GLdouble v1, GLdouble v2, GLdouble v3) PFNGLPROGRAMUNIFORM4DPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLdouble)*value) PFNGLPROGRAMUNIFORM4DVPROC;
alias void function (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3) PFNGLPROGRAMUNIFORM4UIPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLuint)*value) PFNGLPROGRAMUNIFORM4UIVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX2FVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX3FVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX4FVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX2DVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX3DVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX4DVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX2X3FVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX3X2FVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX2X4FVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX4X2FVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX3X4FVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX4X3FVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX2X3DVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX3X2DVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX2X4DVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX4X2DVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX3X4DVPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX4X3DVPROC;
alias void function (GLuint pipeline) PFNGLVALIDATEPROGRAMPIPELINEPROC;
alias void function (GLuint pipeline, GLsizei bufSize, GLsizei *length, GLchar *infoLog) PFNGLGETPROGRAMPIPELINEINFOLOGPROC;
}

version (GL_ARB_vertex_attrib_64bit) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glVertexAttribL1d (GLuint index, GLdouble x);
void glVertexAttribL2d (GLuint index, GLdouble x, GLdouble y);
void glVertexAttribL3d (GLuint index, GLdouble x, GLdouble y, GLdouble z);
void glVertexAttribL4d (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glVertexAttribL1dv (GLuint index, const(GLdouble)*v);
void glVertexAttribL2dv (GLuint index, const(GLdouble)*v);
void glVertexAttribL3dv (GLuint index, const(GLdouble)*v);
void glVertexAttribL4dv (GLuint index, const(GLdouble)*v);
void glVertexAttribLPointer (GLuint index, GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer);
void glGetVertexAttribLdv (GLuint index, GLenum pname, GLdouble *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint index, GLdouble x) PFNGLVERTEXATTRIBL1DPROC;
alias void function (GLuint index, GLdouble x, GLdouble y) PFNGLVERTEXATTRIBL2DPROC;
alias void function (GLuint index, GLdouble x, GLdouble y, GLdouble z) PFNGLVERTEXATTRIBL3DPROC;
alias void function (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w) PFNGLVERTEXATTRIBL4DPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIBL1DVPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIBL2DVPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIBL3DVPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIBL4DVPROC;
alias void function (GLuint index, GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer) PFNGLVERTEXATTRIBLPOINTERPROC;
alias void function (GLuint index, GLenum pname, GLdouble *params) PFNGLGETVERTEXATTRIBLDVPROC;
}

version (GL_ARB_viewport_array) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glViewportArrayv (GLuint first, GLsizei count, const(GLfloat)*v);
void glViewportIndexedf (GLuint index, GLfloat x, GLfloat y, GLfloat w, GLfloat h);
void glViewportIndexedfv (GLuint index, const(GLfloat)*v);
void glScissorArrayv (GLuint first, GLsizei count, const(GLint)*v);
void glScissorIndexed (GLuint index, GLint left, GLint bottom, GLsizei width, GLsizei height);
void glScissorIndexedv (GLuint index, const(GLint)*v);
void glDepthRangeArrayv (GLuint first, GLsizei count, const(GLdouble)*v);
void glDepthRangeIndexed (GLuint index, GLdouble n, GLdouble f);
void glGetFloati_v (GLenum target, GLuint index, GLfloat *data);
void glGetDoublei_v (GLenum target, GLuint index, GLdouble *data);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint first, GLsizei count, const(GLfloat)*v) PFNGLVIEWPORTARRAYVPROC;
alias void function (GLuint index, GLfloat x, GLfloat y, GLfloat w, GLfloat h) PFNGLVIEWPORTINDEXEDFPROC;
alias void function (GLuint index, const(GLfloat)*v) PFNGLVIEWPORTINDEXEDFVPROC;
alias void function (GLuint first, GLsizei count, const(GLint)*v) PFNGLSCISSORARRAYVPROC;
alias void function (GLuint index, GLint left, GLint bottom, GLsizei width, GLsizei height) PFNGLSCISSORINDEXEDPROC;
alias void function (GLuint index, const(GLint)*v) PFNGLSCISSORINDEXEDVPROC;
alias void function (GLuint first, GLsizei count, const(GLdouble)*v) PFNGLDEPTHRANGEARRAYVPROC;
alias void function (GLuint index, GLdouble n, GLdouble f) PFNGLDEPTHRANGEINDEXEDPROC;
alias void function (GLenum target, GLuint index, GLfloat *data) PFNGLGETFLOATI_VPROC;
alias void function (GLenum target, GLuint index, GLdouble *data) PFNGLGETDOUBLEI_VPROC;
}

version (GL_ARB_cl_event) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLsync glCreateSyncFromCLeventARB (_cl_context * context, _cl_event * event, GLbitfield flags);
} /* GL_GLEXT_PROTOTYPES */
alias GLsync function (_cl_context * context, _cl_event * event, GLbitfield flags) PFNGLCREATESYNCFROMCLEVENTARBPROC;
}

version (GL_ARB_debug_output) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDebugMessageControlARB (GLenum source, GLenum type, GLenum severity, GLsizei count, const(GLuint)*ids, GLboolean enabled);
void glDebugMessageInsertARB (GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, const(GLchar)*buf);
void glDebugMessageCallbackARB (GLDEBUGPROCARB callback, const(GLvoid)*userParam);
GLuint glGetDebugMessageLogARB (GLuint count, GLsizei bufsize, GLenum *sources, GLenum *types, GLuint *ids, GLenum *severities, GLsizei *lengths, GLchar *messageLog);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum source, GLenum type, GLenum severity, GLsizei count, const(GLuint)*ids, GLboolean enabled) PFNGLDEBUGMESSAGECONTROLARBPROC;
alias void function (GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, const(GLchar)*buf) PFNGLDEBUGMESSAGEINSERTARBPROC;
alias void function (GLDEBUGPROCARB callback, const(GLvoid)*userParam) PFNGLDEBUGMESSAGECALLBACKARBPROC;
alias GLuint function (GLuint count, GLsizei bufsize, GLenum *sources, GLenum *types, GLuint *ids, GLenum *severities, GLsizei *lengths, GLchar *messageLog) PFNGLGETDEBUGMESSAGELOGARBPROC;
}

version (GL_ARB_robustness) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLenum glGetGraphicsResetStatusARB ();
void glGetnMapdvARB (GLenum target, GLenum query, GLsizei bufSize, GLdouble *v);
void glGetnMapfvARB (GLenum target, GLenum query, GLsizei bufSize, GLfloat *v);
void glGetnMapivARB (GLenum target, GLenum query, GLsizei bufSize, GLint *v);
void glGetnPixelMapfvARB (GLenum map, GLsizei bufSize, GLfloat *values);
void glGetnPixelMapuivARB (GLenum map, GLsizei bufSize, GLuint *values);
void glGetnPixelMapusvARB (GLenum map, GLsizei bufSize, GLushort *values);
void glGetnPolygonStippleARB (GLsizei bufSize, GLubyte *pattern);
void glGetnColorTableARB (GLenum target, GLenum format, GLenum type, GLsizei bufSize, GLvoid *table);
void glGetnConvolutionFilterARB (GLenum target, GLenum format, GLenum type, GLsizei bufSize, GLvoid *image);
void glGetnSeparableFilterARB (GLenum target, GLenum format, GLenum type, GLsizei rowBufSize, GLvoid *row, GLsizei columnBufSize, GLvoid *column, GLvoid *span);
void glGetnHistogramARB (GLenum target, GLboolean reset, GLenum format, GLenum type, GLsizei bufSize, GLvoid *values);
void glGetnMinmaxARB (GLenum target, GLboolean reset, GLenum format, GLenum type, GLsizei bufSize, GLvoid *values);
void glGetnTexImageARB (GLenum target, GLint level, GLenum format, GLenum type, GLsizei bufSize, GLvoid *img);
void glReadnPixelsARB (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLsizei bufSize, GLvoid *data);
void glGetnCompressedTexImageARB (GLenum target, GLint lod, GLsizei bufSize, GLvoid *img);
void glGetnUniformfvARB (GLuint program, GLint location, GLsizei bufSize, GLfloat *params);
void glGetnUniformivARB (GLuint program, GLint location, GLsizei bufSize, GLint *params);
void glGetnUniformuivARB (GLuint program, GLint location, GLsizei bufSize, GLuint *params);
void glGetnUniformdvARB (GLuint program, GLint location, GLsizei bufSize, GLdouble *params);
} /* GL_GLEXT_PROTOTYPES */
alias GLenum function () PFNGLGETGRAPHICSRESETSTATUSARBPROC;
alias void function (GLenum target, GLenum query, GLsizei bufSize, GLdouble *v) PFNGLGETNMAPDVARBPROC;
alias void function (GLenum target, GLenum query, GLsizei bufSize, GLfloat *v) PFNGLGETNMAPFVARBPROC;
alias void function (GLenum target, GLenum query, GLsizei bufSize, GLint *v) PFNGLGETNMAPIVARBPROC;
alias void function (GLenum map, GLsizei bufSize, GLfloat *values) PFNGLGETNPIXELMAPFVARBPROC;
alias void function (GLenum map, GLsizei bufSize, GLuint *values) PFNGLGETNPIXELMAPUIVARBPROC;
alias void function (GLenum map, GLsizei bufSize, GLushort *values) PFNGLGETNPIXELMAPUSVARBPROC;
alias void function (GLsizei bufSize, GLubyte *pattern) PFNGLGETNPOLYGONSTIPPLEARBPROC;
alias void function (GLenum target, GLenum format, GLenum type, GLsizei bufSize, GLvoid *table) PFNGLGETNCOLORTABLEARBPROC;
alias void function (GLenum target, GLenum format, GLenum type, GLsizei bufSize, GLvoid *image) PFNGLGETNCONVOLUTIONFILTERARBPROC;
alias void function (GLenum target, GLenum format, GLenum type, GLsizei rowBufSize, GLvoid *row, GLsizei columnBufSize, GLvoid *column, GLvoid *span) PFNGLGETNSEPARABLEFILTERARBPROC;
alias void function (GLenum target, GLboolean reset, GLenum format, GLenum type, GLsizei bufSize, GLvoid *values) PFNGLGETNHISTOGRAMARBPROC;
alias void function (GLenum target, GLboolean reset, GLenum format, GLenum type, GLsizei bufSize, GLvoid *values) PFNGLGETNMINMAXARBPROC;
alias void function (GLenum target, GLint level, GLenum format, GLenum type, GLsizei bufSize, GLvoid *img) PFNGLGETNTEXIMAGEARBPROC;
alias void function (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLsizei bufSize, GLvoid *data) PFNGLREADNPIXELSARBPROC;
alias void function (GLenum target, GLint lod, GLsizei bufSize, GLvoid *img) PFNGLGETNCOMPRESSEDTEXIMAGEARBPROC;
alias void function (GLuint program, GLint location, GLsizei bufSize, GLfloat *params) PFNGLGETNUNIFORMFVARBPROC;
alias void function (GLuint program, GLint location, GLsizei bufSize, GLint *params) PFNGLGETNUNIFORMIVARBPROC;
alias void function (GLuint program, GLint location, GLsizei bufSize, GLuint *params) PFNGLGETNUNIFORMUIVARBPROC;
alias void function (GLuint program, GLint location, GLsizei bufSize, GLdouble *params) PFNGLGETNUNIFORMDVARBPROC;
}

version (GL_ARB_shader_stencil_export) {} else {
}

version (GL_ARB_base_instance) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDrawArraysInstancedBaseInstance (GLenum mode, GLint first, GLsizei count, GLsizei instancecount, GLuint baseinstance);
void glDrawElementsInstancedBaseInstance (GLenum mode, GLsizei count, GLenum type, const(void)*indices, GLsizei instancecount, GLuint baseinstance);
void glDrawElementsInstancedBaseVertexBaseInstance (GLenum mode, GLsizei count, GLenum type, const(void)*indices, GLsizei instancecount, GLint basevertex, GLuint baseinstance);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode, GLint first, GLsizei count, GLsizei instancecount, GLuint baseinstance) PFNGLDRAWARRAYSINSTANCEDBASEINSTANCEPROC;
alias void function (GLenum mode, GLsizei count, GLenum type, const(void)*indices, GLsizei instancecount, GLuint baseinstance) PFNGLDRAWELEMENTSINSTANCEDBASEINSTANCEPROC;
alias void function (GLenum mode, GLsizei count, GLenum type, const(void)*indices, GLsizei instancecount, GLint basevertex, GLuint baseinstance) PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXBASEINSTANCEPROC;
}

version (GL_ARB_shading_language_420pack) {} else {
}

version (GL_ARB_transform_feedback_instanced) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDrawTransformFeedbackInstanced (GLenum mode, GLuint id, GLsizei instancecount);
void glDrawTransformFeedbackStreamInstanced (GLenum mode, GLuint id, GLuint stream, GLsizei instancecount);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode, GLuint id, GLsizei instancecount) PFNGLDRAWTRANSFORMFEEDBACKINSTANCEDPROC;
alias void function (GLenum mode, GLuint id, GLuint stream, GLsizei instancecount) PFNGLDRAWTRANSFORMFEEDBACKSTREAMINSTANCEDPROC;
}

version (GL_ARB_compressed_texture_pixel_storage) {} else {
}

version (GL_ARB_conservative_depth) {} else {
}

version (GL_ARB_internalformat_query) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGetInternalformativ (GLenum target, GLenum internalformat, GLenum pname, GLsizei bufSize, GLint *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum internalformat, GLenum pname, GLsizei bufSize, GLint *params) PFNGLGETINTERNALFORMATIVPROC;
}

version (GL_ARB_map_buffer_alignment) {} else {
}

version (GL_ARB_shader_atomic_counters) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGetActiveAtomicCounterBufferiv (GLuint program, GLuint bufferIndex, GLenum pname, GLint *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint program, GLuint bufferIndex, GLenum pname, GLint *params) PFNGLGETACTIVEATOMICCOUNTERBUFFERIVPROC;
}

version (GL_ARB_shader_image_load_store) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBindImageTexture (GLuint unit, GLuint texture, GLint level, GLboolean layered, GLint layer, GLenum access, GLenum format);
void glMemoryBarrier (GLbitfield barriers);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint unit, GLuint texture, GLint level, GLboolean layered, GLint layer, GLenum access, GLenum format) PFNGLBINDIMAGETEXTUREPROC;
alias void function (GLbitfield barriers) PFNGLMEMORYBARRIERPROC;
}

version (GL_ARB_shading_language_packing) {} else {
}

version (GL_ARB_texture_storage) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTexStorage1D (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width);
void glTexStorage2D (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
void glTexStorage3D (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
void glTextureStorage1DEXT (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width);
void glTextureStorage2DEXT (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
void glTextureStorage3DEXT (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width) PFNGLTEXSTORAGE1DPROC;
alias void function (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height) PFNGLTEXSTORAGE2DPROC;
alias void function (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth) PFNGLTEXSTORAGE3DPROC;
alias void function (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width) PFNGLTEXTURESTORAGE1DEXTPROC;
alias void function (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height) PFNGLTEXTURESTORAGE2DEXTPROC;
alias void function (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth) PFNGLTEXTURESTORAGE3DEXTPROC;
}

version (GL_KHR_texture_compression_astc_ldr) {} else {
}

version (GL_KHR_debug) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDebugMessageControl (GLenum source, GLenum type, GLenum severity, GLsizei count, const(GLuint)*ids, GLboolean enabled);
void glDebugMessageInsert (GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, const(GLchar)*buf);
void glDebugMessageCallback (GLDEBUGPROC callback, const(void)*userParam);
GLuint glGetDebugMessageLog (GLuint count, GLsizei bufsize, GLenum *sources, GLenum *types, GLuint *ids, GLenum *severities, GLsizei *lengths, GLchar *messageLog);
void glPushDebugGroup (GLenum source, GLuint id, GLsizei length, const(GLchar)*message);
void glPopDebugGroup ();
void glObjectLabel (GLenum identifier, GLuint name, GLsizei length, const(GLchar)*label);
void glGetObjectLabel (GLenum identifier, GLuint name, GLsizei bufSize, GLsizei *length, GLchar *label);
void glObjectPtrLabel (const(void)*ptr, GLsizei length, const(GLchar)*label);
void glGetObjectPtrLabel (const(void)*ptr, GLsizei bufSize, GLsizei *length, GLchar *label);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum source, GLenum type, GLenum severity, GLsizei count, const(GLuint)*ids, GLboolean enabled) PFNGLDEBUGMESSAGECONTROLPROC;
alias void function (GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, const(GLchar)*buf) PFNGLDEBUGMESSAGEINSERTPROC;
alias void function (GLDEBUGPROC callback, const(void)*userParam) PFNGLDEBUGMESSAGECALLBACKPROC;
alias GLuint function (GLuint count, GLsizei bufsize, GLenum *sources, GLenum *types, GLuint *ids, GLenum *severities, GLsizei *lengths, GLchar *messageLog) PFNGLGETDEBUGMESSAGELOGPROC;
alias void function (GLenum source, GLuint id, GLsizei length, const(GLchar)*message) PFNGLPUSHDEBUGGROUPPROC;
alias void function () PFNGLPOPDEBUGGROUPPROC;
alias void function (GLenum identifier, GLuint name, GLsizei length, const(GLchar)*label) PFNGLOBJECTLABELPROC;
alias void function (GLenum identifier, GLuint name, GLsizei bufSize, GLsizei *length, GLchar *label) PFNGLGETOBJECTLABELPROC;
alias void function (const(void)*ptr, GLsizei length, const(GLchar)*label) PFNGLOBJECTPTRLABELPROC;
alias void function (const(void)*ptr, GLsizei bufSize, GLsizei *length, GLchar *label) PFNGLGETOBJECTPTRLABELPROC;
}

version (GL_ARB_arrays_of_arrays) {} else {
}

version (GL_ARB_clear_buffer_object) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glClearBufferData (GLenum target, GLenum internalformat, GLenum format, GLenum type, const(void)*data);
void glClearBufferSubData (GLenum target, GLenum internalformat, GLintptr offset, GLsizeiptr size, GLenum format, GLenum type, const(void)*data);
void glClearNamedBufferDataEXT (GLuint buffer, GLenum internalformat, GLenum format, GLenum type, const(void)*data);
void glClearNamedBufferSubDataEXT (GLuint buffer, GLenum internalformat, GLenum format, GLenum type, GLsizeiptr offset, GLsizeiptr size, const(void)*data);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum internalformat, GLenum format, GLenum type, const(void)*data) PFNGLCLEARBUFFERDATAPROC;
alias void function (GLenum target, GLenum internalformat, GLintptr offset, GLsizeiptr size, GLenum format, GLenum type, const(void)*data) PFNGLCLEARBUFFERSUBDATAPROC;
alias void function (GLuint buffer, GLenum internalformat, GLenum format, GLenum type, const(void)*data) PFNGLCLEARNAMEDBUFFERDATAEXTPROC;
alias void function (GLuint buffer, GLenum internalformat, GLenum format, GLenum type, GLsizeiptr offset, GLsizeiptr size, const(void)*data) PFNGLCLEARNAMEDBUFFERSUBDATAEXTPROC;
}

version (GL_ARB_compute_shader) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDispatchCompute (GLuint num_groups_x, GLuint num_groups_y, GLuint num_groups_z);
void glDispatchComputeIndirect (GLintptr indirect);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint num_groups_x, GLuint num_groups_y, GLuint num_groups_z) PFNGLDISPATCHCOMPUTEPROC;
alias void function (GLintptr indirect) PFNGLDISPATCHCOMPUTEINDIRECTPROC;
}

version (GL_ARB_copy_image) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glCopyImageSubData (GLuint srcName, GLenum srcTarget, GLint srcLevel, GLint srcX, GLint srcY, GLint srcZ, GLuint dstName, GLenum dstTarget, GLint dstLevel, GLint dstX, GLint dstY, GLint dstZ, GLsizei srcWidth, GLsizei srcHeight, GLsizei srcDepth);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint srcName, GLenum srcTarget, GLint srcLevel, GLint srcX, GLint srcY, GLint srcZ, GLuint dstName, GLenum dstTarget, GLint dstLevel, GLint dstX, GLint dstY, GLint dstZ, GLsizei srcWidth, GLsizei srcHeight, GLsizei srcDepth) PFNGLCOPYIMAGESUBDATAPROC;
}

version (GL_ARB_texture_view) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTextureView (GLuint texture, GLenum target, GLuint origtexture, GLenum internalformat, GLuint minlevel, GLuint numlevels, GLuint minlayer, GLuint numlayers);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint texture, GLenum target, GLuint origtexture, GLenum internalformat, GLuint minlevel, GLuint numlevels, GLuint minlayer, GLuint numlayers) PFNGLTEXTUREVIEWPROC;
}

version (GL_ARB_vertex_attrib_binding) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBindVertexBuffer (GLuint bindingindex, GLuint buffer, GLintptr offset, GLsizei stride);
void glVertexAttribFormat (GLuint attribindex, GLint size, GLenum type, GLboolean normalized, GLuint relativeoffset);
void glVertexAttribIFormat (GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset);
void glVertexAttribLFormat (GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset);
void glVertexAttribBinding (GLuint attribindex, GLuint bindingindex);
void glVertexBindingDivisor (GLuint bindingindex, GLuint divisor);
void glVertexArrayBindVertexBufferEXT (GLuint vaobj, GLuint bindingindex, GLuint buffer, GLintptr offset, GLsizei stride);
void glVertexArrayVertexAttribFormatEXT (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLboolean normalized, GLuint relativeoffset);
void glVertexArrayVertexAttribIFormatEXT (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset);
void glVertexArrayVertexAttribLFormatEXT (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset);
void glVertexArrayVertexAttribBindingEXT (GLuint vaobj, GLuint attribindex, GLuint bindingindex);
void glVertexArrayVertexBindingDivisorEXT (GLuint vaobj, GLuint bindingindex, GLuint divisor);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint bindingindex, GLuint buffer, GLintptr offset, GLsizei stride) PFNGLBINDVERTEXBUFFERPROC;
alias void function (GLuint attribindex, GLint size, GLenum type, GLboolean normalized, GLuint relativeoffset) PFNGLVERTEXATTRIBFORMATPROC;
alias void function (GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset) PFNGLVERTEXATTRIBIFORMATPROC;
alias void function (GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset) PFNGLVERTEXATTRIBLFORMATPROC;
alias void function (GLuint attribindex, GLuint bindingindex) PFNGLVERTEXATTRIBBINDINGPROC;
alias void function (GLuint bindingindex, GLuint divisor) PFNGLVERTEXBINDINGDIVISORPROC;
alias void function (GLuint vaobj, GLuint bindingindex, GLuint buffer, GLintptr offset, GLsizei stride) PFNGLVERTEXARRAYBINDVERTEXBUFFEREXTPROC;
alias void function (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLboolean normalized, GLuint relativeoffset) PFNGLVERTEXARRAYVERTEXATTRIBFORMATEXTPROC;
alias void function (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset) PFNGLVERTEXARRAYVERTEXATTRIBIFORMATEXTPROC;
alias void function (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset) PFNGLVERTEXARRAYVERTEXATTRIBLFORMATEXTPROC;
alias void function (GLuint vaobj, GLuint attribindex, GLuint bindingindex) PFNGLVERTEXARRAYVERTEXATTRIBBINDINGEXTPROC;
alias void function (GLuint vaobj, GLuint bindingindex, GLuint divisor) PFNGLVERTEXARRAYVERTEXBINDINGDIVISOREXTPROC;
}

version (GL_ARB_robustness_isolation) {} else {
}

version (GL_ARB_ES3_compatibility) {} else {
}

version (GL_ARB_explicit_uniform_location) {} else {
}

version (GL_ARB_fragment_layer_viewport) {} else {
}

version (GL_ARB_framebuffer_no_attachments) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glFramebufferParameteri (GLenum target, GLenum pname, GLint param);
void glGetFramebufferParameteriv (GLenum target, GLenum pname, GLint *params);
void glNamedFramebufferParameteriEXT (GLuint framebuffer, GLenum pname, GLint param);
void glGetNamedFramebufferParameterivEXT (GLuint framebuffer, GLenum pname, GLint *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum pname, GLint param) PFNGLFRAMEBUFFERPARAMETERIPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETFRAMEBUFFERPARAMETERIVPROC;
alias void function (GLuint framebuffer, GLenum pname, GLint param) PFNGLNAMEDFRAMEBUFFERPARAMETERIEXTPROC;
alias void function (GLuint framebuffer, GLenum pname, GLint *params) PFNGLGETNAMEDFRAMEBUFFERPARAMETERIVEXTPROC;
}

version (GL_ARB_internalformat_query2) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGetInternalformati64v (GLenum target, GLenum internalformat, GLenum pname, GLsizei bufSize, GLint64 *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum internalformat, GLenum pname, GLsizei bufSize, GLint64 *params) PFNGLGETINTERNALFORMATI64VPROC;
}

version (GL_ARB_invalidate_subdata) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glInvalidateTexSubImage (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth);
void glInvalidateTexImage (GLuint texture, GLint level);
void glInvalidateBufferSubData (GLuint buffer, GLintptr offset, GLsizeiptr length);
void glInvalidateBufferData (GLuint buffer);
void glInvalidateFramebuffer (GLenum target, GLsizei numAttachments, const(GLenum)*attachments);
void glInvalidateSubFramebuffer (GLenum target, GLsizei numAttachments, const(GLenum)*attachments, GLint x, GLint y, GLsizei width, GLsizei height);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth) PFNGLINVALIDATETEXSUBIMAGEPROC;
alias void function (GLuint texture, GLint level) PFNGLINVALIDATETEXIMAGEPROC;
alias void function (GLuint buffer, GLintptr offset, GLsizeiptr length) PFNGLINVALIDATEBUFFERSUBDATAPROC;
alias void function (GLuint buffer) PFNGLINVALIDATEBUFFERDATAPROC;
alias void function (GLenum target, GLsizei numAttachments, const(GLenum)*attachments) PFNGLINVALIDATEFRAMEBUFFERPROC;
alias void function (GLenum target, GLsizei numAttachments, const(GLenum)*attachments, GLint x, GLint y, GLsizei width, GLsizei height) PFNGLINVALIDATESUBFRAMEBUFFERPROC;
}

version (GL_ARB_multi_draw_indirect) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glMultiDrawArraysIndirect (GLenum mode, const(void)*indirect, GLsizei drawcount, GLsizei stride);
void glMultiDrawElementsIndirect (GLenum mode, GLenum type, const(void)*indirect, GLsizei drawcount, GLsizei stride);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode, const(void)*indirect, GLsizei drawcount, GLsizei stride) PFNGLMULTIDRAWARRAYSINDIRECTPROC;
alias void function (GLenum mode, GLenum type, const(void)*indirect, GLsizei drawcount, GLsizei stride) PFNGLMULTIDRAWELEMENTSINDIRECTPROC;
}

version (GL_ARB_program_interface_query) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGetProgramInterfaceiv (GLuint program, GLenum programInterface, GLenum pname, GLint *params);
GLuint glGetProgramResourceIndex (GLuint program, GLenum programInterface, const(GLchar)*name);
void glGetProgramResourceName (GLuint program, GLenum programInterface, GLuint index, GLsizei bufSize, GLsizei *length, GLchar *name);
void glGetProgramResourceiv (GLuint program, GLenum programInterface, GLuint index, GLsizei propCount, const(GLenum)*props, GLsizei bufSize, GLsizei *length, GLint *params);
GLint glGetProgramResourceLocation (GLuint program, GLenum programInterface, const(GLchar)*name);
GLint glGetProgramResourceLocationIndex (GLuint program, GLenum programInterface, const(GLchar)*name);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint program, GLenum programInterface, GLenum pname, GLint *params) PFNGLGETPROGRAMINTERFACEIVPROC;
alias GLuint function (GLuint program, GLenum programInterface, const(GLchar)*name) PFNGLGETPROGRAMRESOURCEINDEXPROC;
alias void function (GLuint program, GLenum programInterface, GLuint index, GLsizei bufSize, GLsizei *length, GLchar *name) PFNGLGETPROGRAMRESOURCENAMEPROC;
alias void function (GLuint program, GLenum programInterface, GLuint index, GLsizei propCount, const(GLenum)*props, GLsizei bufSize, GLsizei *length, GLint *params) PFNGLGETPROGRAMRESOURCEIVPROC;
alias GLint function (GLuint program, GLenum programInterface, const(GLchar)*name) PFNGLGETPROGRAMRESOURCELOCATIONPROC;
alias GLint function (GLuint program, GLenum programInterface, const(GLchar)*name) PFNGLGETPROGRAMRESOURCELOCATIONINDEXPROC;
}

version (GL_ARB_robust_buffer_access_behavior) {} else {
}

version (GL_ARB_shader_image_size) {} else {
}

version (GL_ARB_shader_storage_buffer_object) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glShaderStorageBlockBinding (GLuint program, GLuint storageBlockIndex, GLuint storageBlockBinding);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint program, GLuint storageBlockIndex, GLuint storageBlockBinding) PFNGLSHADERSTORAGEBLOCKBINDINGPROC;
}

version (GL_ARB_stencil_texturing) {} else {
}

version (GL_ARB_texture_buffer_range) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTexBufferRange (GLenum target, GLenum internalformat, GLuint buffer, GLintptr offset, GLsizeiptr size);
void glTextureBufferRangeEXT (GLuint texture, GLenum target, GLenum internalformat, GLuint buffer, GLintptr offset, GLsizeiptr size);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum internalformat, GLuint buffer, GLintptr offset, GLsizeiptr size) PFNGLTEXBUFFERRANGEPROC;
alias void function (GLuint texture, GLenum target, GLenum internalformat, GLuint buffer, GLintptr offset, GLsizeiptr size) PFNGLTEXTUREBUFFERRANGEEXTPROC;
}

version (GL_ARB_texture_query_levels) {} else {
}

version (GL_ARB_texture_storage_multisample) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTexStorage2DMultisample (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations);
void glTexStorage3DMultisample (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations);
void glTextureStorage2DMultisampleEXT (GLuint texture, GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations);
void glTextureStorage3DMultisampleEXT (GLuint texture, GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations) PFNGLTEXSTORAGE2DMULTISAMPLEPROC;
alias void function (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations) PFNGLTEXSTORAGE3DMULTISAMPLEPROC;
alias void function (GLuint texture, GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations) PFNGLTEXTURESTORAGE2DMULTISAMPLEEXTPROC;
alias void function (GLuint texture, GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations) PFNGLTEXTURESTORAGE3DMULTISAMPLEEXTPROC;
}

version (GL_EXT_abgr) {} else {
}

version (GL_EXT_blend_color) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBlendColorEXT (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha) PFNGLBLENDCOLOREXTPROC;
}

version (GL_EXT_polygon_offset) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glPolygonOffsetEXT (GLfloat factor, GLfloat bias);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLfloat factor, GLfloat bias) PFNGLPOLYGONOFFSETEXTPROC;
}

version (GL_EXT_texture) {} else {
}

version (GL_EXT_texture3D) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTexImage3DEXT (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels);
void glTexSubImage3DEXT (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const(GLvoid)*pixels);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLTEXIMAGE3DEXTPROC;
alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLTEXSUBIMAGE3DEXTPROC;
}

version (GL_SGIS_texture_filter4) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGetTexFilterFuncSGIS (GLenum target, GLenum filter, GLfloat *weights);
void glTexFilterFuncSGIS (GLenum target, GLenum filter, GLsizei n, const(GLfloat)*weights);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum filter, GLfloat *weights) PFNGLGETTEXFILTERFUNCSGISPROC;
alias void function (GLenum target, GLenum filter, GLsizei n, const(GLfloat)*weights) PFNGLTEXFILTERFUNCSGISPROC;
}

version (GL_EXT_subtexture) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTexSubImage1DEXT (GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const(GLvoid)*pixels);
void glTexSubImage2DEXT (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const(GLvoid)*pixels);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLTEXSUBIMAGE1DEXTPROC;
alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLTEXSUBIMAGE2DEXTPROC;
}

version (GL_EXT_copy_texture) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glCopyTexImage1DEXT (GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border);
void glCopyTexImage2DEXT (GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
void glCopyTexSubImage1DEXT (GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width);
void glCopyTexSubImage2DEXT (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
void glCopyTexSubImage3DEXT (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border) PFNGLCOPYTEXIMAGE1DEXTPROC;
alias void function (GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border) PFNGLCOPYTEXIMAGE2DEXTPROC;
alias void function (GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width) PFNGLCOPYTEXSUBIMAGE1DEXTPROC;
alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height) PFNGLCOPYTEXSUBIMAGE2DEXTPROC;
alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height) PFNGLCOPYTEXSUBIMAGE3DEXTPROC;
}

version (GL_EXT_histogram) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGetHistogramEXT (GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values);
void glGetHistogramParameterfvEXT (GLenum target, GLenum pname, GLfloat *params);
void glGetHistogramParameterivEXT (GLenum target, GLenum pname, GLint *params);
void glGetMinmaxEXT (GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values);
void glGetMinmaxParameterfvEXT (GLenum target, GLenum pname, GLfloat *params);
void glGetMinmaxParameterivEXT (GLenum target, GLenum pname, GLint *params);
void glHistogramEXT (GLenum target, GLsizei width, GLenum internalformat, GLboolean sink);
void glMinmaxEXT (GLenum target, GLenum internalformat, GLboolean sink);
void glResetHistogramEXT (GLenum target);
void glResetMinmaxEXT (GLenum target);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values) PFNGLGETHISTOGRAMEXTPROC;
alias void function (GLenum target, GLenum pname, GLfloat *params) PFNGLGETHISTOGRAMPARAMETERFVEXTPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETHISTOGRAMPARAMETERIVEXTPROC;
alias void function (GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid *values) PFNGLGETMINMAXEXTPROC;
alias void function (GLenum target, GLenum pname, GLfloat *params) PFNGLGETMINMAXPARAMETERFVEXTPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETMINMAXPARAMETERIVEXTPROC;
alias void function (GLenum target, GLsizei width, GLenum internalformat, GLboolean sink) PFNGLHISTOGRAMEXTPROC;
alias void function (GLenum target, GLenum internalformat, GLboolean sink) PFNGLMINMAXEXTPROC;
alias void function (GLenum target) PFNGLRESETHISTOGRAMEXTPROC;
alias void function (GLenum target) PFNGLRESETMINMAXEXTPROC;
}

version (GL_EXT_convolution) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glConvolutionFilter1DEXT (GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const(GLvoid)*image);
void glConvolutionFilter2DEXT (GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const(GLvoid)*image);
void glConvolutionParameterfEXT (GLenum target, GLenum pname, GLfloat params);
void glConvolutionParameterfvEXT (GLenum target, GLenum pname, const(GLfloat)*params);
void glConvolutionParameteriEXT (GLenum target, GLenum pname, GLint params);
void glConvolutionParameterivEXT (GLenum target, GLenum pname, const(GLint)*params);
void glCopyConvolutionFilter1DEXT (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width);
void glCopyConvolutionFilter2DEXT (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height);
void glGetConvolutionFilterEXT (GLenum target, GLenum format, GLenum type, GLvoid *image);
void glGetConvolutionParameterfvEXT (GLenum target, GLenum pname, GLfloat *params);
void glGetConvolutionParameterivEXT (GLenum target, GLenum pname, GLint *params);
void glGetSeparableFilterEXT (GLenum target, GLenum format, GLenum type, GLvoid *row, GLvoid *column, GLvoid *span);
void glSeparableFilter2DEXT (GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const(GLvoid)*row, const(GLvoid)*column);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const(GLvoid)*image) PFNGLCONVOLUTIONFILTER1DEXTPROC;
alias void function (GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const(GLvoid)*image) PFNGLCONVOLUTIONFILTER2DEXTPROC;
alias void function (GLenum target, GLenum pname, GLfloat params) PFNGLCONVOLUTIONPARAMETERFEXTPROC;
alias void function (GLenum target, GLenum pname, const(GLfloat)*params) PFNGLCONVOLUTIONPARAMETERFVEXTPROC;
alias void function (GLenum target, GLenum pname, GLint params) PFNGLCONVOLUTIONPARAMETERIEXTPROC;
alias void function (GLenum target, GLenum pname, const(GLint)*params) PFNGLCONVOLUTIONPARAMETERIVEXTPROC;
alias void function (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width) PFNGLCOPYCONVOLUTIONFILTER1DEXTPROC;
alias void function (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height) PFNGLCOPYCONVOLUTIONFILTER2DEXTPROC;
alias void function (GLenum target, GLenum format, GLenum type, GLvoid *image) PFNGLGETCONVOLUTIONFILTEREXTPROC;
alias void function (GLenum target, GLenum pname, GLfloat *params) PFNGLGETCONVOLUTIONPARAMETERFVEXTPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETCONVOLUTIONPARAMETERIVEXTPROC;
alias void function (GLenum target, GLenum format, GLenum type, GLvoid *row, GLvoid *column, GLvoid *span) PFNGLGETSEPARABLEFILTEREXTPROC;
alias void function (GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, const(GLvoid)*row, const(GLvoid)*column) PFNGLSEPARABLEFILTER2DEXTPROC;
}

version (GL_SGI_color_matrix) {} else {
}

version (GL_SGI_color_table) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glColorTableSGI (GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const(GLvoid)*table);
void glColorTableParameterfvSGI (GLenum target, GLenum pname, const(GLfloat)*params);
void glColorTableParameterivSGI (GLenum target, GLenum pname, const(GLint)*params);
void glCopyColorTableSGI (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width);
void glGetColorTableSGI (GLenum target, GLenum format, GLenum type, GLvoid *table);
void glGetColorTableParameterfvSGI (GLenum target, GLenum pname, GLfloat *params);
void glGetColorTableParameterivSGI (GLenum target, GLenum pname, GLint *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, const(GLvoid)*table) PFNGLCOLORTABLESGIPROC;
alias void function (GLenum target, GLenum pname, const(GLfloat)*params) PFNGLCOLORTABLEPARAMETERFVSGIPROC;
alias void function (GLenum target, GLenum pname, const(GLint)*params) PFNGLCOLORTABLEPARAMETERIVSGIPROC;
alias void function (GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width) PFNGLCOPYCOLORTABLESGIPROC;
alias void function (GLenum target, GLenum format, GLenum type, GLvoid *table) PFNGLGETCOLORTABLESGIPROC;
alias void function (GLenum target, GLenum pname, GLfloat *params) PFNGLGETCOLORTABLEPARAMETERFVSGIPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETCOLORTABLEPARAMETERIVSGIPROC;
}

version (GL_SGIX_pixel_texture) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glPixelTexGenSGIX (GLenum mode);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode) PFNGLPIXELTEXGENSGIXPROC;
}

version (GL_SGIS_pixel_texture) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glPixelTexGenParameteriSGIS (GLenum pname, GLint param);
void glPixelTexGenParameterivSGIS (GLenum pname, const(GLint)*params);
void glPixelTexGenParameterfSGIS (GLenum pname, GLfloat param);
void glPixelTexGenParameterfvSGIS (GLenum pname, const(GLfloat)*params);
void glGetPixelTexGenParameterivSGIS (GLenum pname, GLint *params);
void glGetPixelTexGenParameterfvSGIS (GLenum pname, GLfloat *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum pname, GLint param) PFNGLPIXELTEXGENPARAMETERISGISPROC;
alias void function (GLenum pname, const(GLint)*params) PFNGLPIXELTEXGENPARAMETERIVSGISPROC;
alias void function (GLenum pname, GLfloat param) PFNGLPIXELTEXGENPARAMETERFSGISPROC;
alias void function (GLenum pname, const(GLfloat)*params) PFNGLPIXELTEXGENPARAMETERFVSGISPROC;
alias void function (GLenum pname, GLint *params) PFNGLGETPIXELTEXGENPARAMETERIVSGISPROC;
alias void function (GLenum pname, GLfloat *params) PFNGLGETPIXELTEXGENPARAMETERFVSGISPROC;
}

version (GL_SGIS_texture4D) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTexImage4DSGIS (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLsizei size4d, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels);
void glTexSubImage4DSGIS (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint woffset, GLsizei width, GLsizei height, GLsizei depth, GLsizei size4d, GLenum format, GLenum type, const(GLvoid)*pixels);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLsizei size4d, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLTEXIMAGE4DSGISPROC;
alias void function (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint woffset, GLsizei width, GLsizei height, GLsizei depth, GLsizei size4d, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLTEXSUBIMAGE4DSGISPROC;
}

version (GL_SGI_texture_color_table) {} else {
}

version (GL_EXT_cmyka) {} else {
}

version (GL_EXT_texture_object) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLboolean glAreTexturesResidentEXT (GLsizei n, const(GLuint)*textures, GLboolean *residences);
void glBindTextureEXT (GLenum target, GLuint texture);
void glDeleteTexturesEXT (GLsizei n, const(GLuint)*textures);
void glGenTexturesEXT (GLsizei n, GLuint *textures);
GLboolean glIsTextureEXT (GLuint texture);
void glPrioritizeTexturesEXT (GLsizei n, const(GLuint)*textures, const(GLclampf)*priorities);
} /* GL_GLEXT_PROTOTYPES */
alias GLboolean function (GLsizei n, const(GLuint)*textures, GLboolean *residences) PFNGLARETEXTURESRESIDENTEXTPROC;
alias void function (GLenum target, GLuint texture) PFNGLBINDTEXTUREEXTPROC;
alias void function (GLsizei n, const(GLuint)*textures) PFNGLDELETETEXTURESEXTPROC;
alias void function (GLsizei n, GLuint *textures) PFNGLGENTEXTURESEXTPROC;
alias GLboolean function (GLuint texture) PFNGLISTEXTUREEXTPROC;
alias void function (GLsizei n, const(GLuint)*textures, const(GLclampf)*priorities) PFNGLPRIORITIZETEXTURESEXTPROC;
}

version (GL_SGIS_detail_texture) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDetailTexFuncSGIS (GLenum target, GLsizei n, const(GLfloat)*points);
void glGetDetailTexFuncSGIS (GLenum target, GLfloat *points);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLsizei n, const(GLfloat)*points) PFNGLDETAILTEXFUNCSGISPROC;
alias void function (GLenum target, GLfloat *points) PFNGLGETDETAILTEXFUNCSGISPROC;
}

version (GL_SGIS_sharpen_texture) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glSharpenTexFuncSGIS (GLenum target, GLsizei n, const(GLfloat)*points);
void glGetSharpenTexFuncSGIS (GLenum target, GLfloat *points);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLsizei n, const(GLfloat)*points) PFNGLSHARPENTEXFUNCSGISPROC;
alias void function (GLenum target, GLfloat *points) PFNGLGETSHARPENTEXFUNCSGISPROC;
}

version (GL_EXT_packed_pixels) {} else {
}

version (GL_SGIS_texture_lod) {} else {
}

version (GL_SGIS_multisample) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glSampleMaskSGIS (GLclampf value, GLboolean invert);
void glSamplePatternSGIS (GLenum pattern);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLclampf value, GLboolean invert) PFNGLSAMPLEMASKSGISPROC;
alias void function (GLenum pattern) PFNGLSAMPLEPATTERNSGISPROC;
}

version (GL_EXT_rescale_normal) {} else {
}

version (GL_EXT_vertex_array) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glArrayElementEXT (GLint i);
void glColorPointerEXT (GLint size, GLenum type, GLsizei stride, GLsizei count, const(GLvoid)*pointer);
void glDrawArraysEXT (GLenum mode, GLint first, GLsizei count);
void glEdgeFlagPointerEXT (GLsizei stride, GLsizei count, const(GLboolean)*pointer);
void glGetPointervEXT (GLenum pname, GLvoid* *params);
void glIndexPointerEXT (GLenum type, GLsizei stride, GLsizei count, const(GLvoid)*pointer);
void glNormalPointerEXT (GLenum type, GLsizei stride, GLsizei count, const(GLvoid)*pointer);
void glTexCoordPointerEXT (GLint size, GLenum type, GLsizei stride, GLsizei count, const(GLvoid)*pointer);
void glVertexPointerEXT (GLint size, GLenum type, GLsizei stride, GLsizei count, const(GLvoid)*pointer);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLint i) PFNGLARRAYELEMENTEXTPROC;
alias void function (GLint size, GLenum type, GLsizei stride, GLsizei count, const(GLvoid)*pointer) PFNGLCOLORPOINTEREXTPROC;
alias void function (GLenum mode, GLint first, GLsizei count) PFNGLDRAWARRAYSEXTPROC;
alias void function (GLsizei stride, GLsizei count, const(GLboolean)*pointer) PFNGLEDGEFLAGPOINTEREXTPROC;
alias void function (GLenum pname, GLvoid* *params) PFNGLGETPOINTERVEXTPROC;
alias void function (GLenum type, GLsizei stride, GLsizei count, const(GLvoid)*pointer) PFNGLINDEXPOINTEREXTPROC;
alias void function (GLenum type, GLsizei stride, GLsizei count, const(GLvoid)*pointer) PFNGLNORMALPOINTEREXTPROC;
alias void function (GLint size, GLenum type, GLsizei stride, GLsizei count, const(GLvoid)*pointer) PFNGLTEXCOORDPOINTEREXTPROC;
alias void function (GLint size, GLenum type, GLsizei stride, GLsizei count, const(GLvoid)*pointer) PFNGLVERTEXPOINTEREXTPROC;
}

version (GL_EXT_misc_attribute) {} else {
}

version (GL_SGIS_generate_mipmap) {} else {
}

version (GL_SGIX_clipmap) {} else {
}

version (GL_SGIX_shadow) {} else {
}

version (GL_SGIS_texture_edge_clamp) {} else {
}

version (GL_SGIS_texture_border_clamp) {} else {
}

version (GL_EXT_blend_minmax) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBlendEquationEXT (GLenum mode);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode) PFNGLBLENDEQUATIONEXTPROC;
}

version (GL_EXT_blend_subtract) {} else {
}

version (GL_EXT_blend_logic_op) {} else {
}

version (GL_SGIX_interlace) {} else {
}

version (GL_SGIX_pixel_tiles) {} else {
}

version (GL_SGIX_texture_select) {} else {
}

version (GL_SGIX_sprite) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glSpriteParameterfSGIX (GLenum pname, GLfloat param);
void glSpriteParameterfvSGIX (GLenum pname, const(GLfloat)*params);
void glSpriteParameteriSGIX (GLenum pname, GLint param);
void glSpriteParameterivSGIX (GLenum pname, const(GLint)*params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum pname, GLfloat param) PFNGLSPRITEPARAMETERFSGIXPROC;
alias void function (GLenum pname, const(GLfloat)*params) PFNGLSPRITEPARAMETERFVSGIXPROC;
alias void function (GLenum pname, GLint param) PFNGLSPRITEPARAMETERISGIXPROC;
alias void function (GLenum pname, const(GLint)*params) PFNGLSPRITEPARAMETERIVSGIXPROC;
}

version (GL_SGIX_texture_multi_buffer) {} else {
}

version (GL_EXT_point_parameters) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glPointParameterfEXT (GLenum pname, GLfloat param);
void glPointParameterfvEXT (GLenum pname, const(GLfloat)*params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum pname, GLfloat param) PFNGLPOINTPARAMETERFEXTPROC;
alias void function (GLenum pname, const(GLfloat)*params) PFNGLPOINTPARAMETERFVEXTPROC;
}

version (GL_SGIS_point_parameters) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glPointParameterfSGIS (GLenum pname, GLfloat param);
void glPointParameterfvSGIS (GLenum pname, const(GLfloat)*params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum pname, GLfloat param) PFNGLPOINTPARAMETERFSGISPROC;
alias void function (GLenum pname, const(GLfloat)*params) PFNGLPOINTPARAMETERFVSGISPROC;
}

version (GL_SGIX_instruments) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLint glGetInstrumentsSGIX ();
void glInstrumentsBufferSGIX (GLsizei size, GLint *buffer);
GLint glPollInstrumentsSGIX (GLint *marker_p);
void glReadInstrumentsSGIX (GLint marker);
void glStartInstrumentsSGIX ();
void glStopInstrumentsSGIX (GLint marker);
} /* GL_GLEXT_PROTOTYPES */
alias GLint function () PFNGLGETINSTRUMENTSSGIXPROC;
alias void function (GLsizei size, GLint *buffer) PFNGLINSTRUMENTSBUFFERSGIXPROC;
alias GLint function (GLint *marker_p) PFNGLPOLLINSTRUMENTSSGIXPROC;
alias void function (GLint marker) PFNGLREADINSTRUMENTSSGIXPROC;
alias void function () PFNGLSTARTINSTRUMENTSSGIXPROC;
alias void function (GLint marker) PFNGLSTOPINSTRUMENTSSGIXPROC;
}

version (GL_SGIX_texture_scale_bias) {} else {
}

version (GL_SGIX_framezoom) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glFrameZoomSGIX (GLint factor);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLint factor) PFNGLFRAMEZOOMSGIXPROC;
}

version (GL_SGIX_tag_sample_buffer) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTagSampleBufferSGIX ();
} /* GL_GLEXT_PROTOTYPES */
alias void function () PFNGLTAGSAMPLEBUFFERSGIXPROC;
}

version (GL_SGIX_polynomial_ffd) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDeformationMap3dSGIX (GLenum target, GLdouble u1, GLdouble u2, GLint ustride, GLint uorder, GLdouble v1, GLdouble v2, GLint vstride, GLint vorder, GLdouble w1, GLdouble w2, GLint wstride, GLint worder, const(GLdouble)*points);
void glDeformationMap3fSGIX (GLenum target, GLfloat u1, GLfloat u2, GLint ustride, GLint uorder, GLfloat v1, GLfloat v2, GLint vstride, GLint vorder, GLfloat w1, GLfloat w2, GLint wstride, GLint worder, const(GLfloat)*points);
void glDeformSGIX (GLbitfield mask);
void glLoadIdentityDeformationMapSGIX (GLbitfield mask);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLdouble u1, GLdouble u2, GLint ustride, GLint uorder, GLdouble v1, GLdouble v2, GLint vstride, GLint vorder, GLdouble w1, GLdouble w2, GLint wstride, GLint worder, const(GLdouble)*points) PFNGLDEFORMATIONMAP3DSGIXPROC;
alias void function (GLenum target, GLfloat u1, GLfloat u2, GLint ustride, GLint uorder, GLfloat v1, GLfloat v2, GLint vstride, GLint vorder, GLfloat w1, GLfloat w2, GLint wstride, GLint worder, const(GLfloat)*points) PFNGLDEFORMATIONMAP3FSGIXPROC;
alias void function (GLbitfield mask) PFNGLDEFORMSGIXPROC;
alias void function (GLbitfield mask) PFNGLLOADIDENTITYDEFORMATIONMAPSGIXPROC;
}

version (GL_SGIX_reference_plane) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glReferencePlaneSGIX (const(GLdouble)*equation);
} /* GL_GLEXT_PROTOTYPES */
alias void function (const(GLdouble)*equation) PFNGLREFERENCEPLANESGIXPROC;
}

version (GL_SGIX_flush_raster) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glFlushRasterSGIX ();
} /* GL_GLEXT_PROTOTYPES */
alias void function () PFNGLFLUSHRASTERSGIXPROC;
}

version (GL_SGIX_depth_texture) {} else {
}

version (GL_SGIS_fog_function) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glFogFuncSGIS (GLsizei n, const(GLfloat)*points);
void glGetFogFuncSGIS (GLfloat *points);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLsizei n, const(GLfloat)*points) PFNGLFOGFUNCSGISPROC;
alias void function (GLfloat *points) PFNGLGETFOGFUNCSGISPROC;
}

version (GL_SGIX_fog_offset) {} else {
}

version (GL_HP_image_transform) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glImageTransformParameteriHP (GLenum target, GLenum pname, GLint param);
void glImageTransformParameterfHP (GLenum target, GLenum pname, GLfloat param);
void glImageTransformParameterivHP (GLenum target, GLenum pname, const(GLint)*params);
void glImageTransformParameterfvHP (GLenum target, GLenum pname, const(GLfloat)*params);
void glGetImageTransformParameterivHP (GLenum target, GLenum pname, GLint *params);
void glGetImageTransformParameterfvHP (GLenum target, GLenum pname, GLfloat *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum pname, GLint param) PFNGLIMAGETRANSFORMPARAMETERIHPPROC;
alias void function (GLenum target, GLenum pname, GLfloat param) PFNGLIMAGETRANSFORMPARAMETERFHPPROC;
alias void function (GLenum target, GLenum pname, const(GLint)*params) PFNGLIMAGETRANSFORMPARAMETERIVHPPROC;
alias void function (GLenum target, GLenum pname, const(GLfloat)*params) PFNGLIMAGETRANSFORMPARAMETERFVHPPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETIMAGETRANSFORMPARAMETERIVHPPROC;
alias void function (GLenum target, GLenum pname, GLfloat *params) PFNGLGETIMAGETRANSFORMPARAMETERFVHPPROC;
}

version (GL_HP_convolution_border_modes) {} else {
}

version (GL_SGIX_texture_add_env) {} else {
}

version (GL_EXT_color_subtable) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glColorSubTableEXT (GLenum target, GLsizei start, GLsizei count, GLenum format, GLenum type, const(GLvoid)*data);
void glCopyColorSubTableEXT (GLenum target, GLsizei start, GLint x, GLint y, GLsizei width);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLsizei start, GLsizei count, GLenum format, GLenum type, const(GLvoid)*data) PFNGLCOLORSUBTABLEEXTPROC;
alias void function (GLenum target, GLsizei start, GLint x, GLint y, GLsizei width) PFNGLCOPYCOLORSUBTABLEEXTPROC;
}

version (GL_PGI_vertex_hints) {} else {
}

version (GL_PGI_misc_hints) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glHintPGI (GLenum target, GLint mode);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLint mode) PFNGLHINTPGIPROC;
}

version (GL_EXT_paletted_texture) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glColorTableEXT (GLenum target, GLenum internalFormat, GLsizei width, GLenum format, GLenum type, const(GLvoid)*table);
void glGetColorTableEXT (GLenum target, GLenum format, GLenum type, GLvoid *data);
void glGetColorTableParameterivEXT (GLenum target, GLenum pname, GLint *params);
void glGetColorTableParameterfvEXT (GLenum target, GLenum pname, GLfloat *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum internalFormat, GLsizei width, GLenum format, GLenum type, const(GLvoid)*table) PFNGLCOLORTABLEEXTPROC;
alias void function (GLenum target, GLenum format, GLenum type, GLvoid *data) PFNGLGETCOLORTABLEEXTPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETCOLORTABLEPARAMETERIVEXTPROC;
alias void function (GLenum target, GLenum pname, GLfloat *params) PFNGLGETCOLORTABLEPARAMETERFVEXTPROC;
}

version (GL_EXT_clip_volume_hint) {} else {
}

version (GL_SGIX_list_priority) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGetListParameterfvSGIX (GLuint list, GLenum pname, GLfloat *params);
void glGetListParameterivSGIX (GLuint list, GLenum pname, GLint *params);
void glListParameterfSGIX (GLuint list, GLenum pname, GLfloat param);
void glListParameterfvSGIX (GLuint list, GLenum pname, const(GLfloat)*params);
void glListParameteriSGIX (GLuint list, GLenum pname, GLint param);
void glListParameterivSGIX (GLuint list, GLenum pname, const(GLint)*params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint list, GLenum pname, GLfloat *params) PFNGLGETLISTPARAMETERFVSGIXPROC;
alias void function (GLuint list, GLenum pname, GLint *params) PFNGLGETLISTPARAMETERIVSGIXPROC;
alias void function (GLuint list, GLenum pname, GLfloat param) PFNGLLISTPARAMETERFSGIXPROC;
alias void function (GLuint list, GLenum pname, const(GLfloat)*params) PFNGLLISTPARAMETERFVSGIXPROC;
alias void function (GLuint list, GLenum pname, GLint param) PFNGLLISTPARAMETERISGIXPROC;
alias void function (GLuint list, GLenum pname, const(GLint)*params) PFNGLLISTPARAMETERIVSGIXPROC;
}

version (GL_SGIX_ir_instrument1) {} else {
}

version (GL_SGIX_calligraphic_fragment) {} else {
}

version (GL_SGIX_texture_lod_bias) {} else {
}

version (GL_SGIX_shadow_ambient) {} else {
}

version (GL_EXT_index_texture) {} else {
}

version (GL_EXT_index_material) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glIndexMaterialEXT (GLenum face, GLenum mode);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum face, GLenum mode) PFNGLINDEXMATERIALEXTPROC;
}

version (GL_EXT_index_func) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glIndexFuncEXT (GLenum, GLclampf); // func, ref
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum, GLclampf) PFNGLINDEXFUNCEXTPROC; // func, ref
}

version (GL_EXT_index_array_formats) {} else {
}

version (GL_EXT_compiled_vertex_array) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glLockArraysEXT (GLint first, GLsizei count);
void glUnlockArraysEXT ();
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLint first, GLsizei count) PFNGLLOCKARRAYSEXTPROC;
alias void function () PFNGLUNLOCKARRAYSEXTPROC;
}

version (GL_EXT_cull_vertex) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glCullParameterdvEXT (GLenum pname, GLdouble *params);
void glCullParameterfvEXT (GLenum pname, GLfloat *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum pname, GLdouble *params) PFNGLCULLPARAMETERDVEXTPROC;
alias void function (GLenum pname, GLfloat *params) PFNGLCULLPARAMETERFVEXTPROC;
}

version (GL_SGIX_ycrcb) {} else {
}

version (GL_SGIX_fragment_lighting) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glFragmentColorMaterialSGIX (GLenum face, GLenum mode);
void glFragmentLightfSGIX (GLenum light, GLenum pname, GLfloat param);
void glFragmentLightfvSGIX (GLenum light, GLenum pname, const(GLfloat)*params);
void glFragmentLightiSGIX (GLenum light, GLenum pname, GLint param);
void glFragmentLightivSGIX (GLenum light, GLenum pname, const(GLint)*params);
void glFragmentLightModelfSGIX (GLenum pname, GLfloat param);
void glFragmentLightModelfvSGIX (GLenum pname, const(GLfloat)*params);
void glFragmentLightModeliSGIX (GLenum pname, GLint param);
void glFragmentLightModelivSGIX (GLenum pname, const(GLint)*params);
void glFragmentMaterialfSGIX (GLenum face, GLenum pname, GLfloat param);
void glFragmentMaterialfvSGIX (GLenum face, GLenum pname, const(GLfloat)*params);
void glFragmentMaterialiSGIX (GLenum face, GLenum pname, GLint param);
void glFragmentMaterialivSGIX (GLenum face, GLenum pname, const(GLint)*params);
void glGetFragmentLightfvSGIX (GLenum light, GLenum pname, GLfloat *params);
void glGetFragmentLightivSGIX (GLenum light, GLenum pname, GLint *params);
void glGetFragmentMaterialfvSGIX (GLenum face, GLenum pname, GLfloat *params);
void glGetFragmentMaterialivSGIX (GLenum face, GLenum pname, GLint *params);
void glLightEnviSGIX (GLenum pname, GLint param);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum face, GLenum mode) PFNGLFRAGMENTCOLORMATERIALSGIXPROC;
alias void function (GLenum light, GLenum pname, GLfloat param) PFNGLFRAGMENTLIGHTFSGIXPROC;
alias void function (GLenum light, GLenum pname, const(GLfloat)*params) PFNGLFRAGMENTLIGHTFVSGIXPROC;
alias void function (GLenum light, GLenum pname, GLint param) PFNGLFRAGMENTLIGHTISGIXPROC;
alias void function (GLenum light, GLenum pname, const(GLint)*params) PFNGLFRAGMENTLIGHTIVSGIXPROC;
alias void function (GLenum pname, GLfloat param) PFNGLFRAGMENTLIGHTMODELFSGIXPROC;
alias void function (GLenum pname, const(GLfloat)*params) PFNGLFRAGMENTLIGHTMODELFVSGIXPROC;
alias void function (GLenum pname, GLint param) PFNGLFRAGMENTLIGHTMODELISGIXPROC;
alias void function (GLenum pname, const(GLint)*params) PFNGLFRAGMENTLIGHTMODELIVSGIXPROC;
alias void function (GLenum face, GLenum pname, GLfloat param) PFNGLFRAGMENTMATERIALFSGIXPROC;
alias void function (GLenum face, GLenum pname, const(GLfloat)*params) PFNGLFRAGMENTMATERIALFVSGIXPROC;
alias void function (GLenum face, GLenum pname, GLint param) PFNGLFRAGMENTMATERIALISGIXPROC;
alias void function (GLenum face, GLenum pname, const(GLint)*params) PFNGLFRAGMENTMATERIALIVSGIXPROC;
alias void function (GLenum light, GLenum pname, GLfloat *params) PFNGLGETFRAGMENTLIGHTFVSGIXPROC;
alias void function (GLenum light, GLenum pname, GLint *params) PFNGLGETFRAGMENTLIGHTIVSGIXPROC;
alias void function (GLenum face, GLenum pname, GLfloat *params) PFNGLGETFRAGMENTMATERIALFVSGIXPROC;
alias void function (GLenum face, GLenum pname, GLint *params) PFNGLGETFRAGMENTMATERIALIVSGIXPROC;
alias void function (GLenum pname, GLint param) PFNGLLIGHTENVISGIXPROC;
}

version (GL_IBM_rasterpos_clip) {} else {
}

version (GL_HP_texture_lighting) {} else {
}

version (GL_EXT_draw_range_elements) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDrawRangeElementsEXT (GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const(GLvoid)*indices);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const(GLvoid)*indices) PFNGLDRAWRANGEELEMENTSEXTPROC;
}

version (GL_WIN_phong_shading) {} else {
}

version (GL_WIN_specular_fog) {} else {
}

version (GL_EXT_light_texture) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glApplyTextureEXT (GLenum mode);
void glTextureLightEXT (GLenum pname);
void glTextureMaterialEXT (GLenum face, GLenum mode);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode) PFNGLAPPLYTEXTUREEXTPROC;
alias void function (GLenum pname) PFNGLTEXTURELIGHTEXTPROC;
alias void function (GLenum face, GLenum mode) PFNGLTEXTUREMATERIALEXTPROC;
}

version (GL_SGIX_blend_alpha_minmax) {} else {
}

version (GL_EXT_bgra) {} else {
}

version (GL_SGIX_async) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glAsyncMarkerSGIX (GLuint marker);
GLint glFinishAsyncSGIX (GLuint *markerp);
GLint glPollAsyncSGIX (GLuint *markerp);
GLuint glGenAsyncMarkersSGIX (GLsizei range);
void glDeleteAsyncMarkersSGIX (GLuint marker, GLsizei range);
GLboolean glIsAsyncMarkerSGIX (GLuint marker);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint marker) PFNGLASYNCMARKERSGIXPROC;
alias GLint function (GLuint *markerp) PFNGLFINISHASYNCSGIXPROC;
alias GLint function (GLuint *markerp) PFNGLPOLLASYNCSGIXPROC;
alias GLuint function (GLsizei range) PFNGLGENASYNCMARKERSSGIXPROC;
alias void function (GLuint marker, GLsizei range) PFNGLDELETEASYNCMARKERSSGIXPROC;
alias GLboolean function (GLuint marker) PFNGLISASYNCMARKERSGIXPROC;
}

version (GL_SGIX_async_pixel) {} else {
}

version (GL_SGIX_async_histogram) {} else {
}

version (GL_INTEL_parallel_arrays) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glVertexPointervINTEL (GLint size, GLenum type, const(GLvoid)* *pointer);
void glNormalPointervINTEL (GLenum type, const(GLvoid)* *pointer);
void glColorPointervINTEL (GLint size, GLenum type, const(GLvoid)* *pointer);
void glTexCoordPointervINTEL (GLint size, GLenum type, const(GLvoid)* *pointer);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLint size, GLenum type, const(GLvoid)* *pointer) PFNGLVERTEXPOINTERVINTELPROC;
alias void function (GLenum type, const(GLvoid)* *pointer) PFNGLNORMALPOINTERVINTELPROC;
alias void function (GLint size, GLenum type, const(GLvoid)* *pointer) PFNGLCOLORPOINTERVINTELPROC;
alias void function (GLint size, GLenum type, const(GLvoid)* *pointer) PFNGLTEXCOORDPOINTERVINTELPROC;
}

version (GL_HP_occlusion_test) {} else {
}

version (GL_EXT_pixel_transform) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glPixelTransformParameteriEXT (GLenum target, GLenum pname, GLint param);
void glPixelTransformParameterfEXT (GLenum target, GLenum pname, GLfloat param);
void glPixelTransformParameterivEXT (GLenum target, GLenum pname, const(GLint)*params);
void glPixelTransformParameterfvEXT (GLenum target, GLenum pname, const(GLfloat)*params);
void glGetPixelTransformParameterivEXT (GLenum target, GLenum pname, GLint *params);
void glGetPixelTransformParameterfvEXT (GLenum target, GLenum pname, GLfloat *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum pname, GLint param) PFNGLPIXELTRANSFORMPARAMETERIEXTPROC;
alias void function (GLenum target, GLenum pname, GLfloat param) PFNGLPIXELTRANSFORMPARAMETERFEXTPROC;
alias void function (GLenum target, GLenum pname, const(GLint)*params) PFNGLPIXELTRANSFORMPARAMETERIVEXTPROC;
alias void function (GLenum target, GLenum pname, const(GLfloat)*params) PFNGLPIXELTRANSFORMPARAMETERFVEXTPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETPIXELTRANSFORMPARAMETERIVEXTPROC;
alias void function (GLenum target, GLenum pname, GLfloat *params) PFNGLGETPIXELTRANSFORMPARAMETERFVEXTPROC;
}

version (GL_EXT_pixel_transform_color_table) {} else {
}

version (GL_EXT_shared_texture_palette) {} else {
}

version (GL_EXT_separate_specular_color) {} else {
}

version (GL_EXT_secondary_color) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glSecondaryColor3bEXT (GLbyte red, GLbyte green, GLbyte blue);
void glSecondaryColor3bvEXT (const(GLbyte)*v);
void glSecondaryColor3dEXT (GLdouble red, GLdouble green, GLdouble blue);
void glSecondaryColor3dvEXT (const(GLdouble)*v);
void glSecondaryColor3fEXT (GLfloat red, GLfloat green, GLfloat blue);
void glSecondaryColor3fvEXT (const(GLfloat)*v);
void glSecondaryColor3iEXT (GLint red, GLint green, GLint blue);
void glSecondaryColor3ivEXT (const(GLint)*v);
void glSecondaryColor3sEXT (GLshort red, GLshort green, GLshort blue);
void glSecondaryColor3svEXT (const(GLshort)*v);
void glSecondaryColor3ubEXT (GLubyte red, GLubyte green, GLubyte blue);
void glSecondaryColor3ubvEXT (const(GLubyte)*v);
void glSecondaryColor3uiEXT (GLuint red, GLuint green, GLuint blue);
void glSecondaryColor3uivEXT (const(GLuint)*v);
void glSecondaryColor3usEXT (GLushort red, GLushort green, GLushort blue);
void glSecondaryColor3usvEXT (const(GLushort)*v);
void glSecondaryColorPointerEXT (GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLbyte red, GLbyte green, GLbyte blue) PFNGLSECONDARYCOLOR3BEXTPROC;
alias void function (const(GLbyte)*v) PFNGLSECONDARYCOLOR3BVEXTPROC;
alias void function (GLdouble red, GLdouble green, GLdouble blue) PFNGLSECONDARYCOLOR3DEXTPROC;
alias void function (const(GLdouble)*v) PFNGLSECONDARYCOLOR3DVEXTPROC;
alias void function (GLfloat red, GLfloat green, GLfloat blue) PFNGLSECONDARYCOLOR3FEXTPROC;
alias void function (const(GLfloat)*v) PFNGLSECONDARYCOLOR3FVEXTPROC;
alias void function (GLint red, GLint green, GLint blue) PFNGLSECONDARYCOLOR3IEXTPROC;
alias void function (const(GLint)*v) PFNGLSECONDARYCOLOR3IVEXTPROC;
alias void function (GLshort red, GLshort green, GLshort blue) PFNGLSECONDARYCOLOR3SEXTPROC;
alias void function (const(GLshort)*v) PFNGLSECONDARYCOLOR3SVEXTPROC;
alias void function (GLubyte red, GLubyte green, GLubyte blue) PFNGLSECONDARYCOLOR3UBEXTPROC;
alias void function (const(GLubyte)*v) PFNGLSECONDARYCOLOR3UBVEXTPROC;
alias void function (GLuint red, GLuint green, GLuint blue) PFNGLSECONDARYCOLOR3UIEXTPROC;
alias void function (const(GLuint)*v) PFNGLSECONDARYCOLOR3UIVEXTPROC;
alias void function (GLushort red, GLushort green, GLushort blue) PFNGLSECONDARYCOLOR3USEXTPROC;
alias void function (const(GLushort)*v) PFNGLSECONDARYCOLOR3USVEXTPROC;
alias void function (GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer) PFNGLSECONDARYCOLORPOINTEREXTPROC;
}

version (GL_EXT_texture_perturb_normal) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTextureNormalEXT (GLenum mode);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode) PFNGLTEXTURENORMALEXTPROC;
}

version (GL_EXT_multi_draw_arrays) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glMultiDrawArraysEXT (GLenum mode, const(GLint)*first, const(GLsizei)*count, GLsizei primcount);
void glMultiDrawElementsEXT (GLenum mode, const(GLsizei)*count, GLenum type, const(GLvoid)* *indices, GLsizei primcount);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode, const(GLint)*first, const(GLsizei)*count, GLsizei primcount) PFNGLMULTIDRAWARRAYSEXTPROC;
alias void function (GLenum mode, const(GLsizei)*count, GLenum type, const(GLvoid)* *indices, GLsizei primcount) PFNGLMULTIDRAWELEMENTSEXTPROC;
}

version (GL_EXT_fog_coord) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glFogCoordfEXT (GLfloat coord);
void glFogCoordfvEXT (const(GLfloat)*coord);
void glFogCoorddEXT (GLdouble coord);
void glFogCoorddvEXT (const(GLdouble)*coord);
void glFogCoordPointerEXT (GLenum type, GLsizei stride, const(GLvoid)*pointer);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLfloat coord) PFNGLFOGCOORDFEXTPROC;
alias void function (const(GLfloat)*coord) PFNGLFOGCOORDFVEXTPROC;
alias void function (GLdouble coord) PFNGLFOGCOORDDEXTPROC;
alias void function (const(GLdouble)*coord) PFNGLFOGCOORDDVEXTPROC;
alias void function (GLenum type, GLsizei stride, const(GLvoid)*pointer) PFNGLFOGCOORDPOINTEREXTPROC;
}

version (GL_REND_screen_coordinates) {} else {
}

version (GL_EXT_coordinate_frame) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTangent3bEXT (GLbyte tx, GLbyte ty, GLbyte tz);
void glTangent3bvEXT (const(GLbyte)*v);
void glTangent3dEXT (GLdouble tx, GLdouble ty, GLdouble tz);
void glTangent3dvEXT (const(GLdouble)*v);
void glTangent3fEXT (GLfloat tx, GLfloat ty, GLfloat tz);
void glTangent3fvEXT (const(GLfloat)*v);
void glTangent3iEXT (GLint tx, GLint ty, GLint tz);
void glTangent3ivEXT (const(GLint)*v);
void glTangent3sEXT (GLshort tx, GLshort ty, GLshort tz);
void glTangent3svEXT (const(GLshort)*v);
void glBinormal3bEXT (GLbyte bx, GLbyte by, GLbyte bz);
void glBinormal3bvEXT (const(GLbyte)*v);
void glBinormal3dEXT (GLdouble bx, GLdouble by, GLdouble bz);
void glBinormal3dvEXT (const(GLdouble)*v);
void glBinormal3fEXT (GLfloat bx, GLfloat by, GLfloat bz);
void glBinormal3fvEXT (const(GLfloat)*v);
void glBinormal3iEXT (GLint bx, GLint by, GLint bz);
void glBinormal3ivEXT (const(GLint)*v);
void glBinormal3sEXT (GLshort bx, GLshort by, GLshort bz);
void glBinormal3svEXT (const(GLshort)*v);
void glTangentPointerEXT (GLenum type, GLsizei stride, const(GLvoid)*pointer);
void glBinormalPointerEXT (GLenum type, GLsizei stride, const(GLvoid)*pointer);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLbyte tx, GLbyte ty, GLbyte tz) PFNGLTANGENT3BEXTPROC;
alias void function (const(GLbyte)*v) PFNGLTANGENT3BVEXTPROC;
alias void function (GLdouble tx, GLdouble ty, GLdouble tz) PFNGLTANGENT3DEXTPROC;
alias void function (const(GLdouble)*v) PFNGLTANGENT3DVEXTPROC;
alias void function (GLfloat tx, GLfloat ty, GLfloat tz) PFNGLTANGENT3FEXTPROC;
alias void function (const(GLfloat)*v) PFNGLTANGENT3FVEXTPROC;
alias void function (GLint tx, GLint ty, GLint tz) PFNGLTANGENT3IEXTPROC;
alias void function (const(GLint)*v) PFNGLTANGENT3IVEXTPROC;
alias void function (GLshort tx, GLshort ty, GLshort tz) PFNGLTANGENT3SEXTPROC;
alias void function (const(GLshort)*v) PFNGLTANGENT3SVEXTPROC;
alias void function (GLbyte bx, GLbyte by, GLbyte bz) PFNGLBINORMAL3BEXTPROC;
alias void function (const(GLbyte)*v) PFNGLBINORMAL3BVEXTPROC;
alias void function (GLdouble bx, GLdouble by, GLdouble bz) PFNGLBINORMAL3DEXTPROC;
alias void function (const(GLdouble)*v) PFNGLBINORMAL3DVEXTPROC;
alias void function (GLfloat bx, GLfloat by, GLfloat bz) PFNGLBINORMAL3FEXTPROC;
alias void function (const(GLfloat)*v) PFNGLBINORMAL3FVEXTPROC;
alias void function (GLint bx, GLint by, GLint bz) PFNGLBINORMAL3IEXTPROC;
alias void function (const(GLint)*v) PFNGLBINORMAL3IVEXTPROC;
alias void function (GLshort bx, GLshort by, GLshort bz) PFNGLBINORMAL3SEXTPROC;
alias void function (const(GLshort)*v) PFNGLBINORMAL3SVEXTPROC;
alias void function (GLenum type, GLsizei stride, const(GLvoid)*pointer) PFNGLTANGENTPOINTEREXTPROC;
alias void function (GLenum type, GLsizei stride, const(GLvoid)*pointer) PFNGLBINORMALPOINTEREXTPROC;
}

version (GL_EXT_texture_env_combine) {} else {
}

version (GL_APPLE_specular_vector) {} else {
}

version (GL_APPLE_transform_hint) {} else {
}

version (GL_SGIX_fog_scale) {} else {
}

version (GL_SUNX_constant_data) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glFinishTextureSUNX ();
} /* GL_GLEXT_PROTOTYPES */
alias void function () PFNGLFINISHTEXTURESUNXPROC;
}

version (GL_SUN_global_alpha) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGlobalAlphaFactorbSUN (GLbyte factor);
void glGlobalAlphaFactorsSUN (GLshort factor);
void glGlobalAlphaFactoriSUN (GLint factor);
void glGlobalAlphaFactorfSUN (GLfloat factor);
void glGlobalAlphaFactordSUN (GLdouble factor);
void glGlobalAlphaFactorubSUN (GLubyte factor);
void glGlobalAlphaFactorusSUN (GLushort factor);
void glGlobalAlphaFactoruiSUN (GLuint factor);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLbyte factor) PFNGLGLOBALALPHAFACTORBSUNPROC;
alias void function (GLshort factor) PFNGLGLOBALALPHAFACTORSSUNPROC;
alias void function (GLint factor) PFNGLGLOBALALPHAFACTORISUNPROC;
alias void function (GLfloat factor) PFNGLGLOBALALPHAFACTORFSUNPROC;
alias void function (GLdouble factor) PFNGLGLOBALALPHAFACTORDSUNPROC;
alias void function (GLubyte factor) PFNGLGLOBALALPHAFACTORUBSUNPROC;
alias void function (GLushort factor) PFNGLGLOBALALPHAFACTORUSSUNPROC;
alias void function (GLuint factor) PFNGLGLOBALALPHAFACTORUISUNPROC;
}

version (GL_SUN_triangle_list) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glReplacementCodeuiSUN (GLuint code);
void glReplacementCodeusSUN (GLushort code);
void glReplacementCodeubSUN (GLubyte code);
void glReplacementCodeuivSUN (const(GLuint)*code);
void glReplacementCodeusvSUN (const(GLushort)*code);
void glReplacementCodeubvSUN (const(GLubyte)*code);
void glReplacementCodePointerSUN (GLenum type, GLsizei stride, const(GLvoid)* *pointer);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint code) PFNGLREPLACEMENTCODEUISUNPROC;
alias void function (GLushort code) PFNGLREPLACEMENTCODEUSSUNPROC;
alias void function (GLubyte code) PFNGLREPLACEMENTCODEUBSUNPROC;
alias void function (const(GLuint)*code) PFNGLREPLACEMENTCODEUIVSUNPROC;
alias void function (const(GLushort)*code) PFNGLREPLACEMENTCODEUSVSUNPROC;
alias void function (const(GLubyte)*code) PFNGLREPLACEMENTCODEUBVSUNPROC;
alias void function (GLenum type, GLsizei stride, const(GLvoid)* *pointer) PFNGLREPLACEMENTCODEPOINTERSUNPROC;
}

version (GL_SUN_vertex) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glColor4ubVertex2fSUN (GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y);
void glColor4ubVertex2fvSUN (const(GLubyte)*c, const(GLfloat)*v);
void glColor4ubVertex3fSUN (GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z);
void glColor4ubVertex3fvSUN (const(GLubyte)*c, const(GLfloat)*v);
void glColor3fVertex3fSUN (GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z);
void glColor3fVertex3fvSUN (const(GLfloat)*c, const(GLfloat)*v);
void glNormal3fVertex3fSUN (GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
void glNormal3fVertex3fvSUN (const(GLfloat)*n, const(GLfloat)*v);
void glColor4fNormal3fVertex3fSUN (GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
void glColor4fNormal3fVertex3fvSUN (const(GLfloat)*c, const(GLfloat)*n, const(GLfloat)*v);
void glTexCoord2fVertex3fSUN (GLfloat s, GLfloat t, GLfloat x, GLfloat y, GLfloat z);
void glTexCoord2fVertex3fvSUN (const(GLfloat)*tc, const(GLfloat)*v);
void glTexCoord4fVertex4fSUN (GLfloat s, GLfloat t, GLfloat p, GLfloat q, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glTexCoord4fVertex4fvSUN (const(GLfloat)*tc, const(GLfloat)*v);
void glTexCoord2fColor4ubVertex3fSUN (GLfloat s, GLfloat t, GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z);
void glTexCoord2fColor4ubVertex3fvSUN (const(GLfloat)*tc, const(GLubyte)*c, const(GLfloat)*v);
void glTexCoord2fColor3fVertex3fSUN (GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z);
void glTexCoord2fColor3fVertex3fvSUN (const(GLfloat)*tc, const(GLfloat)*c, const(GLfloat)*v);
void glTexCoord2fNormal3fVertex3fSUN (GLfloat s, GLfloat t, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
void glTexCoord2fNormal3fVertex3fvSUN (const(GLfloat)*tc, const(GLfloat)*n, const(GLfloat)*v);
void glTexCoord2fColor4fNormal3fVertex3fSUN (GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
void glTexCoord2fColor4fNormal3fVertex3fvSUN (const(GLfloat)*tc, const(GLfloat)*c, const(GLfloat)*n, const(GLfloat)*v);
void glTexCoord4fColor4fNormal3fVertex4fSUN (GLfloat s, GLfloat t, GLfloat p, GLfloat q, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glTexCoord4fColor4fNormal3fVertex4fvSUN (const(GLfloat)*tc, const(GLfloat)*c, const(GLfloat)*n, const(GLfloat)*v);
void glReplacementCodeuiVertex3fSUN (GLuint rc, GLfloat x, GLfloat y, GLfloat z);
void glReplacementCodeuiVertex3fvSUN (const(GLuint)*rc, const(GLfloat)*v);
void glReplacementCodeuiColor4ubVertex3fSUN (GLuint rc, GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z);
void glReplacementCodeuiColor4ubVertex3fvSUN (const(GLuint)*rc, const(GLubyte)*c, const(GLfloat)*v);
void glReplacementCodeuiColor3fVertex3fSUN (GLuint rc, GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z);
void glReplacementCodeuiColor3fVertex3fvSUN (const(GLuint)*rc, const(GLfloat)*c, const(GLfloat)*v);
void glReplacementCodeuiNormal3fVertex3fSUN (GLuint rc, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
void glReplacementCodeuiNormal3fVertex3fvSUN (const(GLuint)*rc, const(GLfloat)*n, const(GLfloat)*v);
void glReplacementCodeuiColor4fNormal3fVertex3fSUN (GLuint rc, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
void glReplacementCodeuiColor4fNormal3fVertex3fvSUN (const(GLuint)*rc, const(GLfloat)*c, const(GLfloat)*n, const(GLfloat)*v);
void glReplacementCodeuiTexCoord2fVertex3fSUN (GLuint rc, GLfloat s, GLfloat t, GLfloat x, GLfloat y, GLfloat z);
void glReplacementCodeuiTexCoord2fVertex3fvSUN (const(GLuint)*rc, const(GLfloat)*tc, const(GLfloat)*v);
void glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN (GLuint rc, GLfloat s, GLfloat t, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
void glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN (const(GLuint)*rc, const(GLfloat)*tc, const(GLfloat)*n, const(GLfloat)*v);
void glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN (GLuint rc, GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z);
void glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN (const(GLuint)*rc, const(GLfloat)*tc, const(GLfloat)*c, const(GLfloat)*n, const(GLfloat)*v);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y) PFNGLCOLOR4UBVERTEX2FSUNPROC;
alias void function (const(GLubyte)*c, const(GLfloat)*v) PFNGLCOLOR4UBVERTEX2FVSUNPROC;
alias void function (GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z) PFNGLCOLOR4UBVERTEX3FSUNPROC;
alias void function (const(GLubyte)*c, const(GLfloat)*v) PFNGLCOLOR4UBVERTEX3FVSUNPROC;
alias void function (GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z) PFNGLCOLOR3FVERTEX3FSUNPROC;
alias void function (const(GLfloat)*c, const(GLfloat)*v) PFNGLCOLOR3FVERTEX3FVSUNPROC;
alias void function (GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z) PFNGLNORMAL3FVERTEX3FSUNPROC;
alias void function (const(GLfloat)*n, const(GLfloat)*v) PFNGLNORMAL3FVERTEX3FVSUNPROC;
alias void function (GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z) PFNGLCOLOR4FNORMAL3FVERTEX3FSUNPROC;
alias void function (const(GLfloat)*c, const(GLfloat)*n, const(GLfloat)*v) PFNGLCOLOR4FNORMAL3FVERTEX3FVSUNPROC;
alias void function (GLfloat s, GLfloat t, GLfloat x, GLfloat y, GLfloat z) PFNGLTEXCOORD2FVERTEX3FSUNPROC;
alias void function (const(GLfloat)*tc, const(GLfloat)*v) PFNGLTEXCOORD2FVERTEX3FVSUNPROC;
alias void function (GLfloat s, GLfloat t, GLfloat p, GLfloat q, GLfloat x, GLfloat y, GLfloat z, GLfloat w) PFNGLTEXCOORD4FVERTEX4FSUNPROC;
alias void function (const(GLfloat)*tc, const(GLfloat)*v) PFNGLTEXCOORD4FVERTEX4FVSUNPROC;
alias void function (GLfloat s, GLfloat t, GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z) PFNGLTEXCOORD2FCOLOR4UBVERTEX3FSUNPROC;
alias void function (const(GLfloat)*tc, const(GLubyte)*c, const(GLfloat)*v) PFNGLTEXCOORD2FCOLOR4UBVERTEX3FVSUNPROC;
alias void function (GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z) PFNGLTEXCOORD2FCOLOR3FVERTEX3FSUNPROC;
alias void function (const(GLfloat)*tc, const(GLfloat)*c, const(GLfloat)*v) PFNGLTEXCOORD2FCOLOR3FVERTEX3FVSUNPROC;
alias void function (GLfloat s, GLfloat t, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z) PFNGLTEXCOORD2FNORMAL3FVERTEX3FSUNPROC;
alias void function (const(GLfloat)*tc, const(GLfloat)*n, const(GLfloat)*v) PFNGLTEXCOORD2FNORMAL3FVERTEX3FVSUNPROC;
alias void function (GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z) PFNGLTEXCOORD2FCOLOR4FNORMAL3FVERTEX3FSUNPROC;
alias void function (const(GLfloat)*tc, const(GLfloat)*c, const(GLfloat)*n, const(GLfloat)*v) PFNGLTEXCOORD2FCOLOR4FNORMAL3FVERTEX3FVSUNPROC;
alias void function (GLfloat s, GLfloat t, GLfloat p, GLfloat q, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z, GLfloat w) PFNGLTEXCOORD4FCOLOR4FNORMAL3FVERTEX4FSUNPROC;
alias void function (const(GLfloat)*tc, const(GLfloat)*c, const(GLfloat)*n, const(GLfloat)*v) PFNGLTEXCOORD4FCOLOR4FNORMAL3FVERTEX4FVSUNPROC;
alias void function (GLuint rc, GLfloat x, GLfloat y, GLfloat z) PFNGLREPLACEMENTCODEUIVERTEX3FSUNPROC;
alias void function (const(GLuint)*rc, const(GLfloat)*v) PFNGLREPLACEMENTCODEUIVERTEX3FVSUNPROC;
alias void function (GLuint rc, GLubyte r, GLubyte g, GLubyte b, GLubyte a, GLfloat x, GLfloat y, GLfloat z) PFNGLREPLACEMENTCODEUICOLOR4UBVERTEX3FSUNPROC;
alias void function (const(GLuint)*rc, const(GLubyte)*c, const(GLfloat)*v) PFNGLREPLACEMENTCODEUICOLOR4UBVERTEX3FVSUNPROC;
alias void function (GLuint rc, GLfloat r, GLfloat g, GLfloat b, GLfloat x, GLfloat y, GLfloat z) PFNGLREPLACEMENTCODEUICOLOR3FVERTEX3FSUNPROC;
alias void function (const(GLuint)*rc, const(GLfloat)*c, const(GLfloat)*v) PFNGLREPLACEMENTCODEUICOLOR3FVERTEX3FVSUNPROC;
alias void function (GLuint rc, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z) PFNGLREPLACEMENTCODEUINORMAL3FVERTEX3FSUNPROC;
alias void function (const(GLuint)*rc, const(GLfloat)*n, const(GLfloat)*v) PFNGLREPLACEMENTCODEUINORMAL3FVERTEX3FVSUNPROC;
alias void function (GLuint rc, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z) PFNGLREPLACEMENTCODEUICOLOR4FNORMAL3FVERTEX3FSUNPROC;
alias void function (const(GLuint)*rc, const(GLfloat)*c, const(GLfloat)*n, const(GLfloat)*v) PFNGLREPLACEMENTCODEUICOLOR4FNORMAL3FVERTEX3FVSUNPROC;
alias void function (GLuint rc, GLfloat s, GLfloat t, GLfloat x, GLfloat y, GLfloat z) PFNGLREPLACEMENTCODEUITEXCOORD2FVERTEX3FSUNPROC;
alias void function (const(GLuint)*rc, const(GLfloat)*tc, const(GLfloat)*v) PFNGLREPLACEMENTCODEUITEXCOORD2FVERTEX3FVSUNPROC;
alias void function (GLuint rc, GLfloat s, GLfloat t, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z) PFNGLREPLACEMENTCODEUITEXCOORD2FNORMAL3FVERTEX3FSUNPROC;
alias void function (const(GLuint)*rc, const(GLfloat)*tc, const(GLfloat)*n, const(GLfloat)*v) PFNGLREPLACEMENTCODEUITEXCOORD2FNORMAL3FVERTEX3FVSUNPROC;
alias void function (GLuint rc, GLfloat s, GLfloat t, GLfloat r, GLfloat g, GLfloat b, GLfloat a, GLfloat nx, GLfloat ny, GLfloat nz, GLfloat x, GLfloat y, GLfloat z) PFNGLREPLACEMENTCODEUITEXCOORD2FCOLOR4FNORMAL3FVERTEX3FSUNPROC;
alias void function (const(GLuint)*rc, const(GLfloat)*tc, const(GLfloat)*c, const(GLfloat)*n, const(GLfloat)*v) PFNGLREPLACEMENTCODEUITEXCOORD2FCOLOR4FNORMAL3FVERTEX3FVSUNPROC;
}

version (GL_EXT_blend_func_separate) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBlendFuncSeparateEXT (GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha) PFNGLBLENDFUNCSEPARATEEXTPROC;
}

version (GL_INGR_blend_func_separate) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBlendFuncSeparateINGR (GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha) PFNGLBLENDFUNCSEPARATEINGRPROC;
}

version (GL_INGR_color_clamp) {} else {
}

version (GL_INGR_interlace_read) {} else {
}

version (GL_EXT_stencil_wrap) {} else {
}

version (GL_EXT_422_pixels) {} else {
}

version (GL_NV_texgen_reflection) {} else {
}

version (GL_SUN_convolution_border_modes) {} else {
}

version (GL_EXT_texture_env_add) {} else {
}

version (GL_EXT_texture_lod_bias) {} else {
}

version (GL_EXT_texture_filter_anisotropic) {} else {
}

version (GL_EXT_vertex_weighting) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glVertexWeightfEXT (GLfloat weight);
void glVertexWeightfvEXT (const(GLfloat)*weight);
void glVertexWeightPointerEXT (GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLfloat weight) PFNGLVERTEXWEIGHTFEXTPROC;
alias void function (const(GLfloat)*weight) PFNGLVERTEXWEIGHTFVEXTPROC;
alias void function (GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer) PFNGLVERTEXWEIGHTPOINTEREXTPROC;
}

version (GL_NV_light_max_exponent) {} else {
}

version (GL_NV_vertex_array_range) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glFlushVertexArrayRangeNV ();
void glVertexArrayRangeNV (GLsizei length, const(GLvoid)*pointer);
} /* GL_GLEXT_PROTOTYPES */
alias void function () PFNGLFLUSHVERTEXARRAYRANGENVPROC;
alias void function (GLsizei length, const(GLvoid)*pointer) PFNGLVERTEXARRAYRANGENVPROC;
}

version (GL_NV_register_combiners) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glCombinerParameterfvNV (GLenum pname, const(GLfloat)*params);
void glCombinerParameterfNV (GLenum pname, GLfloat param);
void glCombinerParameterivNV (GLenum pname, const(GLint)*params);
void glCombinerParameteriNV (GLenum pname, GLint param);
void glCombinerInputNV (GLenum stage, GLenum portion, GLenum variable, GLenum input, GLenum mapping, GLenum componentUsage);
void glCombinerOutputNV (GLenum stage, GLenum portion, GLenum abOutput, GLenum cdOutput, GLenum sumOutput, GLenum scale, GLenum bias, GLboolean abDotProduct, GLboolean cdDotProduct, GLboolean muxSum);
void glFinalCombinerInputNV (GLenum variable, GLenum input, GLenum mapping, GLenum componentUsage);
void glGetCombinerInputParameterfvNV (GLenum stage, GLenum portion, GLenum variable, GLenum pname, GLfloat *params);
void glGetCombinerInputParameterivNV (GLenum stage, GLenum portion, GLenum variable, GLenum pname, GLint *params);
void glGetCombinerOutputParameterfvNV (GLenum stage, GLenum portion, GLenum pname, GLfloat *params);
void glGetCombinerOutputParameterivNV (GLenum stage, GLenum portion, GLenum pname, GLint *params);
void glGetFinalCombinerInputParameterfvNV (GLenum variable, GLenum pname, GLfloat *params);
void glGetFinalCombinerInputParameterivNV (GLenum variable, GLenum pname, GLint *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum pname, const(GLfloat)*params) PFNGLCOMBINERPARAMETERFVNVPROC;
alias void function (GLenum pname, GLfloat param) PFNGLCOMBINERPARAMETERFNVPROC;
alias void function (GLenum pname, const(GLint)*params) PFNGLCOMBINERPARAMETERIVNVPROC;
alias void function (GLenum pname, GLint param) PFNGLCOMBINERPARAMETERINVPROC;
alias void function (GLenum stage, GLenum portion, GLenum variable, GLenum input, GLenum mapping, GLenum componentUsage) PFNGLCOMBINERINPUTNVPROC;
alias void function (GLenum stage, GLenum portion, GLenum abOutput, GLenum cdOutput, GLenum sumOutput, GLenum scale, GLenum bias, GLboolean abDotProduct, GLboolean cdDotProduct, GLboolean muxSum) PFNGLCOMBINEROUTPUTNVPROC;
alias void function (GLenum variable, GLenum input, GLenum mapping, GLenum componentUsage) PFNGLFINALCOMBINERINPUTNVPROC;
alias void function (GLenum stage, GLenum portion, GLenum variable, GLenum pname, GLfloat *params) PFNGLGETCOMBINERINPUTPARAMETERFVNVPROC;
alias void function (GLenum stage, GLenum portion, GLenum variable, GLenum pname, GLint *params) PFNGLGETCOMBINERINPUTPARAMETERIVNVPROC;
alias void function (GLenum stage, GLenum portion, GLenum pname, GLfloat *params) PFNGLGETCOMBINEROUTPUTPARAMETERFVNVPROC;
alias void function (GLenum stage, GLenum portion, GLenum pname, GLint *params) PFNGLGETCOMBINEROUTPUTPARAMETERIVNVPROC;
alias void function (GLenum variable, GLenum pname, GLfloat *params) PFNGLGETFINALCOMBINERINPUTPARAMETERFVNVPROC;
alias void function (GLenum variable, GLenum pname, GLint *params) PFNGLGETFINALCOMBINERINPUTPARAMETERIVNVPROC;
}

version (GL_NV_fog_distance) {} else {
}

version (GL_NV_texgen_emboss) {} else {
}

version (GL_NV_blend_square) {} else {
}

version (GL_NV_texture_env_combine4) {} else {
}

version (GL_MESA_resize_buffers) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glResizeBuffersMESA ();
} /* GL_GLEXT_PROTOTYPES */
alias void function () PFNGLRESIZEBUFFERSMESAPROC;
}

version (GL_MESA_window_pos) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glWindowPos2dMESA (GLdouble x, GLdouble y);
void glWindowPos2dvMESA (const(GLdouble)*v);
void glWindowPos2fMESA (GLfloat x, GLfloat y);
void glWindowPos2fvMESA (const(GLfloat)*v);
void glWindowPos2iMESA (GLint x, GLint y);
void glWindowPos2ivMESA (const(GLint)*v);
void glWindowPos2sMESA (GLshort x, GLshort y);
void glWindowPos2svMESA (const(GLshort)*v);
void glWindowPos3dMESA (GLdouble x, GLdouble y, GLdouble z);
void glWindowPos3dvMESA (const(GLdouble)*v);
void glWindowPos3fMESA (GLfloat x, GLfloat y, GLfloat z);
void glWindowPos3fvMESA (const(GLfloat)*v);
void glWindowPos3iMESA (GLint x, GLint y, GLint z);
void glWindowPos3ivMESA (const(GLint)*v);
void glWindowPos3sMESA (GLshort x, GLshort y, GLshort z);
void glWindowPos3svMESA (const(GLshort)*v);
void glWindowPos4dMESA (GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glWindowPos4dvMESA (const(GLdouble)*v);
void glWindowPos4fMESA (GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glWindowPos4fvMESA (const(GLfloat)*v);
void glWindowPos4iMESA (GLint x, GLint y, GLint z, GLint w);
void glWindowPos4ivMESA (const(GLint)*v);
void glWindowPos4sMESA (GLshort x, GLshort y, GLshort z, GLshort w);
void glWindowPos4svMESA (const(GLshort)*v);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLdouble x, GLdouble y) PFNGLWINDOWPOS2DMESAPROC;
alias void function (const(GLdouble)*v) PFNGLWINDOWPOS2DVMESAPROC;
alias void function (GLfloat x, GLfloat y) PFNGLWINDOWPOS2FMESAPROC;
alias void function (const(GLfloat)*v) PFNGLWINDOWPOS2FVMESAPROC;
alias void function (GLint x, GLint y) PFNGLWINDOWPOS2IMESAPROC;
alias void function (const(GLint)*v) PFNGLWINDOWPOS2IVMESAPROC;
alias void function (GLshort x, GLshort y) PFNGLWINDOWPOS2SMESAPROC;
alias void function (const(GLshort)*v) PFNGLWINDOWPOS2SVMESAPROC;
alias void function (GLdouble x, GLdouble y, GLdouble z) PFNGLWINDOWPOS3DMESAPROC;
alias void function (const(GLdouble)*v) PFNGLWINDOWPOS3DVMESAPROC;
alias void function (GLfloat x, GLfloat y, GLfloat z) PFNGLWINDOWPOS3FMESAPROC;
alias void function (const(GLfloat)*v) PFNGLWINDOWPOS3FVMESAPROC;
alias void function (GLint x, GLint y, GLint z) PFNGLWINDOWPOS3IMESAPROC;
alias void function (const(GLint)*v) PFNGLWINDOWPOS3IVMESAPROC;
alias void function (GLshort x, GLshort y, GLshort z) PFNGLWINDOWPOS3SMESAPROC;
alias void function (const(GLshort)*v) PFNGLWINDOWPOS3SVMESAPROC;
alias void function (GLdouble x, GLdouble y, GLdouble z, GLdouble w) PFNGLWINDOWPOS4DMESAPROC;
alias void function (const(GLdouble)*v) PFNGLWINDOWPOS4DVMESAPROC;
alias void function (GLfloat x, GLfloat y, GLfloat z, GLfloat w) PFNGLWINDOWPOS4FMESAPROC;
alias void function (const(GLfloat)*v) PFNGLWINDOWPOS4FVMESAPROC;
alias void function (GLint x, GLint y, GLint z, GLint w) PFNGLWINDOWPOS4IMESAPROC;
alias void function (const(GLint)*v) PFNGLWINDOWPOS4IVMESAPROC;
alias void function (GLshort x, GLshort y, GLshort z, GLshort w) PFNGLWINDOWPOS4SMESAPROC;
alias void function (const(GLshort)*v) PFNGLWINDOWPOS4SVMESAPROC;
}

version (GL_IBM_cull_vertex) {} else {
}

version (GL_IBM_multimode_draw_arrays) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glMultiModeDrawArraysIBM (const(GLenum)*mode, const(GLint)*first, const(GLsizei)*count, GLsizei primcount, GLint modestride);
void glMultiModeDrawElementsIBM (const(GLenum)*mode, const(GLsizei)*count, GLenum type, const(GLvoid*)*indices, GLsizei primcount, GLint modestride);
} /* GL_GLEXT_PROTOTYPES */
alias void function (const(GLenum)*mode, const(GLint)*first, const(GLsizei)*count, GLsizei primcount, GLint modestride) PFNGLMULTIMODEDRAWARRAYSIBMPROC;
alias void function (const(GLenum)*mode, const(GLsizei)*count, GLenum type, const(GLvoid*)*indices, GLsizei primcount, GLint modestride) PFNGLMULTIMODEDRAWELEMENTSIBMPROC;
}

version (GL_IBM_vertex_array_lists) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glColorPointerListIBM (GLint size, GLenum type, GLint stride, const(GLvoid)* *pointer, GLint ptrstride);
void glSecondaryColorPointerListIBM (GLint size, GLenum type, GLint stride, const(GLvoid)* *pointer, GLint ptrstride);
void glEdgeFlagPointerListIBM (GLint stride, const(GLboolean)* *pointer, GLint ptrstride);
void glFogCoordPointerListIBM (GLenum type, GLint stride, const(GLvoid)* *pointer, GLint ptrstride);
void glIndexPointerListIBM (GLenum type, GLint stride, const(GLvoid)* *pointer, GLint ptrstride);
void glNormalPointerListIBM (GLenum type, GLint stride, const(GLvoid)* *pointer, GLint ptrstride);
void glTexCoordPointerListIBM (GLint size, GLenum type, GLint stride, const(GLvoid)* *pointer, GLint ptrstride);
void glVertexPointerListIBM (GLint size, GLenum type, GLint stride, const(GLvoid)* *pointer, GLint ptrstride);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLint size, GLenum type, GLint stride, const(GLvoid)* *pointer, GLint ptrstride) PFNGLCOLORPOINTERLISTIBMPROC;
alias void function (GLint size, GLenum type, GLint stride, const(GLvoid)* *pointer, GLint ptrstride) PFNGLSECONDARYCOLORPOINTERLISTIBMPROC;
alias void function (GLint stride, const(GLboolean)* *pointer, GLint ptrstride) PFNGLEDGEFLAGPOINTERLISTIBMPROC;
alias void function (GLenum type, GLint stride, const(GLvoid)* *pointer, GLint ptrstride) PFNGLFOGCOORDPOINTERLISTIBMPROC;
alias void function (GLenum type, GLint stride, const(GLvoid)* *pointer, GLint ptrstride) PFNGLINDEXPOINTERLISTIBMPROC;
alias void function (GLenum type, GLint stride, const(GLvoid)* *pointer, GLint ptrstride) PFNGLNORMALPOINTERLISTIBMPROC;
alias void function (GLint size, GLenum type, GLint stride, const(GLvoid)* *pointer, GLint ptrstride) PFNGLTEXCOORDPOINTERLISTIBMPROC;
alias void function (GLint size, GLenum type, GLint stride, const(GLvoid)* *pointer, GLint ptrstride) PFNGLVERTEXPOINTERLISTIBMPROC;
}

version (GL_SGIX_subsample) {} else {
}

version (GL_SGIX_ycrcba) {} else {
}

version (GL_SGIX_ycrcb_subsample) {} else {
}

version (GL_SGIX_depth_pass_instrument) {} else {
}

version (GL_3DFX_texture_compression_FXT1) {} else {
}

version (GL_3DFX_multisample) {} else {
}

version (GL_3DFX_tbuffer) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTbufferMask3DFX (GLuint mask);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint mask) PFNGLTBUFFERMASK3DFXPROC;
}

version (GL_EXT_multisample) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glSampleMaskEXT (GLclampf value, GLboolean invert);
void glSamplePatternEXT (GLenum pattern);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLclampf value, GLboolean invert) PFNGLSAMPLEMASKEXTPROC;
alias void function (GLenum pattern) PFNGLSAMPLEPATTERNEXTPROC;
}

version (GL_SGIX_vertex_preclip) {} else {
}

version (GL_SGIX_convolution_accuracy) {} else {
}

version (GL_SGIX_resample) {} else {
}

version (GL_SGIS_point_line_texgen) {} else {
}

version (GL_SGIS_texture_color_mask) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTextureColorMaskSGIS (GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha) PFNGLTEXTURECOLORMASKSGISPROC;
}

version (GL_SGIX_igloo_interface) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glIglooInterfaceSGIX (GLenum pname, const(GLvoid)*params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum pname, const(GLvoid)*params) PFNGLIGLOOINTERFACESGIXPROC;
}

version (GL_EXT_texture_env_dot3) {} else {
}

version (GL_ATI_texture_mirror_once) {} else {
}

version (GL_NV_fence) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDeleteFencesNV (GLsizei n, const(GLuint)*fences);
void glGenFencesNV (GLsizei n, GLuint *fences);
GLboolean glIsFenceNV (GLuint fence);
GLboolean glTestFenceNV (GLuint fence);
void glGetFenceivNV (GLuint fence, GLenum pname, GLint *params);
void glFinishFenceNV (GLuint fence);
void glSetFenceNV (GLuint fence, GLenum condition);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLsizei n, const(GLuint)*fences) PFNGLDELETEFENCESNVPROC;
alias void function (GLsizei n, GLuint *fences) PFNGLGENFENCESNVPROC;
alias GLboolean function (GLuint fence) PFNGLISFENCENVPROC;
alias GLboolean function (GLuint fence) PFNGLTESTFENCENVPROC;
alias void function (GLuint fence, GLenum pname, GLint *params) PFNGLGETFENCEIVNVPROC;
alias void function (GLuint fence) PFNGLFINISHFENCENVPROC;
alias void function (GLuint fence, GLenum condition) PFNGLSETFENCENVPROC;
}

version (GL_NV_evaluators) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glMapControlPointsNV (GLenum target, GLuint index, GLenum type, GLsizei ustride, GLsizei vstride, GLint uorder, GLint vorder, GLboolean packed, const(GLvoid)*points);
void glMapParameterivNV (GLenum target, GLenum pname, const(GLint)*params);
void glMapParameterfvNV (GLenum target, GLenum pname, const(GLfloat)*params);
void glGetMapControlPointsNV (GLenum target, GLuint index, GLenum type, GLsizei ustride, GLsizei vstride, GLboolean packed, GLvoid *points);
void glGetMapParameterivNV (GLenum target, GLenum pname, GLint *params);
void glGetMapParameterfvNV (GLenum target, GLenum pname, GLfloat *params);
void glGetMapAttribParameterivNV (GLenum target, GLuint index, GLenum pname, GLint *params);
void glGetMapAttribParameterfvNV (GLenum target, GLuint index, GLenum pname, GLfloat *params);
void glEvalMapsNV (GLenum target, GLenum mode);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLuint index, GLenum type, GLsizei ustride, GLsizei vstride, GLint uorder, GLint vorder, GLboolean packed, const(GLvoid)*points) PFNGLMAPCONTROLPOINTSNVPROC;
alias void function (GLenum target, GLenum pname, const(GLint)*params) PFNGLMAPPARAMETERIVNVPROC;
alias void function (GLenum target, GLenum pname, const(GLfloat)*params) PFNGLMAPPARAMETERFVNVPROC;
alias void function (GLenum target, GLuint index, GLenum type, GLsizei ustride, GLsizei vstride, GLboolean packed, GLvoid *points) PFNGLGETMAPCONTROLPOINTSNVPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETMAPPARAMETERIVNVPROC;
alias void function (GLenum target, GLenum pname, GLfloat *params) PFNGLGETMAPPARAMETERFVNVPROC;
alias void function (GLenum target, GLuint index, GLenum pname, GLint *params) PFNGLGETMAPATTRIBPARAMETERIVNVPROC;
alias void function (GLenum target, GLuint index, GLenum pname, GLfloat *params) PFNGLGETMAPATTRIBPARAMETERFVNVPROC;
alias void function (GLenum target, GLenum mode) PFNGLEVALMAPSNVPROC;
}

version (GL_NV_packed_depth_stencil) {} else {
}

version (GL_NV_register_combiners2) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glCombinerStageParameterfvNV (GLenum stage, GLenum pname, const(GLfloat)*params);
void glGetCombinerStageParameterfvNV (GLenum stage, GLenum pname, GLfloat *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum stage, GLenum pname, const(GLfloat)*params) PFNGLCOMBINERSTAGEPARAMETERFVNVPROC;
alias void function (GLenum stage, GLenum pname, GLfloat *params) PFNGLGETCOMBINERSTAGEPARAMETERFVNVPROC;
}

version (GL_NV_texture_compression_vtc) {} else {
}

version (GL_NV_texture_rectangle) {} else {
}

version (GL_NV_texture_shader) {} else {
}

version (GL_NV_texture_shader2) {} else {
}

version (GL_NV_vertex_array_range2) {} else {
}

version (GL_NV_vertex_program) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLboolean glAreProgramsResidentNV (GLsizei n, const(GLuint)*programs, GLboolean *residences);
void glBindProgramNV (GLenum target, GLuint id);
void glDeleteProgramsNV (GLsizei n, const(GLuint)*programs);
void glExecuteProgramNV (GLenum target, GLuint id, const(GLfloat)*params);
void glGenProgramsNV (GLsizei n, GLuint *programs);
void glGetProgramParameterdvNV (GLenum target, GLuint index, GLenum pname, GLdouble *params);
void glGetProgramParameterfvNV (GLenum target, GLuint index, GLenum pname, GLfloat *params);
void glGetProgramivNV (GLuint id, GLenum pname, GLint *params);
void glGetProgramStringNV (GLuint id, GLenum pname, GLubyte *program);
void glGetTrackMatrixivNV (GLenum target, GLuint address, GLenum pname, GLint *params);
void glGetVertexAttribdvNV (GLuint index, GLenum pname, GLdouble *params);
void glGetVertexAttribfvNV (GLuint index, GLenum pname, GLfloat *params);
void glGetVertexAttribivNV (GLuint index, GLenum pname, GLint *params);
void glGetVertexAttribPointervNV (GLuint index, GLenum pname, GLvoid* *pointer);
GLboolean glIsProgramNV (GLuint id);
void glLoadProgramNV (GLenum target, GLuint id, GLsizei len, const(GLubyte)*program);
void glProgramParameter4dNV (GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glProgramParameter4dvNV (GLenum target, GLuint index, const(GLdouble)*v);
void glProgramParameter4fNV (GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glProgramParameter4fvNV (GLenum target, GLuint index, const(GLfloat)*v);
void glProgramParameters4dvNV (GLenum target, GLuint index, GLsizei count, const(GLdouble)*v);
void glProgramParameters4fvNV (GLenum target, GLuint index, GLsizei count, const(GLfloat)*v);
void glRequestResidentProgramsNV (GLsizei n, const(GLuint)*programs);
void glTrackMatrixNV (GLenum target, GLuint address, GLenum matrix, GLenum transform);
void glVertexAttribPointerNV (GLuint index, GLint fsize, GLenum type, GLsizei stride, const(GLvoid)*pointer);
void glVertexAttrib1dNV (GLuint index, GLdouble x);
void glVertexAttrib1dvNV (GLuint index, const(GLdouble)*v);
void glVertexAttrib1fNV (GLuint index, GLfloat x);
void glVertexAttrib1fvNV (GLuint index, const(GLfloat)*v);
void glVertexAttrib1sNV (GLuint index, GLshort x);
void glVertexAttrib1svNV (GLuint index, const(GLshort)*v);
void glVertexAttrib2dNV (GLuint index, GLdouble x, GLdouble y);
void glVertexAttrib2dvNV (GLuint index, const(GLdouble)*v);
void glVertexAttrib2fNV (GLuint index, GLfloat x, GLfloat y);
void glVertexAttrib2fvNV (GLuint index, const(GLfloat)*v);
void glVertexAttrib2sNV (GLuint index, GLshort x, GLshort y);
void glVertexAttrib2svNV (GLuint index, const(GLshort)*v);
void glVertexAttrib3dNV (GLuint index, GLdouble x, GLdouble y, GLdouble z);
void glVertexAttrib3dvNV (GLuint index, const(GLdouble)*v);
void glVertexAttrib3fNV (GLuint index, GLfloat x, GLfloat y, GLfloat z);
void glVertexAttrib3fvNV (GLuint index, const(GLfloat)*v);
void glVertexAttrib3sNV (GLuint index, GLshort x, GLshort y, GLshort z);
void glVertexAttrib3svNV (GLuint index, const(GLshort)*v);
void glVertexAttrib4dNV (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glVertexAttrib4dvNV (GLuint index, const(GLdouble)*v);
void glVertexAttrib4fNV (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glVertexAttrib4fvNV (GLuint index, const(GLfloat)*v);
void glVertexAttrib4sNV (GLuint index, GLshort x, GLshort y, GLshort z, GLshort w);
void glVertexAttrib4svNV (GLuint index, const(GLshort)*v);
void glVertexAttrib4ubNV (GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w);
void glVertexAttrib4ubvNV (GLuint index, const(GLubyte)*v);
void glVertexAttribs1dvNV (GLuint index, GLsizei count, const(GLdouble)*v);
void glVertexAttribs1fvNV (GLuint index, GLsizei count, const(GLfloat)*v);
void glVertexAttribs1svNV (GLuint index, GLsizei count, const(GLshort)*v);
void glVertexAttribs2dvNV (GLuint index, GLsizei count, const(GLdouble)*v);
void glVertexAttribs2fvNV (GLuint index, GLsizei count, const(GLfloat)*v);
void glVertexAttribs2svNV (GLuint index, GLsizei count, const(GLshort)*v);
void glVertexAttribs3dvNV (GLuint index, GLsizei count, const(GLdouble)*v);
void glVertexAttribs3fvNV (GLuint index, GLsizei count, const(GLfloat)*v);
void glVertexAttribs3svNV (GLuint index, GLsizei count, const(GLshort)*v);
void glVertexAttribs4dvNV (GLuint index, GLsizei count, const(GLdouble)*v);
void glVertexAttribs4fvNV (GLuint index, GLsizei count, const(GLfloat)*v);
void glVertexAttribs4svNV (GLuint index, GLsizei count, const(GLshort)*v);
void glVertexAttribs4ubvNV (GLuint index, GLsizei count, const(GLubyte)*v);
} /* GL_GLEXT_PROTOTYPES */
alias GLboolean function (GLsizei n, const(GLuint)*programs, GLboolean *residences) PFNGLAREPROGRAMSRESIDENTNVPROC;
alias void function (GLenum target, GLuint id) PFNGLBINDPROGRAMNVPROC;
alias void function (GLsizei n, const(GLuint)*programs) PFNGLDELETEPROGRAMSNVPROC;
alias void function (GLenum target, GLuint id, const(GLfloat)*params) PFNGLEXECUTEPROGRAMNVPROC;
alias void function (GLsizei n, GLuint *programs) PFNGLGENPROGRAMSNVPROC;
alias void function (GLenum target, GLuint index, GLenum pname, GLdouble *params) PFNGLGETPROGRAMPARAMETERDVNVPROC;
alias void function (GLenum target, GLuint index, GLenum pname, GLfloat *params) PFNGLGETPROGRAMPARAMETERFVNVPROC;
alias void function (GLuint id, GLenum pname, GLint *params) PFNGLGETPROGRAMIVNVPROC;
alias void function (GLuint id, GLenum pname, GLubyte *program) PFNGLGETPROGRAMSTRINGNVPROC;
alias void function (GLenum target, GLuint address, GLenum pname, GLint *params) PFNGLGETTRACKMATRIXIVNVPROC;
alias void function (GLuint index, GLenum pname, GLdouble *params) PFNGLGETVERTEXATTRIBDVNVPROC;
alias void function (GLuint index, GLenum pname, GLfloat *params) PFNGLGETVERTEXATTRIBFVNVPROC;
alias void function (GLuint index, GLenum pname, GLint *params) PFNGLGETVERTEXATTRIBIVNVPROC;
alias void function (GLuint index, GLenum pname, GLvoid* *pointer) PFNGLGETVERTEXATTRIBPOINTERVNVPROC;
alias GLboolean function (GLuint id) PFNGLISPROGRAMNVPROC;
alias void function (GLenum target, GLuint id, GLsizei len, const(GLubyte)*program) PFNGLLOADPROGRAMNVPROC;
alias void function (GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w) PFNGLPROGRAMPARAMETER4DNVPROC;
alias void function (GLenum target, GLuint index, const(GLdouble)*v) PFNGLPROGRAMPARAMETER4DVNVPROC;
alias void function (GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w) PFNGLPROGRAMPARAMETER4FNVPROC;
alias void function (GLenum target, GLuint index, const(GLfloat)*v) PFNGLPROGRAMPARAMETER4FVNVPROC;
alias void function (GLenum target, GLuint index, GLsizei count, const(GLdouble)*v) PFNGLPROGRAMPARAMETERS4DVNVPROC;
alias void function (GLenum target, GLuint index, GLsizei count, const(GLfloat)*v) PFNGLPROGRAMPARAMETERS4FVNVPROC;
alias void function (GLsizei n, const(GLuint)*programs) PFNGLREQUESTRESIDENTPROGRAMSNVPROC;
alias void function (GLenum target, GLuint address, GLenum matrix, GLenum transform) PFNGLTRACKMATRIXNVPROC;
alias void function (GLuint index, GLint fsize, GLenum type, GLsizei stride, const(GLvoid)*pointer) PFNGLVERTEXATTRIBPOINTERNVPROC;
alias void function (GLuint index, GLdouble x) PFNGLVERTEXATTRIB1DNVPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIB1DVNVPROC;
alias void function (GLuint index, GLfloat x) PFNGLVERTEXATTRIB1FNVPROC;
alias void function (GLuint index, const(GLfloat)*v) PFNGLVERTEXATTRIB1FVNVPROC;
alias void function (GLuint index, GLshort x) PFNGLVERTEXATTRIB1SNVPROC;
alias void function (GLuint index, const(GLshort)*v) PFNGLVERTEXATTRIB1SVNVPROC;
alias void function (GLuint index, GLdouble x, GLdouble y) PFNGLVERTEXATTRIB2DNVPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIB2DVNVPROC;
alias void function (GLuint index, GLfloat x, GLfloat y) PFNGLVERTEXATTRIB2FNVPROC;
alias void function (GLuint index, const(GLfloat)*v) PFNGLVERTEXATTRIB2FVNVPROC;
alias void function (GLuint index, GLshort x, GLshort y) PFNGLVERTEXATTRIB2SNVPROC;
alias void function (GLuint index, const(GLshort)*v) PFNGLVERTEXATTRIB2SVNVPROC;
alias void function (GLuint index, GLdouble x, GLdouble y, GLdouble z) PFNGLVERTEXATTRIB3DNVPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIB3DVNVPROC;
alias void function (GLuint index, GLfloat x, GLfloat y, GLfloat z) PFNGLVERTEXATTRIB3FNVPROC;
alias void function (GLuint index, const(GLfloat)*v) PFNGLVERTEXATTRIB3FVNVPROC;
alias void function (GLuint index, GLshort x, GLshort y, GLshort z) PFNGLVERTEXATTRIB3SNVPROC;
alias void function (GLuint index, const(GLshort)*v) PFNGLVERTEXATTRIB3SVNVPROC;
alias void function (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w) PFNGLVERTEXATTRIB4DNVPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIB4DVNVPROC;
alias void function (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w) PFNGLVERTEXATTRIB4FNVPROC;
alias void function (GLuint index, const(GLfloat)*v) PFNGLVERTEXATTRIB4FVNVPROC;
alias void function (GLuint index, GLshort x, GLshort y, GLshort z, GLshort w) PFNGLVERTEXATTRIB4SNVPROC;
alias void function (GLuint index, const(GLshort)*v) PFNGLVERTEXATTRIB4SVNVPROC;
alias void function (GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w) PFNGLVERTEXATTRIB4UBNVPROC;
alias void function (GLuint index, const(GLubyte)*v) PFNGLVERTEXATTRIB4UBVNVPROC;
alias void function (GLuint index, GLsizei count, const(GLdouble)*v) PFNGLVERTEXATTRIBS1DVNVPROC;
alias void function (GLuint index, GLsizei count, const(GLfloat)*v) PFNGLVERTEXATTRIBS1FVNVPROC;
alias void function (GLuint index, GLsizei count, const(GLshort)*v) PFNGLVERTEXATTRIBS1SVNVPROC;
alias void function (GLuint index, GLsizei count, const(GLdouble)*v) PFNGLVERTEXATTRIBS2DVNVPROC;
alias void function (GLuint index, GLsizei count, const(GLfloat)*v) PFNGLVERTEXATTRIBS2FVNVPROC;
alias void function (GLuint index, GLsizei count, const(GLshort)*v) PFNGLVERTEXATTRIBS2SVNVPROC;
alias void function (GLuint index, GLsizei count, const(GLdouble)*v) PFNGLVERTEXATTRIBS3DVNVPROC;
alias void function (GLuint index, GLsizei count, const(GLfloat)*v) PFNGLVERTEXATTRIBS3FVNVPROC;
alias void function (GLuint index, GLsizei count, const(GLshort)*v) PFNGLVERTEXATTRIBS3SVNVPROC;
alias void function (GLuint index, GLsizei count, const(GLdouble)*v) PFNGLVERTEXATTRIBS4DVNVPROC;
alias void function (GLuint index, GLsizei count, const(GLfloat)*v) PFNGLVERTEXATTRIBS4FVNVPROC;
alias void function (GLuint index, GLsizei count, const(GLshort)*v) PFNGLVERTEXATTRIBS4SVNVPROC;
alias void function (GLuint index, GLsizei count, const(GLubyte)*v) PFNGLVERTEXATTRIBS4UBVNVPROC;
}

version (GL_SGIX_texture_coordinate_clamp) {} else {
}

version (GL_SGIX_scalebias_hint) {} else {
}

version (GL_OML_interlace) {} else {
}

version (GL_OML_subsample) {} else {
}

version (GL_OML_resample) {} else {
}

version (GL_NV_copy_depth_to_color) {} else {
}

version (GL_ATI_envmap_bumpmap) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTexBumpParameterivATI (GLenum pname, const(GLint)*param);
void glTexBumpParameterfvATI (GLenum pname, const(GLfloat)*param);
void glGetTexBumpParameterivATI (GLenum pname, GLint *param);
void glGetTexBumpParameterfvATI (GLenum pname, GLfloat *param);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum pname, const(GLint)*param) PFNGLTEXBUMPPARAMETERIVATIPROC;
alias void function (GLenum pname, const(GLfloat)*param) PFNGLTEXBUMPPARAMETERFVATIPROC;
alias void function (GLenum pname, GLint *param) PFNGLGETTEXBUMPPARAMETERIVATIPROC;
alias void function (GLenum pname, GLfloat *param) PFNGLGETTEXBUMPPARAMETERFVATIPROC;
}

version (GL_ATI_fragment_shader) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLuint glGenFragmentShadersATI (GLuint range);
void glBindFragmentShaderATI (GLuint id);
void glDeleteFragmentShaderATI (GLuint id);
void glBeginFragmentShaderATI ();
void glEndFragmentShaderATI ();
void glPassTexCoordATI (GLuint dst, GLuint coord, GLenum swizzle);
void glSampleMapATI (GLuint dst, GLuint interp, GLenum swizzle);
void glColorFragmentOp1ATI (GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod);
void glColorFragmentOp2ATI (GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod);
void glColorFragmentOp3ATI (GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod, GLuint arg3, GLuint arg3Rep, GLuint arg3Mod);
void glAlphaFragmentOp1ATI (GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod);
void glAlphaFragmentOp2ATI (GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod);
void glAlphaFragmentOp3ATI (GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod, GLuint arg3, GLuint arg3Rep, GLuint arg3Mod);
void glSetFragmentShaderConstantATI (GLuint dst, const(GLfloat)*value);
} /* GL_GLEXT_PROTOTYPES */
alias GLuint function (GLuint range) PFNGLGENFRAGMENTSHADERSATIPROC;
alias void function (GLuint id) PFNGLBINDFRAGMENTSHADERATIPROC;
alias void function (GLuint id) PFNGLDELETEFRAGMENTSHADERATIPROC;
alias void function () PFNGLBEGINFRAGMENTSHADERATIPROC;
alias void function () PFNGLENDFRAGMENTSHADERATIPROC;
alias void function (GLuint dst, GLuint coord, GLenum swizzle) PFNGLPASSTEXCOORDATIPROC;
alias void function (GLuint dst, GLuint interp, GLenum swizzle) PFNGLSAMPLEMAPATIPROC;
alias void function (GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod) PFNGLCOLORFRAGMENTOP1ATIPROC;
alias void function (GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod) PFNGLCOLORFRAGMENTOP2ATIPROC;
alias void function (GLenum op, GLuint dst, GLuint dstMask, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod, GLuint arg3, GLuint arg3Rep, GLuint arg3Mod) PFNGLCOLORFRAGMENTOP3ATIPROC;
alias void function (GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod) PFNGLALPHAFRAGMENTOP1ATIPROC;
alias void function (GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod) PFNGLALPHAFRAGMENTOP2ATIPROC;
alias void function (GLenum op, GLuint dst, GLuint dstMod, GLuint arg1, GLuint arg1Rep, GLuint arg1Mod, GLuint arg2, GLuint arg2Rep, GLuint arg2Mod, GLuint arg3, GLuint arg3Rep, GLuint arg3Mod) PFNGLALPHAFRAGMENTOP3ATIPROC;
alias void function (GLuint dst, const(GLfloat)*value) PFNGLSETFRAGMENTSHADERCONSTANTATIPROC;
}

version (GL_ATI_pn_triangles) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glPNTrianglesiATI (GLenum pname, GLint param);
void glPNTrianglesfATI (GLenum pname, GLfloat param);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum pname, GLint param) PFNGLPNTRIANGLESIATIPROC;
alias void function (GLenum pname, GLfloat param) PFNGLPNTRIANGLESFATIPROC;
}

version (GL_ATI_vertex_array_object) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLuint glNewObjectBufferATI (GLsizei size, const(GLvoid)*pointer, GLenum usage);
GLboolean glIsObjectBufferATI (GLuint buffer);
void glUpdateObjectBufferATI (GLuint buffer, GLuint offset, GLsizei size, const(GLvoid)*pointer, GLenum preserve);
void glGetObjectBufferfvATI (GLuint buffer, GLenum pname, GLfloat *params);
void glGetObjectBufferivATI (GLuint buffer, GLenum pname, GLint *params);
void glFreeObjectBufferATI (GLuint buffer);
void glArrayObjectATI (GLenum array, GLint size, GLenum type, GLsizei stride, GLuint buffer, GLuint offset);
void glGetArrayObjectfvATI (GLenum array, GLenum pname, GLfloat *params);
void glGetArrayObjectivATI (GLenum array, GLenum pname, GLint *params);
void glVariantArrayObjectATI (GLuint id, GLenum type, GLsizei stride, GLuint buffer, GLuint offset);
void glGetVariantArrayObjectfvATI (GLuint id, GLenum pname, GLfloat *params);
void glGetVariantArrayObjectivATI (GLuint id, GLenum pname, GLint *params);
} /* GL_GLEXT_PROTOTYPES */
alias GLuint function (GLsizei size, const(GLvoid)*pointer, GLenum usage) PFNGLNEWOBJECTBUFFERATIPROC;
alias GLboolean function (GLuint buffer) PFNGLISOBJECTBUFFERATIPROC;
alias void function (GLuint buffer, GLuint offset, GLsizei size, const(GLvoid)*pointer, GLenum preserve) PFNGLUPDATEOBJECTBUFFERATIPROC;
alias void function (GLuint buffer, GLenum pname, GLfloat *params) PFNGLGETOBJECTBUFFERFVATIPROC;
alias void function (GLuint buffer, GLenum pname, GLint *params) PFNGLGETOBJECTBUFFERIVATIPROC;
alias void function (GLuint buffer) PFNGLFREEOBJECTBUFFERATIPROC;
alias void function (GLenum array, GLint size, GLenum type, GLsizei stride, GLuint buffer, GLuint offset) PFNGLARRAYOBJECTATIPROC;
alias void function (GLenum array, GLenum pname, GLfloat *params) PFNGLGETARRAYOBJECTFVATIPROC;
alias void function (GLenum array, GLenum pname, GLint *params) PFNGLGETARRAYOBJECTIVATIPROC;
alias void function (GLuint id, GLenum type, GLsizei stride, GLuint buffer, GLuint offset) PFNGLVARIANTARRAYOBJECTATIPROC;
alias void function (GLuint id, GLenum pname, GLfloat *params) PFNGLGETVARIANTARRAYOBJECTFVATIPROC;
alias void function (GLuint id, GLenum pname, GLint *params) PFNGLGETVARIANTARRAYOBJECTIVATIPROC;
}

version (GL_EXT_vertex_shader) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBeginVertexShaderEXT ();
void glEndVertexShaderEXT ();
void glBindVertexShaderEXT (GLuint id);
GLuint glGenVertexShadersEXT (GLuint range);
void glDeleteVertexShaderEXT (GLuint id);
void glShaderOp1EXT (GLenum op, GLuint res, GLuint arg1);
void glShaderOp2EXT (GLenum op, GLuint res, GLuint arg1, GLuint arg2);
void glShaderOp3EXT (GLenum op, GLuint res, GLuint arg1, GLuint arg2, GLuint arg3);
void glSwizzleEXT (GLuint res, GLuint /*in*/, GLenum outX, GLenum outY, GLenum outZ, GLenum outW);
void glWriteMaskEXT (GLuint res, GLuint /*in*/, GLenum outX, GLenum outY, GLenum outZ, GLenum outW);
void glInsertComponentEXT (GLuint res, GLuint src, GLuint num);
void glExtractComponentEXT (GLuint res, GLuint src, GLuint num);
GLuint glGenSymbolsEXT (GLenum datatype, GLenum storagetype, GLenum range, GLuint components);
void glSetInvariantEXT (GLuint id, GLenum type, const(GLvoid)*addr);
void glSetLocalConstantEXT (GLuint id, GLenum type, const(GLvoid)*addr);
void glVariantbvEXT (GLuint id, const(GLbyte)*addr);
void glVariantsvEXT (GLuint id, const(GLshort)*addr);
void glVariantivEXT (GLuint id, const(GLint)*addr);
void glVariantfvEXT (GLuint id, const(GLfloat)*addr);
void glVariantdvEXT (GLuint id, const(GLdouble)*addr);
void glVariantubvEXT (GLuint id, const(GLubyte)*addr);
void glVariantusvEXT (GLuint id, const(GLushort)*addr);
void glVariantuivEXT (GLuint id, const(GLuint)*addr);
void glVariantPointerEXT (GLuint id, GLenum type, GLuint stride, const(GLvoid)*addr);
void glEnableVariantClientStateEXT (GLuint id);
void glDisableVariantClientStateEXT (GLuint id);
GLuint glBindLightParameterEXT (GLenum light, GLenum value);
GLuint glBindMaterialParameterEXT (GLenum face, GLenum value);
GLuint glBindTexGenParameterEXT (GLenum unit, GLenum coord, GLenum value);
GLuint glBindTextureUnitParameterEXT (GLenum unit, GLenum value);
GLuint glBindParameterEXT (GLenum value);
GLboolean glIsVariantEnabledEXT (GLuint id, GLenum cap);
void glGetVariantBooleanvEXT (GLuint id, GLenum value, GLboolean *data);
void glGetVariantIntegervEXT (GLuint id, GLenum value, GLint *data);
void glGetVariantFloatvEXT (GLuint id, GLenum value, GLfloat *data);
void glGetVariantPointervEXT (GLuint id, GLenum value, GLvoid* *data);
void glGetInvariantBooleanvEXT (GLuint id, GLenum value, GLboolean *data);
void glGetInvariantIntegervEXT (GLuint id, GLenum value, GLint *data);
void glGetInvariantFloatvEXT (GLuint id, GLenum value, GLfloat *data);
void glGetLocalConstantBooleanvEXT (GLuint id, GLenum value, GLboolean *data);
void glGetLocalConstantIntegervEXT (GLuint id, GLenum value, GLint *data);
void glGetLocalConstantFloatvEXT (GLuint id, GLenum value, GLfloat *data);
} /* GL_GLEXT_PROTOTYPES */
alias void function () PFNGLBEGINVERTEXSHADEREXTPROC;
alias void function () PFNGLENDVERTEXSHADEREXTPROC;
alias void function (GLuint id) PFNGLBINDVERTEXSHADEREXTPROC;
alias GLuint function (GLuint range) PFNGLGENVERTEXSHADERSEXTPROC;
alias void function (GLuint id) PFNGLDELETEVERTEXSHADEREXTPROC;
alias void function (GLenum op, GLuint res, GLuint arg1) PFNGLSHADEROP1EXTPROC;
alias void function (GLenum op, GLuint res, GLuint arg1, GLuint arg2) PFNGLSHADEROP2EXTPROC;
alias void function (GLenum op, GLuint res, GLuint arg1, GLuint arg2, GLuint arg3) PFNGLSHADEROP3EXTPROC;
alias void function (GLuint res, GLuint/*in*/, GLenum outX, GLenum outY, GLenum outZ, GLenum outW) PFNGLSWIZZLEEXTPROC;
alias void function (GLuint res, GLuint/*in*/, GLenum outX, GLenum outY, GLenum outZ, GLenum outW) PFNGLWRITEMASKEXTPROC;
alias void function (GLuint res, GLuint src, GLuint num) PFNGLINSERTCOMPONENTEXTPROC;
alias void function (GLuint res, GLuint src, GLuint num) PFNGLEXTRACTCOMPONENTEXTPROC;
alias GLuint function (GLenum datatype, GLenum storagetype, GLenum range, GLuint components) PFNGLGENSYMBOLSEXTPROC;
alias void function (GLuint id, GLenum type, const(GLvoid)*addr) PFNGLSETINVARIANTEXTPROC;
alias void function (GLuint id, GLenum type, const(GLvoid)*addr) PFNGLSETLOCALCONSTANTEXTPROC;
alias void function (GLuint id, const(GLbyte)*addr) PFNGLVARIANTBVEXTPROC;
alias void function (GLuint id, const(GLshort)*addr) PFNGLVARIANTSVEXTPROC;
alias void function (GLuint id, const(GLint)*addr) PFNGLVARIANTIVEXTPROC;
alias void function (GLuint id, const(GLfloat)*addr) PFNGLVARIANTFVEXTPROC;
alias void function (GLuint id, const(GLdouble)*addr) PFNGLVARIANTDVEXTPROC;
alias void function (GLuint id, const(GLubyte)*addr) PFNGLVARIANTUBVEXTPROC;
alias void function (GLuint id, const(GLushort)*addr) PFNGLVARIANTUSVEXTPROC;
alias void function (GLuint id, const(GLuint)*addr) PFNGLVARIANTUIVEXTPROC;
alias void function (GLuint id, GLenum type, GLuint stride, const(GLvoid)*addr) PFNGLVARIANTPOINTEREXTPROC;
alias void function (GLuint id) PFNGLENABLEVARIANTCLIENTSTATEEXTPROC;
alias void function (GLuint id) PFNGLDISABLEVARIANTCLIENTSTATEEXTPROC;
alias GLuint function (GLenum light, GLenum value) PFNGLBINDLIGHTPARAMETEREXTPROC;
alias GLuint function (GLenum face, GLenum value) PFNGLBINDMATERIALPARAMETEREXTPROC;
alias GLuint function (GLenum unit, GLenum coord, GLenum value) PFNGLBINDTEXGENPARAMETEREXTPROC;
alias GLuint function (GLenum unit, GLenum value) PFNGLBINDTEXTUREUNITPARAMETEREXTPROC;
alias GLuint function (GLenum value) PFNGLBINDPARAMETEREXTPROC;
alias GLboolean function (GLuint id, GLenum cap) PFNGLISVARIANTENABLEDEXTPROC;
alias void function (GLuint id, GLenum value, GLboolean *data) PFNGLGETVARIANTBOOLEANVEXTPROC;
alias void function (GLuint id, GLenum value, GLint *data) PFNGLGETVARIANTINTEGERVEXTPROC;
alias void function (GLuint id, GLenum value, GLfloat *data) PFNGLGETVARIANTFLOATVEXTPROC;
alias void function (GLuint id, GLenum value, GLvoid* *data) PFNGLGETVARIANTPOINTERVEXTPROC;
alias void function (GLuint id, GLenum value, GLboolean *data) PFNGLGETINVARIANTBOOLEANVEXTPROC;
alias void function (GLuint id, GLenum value, GLint *data) PFNGLGETINVARIANTINTEGERVEXTPROC;
alias void function (GLuint id, GLenum value, GLfloat *data) PFNGLGETINVARIANTFLOATVEXTPROC;
alias void function (GLuint id, GLenum value, GLboolean *data) PFNGLGETLOCALCONSTANTBOOLEANVEXTPROC;
alias void function (GLuint id, GLenum value, GLint *data) PFNGLGETLOCALCONSTANTINTEGERVEXTPROC;
alias void function (GLuint id, GLenum value, GLfloat *data) PFNGLGETLOCALCONSTANTFLOATVEXTPROC;
}

version (GL_ATI_vertex_streams) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glVertexStream1sATI (GLenum stream, GLshort x);
void glVertexStream1svATI (GLenum stream, const(GLshort)*coords);
void glVertexStream1iATI (GLenum stream, GLint x);
void glVertexStream1ivATI (GLenum stream, const(GLint)*coords);
void glVertexStream1fATI (GLenum stream, GLfloat x);
void glVertexStream1fvATI (GLenum stream, const(GLfloat)*coords);
void glVertexStream1dATI (GLenum stream, GLdouble x);
void glVertexStream1dvATI (GLenum stream, const(GLdouble)*coords);
void glVertexStream2sATI (GLenum stream, GLshort x, GLshort y);
void glVertexStream2svATI (GLenum stream, const(GLshort)*coords);
void glVertexStream2iATI (GLenum stream, GLint x, GLint y);
void glVertexStream2ivATI (GLenum stream, const(GLint)*coords);
void glVertexStream2fATI (GLenum stream, GLfloat x, GLfloat y);
void glVertexStream2fvATI (GLenum stream, const(GLfloat)*coords);
void glVertexStream2dATI (GLenum stream, GLdouble x, GLdouble y);
void glVertexStream2dvATI (GLenum stream, const(GLdouble)*coords);
void glVertexStream3sATI (GLenum stream, GLshort x, GLshort y, GLshort z);
void glVertexStream3svATI (GLenum stream, const(GLshort)*coords);
void glVertexStream3iATI (GLenum stream, GLint x, GLint y, GLint z);
void glVertexStream3ivATI (GLenum stream, const(GLint)*coords);
void glVertexStream3fATI (GLenum stream, GLfloat x, GLfloat y, GLfloat z);
void glVertexStream3fvATI (GLenum stream, const(GLfloat)*coords);
void glVertexStream3dATI (GLenum stream, GLdouble x, GLdouble y, GLdouble z);
void glVertexStream3dvATI (GLenum stream, const(GLdouble)*coords);
void glVertexStream4sATI (GLenum stream, GLshort x, GLshort y, GLshort z, GLshort w);
void glVertexStream4svATI (GLenum stream, const(GLshort)*coords);
void glVertexStream4iATI (GLenum stream, GLint x, GLint y, GLint z, GLint w);
void glVertexStream4ivATI (GLenum stream, const(GLint)*coords);
void glVertexStream4fATI (GLenum stream, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glVertexStream4fvATI (GLenum stream, const(GLfloat)*coords);
void glVertexStream4dATI (GLenum stream, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glVertexStream4dvATI (GLenum stream, const(GLdouble)*coords);
void glNormalStream3bATI (GLenum stream, GLbyte nx, GLbyte ny, GLbyte nz);
void glNormalStream3bvATI (GLenum stream, const(GLbyte)*coords);
void glNormalStream3sATI (GLenum stream, GLshort nx, GLshort ny, GLshort nz);
void glNormalStream3svATI (GLenum stream, const(GLshort)*coords);
void glNormalStream3iATI (GLenum stream, GLint nx, GLint ny, GLint nz);
void glNormalStream3ivATI (GLenum stream, const(GLint)*coords);
void glNormalStream3fATI (GLenum stream, GLfloat nx, GLfloat ny, GLfloat nz);
void glNormalStream3fvATI (GLenum stream, const(GLfloat)*coords);
void glNormalStream3dATI (GLenum stream, GLdouble nx, GLdouble ny, GLdouble nz);
void glNormalStream3dvATI (GLenum stream, const(GLdouble)*coords);
void glClientActiveVertexStreamATI (GLenum stream);
void glVertexBlendEnviATI (GLenum pname, GLint param);
void glVertexBlendEnvfATI (GLenum pname, GLfloat param);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum stream, GLshort x) PFNGLVERTEXSTREAM1SATIPROC;
alias void function (GLenum stream, const(GLshort)*coords) PFNGLVERTEXSTREAM1SVATIPROC;
alias void function (GLenum stream, GLint x) PFNGLVERTEXSTREAM1IATIPROC;
alias void function (GLenum stream, const(GLint)*coords) PFNGLVERTEXSTREAM1IVATIPROC;
alias void function (GLenum stream, GLfloat x) PFNGLVERTEXSTREAM1FATIPROC;
alias void function (GLenum stream, const(GLfloat)*coords) PFNGLVERTEXSTREAM1FVATIPROC;
alias void function (GLenum stream, GLdouble x) PFNGLVERTEXSTREAM1DATIPROC;
alias void function (GLenum stream, const(GLdouble)*coords) PFNGLVERTEXSTREAM1DVATIPROC;
alias void function (GLenum stream, GLshort x, GLshort y) PFNGLVERTEXSTREAM2SATIPROC;
alias void function (GLenum stream, const(GLshort)*coords) PFNGLVERTEXSTREAM2SVATIPROC;
alias void function (GLenum stream, GLint x, GLint y) PFNGLVERTEXSTREAM2IATIPROC;
alias void function (GLenum stream, const(GLint)*coords) PFNGLVERTEXSTREAM2IVATIPROC;
alias void function (GLenum stream, GLfloat x, GLfloat y) PFNGLVERTEXSTREAM2FATIPROC;
alias void function (GLenum stream, const(GLfloat)*coords) PFNGLVERTEXSTREAM2FVATIPROC;
alias void function (GLenum stream, GLdouble x, GLdouble y) PFNGLVERTEXSTREAM2DATIPROC;
alias void function (GLenum stream, const(GLdouble)*coords) PFNGLVERTEXSTREAM2DVATIPROC;
alias void function (GLenum stream, GLshort x, GLshort y, GLshort z) PFNGLVERTEXSTREAM3SATIPROC;
alias void function (GLenum stream, const(GLshort)*coords) PFNGLVERTEXSTREAM3SVATIPROC;
alias void function (GLenum stream, GLint x, GLint y, GLint z) PFNGLVERTEXSTREAM3IATIPROC;
alias void function (GLenum stream, const(GLint)*coords) PFNGLVERTEXSTREAM3IVATIPROC;
alias void function (GLenum stream, GLfloat x, GLfloat y, GLfloat z) PFNGLVERTEXSTREAM3FATIPROC;
alias void function (GLenum stream, const(GLfloat)*coords) PFNGLVERTEXSTREAM3FVATIPROC;
alias void function (GLenum stream, GLdouble x, GLdouble y, GLdouble z) PFNGLVERTEXSTREAM3DATIPROC;
alias void function (GLenum stream, const(GLdouble)*coords) PFNGLVERTEXSTREAM3DVATIPROC;
alias void function (GLenum stream, GLshort x, GLshort y, GLshort z, GLshort w) PFNGLVERTEXSTREAM4SATIPROC;
alias void function (GLenum stream, const(GLshort)*coords) PFNGLVERTEXSTREAM4SVATIPROC;
alias void function (GLenum stream, GLint x, GLint y, GLint z, GLint w) PFNGLVERTEXSTREAM4IATIPROC;
alias void function (GLenum stream, const(GLint)*coords) PFNGLVERTEXSTREAM4IVATIPROC;
alias void function (GLenum stream, GLfloat x, GLfloat y, GLfloat z, GLfloat w) PFNGLVERTEXSTREAM4FATIPROC;
alias void function (GLenum stream, const(GLfloat)*coords) PFNGLVERTEXSTREAM4FVATIPROC;
alias void function (GLenum stream, GLdouble x, GLdouble y, GLdouble z, GLdouble w) PFNGLVERTEXSTREAM4DATIPROC;
alias void function (GLenum stream, const(GLdouble)*coords) PFNGLVERTEXSTREAM4DVATIPROC;
alias void function (GLenum stream, GLbyte nx, GLbyte ny, GLbyte nz) PFNGLNORMALSTREAM3BATIPROC;
alias void function (GLenum stream, const(GLbyte)*coords) PFNGLNORMALSTREAM3BVATIPROC;
alias void function (GLenum stream, GLshort nx, GLshort ny, GLshort nz) PFNGLNORMALSTREAM3SATIPROC;
alias void function (GLenum stream, const(GLshort)*coords) PFNGLNORMALSTREAM3SVATIPROC;
alias void function (GLenum stream, GLint nx, GLint ny, GLint nz) PFNGLNORMALSTREAM3IATIPROC;
alias void function (GLenum stream, const(GLint)*coords) PFNGLNORMALSTREAM3IVATIPROC;
alias void function (GLenum stream, GLfloat nx, GLfloat ny, GLfloat nz) PFNGLNORMALSTREAM3FATIPROC;
alias void function (GLenum stream, const(GLfloat)*coords) PFNGLNORMALSTREAM3FVATIPROC;
alias void function (GLenum stream, GLdouble nx, GLdouble ny, GLdouble nz) PFNGLNORMALSTREAM3DATIPROC;
alias void function (GLenum stream, const(GLdouble)*coords) PFNGLNORMALSTREAM3DVATIPROC;
alias void function (GLenum stream) PFNGLCLIENTACTIVEVERTEXSTREAMATIPROC;
alias void function (GLenum pname, GLint param) PFNGLVERTEXBLENDENVIATIPROC;
alias void function (GLenum pname, GLfloat param) PFNGLVERTEXBLENDENVFATIPROC;
}

version (GL_ATI_element_array) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glElementPointerATI (GLenum type, const(GLvoid)*pointer);
void glDrawElementArrayATI (GLenum mode, GLsizei count);
void glDrawRangeElementArrayATI (GLenum mode, GLuint start, GLuint end, GLsizei count);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum type, const(GLvoid)*pointer) PFNGLELEMENTPOINTERATIPROC;
alias void function (GLenum mode, GLsizei count) PFNGLDRAWELEMENTARRAYATIPROC;
alias void function (GLenum mode, GLuint start, GLuint end, GLsizei count) PFNGLDRAWRANGEELEMENTARRAYATIPROC;
}

version (GL_SUN_mesh_array) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDrawMeshArraysSUN (GLenum mode, GLint first, GLsizei count, GLsizei width);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode, GLint first, GLsizei count, GLsizei width) PFNGLDRAWMESHARRAYSSUNPROC;
}

version (GL_SUN_slice_accum) {} else {
}

version (GL_NV_multisample_filter_hint) {} else {
}

version (GL_NV_depth_clamp) {} else {
}

version (GL_NV_occlusion_query) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGenOcclusionQueriesNV (GLsizei n, GLuint *ids);
void glDeleteOcclusionQueriesNV (GLsizei n, const(GLuint)*ids);
GLboolean glIsOcclusionQueryNV (GLuint id);
void glBeginOcclusionQueryNV (GLuint id);
void glEndOcclusionQueryNV ();
void glGetOcclusionQueryivNV (GLuint id, GLenum pname, GLint *params);
void glGetOcclusionQueryuivNV (GLuint id, GLenum pname, GLuint *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLsizei n, GLuint *ids) PFNGLGENOCCLUSIONQUERIESNVPROC;
alias void function (GLsizei n, const(GLuint)*ids) PFNGLDELETEOCCLUSIONQUERIESNVPROC;
alias GLboolean function (GLuint id) PFNGLISOCCLUSIONQUERYNVPROC;
alias void function (GLuint id) PFNGLBEGINOCCLUSIONQUERYNVPROC;
alias void function () PFNGLENDOCCLUSIONQUERYNVPROC;
alias void function (GLuint id, GLenum pname, GLint *params) PFNGLGETOCCLUSIONQUERYIVNVPROC;
alias void function (GLuint id, GLenum pname, GLuint *params) PFNGLGETOCCLUSIONQUERYUIVNVPROC;
}

version (GL_NV_point_sprite) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glPointParameteriNV (GLenum pname, GLint param);
void glPointParameterivNV (GLenum pname, const(GLint)*params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum pname, GLint param) PFNGLPOINTPARAMETERINVPROC;
alias void function (GLenum pname, const(GLint)*params) PFNGLPOINTPARAMETERIVNVPROC;
}

version (GL_NV_texture_shader3) {} else {
}

version (GL_NV_vertex_program1_1) {} else {
}

version (GL_EXT_shadow_funcs) {} else {
}

version (GL_EXT_stencil_two_side) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glActiveStencilFaceEXT (GLenum face);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum face) PFNGLACTIVESTENCILFACEEXTPROC;
}

version (GL_ATI_text_fragment_shader) {} else {
}

version (GL_APPLE_client_storage) {} else {
}

version (GL_APPLE_element_array) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glElementPointerAPPLE (GLenum type, const(GLvoid)*pointer);
void glDrawElementArrayAPPLE (GLenum mode, GLint first, GLsizei count);
void glDrawRangeElementArrayAPPLE (GLenum mode, GLuint start, GLuint end, GLint first, GLsizei count);
void glMultiDrawElementArrayAPPLE (GLenum mode, const(GLint)*first, const(GLsizei)*count, GLsizei primcount);
void glMultiDrawRangeElementArrayAPPLE (GLenum mode, GLuint start, GLuint end, const(GLint)*first, const(GLsizei)*count, GLsizei primcount);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum type, const(GLvoid)*pointer) PFNGLELEMENTPOINTERAPPLEPROC;
alias void function (GLenum mode, GLint first, GLsizei count) PFNGLDRAWELEMENTARRAYAPPLEPROC;
alias void function (GLenum mode, GLuint start, GLuint end, GLint first, GLsizei count) PFNGLDRAWRANGEELEMENTARRAYAPPLEPROC;
alias void function (GLenum mode, const(GLint)*first, const(GLsizei)*count, GLsizei primcount) PFNGLMULTIDRAWELEMENTARRAYAPPLEPROC;
alias void function (GLenum mode, GLuint start, GLuint end, const(GLint)*first, const(GLsizei)*count, GLsizei primcount) PFNGLMULTIDRAWRANGEELEMENTARRAYAPPLEPROC;
}

version (GL_APPLE_fence) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGenFencesAPPLE (GLsizei n, GLuint *fences);
void glDeleteFencesAPPLE (GLsizei n, const(GLuint)*fences);
void glSetFenceAPPLE (GLuint fence);
GLboolean glIsFenceAPPLE (GLuint fence);
GLboolean glTestFenceAPPLE (GLuint fence);
void glFinishFenceAPPLE (GLuint fence);
GLboolean glTestObjectAPPLE (GLenum object, GLuint name);
void glFinishObjectAPPLE (GLenum object, GLint name);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLsizei n, GLuint *fences) PFNGLGENFENCESAPPLEPROC;
alias void function (GLsizei n, const(GLuint)*fences) PFNGLDELETEFENCESAPPLEPROC;
alias void function (GLuint fence) PFNGLSETFENCEAPPLEPROC;
alias GLboolean function (GLuint fence) PFNGLISFENCEAPPLEPROC;
alias GLboolean function (GLuint fence) PFNGLTESTFENCEAPPLEPROC;
alias void function (GLuint fence) PFNGLFINISHFENCEAPPLEPROC;
alias GLboolean function (GLenum object, GLuint name) PFNGLTESTOBJECTAPPLEPROC;
alias void function (GLenum object, GLint name) PFNGLFINISHOBJECTAPPLEPROC;
}

version (GL_APPLE_vertex_array_object) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBindVertexArrayAPPLE (GLuint array);
void glDeleteVertexArraysAPPLE (GLsizei n, const(GLuint)*arrays);
void glGenVertexArraysAPPLE (GLsizei n, GLuint *arrays);
GLboolean glIsVertexArrayAPPLE (GLuint array);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint array) PFNGLBINDVERTEXARRAYAPPLEPROC;
alias void function (GLsizei n, const(GLuint)*arrays) PFNGLDELETEVERTEXARRAYSAPPLEPROC;
alias void function (GLsizei n, GLuint *arrays) PFNGLGENVERTEXARRAYSAPPLEPROC;
alias GLboolean function (GLuint array) PFNGLISVERTEXARRAYAPPLEPROC;
}

version (GL_APPLE_vertex_array_range) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glVertexArrayRangeAPPLE (GLsizei length, GLvoid *pointer);
void glFlushVertexArrayRangeAPPLE (GLsizei length, GLvoid *pointer);
void glVertexArrayParameteriAPPLE (GLenum pname, GLint param);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLsizei length, GLvoid *pointer) PFNGLVERTEXARRAYRANGEAPPLEPROC;
alias void function (GLsizei length, GLvoid *pointer) PFNGLFLUSHVERTEXARRAYRANGEAPPLEPROC;
alias void function (GLenum pname, GLint param) PFNGLVERTEXARRAYPARAMETERIAPPLEPROC;
}

version (GL_APPLE_ycbcr_422) {} else {
}

version (GL_S3_s3tc) {} else {
}

version (GL_ATI_draw_buffers) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDrawBuffersATI (GLsizei n, const(GLenum)*bufs);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLsizei n, const(GLenum)*bufs) PFNGLDRAWBUFFERSATIPROC;
}

version (GL_ATI_pixel_format_float) {} else {
/* This is really a WGL extension, but defines some associated GL enums.
 * ATI does not export "GL_ATI_pixel_format_float" in the GL_EXTENSIONS string.
 */
}

version (GL_ATI_texture_env_combine3) {} else {
}

version (GL_ATI_texture_float) {} else {
}

version (GL_NV_float_buffer) {} else {
}

version (GL_NV_fragment_program) {} else {
/* Some NV_fragment_program entry points are shared with ARB_vertex_program. */
version (GL_GLEXT_PROTOTYPES) {
void glProgramNamedParameter4fNV (GLuint id, GLsizei len, const(GLubyte)*name, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glProgramNamedParameter4dNV (GLuint id, GLsizei len, const(GLubyte)*name, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glProgramNamedParameter4fvNV (GLuint id, GLsizei len, const(GLubyte)*name, const(GLfloat)*v);
void glProgramNamedParameter4dvNV (GLuint id, GLsizei len, const(GLubyte)*name, const(GLdouble)*v);
void glGetProgramNamedParameterfvNV (GLuint id, GLsizei len, const(GLubyte)*name, GLfloat *params);
void glGetProgramNamedParameterdvNV (GLuint id, GLsizei len, const(GLubyte)*name, GLdouble *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint id, GLsizei len, const(GLubyte)*name, GLfloat x, GLfloat y, GLfloat z, GLfloat w) PFNGLPROGRAMNAMEDPARAMETER4FNVPROC;
alias void function (GLuint id, GLsizei len, const(GLubyte)*name, GLdouble x, GLdouble y, GLdouble z, GLdouble w) PFNGLPROGRAMNAMEDPARAMETER4DNVPROC;
alias void function (GLuint id, GLsizei len, const(GLubyte)*name, const(GLfloat)*v) PFNGLPROGRAMNAMEDPARAMETER4FVNVPROC;
alias void function (GLuint id, GLsizei len, const(GLubyte)*name, const(GLdouble)*v) PFNGLPROGRAMNAMEDPARAMETER4DVNVPROC;
alias void function (GLuint id, GLsizei len, const(GLubyte)*name, GLfloat *params) PFNGLGETPROGRAMNAMEDPARAMETERFVNVPROC;
alias void function (GLuint id, GLsizei len, const(GLubyte)*name, GLdouble *params) PFNGLGETPROGRAMNAMEDPARAMETERDVNVPROC;
}

version (GL_NV_half_float) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glVertex2hNV (GLhalfNV x, GLhalfNV y);
void glVertex2hvNV (const(GLhalfNV)*v);
void glVertex3hNV (GLhalfNV x, GLhalfNV y, GLhalfNV z);
void glVertex3hvNV (const(GLhalfNV)*v);
void glVertex4hNV (GLhalfNV x, GLhalfNV y, GLhalfNV z, GLhalfNV w);
void glVertex4hvNV (const(GLhalfNV)*v);
void glNormal3hNV (GLhalfNV nx, GLhalfNV ny, GLhalfNV nz);
void glNormal3hvNV (const(GLhalfNV)*v);
void glColor3hNV (GLhalfNV red, GLhalfNV green, GLhalfNV blue);
void glColor3hvNV (const(GLhalfNV)*v);
void glColor4hNV (GLhalfNV red, GLhalfNV green, GLhalfNV blue, GLhalfNV alpha);
void glColor4hvNV (const(GLhalfNV)*v);
void glTexCoord1hNV (GLhalfNV s);
void glTexCoord1hvNV (const(GLhalfNV)*v);
void glTexCoord2hNV (GLhalfNV s, GLhalfNV t);
void glTexCoord2hvNV (const(GLhalfNV)*v);
void glTexCoord3hNV (GLhalfNV s, GLhalfNV t, GLhalfNV r);
void glTexCoord3hvNV (const(GLhalfNV)*v);
void glTexCoord4hNV (GLhalfNV s, GLhalfNV t, GLhalfNV r, GLhalfNV q);
void glTexCoord4hvNV (const(GLhalfNV)*v);
void glMultiTexCoord1hNV (GLenum target, GLhalfNV s);
void glMultiTexCoord1hvNV (GLenum target, const(GLhalfNV)*v);
void glMultiTexCoord2hNV (GLenum target, GLhalfNV s, GLhalfNV t);
void glMultiTexCoord2hvNV (GLenum target, const(GLhalfNV)*v);
void glMultiTexCoord3hNV (GLenum target, GLhalfNV s, GLhalfNV t, GLhalfNV r);
void glMultiTexCoord3hvNV (GLenum target, const(GLhalfNV)*v);
void glMultiTexCoord4hNV (GLenum target, GLhalfNV s, GLhalfNV t, GLhalfNV r, GLhalfNV q);
void glMultiTexCoord4hvNV (GLenum target, const(GLhalfNV)*v);
void glFogCoordhNV (GLhalfNV fog);
void glFogCoordhvNV (const(GLhalfNV)*fog);
void glSecondaryColor3hNV (GLhalfNV red, GLhalfNV green, GLhalfNV blue);
void glSecondaryColor3hvNV (const(GLhalfNV)*v);
void glVertexWeighthNV (GLhalfNV weight);
void glVertexWeighthvNV (const(GLhalfNV)*weight);
void glVertexAttrib1hNV (GLuint index, GLhalfNV x);
void glVertexAttrib1hvNV (GLuint index, const(GLhalfNV)*v);
void glVertexAttrib2hNV (GLuint index, GLhalfNV x, GLhalfNV y);
void glVertexAttrib2hvNV (GLuint index, const(GLhalfNV)*v);
void glVertexAttrib3hNV (GLuint index, GLhalfNV x, GLhalfNV y, GLhalfNV z);
void glVertexAttrib3hvNV (GLuint index, const(GLhalfNV)*v);
void glVertexAttrib4hNV (GLuint index, GLhalfNV x, GLhalfNV y, GLhalfNV z, GLhalfNV w);
void glVertexAttrib4hvNV (GLuint index, const(GLhalfNV)*v);
void glVertexAttribs1hvNV (GLuint index, GLsizei n, const(GLhalfNV)*v);
void glVertexAttribs2hvNV (GLuint index, GLsizei n, const(GLhalfNV)*v);
void glVertexAttribs3hvNV (GLuint index, GLsizei n, const(GLhalfNV)*v);
void glVertexAttribs4hvNV (GLuint index, GLsizei n, const(GLhalfNV)*v);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLhalfNV x, GLhalfNV y) PFNGLVERTEX2HNVPROC;
alias void function (const(GLhalfNV)*v) PFNGLVERTEX2HVNVPROC;
alias void function (GLhalfNV x, GLhalfNV y, GLhalfNV z) PFNGLVERTEX3HNVPROC;
alias void function (const(GLhalfNV)*v) PFNGLVERTEX3HVNVPROC;
alias void function (GLhalfNV x, GLhalfNV y, GLhalfNV z, GLhalfNV w) PFNGLVERTEX4HNVPROC;
alias void function (const(GLhalfNV)*v) PFNGLVERTEX4HVNVPROC;
alias void function (GLhalfNV nx, GLhalfNV ny, GLhalfNV nz) PFNGLNORMAL3HNVPROC;
alias void function (const(GLhalfNV)*v) PFNGLNORMAL3HVNVPROC;
alias void function (GLhalfNV red, GLhalfNV green, GLhalfNV blue) PFNGLCOLOR3HNVPROC;
alias void function (const(GLhalfNV)*v) PFNGLCOLOR3HVNVPROC;
alias void function (GLhalfNV red, GLhalfNV green, GLhalfNV blue, GLhalfNV alpha) PFNGLCOLOR4HNVPROC;
alias void function (const(GLhalfNV)*v) PFNGLCOLOR4HVNVPROC;
alias void function (GLhalfNV s) PFNGLTEXCOORD1HNVPROC;
alias void function (const(GLhalfNV)*v) PFNGLTEXCOORD1HVNVPROC;
alias void function (GLhalfNV s, GLhalfNV t) PFNGLTEXCOORD2HNVPROC;
alias void function (const(GLhalfNV)*v) PFNGLTEXCOORD2HVNVPROC;
alias void function (GLhalfNV s, GLhalfNV t, GLhalfNV r) PFNGLTEXCOORD3HNVPROC;
alias void function (const(GLhalfNV)*v) PFNGLTEXCOORD3HVNVPROC;
alias void function (GLhalfNV s, GLhalfNV t, GLhalfNV r, GLhalfNV q) PFNGLTEXCOORD4HNVPROC;
alias void function (const(GLhalfNV)*v) PFNGLTEXCOORD4HVNVPROC;
alias void function (GLenum target, GLhalfNV s) PFNGLMULTITEXCOORD1HNVPROC;
alias void function (GLenum target, const(GLhalfNV)*v) PFNGLMULTITEXCOORD1HVNVPROC;
alias void function (GLenum target, GLhalfNV s, GLhalfNV t) PFNGLMULTITEXCOORD2HNVPROC;
alias void function (GLenum target, const(GLhalfNV)*v) PFNGLMULTITEXCOORD2HVNVPROC;
alias void function (GLenum target, GLhalfNV s, GLhalfNV t, GLhalfNV r) PFNGLMULTITEXCOORD3HNVPROC;
alias void function (GLenum target, const(GLhalfNV)*v) PFNGLMULTITEXCOORD3HVNVPROC;
alias void function (GLenum target, GLhalfNV s, GLhalfNV t, GLhalfNV r, GLhalfNV q) PFNGLMULTITEXCOORD4HNVPROC;
alias void function (GLenum target, const(GLhalfNV)*v) PFNGLMULTITEXCOORD4HVNVPROC;
alias void function (GLhalfNV fog) PFNGLFOGCOORDHNVPROC;
alias void function (const(GLhalfNV)*fog) PFNGLFOGCOORDHVNVPROC;
alias void function (GLhalfNV red, GLhalfNV green, GLhalfNV blue) PFNGLSECONDARYCOLOR3HNVPROC;
alias void function (const(GLhalfNV)*v) PFNGLSECONDARYCOLOR3HVNVPROC;
alias void function (GLhalfNV weight) PFNGLVERTEXWEIGHTHNVPROC;
alias void function (const(GLhalfNV)*weight) PFNGLVERTEXWEIGHTHVNVPROC;
alias void function (GLuint index, GLhalfNV x) PFNGLVERTEXATTRIB1HNVPROC;
alias void function (GLuint index, const(GLhalfNV)*v) PFNGLVERTEXATTRIB1HVNVPROC;
alias void function (GLuint index, GLhalfNV x, GLhalfNV y) PFNGLVERTEXATTRIB2HNVPROC;
alias void function (GLuint index, const(GLhalfNV)*v) PFNGLVERTEXATTRIB2HVNVPROC;
alias void function (GLuint index, GLhalfNV x, GLhalfNV y, GLhalfNV z) PFNGLVERTEXATTRIB3HNVPROC;
alias void function (GLuint index, const(GLhalfNV)*v) PFNGLVERTEXATTRIB3HVNVPROC;
alias void function (GLuint index, GLhalfNV x, GLhalfNV y, GLhalfNV z, GLhalfNV w) PFNGLVERTEXATTRIB4HNVPROC;
alias void function (GLuint index, const(GLhalfNV)*v) PFNGLVERTEXATTRIB4HVNVPROC;
alias void function (GLuint index, GLsizei n, const(GLhalfNV)*v) PFNGLVERTEXATTRIBS1HVNVPROC;
alias void function (GLuint index, GLsizei n, const(GLhalfNV)*v) PFNGLVERTEXATTRIBS2HVNVPROC;
alias void function (GLuint index, GLsizei n, const(GLhalfNV)*v) PFNGLVERTEXATTRIBS3HVNVPROC;
alias void function (GLuint index, GLsizei n, const(GLhalfNV)*v) PFNGLVERTEXATTRIBS4HVNVPROC;
}

version (GL_NV_pixel_data_range) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glPixelDataRangeNV (GLenum target, GLsizei length, const(GLvoid)*pointer);
void glFlushPixelDataRangeNV (GLenum target);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLsizei length, const(GLvoid)*pointer) PFNGLPIXELDATARANGENVPROC;
alias void function (GLenum target) PFNGLFLUSHPIXELDATARANGENVPROC;
}

version (GL_NV_primitive_restart) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glPrimitiveRestartNV ();
void glPrimitiveRestartIndexNV (GLuint index);
} /* GL_GLEXT_PROTOTYPES */
alias void function () PFNGLPRIMITIVERESTARTNVPROC;
alias void function (GLuint index) PFNGLPRIMITIVERESTARTINDEXNVPROC;
}

version (GL_NV_texture_expand_normal) {} else {
}

version (GL_NV_vertex_program2) {} else {
}

version (GL_ATI_map_object_buffer) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLvoid* glMapObjectBufferATI (GLuint buffer);
void glUnmapObjectBufferATI (GLuint buffer);
} /* GL_GLEXT_PROTOTYPES */
alias GLvoid* function (GLuint buffer) PFNGLMAPOBJECTBUFFERATIPROC;
alias void function (GLuint buffer) PFNGLUNMAPOBJECTBUFFERATIPROC;
}

version (GL_ATI_separate_stencil) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glStencilOpSeparateATI (GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass);
void glStencilFuncSeparateATI (GLenum frontfunc, GLenum backfunc, GLint/*ref*/, GLuint mask);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass) PFNGLSTENCILOPSEPARATEATIPROC;
alias void function (GLenum frontfunc, GLenum backfunc, GLint/*ref*/, GLuint mask) PFNGLSTENCILFUNCSEPARATEATIPROC;
}

version (GL_ATI_vertex_attrib_array_object) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glVertexAttribArrayObjectATI (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, GLuint buffer, GLuint offset);
void glGetVertexAttribArrayObjectfvATI (GLuint index, GLenum pname, GLfloat *params);
void glGetVertexAttribArrayObjectivATI (GLuint index, GLenum pname, GLint *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, GLuint buffer, GLuint offset) PFNGLVERTEXATTRIBARRAYOBJECTATIPROC;
alias void function (GLuint index, GLenum pname, GLfloat *params) PFNGLGETVERTEXATTRIBARRAYOBJECTFVATIPROC;
alias void function (GLuint index, GLenum pname, GLint *params) PFNGLGETVERTEXATTRIBARRAYOBJECTIVATIPROC;
}

version (GL_OES_read_format) {} else {
}

version (GL_EXT_depth_bounds_test) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDepthBoundsEXT (GLclampd zmin, GLclampd zmax);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLclampd zmin, GLclampd zmax) PFNGLDEPTHBOUNDSEXTPROC;
}

version (GL_EXT_texture_mirror_clamp) {} else {
}

version (GL_EXT_blend_equation_separate) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBlendEquationSeparateEXT (GLenum modeRGB, GLenum modeAlpha);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum modeRGB, GLenum modeAlpha) PFNGLBLENDEQUATIONSEPARATEEXTPROC;
}

version (GL_MESA_pack_invert) {} else {
}

version (GL_MESA_ycbcr_texture) {} else {
}

version (GL_EXT_pixel_buffer_object) {} else {
}

version (GL_NV_fragment_program_option) {} else {
}

version (GL_NV_fragment_program2) {} else {
}

version (GL_NV_vertex_program2_option) {} else {
}

version (GL_NV_vertex_program3) {} else {
}

version (GL_EXT_framebuffer_object) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLboolean glIsRenderbufferEXT (GLuint renderbuffer);
void glBindRenderbufferEXT (GLenum target, GLuint renderbuffer);
void glDeleteRenderbuffersEXT (GLsizei n, const(GLuint)*renderbuffers);
void glGenRenderbuffersEXT (GLsizei n, GLuint *renderbuffers);
void glRenderbufferStorageEXT (GLenum target, GLenum internalformat, GLsizei width, GLsizei height);
void glGetRenderbufferParameterivEXT (GLenum target, GLenum pname, GLint *params);
GLboolean glIsFramebufferEXT (GLuint framebuffer);
void glBindFramebufferEXT (GLenum target, GLuint framebuffer);
void glDeleteFramebuffersEXT (GLsizei n, const(GLuint)*framebuffers);
void glGenFramebuffersEXT (GLsizei n, GLuint *framebuffers);
GLenum glCheckFramebufferStatusEXT (GLenum target);
void glFramebufferTexture1DEXT (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
void glFramebufferTexture2DEXT (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
void glFramebufferTexture3DEXT (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset);
void glFramebufferRenderbufferEXT (GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer);
void glGetFramebufferAttachmentParameterivEXT (GLenum target, GLenum attachment, GLenum pname, GLint *params);
void glGenerateMipmapEXT (GLenum target);
} /* GL_GLEXT_PROTOTYPES */
alias GLboolean function (GLuint renderbuffer) PFNGLISRENDERBUFFEREXTPROC;
alias void function (GLenum target, GLuint renderbuffer) PFNGLBINDRENDERBUFFEREXTPROC;
alias void function (GLsizei n, const(GLuint)*renderbuffers) PFNGLDELETERENDERBUFFERSEXTPROC;
alias void function (GLsizei n, GLuint *renderbuffers) PFNGLGENRENDERBUFFERSEXTPROC;
alias void function (GLenum target, GLenum internalformat, GLsizei width, GLsizei height) PFNGLRENDERBUFFERSTORAGEEXTPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETRENDERBUFFERPARAMETERIVEXTPROC;
alias GLboolean function (GLuint framebuffer) PFNGLISFRAMEBUFFEREXTPROC;
alias void function (GLenum target, GLuint framebuffer) PFNGLBINDFRAMEBUFFEREXTPROC;
alias void function (GLsizei n, const(GLuint)*framebuffers) PFNGLDELETEFRAMEBUFFERSEXTPROC;
alias void function (GLsizei n, GLuint *framebuffers) PFNGLGENFRAMEBUFFERSEXTPROC;
alias GLenum function (GLenum target) PFNGLCHECKFRAMEBUFFERSTATUSEXTPROC;
alias void function (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level) PFNGLFRAMEBUFFERTEXTURE1DEXTPROC;
alias void function (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level) PFNGLFRAMEBUFFERTEXTURE2DEXTPROC;
alias void function (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset) PFNGLFRAMEBUFFERTEXTURE3DEXTPROC;
alias void function (GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer) PFNGLFRAMEBUFFERRENDERBUFFEREXTPROC;
alias void function (GLenum target, GLenum attachment, GLenum pname, GLint *params) PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVEXTPROC;
alias void function (GLenum target) PFNGLGENERATEMIPMAPEXTPROC;
}

version (GL_GREMEDY_string_marker) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glStringMarkerGREMEDY (GLsizei len, const(GLvoid)*string_);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLsizei len, const(GLvoid)*string_) PFNGLSTRINGMARKERGREMEDYPROC;
}

version (GL_EXT_packed_depth_stencil) {} else {
}

version (GL_EXT_stencil_clear_tag) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glStencilClearTagEXT (GLsizei stencilTagBits, GLuint stencilClearTag);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLsizei stencilTagBits, GLuint stencilClearTag) PFNGLSTENCILCLEARTAGEXTPROC;
}

version (GL_EXT_texture_sRGB) {} else {
}

version (GL_EXT_framebuffer_blit) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBlitFramebufferEXT (GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter) PFNGLBLITFRAMEBUFFEREXTPROC;
}

version (GL_EXT_framebuffer_multisample) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glRenderbufferStorageMultisampleEXT (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height) PFNGLRENDERBUFFERSTORAGEMULTISAMPLEEXTPROC;
}

version (GL_MESAX_texture_stack) {} else {
}

version (GL_EXT_timer_query) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGetQueryObjecti64vEXT (GLuint id, GLenum pname, GLint64EXT *params);
void glGetQueryObjectui64vEXT (GLuint id, GLenum pname, GLuint64EXT *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint id, GLenum pname, GLint64EXT *params) PFNGLGETQUERYOBJECTI64VEXTPROC;
alias void function (GLuint id, GLenum pname, GLuint64EXT *params) PFNGLGETQUERYOBJECTUI64VEXTPROC;
}

version (GL_EXT_gpu_program_parameters) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glProgramEnvParameters4fvEXT (GLenum target, GLuint index, GLsizei count, const(GLfloat)*params);
void glProgramLocalParameters4fvEXT (GLenum target, GLuint index, GLsizei count, const(GLfloat)*params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLuint index, GLsizei count, const(GLfloat)*params) PFNGLPROGRAMENVPARAMETERS4FVEXTPROC;
alias void function (GLenum target, GLuint index, GLsizei count, const(GLfloat)*params) PFNGLPROGRAMLOCALPARAMETERS4FVEXTPROC;
}

version (GL_APPLE_flush_buffer_range) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBufferParameteriAPPLE (GLenum target, GLenum pname, GLint param);
void glFlushMappedBufferRangeAPPLE (GLenum target, GLintptr offset, GLsizeiptr size);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum pname, GLint param) PFNGLBUFFERPARAMETERIAPPLEPROC;
alias void function (GLenum target, GLintptr offset, GLsizeiptr size) PFNGLFLUSHMAPPEDBUFFERRANGEAPPLEPROC;
}

version (GL_NV_gpu_program4) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glProgramLocalParameterI4iNV (GLenum target, GLuint index, GLint x, GLint y, GLint z, GLint w);
void glProgramLocalParameterI4ivNV (GLenum target, GLuint index, const(GLint)*params);
void glProgramLocalParametersI4ivNV (GLenum target, GLuint index, GLsizei count, const(GLint)*params);
void glProgramLocalParameterI4uiNV (GLenum target, GLuint index, GLuint x, GLuint y, GLuint z, GLuint w);
void glProgramLocalParameterI4uivNV (GLenum target, GLuint index, const(GLuint)*params);
void glProgramLocalParametersI4uivNV (GLenum target, GLuint index, GLsizei count, const(GLuint)*params);
void glProgramEnvParameterI4iNV (GLenum target, GLuint index, GLint x, GLint y, GLint z, GLint w);
void glProgramEnvParameterI4ivNV (GLenum target, GLuint index, const(GLint)*params);
void glProgramEnvParametersI4ivNV (GLenum target, GLuint index, GLsizei count, const(GLint)*params);
void glProgramEnvParameterI4uiNV (GLenum target, GLuint index, GLuint x, GLuint y, GLuint z, GLuint w);
void glProgramEnvParameterI4uivNV (GLenum target, GLuint index, const(GLuint)*params);
void glProgramEnvParametersI4uivNV (GLenum target, GLuint index, GLsizei count, const(GLuint)*params);
void glGetProgramLocalParameterIivNV (GLenum target, GLuint index, GLint *params);
void glGetProgramLocalParameterIuivNV (GLenum target, GLuint index, GLuint *params);
void glGetProgramEnvParameterIivNV (GLenum target, GLuint index, GLint *params);
void glGetProgramEnvParameterIuivNV (GLenum target, GLuint index, GLuint *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLuint index, GLint x, GLint y, GLint z, GLint w) PFNGLPROGRAMLOCALPARAMETERI4INVPROC;
alias void function (GLenum target, GLuint index, const(GLint)*params) PFNGLPROGRAMLOCALPARAMETERI4IVNVPROC;
alias void function (GLenum target, GLuint index, GLsizei count, const(GLint)*params) PFNGLPROGRAMLOCALPARAMETERSI4IVNVPROC;
alias void function (GLenum target, GLuint index, GLuint x, GLuint y, GLuint z, GLuint w) PFNGLPROGRAMLOCALPARAMETERI4UINVPROC;
alias void function (GLenum target, GLuint index, const(GLuint)*params) PFNGLPROGRAMLOCALPARAMETERI4UIVNVPROC;
alias void function (GLenum target, GLuint index, GLsizei count, const(GLuint)*params) PFNGLPROGRAMLOCALPARAMETERSI4UIVNVPROC;
alias void function (GLenum target, GLuint index, GLint x, GLint y, GLint z, GLint w) PFNGLPROGRAMENVPARAMETERI4INVPROC;
alias void function (GLenum target, GLuint index, const(GLint)*params) PFNGLPROGRAMENVPARAMETERI4IVNVPROC;
alias void function (GLenum target, GLuint index, GLsizei count, const(GLint)*params) PFNGLPROGRAMENVPARAMETERSI4IVNVPROC;
alias void function (GLenum target, GLuint index, GLuint x, GLuint y, GLuint z, GLuint w) PFNGLPROGRAMENVPARAMETERI4UINVPROC;
alias void function (GLenum target, GLuint index, const(GLuint)*params) PFNGLPROGRAMENVPARAMETERI4UIVNVPROC;
alias void function (GLenum target, GLuint index, GLsizei count, const(GLuint)*params) PFNGLPROGRAMENVPARAMETERSI4UIVNVPROC;
alias void function (GLenum target, GLuint index, GLint *params) PFNGLGETPROGRAMLOCALPARAMETERIIVNVPROC;
alias void function (GLenum target, GLuint index, GLuint *params) PFNGLGETPROGRAMLOCALPARAMETERIUIVNVPROC;
alias void function (GLenum target, GLuint index, GLint *params) PFNGLGETPROGRAMENVPARAMETERIIVNVPROC;
alias void function (GLenum target, GLuint index, GLuint *params) PFNGLGETPROGRAMENVPARAMETERIUIVNVPROC;
}

version (GL_NV_geometry_program4) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glProgramVertexLimitNV (GLenum target, GLint limit);
void glFramebufferTextureEXT (GLenum target, GLenum attachment, GLuint texture, GLint level);
void glFramebufferTextureLayerEXT (GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer);
void glFramebufferTextureFaceEXT (GLenum target, GLenum attachment, GLuint texture, GLint level, GLenum face);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLint limit) PFNGLPROGRAMVERTEXLIMITNVPROC;
alias void function (GLenum target, GLenum attachment, GLuint texture, GLint level) PFNGLFRAMEBUFFERTEXTUREEXTPROC;
alias void function (GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer) PFNGLFRAMEBUFFERTEXTURELAYEREXTPROC;
alias void function (GLenum target, GLenum attachment, GLuint texture, GLint level, GLenum face) PFNGLFRAMEBUFFERTEXTUREFACEEXTPROC;
}

version (GL_EXT_geometry_shader4) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glProgramParameteriEXT (GLuint program, GLenum pname, GLint value);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint program, GLenum pname, GLint value) PFNGLPROGRAMPARAMETERIEXTPROC;
}

version (GL_NV_vertex_program4) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glVertexAttribI1iEXT (GLuint index, GLint x);
void glVertexAttribI2iEXT (GLuint index, GLint x, GLint y);
void glVertexAttribI3iEXT (GLuint index, GLint x, GLint y, GLint z);
void glVertexAttribI4iEXT (GLuint index, GLint x, GLint y, GLint z, GLint w);
void glVertexAttribI1uiEXT (GLuint index, GLuint x);
void glVertexAttribI2uiEXT (GLuint index, GLuint x, GLuint y);
void glVertexAttribI3uiEXT (GLuint index, GLuint x, GLuint y, GLuint z);
void glVertexAttribI4uiEXT (GLuint index, GLuint x, GLuint y, GLuint z, GLuint w);
void glVertexAttribI1ivEXT (GLuint index, const(GLint)*v);
void glVertexAttribI2ivEXT (GLuint index, const(GLint)*v);
void glVertexAttribI3ivEXT (GLuint index, const(GLint)*v);
void glVertexAttribI4ivEXT (GLuint index, const(GLint)*v);
void glVertexAttribI1uivEXT (GLuint index, const(GLuint)*v);
void glVertexAttribI2uivEXT (GLuint index, const(GLuint)*v);
void glVertexAttribI3uivEXT (GLuint index, const(GLuint)*v);
void glVertexAttribI4uivEXT (GLuint index, const(GLuint)*v);
void glVertexAttribI4bvEXT (GLuint index, const(GLbyte)*v);
void glVertexAttribI4svEXT (GLuint index, const(GLshort)*v);
void glVertexAttribI4ubvEXT (GLuint index, const(GLubyte)*v);
void glVertexAttribI4usvEXT (GLuint index, const(GLushort)*v);
void glVertexAttribIPointerEXT (GLuint index, GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer);
void glGetVertexAttribIivEXT (GLuint index, GLenum pname, GLint *params);
void glGetVertexAttribIuivEXT (GLuint index, GLenum pname, GLuint *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint index, GLint x) PFNGLVERTEXATTRIBI1IEXTPROC;
alias void function (GLuint index, GLint x, GLint y) PFNGLVERTEXATTRIBI2IEXTPROC;
alias void function (GLuint index, GLint x, GLint y, GLint z) PFNGLVERTEXATTRIBI3IEXTPROC;
alias void function (GLuint index, GLint x, GLint y, GLint z, GLint w) PFNGLVERTEXATTRIBI4IEXTPROC;
alias void function (GLuint index, GLuint x) PFNGLVERTEXATTRIBI1UIEXTPROC;
alias void function (GLuint index, GLuint x, GLuint y) PFNGLVERTEXATTRIBI2UIEXTPROC;
alias void function (GLuint index, GLuint x, GLuint y, GLuint z) PFNGLVERTEXATTRIBI3UIEXTPROC;
alias void function (GLuint index, GLuint x, GLuint y, GLuint z, GLuint w) PFNGLVERTEXATTRIBI4UIEXTPROC;
alias void function (GLuint index, const(GLint)*v) PFNGLVERTEXATTRIBI1IVEXTPROC;
alias void function (GLuint index, const(GLint)*v) PFNGLVERTEXATTRIBI2IVEXTPROC;
alias void function (GLuint index, const(GLint)*v) PFNGLVERTEXATTRIBI3IVEXTPROC;
alias void function (GLuint index, const(GLint)*v) PFNGLVERTEXATTRIBI4IVEXTPROC;
alias void function (GLuint index, const(GLuint)*v) PFNGLVERTEXATTRIBI1UIVEXTPROC;
alias void function (GLuint index, const(GLuint)*v) PFNGLVERTEXATTRIBI2UIVEXTPROC;
alias void function (GLuint index, const(GLuint)*v) PFNGLVERTEXATTRIBI3UIVEXTPROC;
alias void function (GLuint index, const(GLuint)*v) PFNGLVERTEXATTRIBI4UIVEXTPROC;
alias void function (GLuint index, const(GLbyte)*v) PFNGLVERTEXATTRIBI4BVEXTPROC;
alias void function (GLuint index, const(GLshort)*v) PFNGLVERTEXATTRIBI4SVEXTPROC;
alias void function (GLuint index, const(GLubyte)*v) PFNGLVERTEXATTRIBI4UBVEXTPROC;
alias void function (GLuint index, const(GLushort)*v) PFNGLVERTEXATTRIBI4USVEXTPROC;
alias void function (GLuint index, GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer) PFNGLVERTEXATTRIBIPOINTEREXTPROC;
alias void function (GLuint index, GLenum pname, GLint *params) PFNGLGETVERTEXATTRIBIIVEXTPROC;
alias void function (GLuint index, GLenum pname, GLuint *params) PFNGLGETVERTEXATTRIBIUIVEXTPROC;
}

version (GL_EXT_gpu_shader4) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGetUniformuivEXT (GLuint program, GLint location, GLuint *params);
void glBindFragDataLocationEXT (GLuint program, GLuint color, const(GLchar)*name);
GLint glGetFragDataLocationEXT (GLuint program, const(GLchar)*name);
void glUniform1uiEXT (GLint location, GLuint v0);
void glUniform2uiEXT (GLint location, GLuint v0, GLuint v1);
void glUniform3uiEXT (GLint location, GLuint v0, GLuint v1, GLuint v2);
void glUniform4uiEXT (GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3);
void glUniform1uivEXT (GLint location, GLsizei count, const(GLuint)*value);
void glUniform2uivEXT (GLint location, GLsizei count, const(GLuint)*value);
void glUniform3uivEXT (GLint location, GLsizei count, const(GLuint)*value);
void glUniform4uivEXT (GLint location, GLsizei count, const(GLuint)*value);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint program, GLint location, GLuint *params) PFNGLGETUNIFORMUIVEXTPROC;
alias void function (GLuint program, GLuint color, const(GLchar)*name) PFNGLBINDFRAGDATALOCATIONEXTPROC;
alias GLint function (GLuint program, const(GLchar)*name) PFNGLGETFRAGDATALOCATIONEXTPROC;
alias void function (GLint location, GLuint v0) PFNGLUNIFORM1UIEXTPROC;
alias void function (GLint location, GLuint v0, GLuint v1) PFNGLUNIFORM2UIEXTPROC;
alias void function (GLint location, GLuint v0, GLuint v1, GLuint v2) PFNGLUNIFORM3UIEXTPROC;
alias void function (GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3) PFNGLUNIFORM4UIEXTPROC;
alias void function (GLint location, GLsizei count, const(GLuint)*value) PFNGLUNIFORM1UIVEXTPROC;
alias void function (GLint location, GLsizei count, const(GLuint)*value) PFNGLUNIFORM2UIVEXTPROC;
alias void function (GLint location, GLsizei count, const(GLuint)*value) PFNGLUNIFORM3UIVEXTPROC;
alias void function (GLint location, GLsizei count, const(GLuint)*value) PFNGLUNIFORM4UIVEXTPROC;
}

version (GL_EXT_draw_instanced) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDrawArraysInstancedEXT (GLenum mode, GLint start, GLsizei count, GLsizei primcount);
void glDrawElementsInstancedEXT (GLenum mode, GLsizei count, GLenum type, const(GLvoid)*indices, GLsizei primcount);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode, GLint start, GLsizei count, GLsizei primcount) PFNGLDRAWARRAYSINSTANCEDEXTPROC;
alias void function (GLenum mode, GLsizei count, GLenum type, const(GLvoid)*indices, GLsizei primcount) PFNGLDRAWELEMENTSINSTANCEDEXTPROC;
}

version (GL_EXT_packed_float) {} else {
}

version (GL_EXT_texture_array) {} else {
}

version (GL_EXT_texture_buffer_object) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTexBufferEXT (GLenum target, GLenum internalformat, GLuint buffer);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum internalformat, GLuint buffer) PFNGLTEXBUFFEREXTPROC;
}

version (GL_EXT_texture_compression_latc) {} else {
}

version (GL_EXT_texture_compression_rgtc) {} else {
}

version (GL_EXT_texture_shared_exponent) {} else {
}

version (GL_NV_depth_buffer_float) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDepthRangedNV (GLdouble zNear, GLdouble zFar);
void glClearDepthdNV (GLdouble depth);
void glDepthBoundsdNV (GLdouble zmin, GLdouble zmax);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLdouble zNear, GLdouble zFar) PFNGLDEPTHRANGEDNVPROC;
alias void function (GLdouble depth) PFNGLCLEARDEPTHDNVPROC;
alias void function (GLdouble zmin, GLdouble zmax) PFNGLDEPTHBOUNDSDNVPROC;
}

version (GL_NV_fragment_program4) {} else {
}

version (GL_NV_framebuffer_multisample_coverage) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glRenderbufferStorageMultisampleCoverageNV (GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLenum internalformat, GLsizei width, GLsizei height);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLenum internalformat, GLsizei width, GLsizei height) PFNGLRENDERBUFFERSTORAGEMULTISAMPLECOVERAGENVPROC;
}

version (GL_EXT_framebuffer_sRGB) {} else {
}

version (GL_NV_geometry_shader4) {} else {
}

version (GL_NV_parameter_buffer_object) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glProgramBufferParametersfvNV (GLenum target, GLuint buffer, GLuint index, GLsizei count, const(GLfloat)*params);
void glProgramBufferParametersIivNV (GLenum target, GLuint buffer, GLuint index, GLsizei count, const(GLint)*params);
void glProgramBufferParametersIuivNV (GLenum target, GLuint buffer, GLuint index, GLsizei count, const(GLuint)*params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLuint buffer, GLuint index, GLsizei count, const(GLfloat)*params) PFNGLPROGRAMBUFFERPARAMETERSFVNVPROC;
alias void function (GLenum target, GLuint buffer, GLuint index, GLsizei count, const(GLint)*params) PFNGLPROGRAMBUFFERPARAMETERSIIVNVPROC;
alias void function (GLenum target, GLuint buffer, GLuint index, GLsizei count, const(GLuint)*params) PFNGLPROGRAMBUFFERPARAMETERSIUIVNVPROC;
}

version (GL_EXT_draw_buffers2) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glColorMaskIndexedEXT (GLuint index, GLboolean r, GLboolean g, GLboolean b, GLboolean a);
void glGetBooleanIndexedvEXT (GLenum target, GLuint index, GLboolean *data);
void glGetIntegerIndexedvEXT (GLenum target, GLuint index, GLint *data);
void glEnableIndexedEXT (GLenum target, GLuint index);
void glDisableIndexedEXT (GLenum target, GLuint index);
GLboolean glIsEnabledIndexedEXT (GLenum target, GLuint index);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint index, GLboolean r, GLboolean g, GLboolean b, GLboolean a) PFNGLCOLORMASKINDEXEDEXTPROC;
alias void function (GLenum target, GLuint index, GLboolean *data) PFNGLGETBOOLEANINDEXEDVEXTPROC;
alias void function (GLenum target, GLuint index, GLint *data) PFNGLGETINTEGERINDEXEDVEXTPROC;
alias void function (GLenum target, GLuint index) PFNGLENABLEINDEXEDEXTPROC;
alias void function (GLenum target, GLuint index) PFNGLDISABLEINDEXEDEXTPROC;
alias GLboolean function (GLenum target, GLuint index) PFNGLISENABLEDINDEXEDEXTPROC;
}

version (GL_NV_transform_feedback) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBeginTransformFeedbackNV (GLenum primitiveMode);
void glEndTransformFeedbackNV ();
void glTransformFeedbackAttribsNV (GLuint count, const(GLint)*attribs, GLenum bufferMode);
void glBindBufferRangeNV (GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size);
void glBindBufferOffsetNV (GLenum target, GLuint index, GLuint buffer, GLintptr offset);
void glBindBufferBaseNV (GLenum target, GLuint index, GLuint buffer);
void glTransformFeedbackVaryingsNV (GLuint program, GLsizei count, const(GLint)*locations, GLenum bufferMode);
void glActiveVaryingNV (GLuint program, const(GLchar)*name);
GLint glGetVaryingLocationNV (GLuint program, const(GLchar)*name);
void glGetActiveVaryingNV (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLsizei *size, GLenum *type, GLchar *name);
void glGetTransformFeedbackVaryingNV (GLuint program, GLuint index, GLint *location);
void glTransformFeedbackStreamAttribsNV (GLsizei count, const(GLint)*attribs, GLsizei nbuffers, const(GLint)*bufstreams, GLenum bufferMode);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum primitiveMode) PFNGLBEGINTRANSFORMFEEDBACKNVPROC;
alias void function () PFNGLENDTRANSFORMFEEDBACKNVPROC;
alias void function (GLuint count, const(GLint)*attribs, GLenum bufferMode) PFNGLTRANSFORMFEEDBACKATTRIBSNVPROC;
alias void function (GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size) PFNGLBINDBUFFERRANGENVPROC;
alias void function (GLenum target, GLuint index, GLuint buffer, GLintptr offset) PFNGLBINDBUFFEROFFSETNVPROC;
alias void function (GLenum target, GLuint index, GLuint buffer) PFNGLBINDBUFFERBASENVPROC;
alias void function (GLuint program, GLsizei count, const(GLint)*locations, GLenum bufferMode) PFNGLTRANSFORMFEEDBACKVARYINGSNVPROC;
alias void function (GLuint program, const(GLchar)*name) PFNGLACTIVEVARYINGNVPROC;
alias GLint function (GLuint program, const(GLchar)*name) PFNGLGETVARYINGLOCATIONNVPROC;
alias void function (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLsizei *size, GLenum *type, GLchar *name) PFNGLGETACTIVEVARYINGNVPROC;
alias void function (GLuint program, GLuint index, GLint *location) PFNGLGETTRANSFORMFEEDBACKVARYINGNVPROC;
alias void function (GLsizei count, const(GLint)*attribs, GLsizei nbuffers, const(GLint)*bufstreams, GLenum bufferMode) PFNGLTRANSFORMFEEDBACKSTREAMATTRIBSNVPROC;
}

version (GL_EXT_bindable_uniform) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glUniformBufferEXT (GLuint program, GLint location, GLuint buffer);
GLint glGetUniformBufferSizeEXT (GLuint program, GLint location);
GLintptr glGetUniformOffsetEXT (GLuint program, GLint location);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint program, GLint location, GLuint buffer) PFNGLUNIFORMBUFFEREXTPROC;
alias GLint function (GLuint program, GLint location) PFNGLGETUNIFORMBUFFERSIZEEXTPROC;
alias GLintptr function (GLuint program, GLint location) PFNGLGETUNIFORMOFFSETEXTPROC;
}

version (GL_EXT_texture_integer) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTexParameterIivEXT (GLenum target, GLenum pname, const(GLint)*params);
void glTexParameterIuivEXT (GLenum target, GLenum pname, const(GLuint)*params);
void glGetTexParameterIivEXT (GLenum target, GLenum pname, GLint *params);
void glGetTexParameterIuivEXT (GLenum target, GLenum pname, GLuint *params);
void glClearColorIiEXT (GLint red, GLint green, GLint blue, GLint alpha);
void glClearColorIuiEXT (GLuint red, GLuint green, GLuint blue, GLuint alpha);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum pname, const(GLint)*params) PFNGLTEXPARAMETERIIVEXTPROC;
alias void function (GLenum target, GLenum pname, const(GLuint)*params) PFNGLTEXPARAMETERIUIVEXTPROC;
alias void function (GLenum target, GLenum pname, GLint *params) PFNGLGETTEXPARAMETERIIVEXTPROC;
alias void function (GLenum target, GLenum pname, GLuint *params) PFNGLGETTEXPARAMETERIUIVEXTPROC;
alias void function (GLint red, GLint green, GLint blue, GLint alpha) PFNGLCLEARCOLORIIEXTPROC;
alias void function (GLuint red, GLuint green, GLuint blue, GLuint alpha) PFNGLCLEARCOLORIUIEXTPROC;
}

version (GL_GREMEDY_frame_terminator) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glFrameTerminatorGREMEDY ();
} /* GL_GLEXT_PROTOTYPES */
alias void function () PFNGLFRAMETERMINATORGREMEDYPROC;
}

version (GL_NV_conditional_render) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBeginConditionalRenderNV (GLuint id, GLenum mode);
void glEndConditionalRenderNV ();
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint id, GLenum mode) PFNGLBEGINCONDITIONALRENDERNVPROC;
alias void function () PFNGLENDCONDITIONALRENDERNVPROC;
}

version (GL_NV_present_video) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glPresentFrameKeyedNV (GLuint video_slot, GLuint64EXT minPresentTime, GLuint beginPresentTimeId, GLuint presentDurationId, GLenum type, GLenum target0, GLuint fill0, GLuint key0, GLenum target1, GLuint fill1, GLuint key1);
void glPresentFrameDualFillNV (GLuint video_slot, GLuint64EXT minPresentTime, GLuint beginPresentTimeId, GLuint presentDurationId, GLenum type, GLenum target0, GLuint fill0, GLenum target1, GLuint fill1, GLenum target2, GLuint fill2, GLenum target3, GLuint fill3);
void glGetVideoivNV (GLuint video_slot, GLenum pname, GLint *params);
void glGetVideouivNV (GLuint video_slot, GLenum pname, GLuint *params);
void glGetVideoi64vNV (GLuint video_slot, GLenum pname, GLint64EXT *params);
void glGetVideoui64vNV (GLuint video_slot, GLenum pname, GLuint64EXT *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint video_slot, GLuint64EXT minPresentTime, GLuint beginPresentTimeId, GLuint presentDurationId, GLenum type, GLenum target0, GLuint fill0, GLuint key0, GLenum target1, GLuint fill1, GLuint key1) PFNGLPRESENTFRAMEKEYEDNVPROC;
alias void function (GLuint video_slot, GLuint64EXT minPresentTime, GLuint beginPresentTimeId, GLuint presentDurationId, GLenum type, GLenum target0, GLuint fill0, GLenum target1, GLuint fill1, GLenum target2, GLuint fill2, GLenum target3, GLuint fill3) PFNGLPRESENTFRAMEDUALFILLNVPROC;
alias void function (GLuint video_slot, GLenum pname, GLint *params) PFNGLGETVIDEOIVNVPROC;
alias void function (GLuint video_slot, GLenum pname, GLuint *params) PFNGLGETVIDEOUIVNVPROC;
alias void function (GLuint video_slot, GLenum pname, GLint64EXT *params) PFNGLGETVIDEOI64VNVPROC;
alias void function (GLuint video_slot, GLenum pname, GLuint64EXT *params) PFNGLGETVIDEOUI64VNVPROC;
}

version (GL_EXT_transform_feedback) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBeginTransformFeedbackEXT (GLenum primitiveMode);
void glEndTransformFeedbackEXT ();
void glBindBufferRangeEXT (GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size);
void glBindBufferOffsetEXT (GLenum target, GLuint index, GLuint buffer, GLintptr offset);
void glBindBufferBaseEXT (GLenum target, GLuint index, GLuint buffer);
void glTransformFeedbackVaryingsEXT (GLuint program, GLsizei count, const(GLchar)* *varyings, GLenum bufferMode);
void glGetTransformFeedbackVaryingEXT (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLsizei *size, GLenum *type, GLchar *name);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum primitiveMode) PFNGLBEGINTRANSFORMFEEDBACKEXTPROC;
alias void function () PFNGLENDTRANSFORMFEEDBACKEXTPROC;
alias void function (GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size) PFNGLBINDBUFFERRANGEEXTPROC;
alias void function (GLenum target, GLuint index, GLuint buffer, GLintptr offset) PFNGLBINDBUFFEROFFSETEXTPROC;
alias void function (GLenum target, GLuint index, GLuint buffer) PFNGLBINDBUFFERBASEEXTPROC;
alias void function (GLuint program, GLsizei count, const(GLchar)* *varyings, GLenum bufferMode) PFNGLTRANSFORMFEEDBACKVARYINGSEXTPROC;
alias void function (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLsizei *size, GLenum *type, GLchar *name) PFNGLGETTRANSFORMFEEDBACKVARYINGEXTPROC;
}

version (GL_EXT_direct_state_access) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glClientAttribDefaultEXT (GLbitfield mask);
void glPushClientAttribDefaultEXT (GLbitfield mask);
void glMatrixLoadfEXT (GLenum mode, const(GLfloat)*m);
void glMatrixLoaddEXT (GLenum mode, const(GLdouble)*m);
void glMatrixMultfEXT (GLenum mode, const(GLfloat)*m);
void glMatrixMultdEXT (GLenum mode, const(GLdouble)*m);
void glMatrixLoadIdentityEXT (GLenum mode);
void glMatrixRotatefEXT (GLenum mode, GLfloat angle, GLfloat x, GLfloat y, GLfloat z);
void glMatrixRotatedEXT (GLenum mode, GLdouble angle, GLdouble x, GLdouble y, GLdouble z);
void glMatrixScalefEXT (GLenum mode, GLfloat x, GLfloat y, GLfloat z);
void glMatrixScaledEXT (GLenum mode, GLdouble x, GLdouble y, GLdouble z);
void glMatrixTranslatefEXT (GLenum mode, GLfloat x, GLfloat y, GLfloat z);
void glMatrixTranslatedEXT (GLenum mode, GLdouble x, GLdouble y, GLdouble z);
void glMatrixFrustumEXT (GLenum mode, GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble zNear, GLdouble zFar);
void glMatrixOrthoEXT (GLenum mode, GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble zNear, GLdouble zFar);
void glMatrixPopEXT (GLenum mode);
void glMatrixPushEXT (GLenum mode);
void glMatrixLoadTransposefEXT (GLenum mode, const(GLfloat)*m);
void glMatrixLoadTransposedEXT (GLenum mode, const(GLdouble)*m);
void glMatrixMultTransposefEXT (GLenum mode, const(GLfloat)*m);
void glMatrixMultTransposedEXT (GLenum mode, const(GLdouble)*m);
void glTextureParameterfEXT (GLuint texture, GLenum target, GLenum pname, GLfloat param);
void glTextureParameterfvEXT (GLuint texture, GLenum target, GLenum pname, const(GLfloat)*params);
void glTextureParameteriEXT (GLuint texture, GLenum target, GLenum pname, GLint param);
void glTextureParameterivEXT (GLuint texture, GLenum target, GLenum pname, const(GLint)*params);
void glTextureImage1DEXT (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels);
void glTextureImage2DEXT (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels);
void glTextureSubImage1DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const(GLvoid)*pixels);
void glTextureSubImage2DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const(GLvoid)*pixels);
void glCopyTextureImage1DEXT (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border);
void glCopyTextureImage2DEXT (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
void glCopyTextureSubImage1DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width);
void glCopyTextureSubImage2DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
void glGetTextureImageEXT (GLuint texture, GLenum target, GLint level, GLenum format, GLenum type, GLvoid *pixels);
void glGetTextureParameterfvEXT (GLuint texture, GLenum target, GLenum pname, GLfloat *params);
void glGetTextureParameterivEXT (GLuint texture, GLenum target, GLenum pname, GLint *params);
void glGetTextureLevelParameterfvEXT (GLuint texture, GLenum target, GLint level, GLenum pname, GLfloat *params);
void glGetTextureLevelParameterivEXT (GLuint texture, GLenum target, GLint level, GLenum pname, GLint *params);
void glTextureImage3DEXT (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels);
void glTextureSubImage3DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const(GLvoid)*pixels);
void glCopyTextureSubImage3DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
void glMultiTexParameterfEXT (GLenum texunit, GLenum target, GLenum pname, GLfloat param);
void glMultiTexParameterfvEXT (GLenum texunit, GLenum target, GLenum pname, const(GLfloat)*params);
void glMultiTexParameteriEXT (GLenum texunit, GLenum target, GLenum pname, GLint param);
void glMultiTexParameterivEXT (GLenum texunit, GLenum target, GLenum pname, const(GLint)*params);
void glMultiTexImage1DEXT (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels);
void glMultiTexImage2DEXT (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels);
void glMultiTexSubImage1DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const(GLvoid)*pixels);
void glMultiTexSubImage2DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const(GLvoid)*pixels);
void glCopyMultiTexImage1DEXT (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border);
void glCopyMultiTexImage2DEXT (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
void glCopyMultiTexSubImage1DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width);
void glCopyMultiTexSubImage2DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
void glGetMultiTexImageEXT (GLenum texunit, GLenum target, GLint level, GLenum format, GLenum type, GLvoid *pixels);
void glGetMultiTexParameterfvEXT (GLenum texunit, GLenum target, GLenum pname, GLfloat *params);
void glGetMultiTexParameterivEXT (GLenum texunit, GLenum target, GLenum pname, GLint *params);
void glGetMultiTexLevelParameterfvEXT (GLenum texunit, GLenum target, GLint level, GLenum pname, GLfloat *params);
void glGetMultiTexLevelParameterivEXT (GLenum texunit, GLenum target, GLint level, GLenum pname, GLint *params);
void glMultiTexImage3DEXT (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels);
void glMultiTexSubImage3DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const(GLvoid)*pixels);
void glCopyMultiTexSubImage3DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
void glBindMultiTextureEXT (GLenum texunit, GLenum target, GLuint texture);
void glEnableClientStateIndexedEXT (GLenum array, GLuint index);
void glDisableClientStateIndexedEXT (GLenum array, GLuint index);
void glMultiTexCoordPointerEXT (GLenum texunit, GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer);
void glMultiTexEnvfEXT (GLenum texunit, GLenum target, GLenum pname, GLfloat param);
void glMultiTexEnvfvEXT (GLenum texunit, GLenum target, GLenum pname, const(GLfloat)*params);
void glMultiTexEnviEXT (GLenum texunit, GLenum target, GLenum pname, GLint param);
void glMultiTexEnvivEXT (GLenum texunit, GLenum target, GLenum pname, const(GLint)*params);
void glMultiTexGendEXT (GLenum texunit, GLenum coord, GLenum pname, GLdouble param);
void glMultiTexGendvEXT (GLenum texunit, GLenum coord, GLenum pname, const(GLdouble)*params);
void glMultiTexGenfEXT (GLenum texunit, GLenum coord, GLenum pname, GLfloat param);
void glMultiTexGenfvEXT (GLenum texunit, GLenum coord, GLenum pname, const(GLfloat)*params);
void glMultiTexGeniEXT (GLenum texunit, GLenum coord, GLenum pname, GLint param);
void glMultiTexGenivEXT (GLenum texunit, GLenum coord, GLenum pname, const(GLint)*params);
void glGetMultiTexEnvfvEXT (GLenum texunit, GLenum target, GLenum pname, GLfloat *params);
void glGetMultiTexEnvivEXT (GLenum texunit, GLenum target, GLenum pname, GLint *params);
void glGetMultiTexGendvEXT (GLenum texunit, GLenum coord, GLenum pname, GLdouble *params);
void glGetMultiTexGenfvEXT (GLenum texunit, GLenum coord, GLenum pname, GLfloat *params);
void glGetMultiTexGenivEXT (GLenum texunit, GLenum coord, GLenum pname, GLint *params);
void glGetFloatIndexedvEXT (GLenum target, GLuint index, GLfloat *data);
void glGetDoubleIndexedvEXT (GLenum target, GLuint index, GLdouble *data);
void glGetPointerIndexedvEXT (GLenum target, GLuint index, GLvoid* *data);
void glCompressedTextureImage3DEXT (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const(GLvoid)*bits);
void glCompressedTextureImage2DEXT (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const(GLvoid)*bits);
void glCompressedTextureImage1DEXT (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const(GLvoid)*bits);
void glCompressedTextureSubImage3DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const(GLvoid)*bits);
void glCompressedTextureSubImage2DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const(GLvoid)*bits);
void glCompressedTextureSubImage1DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const(GLvoid)*bits);
void glGetCompressedTextureImageEXT (GLuint texture, GLenum target, GLint lod, GLvoid *img);
void glCompressedMultiTexImage3DEXT (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const(GLvoid)*bits);
void glCompressedMultiTexImage2DEXT (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const(GLvoid)*bits);
void glCompressedMultiTexImage1DEXT (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const(GLvoid)*bits);
void glCompressedMultiTexSubImage3DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const(GLvoid)*bits);
void glCompressedMultiTexSubImage2DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const(GLvoid)*bits);
void glCompressedMultiTexSubImage1DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const(GLvoid)*bits);
void glGetCompressedMultiTexImageEXT (GLenum texunit, GLenum target, GLint lod, GLvoid *img);
void glNamedProgramStringEXT (GLuint program, GLenum target, GLenum format, GLsizei len, const(GLvoid)*string_);
void glNamedProgramLocalParameter4dEXT (GLuint program, GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glNamedProgramLocalParameter4dvEXT (GLuint program, GLenum target, GLuint index, const(GLdouble)*params);
void glNamedProgramLocalParameter4fEXT (GLuint program, GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glNamedProgramLocalParameter4fvEXT (GLuint program, GLenum target, GLuint index, const(GLfloat)*params);
void glGetNamedProgramLocalParameterdvEXT (GLuint program, GLenum target, GLuint index, GLdouble *params);
void glGetNamedProgramLocalParameterfvEXT (GLuint program, GLenum target, GLuint index, GLfloat *params);
void glGetNamedProgramivEXT (GLuint program, GLenum target, GLenum pname, GLint *params);
void glGetNamedProgramStringEXT (GLuint program, GLenum target, GLenum pname, GLvoid *string_);
void glNamedProgramLocalParameters4fvEXT (GLuint program, GLenum target, GLuint index, GLsizei count, const(GLfloat)*params);
void glNamedProgramLocalParameterI4iEXT (GLuint program, GLenum target, GLuint index, GLint x, GLint y, GLint z, GLint w);
void glNamedProgramLocalParameterI4ivEXT (GLuint program, GLenum target, GLuint index, const(GLint)*params);
void glNamedProgramLocalParametersI4ivEXT (GLuint program, GLenum target, GLuint index, GLsizei count, const(GLint)*params);
void glNamedProgramLocalParameterI4uiEXT (GLuint program, GLenum target, GLuint index, GLuint x, GLuint y, GLuint z, GLuint w);
void glNamedProgramLocalParameterI4uivEXT (GLuint program, GLenum target, GLuint index, const(GLuint)*params);
void glNamedProgramLocalParametersI4uivEXT (GLuint program, GLenum target, GLuint index, GLsizei count, const(GLuint)*params);
void glGetNamedProgramLocalParameterIivEXT (GLuint program, GLenum target, GLuint index, GLint *params);
void glGetNamedProgramLocalParameterIuivEXT (GLuint program, GLenum target, GLuint index, GLuint *params);
void glTextureParameterIivEXT (GLuint texture, GLenum target, GLenum pname, const(GLint)*params);
void glTextureParameterIuivEXT (GLuint texture, GLenum target, GLenum pname, const(GLuint)*params);
void glGetTextureParameterIivEXT (GLuint texture, GLenum target, GLenum pname, GLint *params);
void glGetTextureParameterIuivEXT (GLuint texture, GLenum target, GLenum pname, GLuint *params);
void glMultiTexParameterIivEXT (GLenum texunit, GLenum target, GLenum pname, const(GLint)*params);
void glMultiTexParameterIuivEXT (GLenum texunit, GLenum target, GLenum pname, const(GLuint)*params);
void glGetMultiTexParameterIivEXT (GLenum texunit, GLenum target, GLenum pname, GLint *params);
void glGetMultiTexParameterIuivEXT (GLenum texunit, GLenum target, GLenum pname, GLuint *params);
void glProgramUniform1fEXT (GLuint program, GLint location, GLfloat v0);
void glProgramUniform2fEXT (GLuint program, GLint location, GLfloat v0, GLfloat v1);
void glProgramUniform3fEXT (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
void glProgramUniform4fEXT (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
void glProgramUniform1iEXT (GLuint program, GLint location, GLint v0);
void glProgramUniform2iEXT (GLuint program, GLint location, GLint v0, GLint v1);
void glProgramUniform3iEXT (GLuint program, GLint location, GLint v0, GLint v1, GLint v2);
void glProgramUniform4iEXT (GLuint program, GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
void glProgramUniform1fvEXT (GLuint program, GLint location, GLsizei count, const(GLfloat)*value);
void glProgramUniform2fvEXT (GLuint program, GLint location, GLsizei count, const(GLfloat)*value);
void glProgramUniform3fvEXT (GLuint program, GLint location, GLsizei count, const(GLfloat)*value);
void glProgramUniform4fvEXT (GLuint program, GLint location, GLsizei count, const(GLfloat)*value);
void glProgramUniform1ivEXT (GLuint program, GLint location, GLsizei count, const(GLint)*value);
void glProgramUniform2ivEXT (GLuint program, GLint location, GLsizei count, const(GLint)*value);
void glProgramUniform3ivEXT (GLuint program, GLint location, GLsizei count, const(GLint)*value);
void glProgramUniform4ivEXT (GLuint program, GLint location, GLsizei count, const(GLint)*value);
void glProgramUniformMatrix2fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix3fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix4fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix2x3fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix3x2fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix2x4fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix4x2fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix3x4fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniformMatrix4x3fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value);
void glProgramUniform1uiEXT (GLuint program, GLint location, GLuint v0);
void glProgramUniform2uiEXT (GLuint program, GLint location, GLuint v0, GLuint v1);
void glProgramUniform3uiEXT (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2);
void glProgramUniform4uiEXT (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3);
void glProgramUniform1uivEXT (GLuint program, GLint location, GLsizei count, const(GLuint)*value);
void glProgramUniform2uivEXT (GLuint program, GLint location, GLsizei count, const(GLuint)*value);
void glProgramUniform3uivEXT (GLuint program, GLint location, GLsizei count, const(GLuint)*value);
void glProgramUniform4uivEXT (GLuint program, GLint location, GLsizei count, const(GLuint)*value);
void glNamedBufferDataEXT (GLuint buffer, GLsizeiptr size, const(GLvoid)*data, GLenum usage);
void glNamedBufferSubDataEXT (GLuint buffer, GLintptr offset, GLsizeiptr size, const(GLvoid)*data);
GLvoid* glMapNamedBufferEXT (GLuint buffer, GLenum access);
GLboolean glUnmapNamedBufferEXT (GLuint buffer);
GLvoid* glMapNamedBufferRangeEXT (GLuint buffer, GLintptr offset, GLsizeiptr length, GLbitfield access);
void glFlushMappedNamedBufferRangeEXT (GLuint buffer, GLintptr offset, GLsizeiptr length);
void glNamedCopyBufferSubDataEXT (GLuint readBuffer, GLuint writeBuffer, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size);
void glGetNamedBufferParameterivEXT (GLuint buffer, GLenum pname, GLint *params);
void glGetNamedBufferPointervEXT (GLuint buffer, GLenum pname, GLvoid* *params);
void glGetNamedBufferSubDataEXT (GLuint buffer, GLintptr offset, GLsizeiptr size, GLvoid *data);
void glTextureBufferEXT (GLuint texture, GLenum target, GLenum internalformat, GLuint buffer);
void glMultiTexBufferEXT (GLenum texunit, GLenum target, GLenum internalformat, GLuint buffer);
void glNamedRenderbufferStorageEXT (GLuint renderbuffer, GLenum internalformat, GLsizei width, GLsizei height);
void glGetNamedRenderbufferParameterivEXT (GLuint renderbuffer, GLenum pname, GLint *params);
GLenum glCheckNamedFramebufferStatusEXT (GLuint framebuffer, GLenum target);
void glNamedFramebufferTexture1DEXT (GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
void glNamedFramebufferTexture2DEXT (GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
void glNamedFramebufferTexture3DEXT (GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset);
void glNamedFramebufferRenderbufferEXT (GLuint framebuffer, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer);
void glGetNamedFramebufferAttachmentParameterivEXT (GLuint framebuffer, GLenum attachment, GLenum pname, GLint *params);
void glGenerateTextureMipmapEXT (GLuint texture, GLenum target);
void glGenerateMultiTexMipmapEXT (GLenum texunit, GLenum target);
void glFramebufferDrawBufferEXT (GLuint framebuffer, GLenum mode);
void glFramebufferDrawBuffersEXT (GLuint framebuffer, GLsizei n, const(GLenum)*bufs);
void glFramebufferReadBufferEXT (GLuint framebuffer, GLenum mode);
void glGetFramebufferParameterivEXT (GLuint framebuffer, GLenum pname, GLint *params);
void glNamedRenderbufferStorageMultisampleEXT (GLuint renderbuffer, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
void glNamedRenderbufferStorageMultisampleCoverageEXT (GLuint renderbuffer, GLsizei coverageSamples, GLsizei colorSamples, GLenum internalformat, GLsizei width, GLsizei height);
void glNamedFramebufferTextureEXT (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level);
void glNamedFramebufferTextureLayerEXT (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level, GLint layer);
void glNamedFramebufferTextureFaceEXT (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level, GLenum face);
void glTextureRenderbufferEXT (GLuint texture, GLenum target, GLuint renderbuffer);
void glMultiTexRenderbufferEXT (GLenum texunit, GLenum target, GLuint renderbuffer);
void glProgramUniform1dEXT (GLuint program, GLint location, GLdouble x);
void glProgramUniform2dEXT (GLuint program, GLint location, GLdouble x, GLdouble y);
void glProgramUniform3dEXT (GLuint program, GLint location, GLdouble x, GLdouble y, GLdouble z);
void glProgramUniform4dEXT (GLuint program, GLint location, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glProgramUniform1dvEXT (GLuint program, GLint location, GLsizei count, const(GLdouble)*value);
void glProgramUniform2dvEXT (GLuint program, GLint location, GLsizei count, const(GLdouble)*value);
void glProgramUniform3dvEXT (GLuint program, GLint location, GLsizei count, const(GLdouble)*value);
void glProgramUniform4dvEXT (GLuint program, GLint location, GLsizei count, const(GLdouble)*value);
void glProgramUniformMatrix2dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glProgramUniformMatrix3dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glProgramUniformMatrix4dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glProgramUniformMatrix2x3dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glProgramUniformMatrix2x4dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glProgramUniformMatrix3x2dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glProgramUniformMatrix3x4dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glProgramUniformMatrix4x2dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
void glProgramUniformMatrix4x3dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLbitfield mask) PFNGLCLIENTATTRIBDEFAULTEXTPROC;
alias void function (GLbitfield mask) PFNGLPUSHCLIENTATTRIBDEFAULTEXTPROC;
alias void function (GLenum mode, const(GLfloat)*m) PFNGLMATRIXLOADFEXTPROC;
alias void function (GLenum mode, const(GLdouble)*m) PFNGLMATRIXLOADDEXTPROC;
alias void function (GLenum mode, const(GLfloat)*m) PFNGLMATRIXMULTFEXTPROC;
alias void function (GLenum mode, const(GLdouble)*m) PFNGLMATRIXMULTDEXTPROC;
alias void function (GLenum mode) PFNGLMATRIXLOADIDENTITYEXTPROC;
alias void function (GLenum mode, GLfloat angle, GLfloat x, GLfloat y, GLfloat z) PFNGLMATRIXROTATEFEXTPROC;
alias void function (GLenum mode, GLdouble angle, GLdouble x, GLdouble y, GLdouble z) PFNGLMATRIXROTATEDEXTPROC;
alias void function (GLenum mode, GLfloat x, GLfloat y, GLfloat z) PFNGLMATRIXSCALEFEXTPROC;
alias void function (GLenum mode, GLdouble x, GLdouble y, GLdouble z) PFNGLMATRIXSCALEDEXTPROC;
alias void function (GLenum mode, GLfloat x, GLfloat y, GLfloat z) PFNGLMATRIXTRANSLATEFEXTPROC;
alias void function (GLenum mode, GLdouble x, GLdouble y, GLdouble z) PFNGLMATRIXTRANSLATEDEXTPROC;
alias void function (GLenum mode, GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble zNear, GLdouble zFar) PFNGLMATRIXFRUSTUMEXTPROC;
alias void function (GLenum mode, GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble zNear, GLdouble zFar) PFNGLMATRIXORTHOEXTPROC;
alias void function (GLenum mode) PFNGLMATRIXPOPEXTPROC;
alias void function (GLenum mode) PFNGLMATRIXPUSHEXTPROC;
alias void function (GLenum mode, const(GLfloat)*m) PFNGLMATRIXLOADTRANSPOSEFEXTPROC;
alias void function (GLenum mode, const(GLdouble)*m) PFNGLMATRIXLOADTRANSPOSEDEXTPROC;
alias void function (GLenum mode, const(GLfloat)*m) PFNGLMATRIXMULTTRANSPOSEFEXTPROC;
alias void function (GLenum mode, const(GLdouble)*m) PFNGLMATRIXMULTTRANSPOSEDEXTPROC;
alias void function (GLuint texture, GLenum target, GLenum pname, GLfloat param) PFNGLTEXTUREPARAMETERFEXTPROC;
alias void function (GLuint texture, GLenum target, GLenum pname, const(GLfloat)*params) PFNGLTEXTUREPARAMETERFVEXTPROC;
alias void function (GLuint texture, GLenum target, GLenum pname, GLint param) PFNGLTEXTUREPARAMETERIEXTPROC;
alias void function (GLuint texture, GLenum target, GLenum pname, const(GLint)*params) PFNGLTEXTUREPARAMETERIVEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLTEXTUREIMAGE1DEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLTEXTUREIMAGE2DEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLTEXTURESUBIMAGE1DEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLTEXTURESUBIMAGE2DEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border) PFNGLCOPYTEXTUREIMAGE1DEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border) PFNGLCOPYTEXTUREIMAGE2DEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width) PFNGLCOPYTEXTURESUBIMAGE1DEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height) PFNGLCOPYTEXTURESUBIMAGE2DEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLenum format, GLenum type, GLvoid *pixels) PFNGLGETTEXTUREIMAGEEXTPROC;
alias void function (GLuint texture, GLenum target, GLenum pname, GLfloat *params) PFNGLGETTEXTUREPARAMETERFVEXTPROC;
alias void function (GLuint texture, GLenum target, GLenum pname, GLint *params) PFNGLGETTEXTUREPARAMETERIVEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLenum pname, GLfloat *params) PFNGLGETTEXTURELEVELPARAMETERFVEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLenum pname, GLint *params) PFNGLGETTEXTURELEVELPARAMETERIVEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLTEXTUREIMAGE3DEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLTEXTURESUBIMAGE3DEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height) PFNGLCOPYTEXTURESUBIMAGE3DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum pname, GLfloat param) PFNGLMULTITEXPARAMETERFEXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum pname, const(GLfloat)*params) PFNGLMULTITEXPARAMETERFVEXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum pname, GLint param) PFNGLMULTITEXPARAMETERIEXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum pname, const(GLint)*params) PFNGLMULTITEXPARAMETERIVEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLMULTITEXIMAGE1DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLMULTITEXIMAGE2DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLMULTITEXSUBIMAGE1DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLMULTITEXSUBIMAGE2DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border) PFNGLCOPYMULTITEXIMAGE1DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border) PFNGLCOPYMULTITEXIMAGE2DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width) PFNGLCOPYMULTITEXSUBIMAGE1DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height) PFNGLCOPYMULTITEXSUBIMAGE2DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLenum format, GLenum type, GLvoid *pixels) PFNGLGETMULTITEXIMAGEEXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum pname, GLfloat *params) PFNGLGETMULTITEXPARAMETERFVEXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum pname, GLint *params) PFNGLGETMULTITEXPARAMETERIVEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLenum pname, GLfloat *params) PFNGLGETMULTITEXLEVELPARAMETERFVEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLenum pname, GLint *params) PFNGLGETMULTITEXLEVELPARAMETERIVEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLMULTITEXIMAGE3DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const(GLvoid)*pixels) PFNGLMULTITEXSUBIMAGE3DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height) PFNGLCOPYMULTITEXSUBIMAGE3DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLuint texture) PFNGLBINDMULTITEXTUREEXTPROC;
alias void function (GLenum array, GLuint index) PFNGLENABLECLIENTSTATEINDEXEDEXTPROC;
alias void function (GLenum array, GLuint index) PFNGLDISABLECLIENTSTATEINDEXEDEXTPROC;
alias void function (GLenum texunit, GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer) PFNGLMULTITEXCOORDPOINTEREXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum pname, GLfloat param) PFNGLMULTITEXENVFEXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum pname, const(GLfloat)*params) PFNGLMULTITEXENVFVEXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum pname, GLint param) PFNGLMULTITEXENVIEXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum pname, const(GLint)*params) PFNGLMULTITEXENVIVEXTPROC;
alias void function (GLenum texunit, GLenum coord, GLenum pname, GLdouble param) PFNGLMULTITEXGENDEXTPROC;
alias void function (GLenum texunit, GLenum coord, GLenum pname, const(GLdouble)*params) PFNGLMULTITEXGENDVEXTPROC;
alias void function (GLenum texunit, GLenum coord, GLenum pname, GLfloat param) PFNGLMULTITEXGENFEXTPROC;
alias void function (GLenum texunit, GLenum coord, GLenum pname, const(GLfloat)*params) PFNGLMULTITEXGENFVEXTPROC;
alias void function (GLenum texunit, GLenum coord, GLenum pname, GLint param) PFNGLMULTITEXGENIEXTPROC;
alias void function (GLenum texunit, GLenum coord, GLenum pname, const(GLint)*params) PFNGLMULTITEXGENIVEXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum pname, GLfloat *params) PFNGLGETMULTITEXENVFVEXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum pname, GLint *params) PFNGLGETMULTITEXENVIVEXTPROC;
alias void function (GLenum texunit, GLenum coord, GLenum pname, GLdouble *params) PFNGLGETMULTITEXGENDVEXTPROC;
alias void function (GLenum texunit, GLenum coord, GLenum pname, GLfloat *params) PFNGLGETMULTITEXGENFVEXTPROC;
alias void function (GLenum texunit, GLenum coord, GLenum pname, GLint *params) PFNGLGETMULTITEXGENIVEXTPROC;
alias void function (GLenum target, GLuint index, GLfloat *data) PFNGLGETFLOATINDEXEDVEXTPROC;
alias void function (GLenum target, GLuint index, GLdouble *data) PFNGLGETDOUBLEINDEXEDVEXTPROC;
alias void function (GLenum target, GLuint index, GLvoid* *data) PFNGLGETPOINTERINDEXEDVEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const(GLvoid)*bits) PFNGLCOMPRESSEDTEXTUREIMAGE3DEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const(GLvoid)*bits) PFNGLCOMPRESSEDTEXTUREIMAGE2DEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const(GLvoid)*bits) PFNGLCOMPRESSEDTEXTUREIMAGE1DEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const(GLvoid)*bits) PFNGLCOMPRESSEDTEXTURESUBIMAGE3DEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const(GLvoid)*bits) PFNGLCOMPRESSEDTEXTURESUBIMAGE2DEXTPROC;
alias void function (GLuint texture, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const(GLvoid)*bits) PFNGLCOMPRESSEDTEXTURESUBIMAGE1DEXTPROC;
alias void function (GLuint texture, GLenum target, GLint lod, GLvoid *img) PFNGLGETCOMPRESSEDTEXTUREIMAGEEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const(GLvoid)*bits) PFNGLCOMPRESSEDMULTITEXIMAGE3DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const(GLvoid)*bits) PFNGLCOMPRESSEDMULTITEXIMAGE2DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const(GLvoid)*bits) PFNGLCOMPRESSEDMULTITEXIMAGE1DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const(GLvoid)*bits) PFNGLCOMPRESSEDMULTITEXSUBIMAGE3DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const(GLvoid)*bits) PFNGLCOMPRESSEDMULTITEXSUBIMAGE2DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const(GLvoid)*bits) PFNGLCOMPRESSEDMULTITEXSUBIMAGE1DEXTPROC;
alias void function (GLenum texunit, GLenum target, GLint lod, GLvoid *img) PFNGLGETCOMPRESSEDMULTITEXIMAGEEXTPROC;
alias void function (GLuint program, GLenum target, GLenum format, GLsizei len, const(GLvoid)*string_) PFNGLNAMEDPROGRAMSTRINGEXTPROC;
alias void function (GLuint program, GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w) PFNGLNAMEDPROGRAMLOCALPARAMETER4DEXTPROC;
alias void function (GLuint program, GLenum target, GLuint index, const(GLdouble)*params) PFNGLNAMEDPROGRAMLOCALPARAMETER4DVEXTPROC;
alias void function (GLuint program, GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w) PFNGLNAMEDPROGRAMLOCALPARAMETER4FEXTPROC;
alias void function (GLuint program, GLenum target, GLuint index, const(GLfloat)*params) PFNGLNAMEDPROGRAMLOCALPARAMETER4FVEXTPROC;
alias void function (GLuint program, GLenum target, GLuint index, GLdouble *params) PFNGLGETNAMEDPROGRAMLOCALPARAMETERDVEXTPROC;
alias void function (GLuint program, GLenum target, GLuint index, GLfloat *params) PFNGLGETNAMEDPROGRAMLOCALPARAMETERFVEXTPROC;
alias void function (GLuint program, GLenum target, GLenum pname, GLint *params) PFNGLGETNAMEDPROGRAMIVEXTPROC;
alias void function (GLuint program, GLenum target, GLenum pname, GLvoid *string_) PFNGLGETNAMEDPROGRAMSTRINGEXTPROC;
alias void function (GLuint program, GLenum target, GLuint index, GLsizei count, const(GLfloat)*params) PFNGLNAMEDPROGRAMLOCALPARAMETERS4FVEXTPROC;
alias void function (GLuint program, GLenum target, GLuint index, GLint x, GLint y, GLint z, GLint w) PFNGLNAMEDPROGRAMLOCALPARAMETERI4IEXTPROC;
alias void function (GLuint program, GLenum target, GLuint index, const(GLint)*params) PFNGLNAMEDPROGRAMLOCALPARAMETERI4IVEXTPROC;
alias void function (GLuint program, GLenum target, GLuint index, GLsizei count, const(GLint)*params) PFNGLNAMEDPROGRAMLOCALPARAMETERSI4IVEXTPROC;
alias void function (GLuint program, GLenum target, GLuint index, GLuint x, GLuint y, GLuint z, GLuint w) PFNGLNAMEDPROGRAMLOCALPARAMETERI4UIEXTPROC;
alias void function (GLuint program, GLenum target, GLuint index, const(GLuint)*params) PFNGLNAMEDPROGRAMLOCALPARAMETERI4UIVEXTPROC;
alias void function (GLuint program, GLenum target, GLuint index, GLsizei count, const(GLuint)*params) PFNGLNAMEDPROGRAMLOCALPARAMETERSI4UIVEXTPROC;
alias void function (GLuint program, GLenum target, GLuint index, GLint *params) PFNGLGETNAMEDPROGRAMLOCALPARAMETERIIVEXTPROC;
alias void function (GLuint program, GLenum target, GLuint index, GLuint *params) PFNGLGETNAMEDPROGRAMLOCALPARAMETERIUIVEXTPROC;
alias void function (GLuint texture, GLenum target, GLenum pname, const(GLint)*params) PFNGLTEXTUREPARAMETERIIVEXTPROC;
alias void function (GLuint texture, GLenum target, GLenum pname, const(GLuint)*params) PFNGLTEXTUREPARAMETERIUIVEXTPROC;
alias void function (GLuint texture, GLenum target, GLenum pname, GLint *params) PFNGLGETTEXTUREPARAMETERIIVEXTPROC;
alias void function (GLuint texture, GLenum target, GLenum pname, GLuint *params) PFNGLGETTEXTUREPARAMETERIUIVEXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum pname, const(GLint)*params) PFNGLMULTITEXPARAMETERIIVEXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum pname, const(GLuint)*params) PFNGLMULTITEXPARAMETERIUIVEXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum pname, GLint *params) PFNGLGETMULTITEXPARAMETERIIVEXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum pname, GLuint *params) PFNGLGETMULTITEXPARAMETERIUIVEXTPROC;
alias void function (GLuint program, GLint location, GLfloat v0) PFNGLPROGRAMUNIFORM1FEXTPROC;
alias void function (GLuint program, GLint location, GLfloat v0, GLfloat v1) PFNGLPROGRAMUNIFORM2FEXTPROC;
alias void function (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2) PFNGLPROGRAMUNIFORM3FEXTPROC;
alias void function (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3) PFNGLPROGRAMUNIFORM4FEXTPROC;
alias void function (GLuint program, GLint location, GLint v0) PFNGLPROGRAMUNIFORM1IEXTPROC;
alias void function (GLuint program, GLint location, GLint v0, GLint v1) PFNGLPROGRAMUNIFORM2IEXTPROC;
alias void function (GLuint program, GLint location, GLint v0, GLint v1, GLint v2) PFNGLPROGRAMUNIFORM3IEXTPROC;
alias void function (GLuint program, GLint location, GLint v0, GLint v1, GLint v2, GLint v3) PFNGLPROGRAMUNIFORM4IEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLfloat)*value) PFNGLPROGRAMUNIFORM1FVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLfloat)*value) PFNGLPROGRAMUNIFORM2FVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLfloat)*value) PFNGLPROGRAMUNIFORM3FVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLfloat)*value) PFNGLPROGRAMUNIFORM4FVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLint)*value) PFNGLPROGRAMUNIFORM1IVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLint)*value) PFNGLPROGRAMUNIFORM2IVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLint)*value) PFNGLPROGRAMUNIFORM3IVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLint)*value) PFNGLPROGRAMUNIFORM4IVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX2FVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX3FVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX4FVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX2X3FVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX3X2FVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX2X4FVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX4X2FVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX3X4FVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLfloat)*value) PFNGLPROGRAMUNIFORMMATRIX4X3FVEXTPROC;
alias void function (GLuint program, GLint location, GLuint v0) PFNGLPROGRAMUNIFORM1UIEXTPROC;
alias void function (GLuint program, GLint location, GLuint v0, GLuint v1) PFNGLPROGRAMUNIFORM2UIEXTPROC;
alias void function (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2) PFNGLPROGRAMUNIFORM3UIEXTPROC;
alias void function (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3) PFNGLPROGRAMUNIFORM4UIEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLuint)*value) PFNGLPROGRAMUNIFORM1UIVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLuint)*value) PFNGLPROGRAMUNIFORM2UIVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLuint)*value) PFNGLPROGRAMUNIFORM3UIVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLuint)*value) PFNGLPROGRAMUNIFORM4UIVEXTPROC;
alias void function (GLuint buffer, GLsizeiptr size, const(GLvoid)*data, GLenum usage) PFNGLNAMEDBUFFERDATAEXTPROC;
alias void function (GLuint buffer, GLintptr offset, GLsizeiptr size, const(GLvoid)*data) PFNGLNAMEDBUFFERSUBDATAEXTPROC;
alias GLvoid* function (GLuint buffer, GLenum access) PFNGLMAPNAMEDBUFFEREXTPROC;
alias GLboolean function (GLuint buffer) PFNGLUNMAPNAMEDBUFFEREXTPROC;
alias GLvoid* function (GLuint buffer, GLintptr offset, GLsizeiptr length, GLbitfield access) PFNGLMAPNAMEDBUFFERRANGEEXTPROC;
alias void function (GLuint buffer, GLintptr offset, GLsizeiptr length) PFNGLFLUSHMAPPEDNAMEDBUFFERRANGEEXTPROC;
alias void function (GLuint readBuffer, GLuint writeBuffer, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size) PFNGLNAMEDCOPYBUFFERSUBDATAEXTPROC;
alias void function (GLuint buffer, GLenum pname, GLint *params) PFNGLGETNAMEDBUFFERPARAMETERIVEXTPROC;
alias void function (GLuint buffer, GLenum pname, GLvoid* *params) PFNGLGETNAMEDBUFFERPOINTERVEXTPROC;
alias void function (GLuint buffer, GLintptr offset, GLsizeiptr size, GLvoid *data) PFNGLGETNAMEDBUFFERSUBDATAEXTPROC;
alias void function (GLuint texture, GLenum target, GLenum internalformat, GLuint buffer) PFNGLTEXTUREBUFFEREXTPROC;
alias void function (GLenum texunit, GLenum target, GLenum internalformat, GLuint buffer) PFNGLMULTITEXBUFFEREXTPROC;
alias void function (GLuint renderbuffer, GLenum internalformat, GLsizei width, GLsizei height) PFNGLNAMEDRENDERBUFFERSTORAGEEXTPROC;
alias void function (GLuint renderbuffer, GLenum pname, GLint *params) PFNGLGETNAMEDRENDERBUFFERPARAMETERIVEXTPROC;
alias GLenum function (GLuint framebuffer, GLenum target) PFNGLCHECKNAMEDFRAMEBUFFERSTATUSEXTPROC;
alias void function (GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level) PFNGLNAMEDFRAMEBUFFERTEXTURE1DEXTPROC;
alias void function (GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level) PFNGLNAMEDFRAMEBUFFERTEXTURE2DEXTPROC;
alias void function (GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset) PFNGLNAMEDFRAMEBUFFERTEXTURE3DEXTPROC;
alias void function (GLuint framebuffer, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer) PFNGLNAMEDFRAMEBUFFERRENDERBUFFEREXTPROC;
alias void function (GLuint framebuffer, GLenum attachment, GLenum pname, GLint *params) PFNGLGETNAMEDFRAMEBUFFERATTACHMENTPARAMETERIVEXTPROC;
alias void function (GLuint texture, GLenum target) PFNGLGENERATETEXTUREMIPMAPEXTPROC;
alias void function (GLenum texunit, GLenum target) PFNGLGENERATEMULTITEXMIPMAPEXTPROC;
alias void function (GLuint framebuffer, GLenum mode) PFNGLFRAMEBUFFERDRAWBUFFEREXTPROC;
alias void function (GLuint framebuffer, GLsizei n, const(GLenum)*bufs) PFNGLFRAMEBUFFERDRAWBUFFERSEXTPROC;
alias void function (GLuint framebuffer, GLenum mode) PFNGLFRAMEBUFFERREADBUFFEREXTPROC;
alias void function (GLuint framebuffer, GLenum pname, GLint *params) PFNGLGETFRAMEBUFFERPARAMETERIVEXTPROC;
alias void function (GLuint renderbuffer, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height) PFNGLNAMEDRENDERBUFFERSTORAGEMULTISAMPLEEXTPROC;
alias void function (GLuint renderbuffer, GLsizei coverageSamples, GLsizei colorSamples, GLenum internalformat, GLsizei width, GLsizei height) PFNGLNAMEDRENDERBUFFERSTORAGEMULTISAMPLECOVERAGEEXTPROC;
alias void function (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level) PFNGLNAMEDFRAMEBUFFERTEXTUREEXTPROC;
alias void function (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level, GLint layer) PFNGLNAMEDFRAMEBUFFERTEXTURELAYEREXTPROC;
alias void function (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level, GLenum face) PFNGLNAMEDFRAMEBUFFERTEXTUREFACEEXTPROC;
alias void function (GLuint texture, GLenum target, GLuint renderbuffer) PFNGLTEXTURERENDERBUFFEREXTPROC;
alias void function (GLenum texunit, GLenum target, GLuint renderbuffer) PFNGLMULTITEXRENDERBUFFEREXTPROC;
alias void function (GLuint program, GLint location, GLdouble x) PFNGLPROGRAMUNIFORM1DEXTPROC;
alias void function (GLuint program, GLint location, GLdouble x, GLdouble y) PFNGLPROGRAMUNIFORM2DEXTPROC;
alias void function (GLuint program, GLint location, GLdouble x, GLdouble y, GLdouble z) PFNGLPROGRAMUNIFORM3DEXTPROC;
alias void function (GLuint program, GLint location, GLdouble x, GLdouble y, GLdouble z, GLdouble w) PFNGLPROGRAMUNIFORM4DEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLdouble)*value) PFNGLPROGRAMUNIFORM1DVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLdouble)*value) PFNGLPROGRAMUNIFORM2DVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLdouble)*value) PFNGLPROGRAMUNIFORM3DVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLdouble)*value) PFNGLPROGRAMUNIFORM4DVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX2DVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX3DVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX4DVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX2X3DVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX2X4DVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX3X2DVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX3X4DVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX4X2DVEXTPROC;
alias void function (GLuint program, GLint location, GLsizei count, GLboolean transpose, const(GLdouble)*value) PFNGLPROGRAMUNIFORMMATRIX4X3DVEXTPROC;
}

version (GL_EXT_vertex_array_bgra) {} else {
}

version (GL_EXT_texture_swizzle) {} else {
}

version (GL_NV_explicit_multisample) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGetMultisamplefvNV (GLenum pname, GLuint index, GLfloat *val);
void glSampleMaskIndexedNV (GLuint index, GLbitfield mask);
void glTexRenderbufferNV (GLenum target, GLuint renderbuffer);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum pname, GLuint index, GLfloat *val) PFNGLGETMULTISAMPLEFVNVPROC;
alias void function (GLuint index, GLbitfield mask) PFNGLSAMPLEMASKINDEXEDNVPROC;
alias void function (GLenum target, GLuint renderbuffer) PFNGLTEXRENDERBUFFERNVPROC;
}

version (GL_NV_transform_feedback2) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBindTransformFeedbackNV (GLenum target, GLuint id);
void glDeleteTransformFeedbacksNV (GLsizei n, const(GLuint)*ids);
void glGenTransformFeedbacksNV (GLsizei n, GLuint *ids);
GLboolean glIsTransformFeedbackNV (GLuint id);
void glPauseTransformFeedbackNV ();
void glResumeTransformFeedbackNV ();
void glDrawTransformFeedbackNV (GLenum mode, GLuint id);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLuint id) PFNGLBINDTRANSFORMFEEDBACKNVPROC;
alias void function (GLsizei n, const(GLuint)*ids) PFNGLDELETETRANSFORMFEEDBACKSNVPROC;
alias void function (GLsizei n, GLuint *ids) PFNGLGENTRANSFORMFEEDBACKSNVPROC;
alias GLboolean function (GLuint id) PFNGLISTRANSFORMFEEDBACKNVPROC;
alias void function () PFNGLPAUSETRANSFORMFEEDBACKNVPROC;
alias void function () PFNGLRESUMETRANSFORMFEEDBACKNVPROC;
alias void function (GLenum mode, GLuint id) PFNGLDRAWTRANSFORMFEEDBACKNVPROC;
}

version (GL_ATI_meminfo) {} else {
}

version (GL_AMD_performance_monitor) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGetPerfMonitorGroupsAMD (GLint *numGroups, GLsizei groupsSize, GLuint *groups);
void glGetPerfMonitorCountersAMD (GLuint group, GLint *numCounters, GLint *maxActiveCounters, GLsizei counterSize, GLuint *counters);
void glGetPerfMonitorGroupStringAMD (GLuint group, GLsizei bufSize, GLsizei *length, GLchar *groupString);
void glGetPerfMonitorCounterStringAMD (GLuint group, GLuint counter, GLsizei bufSize, GLsizei *length, GLchar *counterString);
void glGetPerfMonitorCounterInfoAMD (GLuint group, GLuint counter, GLenum pname, GLvoid *data);
void glGenPerfMonitorsAMD (GLsizei n, GLuint *monitors);
void glDeletePerfMonitorsAMD (GLsizei n, GLuint *monitors);
void glSelectPerfMonitorCountersAMD (GLuint monitor, GLboolean enable, GLuint group, GLint numCounters, GLuint *counterList);
void glBeginPerfMonitorAMD (GLuint monitor);
void glEndPerfMonitorAMD (GLuint monitor);
void glGetPerfMonitorCounterDataAMD (GLuint monitor, GLenum pname, GLsizei dataSize, GLuint *data, GLint *bytesWritten);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLint *numGroups, GLsizei groupsSize, GLuint *groups) PFNGLGETPERFMONITORGROUPSAMDPROC;
alias void function (GLuint group, GLint *numCounters, GLint *maxActiveCounters, GLsizei counterSize, GLuint *counters) PFNGLGETPERFMONITORCOUNTERSAMDPROC;
alias void function (GLuint group, GLsizei bufSize, GLsizei *length, GLchar *groupString) PFNGLGETPERFMONITORGROUPSTRINGAMDPROC;
alias void function (GLuint group, GLuint counter, GLsizei bufSize, GLsizei *length, GLchar *counterString) PFNGLGETPERFMONITORCOUNTERSTRINGAMDPROC;
alias void function (GLuint group, GLuint counter, GLenum pname, GLvoid *data) PFNGLGETPERFMONITORCOUNTERINFOAMDPROC;
alias void function (GLsizei n, GLuint *monitors) PFNGLGENPERFMONITORSAMDPROC;
alias void function (GLsizei n, GLuint *monitors) PFNGLDELETEPERFMONITORSAMDPROC;
alias void function (GLuint monitor, GLboolean enable, GLuint group, GLint numCounters, GLuint *counterList) PFNGLSELECTPERFMONITORCOUNTERSAMDPROC;
alias void function (GLuint monitor) PFNGLBEGINPERFMONITORAMDPROC;
alias void function (GLuint monitor) PFNGLENDPERFMONITORAMDPROC;
alias void function (GLuint monitor, GLenum pname, GLsizei dataSize, GLuint *data, GLint *bytesWritten) PFNGLGETPERFMONITORCOUNTERDATAAMDPROC;
}

version (GL_AMD_texture_texture4) {} else {
}

version (GL_AMD_vertex_shader_tesselator) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTessellationFactorAMD (GLfloat factor);
void glTessellationModeAMD (GLenum mode);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLfloat factor) PFNGLTESSELLATIONFACTORAMDPROC;
alias void function (GLenum mode) PFNGLTESSELLATIONMODEAMDPROC;
}

version (GL_EXT_provoking_vertex) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glProvokingVertexEXT (GLenum mode);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode) PFNGLPROVOKINGVERTEXEXTPROC;
}

version (GL_EXT_texture_snorm) {} else {
}

version (GL_AMD_draw_buffers_blend) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBlendFuncIndexedAMD (GLuint buf, GLenum src, GLenum dst);
void glBlendFuncSeparateIndexedAMD (GLuint buf, GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha);
void glBlendEquationIndexedAMD (GLuint buf, GLenum mode);
void glBlendEquationSeparateIndexedAMD (GLuint buf, GLenum modeRGB, GLenum modeAlpha);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint buf, GLenum src, GLenum dst) PFNGLBLENDFUNCINDEXEDAMDPROC;
alias void function (GLuint buf, GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha) PFNGLBLENDFUNCSEPARATEINDEXEDAMDPROC;
alias void function (GLuint buf, GLenum mode) PFNGLBLENDEQUATIONINDEXEDAMDPROC;
alias void function (GLuint buf, GLenum modeRGB, GLenum modeAlpha) PFNGLBLENDEQUATIONSEPARATEINDEXEDAMDPROC;
}

version (GL_APPLE_texture_range) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTextureRangeAPPLE (GLenum target, GLsizei length, const(GLvoid)*pointer);
void glGetTexParameterPointervAPPLE (GLenum target, GLenum pname, GLvoid* *params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLsizei length, const(GLvoid)*pointer) PFNGLTEXTURERANGEAPPLEPROC;
alias void function (GLenum target, GLenum pname, GLvoid* *params) PFNGLGETTEXPARAMETERPOINTERVAPPLEPROC;
}

version (GL_APPLE_float_pixels) {} else {
}

version (GL_APPLE_vertex_program_evaluators) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glEnableVertexAttribAPPLE (GLuint index, GLenum pname);
void glDisableVertexAttribAPPLE (GLuint index, GLenum pname);
GLboolean glIsVertexAttribEnabledAPPLE (GLuint index, GLenum pname);
void glMapVertexAttrib1dAPPLE (GLuint index, GLuint size, GLdouble u1, GLdouble u2, GLint stride, GLint order, const(GLdouble)*points);
void glMapVertexAttrib1fAPPLE (GLuint index, GLuint size, GLfloat u1, GLfloat u2, GLint stride, GLint order, const(GLfloat)*points);
void glMapVertexAttrib2dAPPLE (GLuint index, GLuint size, GLdouble u1, GLdouble u2, GLint ustride, GLint uorder, GLdouble v1, GLdouble v2, GLint vstride, GLint vorder, const(GLdouble)*points);
void glMapVertexAttrib2fAPPLE (GLuint index, GLuint size, GLfloat u1, GLfloat u2, GLint ustride, GLint uorder, GLfloat v1, GLfloat v2, GLint vstride, GLint vorder, const(GLfloat)*points);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint index, GLenum pname) PFNGLENABLEVERTEXATTRIBAPPLEPROC;
alias void function (GLuint index, GLenum pname) PFNGLDISABLEVERTEXATTRIBAPPLEPROC;
alias GLboolean function (GLuint index, GLenum pname) PFNGLISVERTEXATTRIBENABLEDAPPLEPROC;
alias void function (GLuint index, GLuint size, GLdouble u1, GLdouble u2, GLint stride, GLint order, const(GLdouble)*points) PFNGLMAPVERTEXATTRIB1DAPPLEPROC;
alias void function (GLuint index, GLuint size, GLfloat u1, GLfloat u2, GLint stride, GLint order, const(GLfloat)*points) PFNGLMAPVERTEXATTRIB1FAPPLEPROC;
alias void function (GLuint index, GLuint size, GLdouble u1, GLdouble u2, GLint ustride, GLint uorder, GLdouble v1, GLdouble v2, GLint vstride, GLint vorder, const(GLdouble)*points) PFNGLMAPVERTEXATTRIB2DAPPLEPROC;
alias void function (GLuint index, GLuint size, GLfloat u1, GLfloat u2, GLint ustride, GLint uorder, GLfloat v1, GLfloat v2, GLint vstride, GLint vorder, const(GLfloat)*points) PFNGLMAPVERTEXATTRIB2FAPPLEPROC;
}

version (GL_APPLE_aux_depth_stencil) {} else {
}

version (GL_APPLE_object_purgeable) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLenum glObjectPurgeableAPPLE (GLenum objectType, GLuint name, GLenum option);
GLenum glObjectUnpurgeableAPPLE (GLenum objectType, GLuint name, GLenum option);
void glGetObjectParameterivAPPLE (GLenum objectType, GLuint name, GLenum pname, GLint *params);
} /* GL_GLEXT_PROTOTYPES */
alias GLenum function (GLenum objectType, GLuint name, GLenum option) PFNGLOBJECTPURGEABLEAPPLEPROC;
alias GLenum function (GLenum objectType, GLuint name, GLenum option) PFNGLOBJECTUNPURGEABLEAPPLEPROC;
alias void function (GLenum objectType, GLuint name, GLenum pname, GLint *params) PFNGLGETOBJECTPARAMETERIVAPPLEPROC;
}

version (GL_APPLE_row_bytes) {} else {
}

version (GL_APPLE_rgb_422) {} else {
}

version (GL_NV_video_capture) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBeginVideoCaptureNV (GLuint video_capture_slot);
void glBindVideoCaptureStreamBufferNV (GLuint video_capture_slot, GLuint stream, GLenum frame_region, GLintptrARB offset);
void glBindVideoCaptureStreamTextureNV (GLuint video_capture_slot, GLuint stream, GLenum frame_region, GLenum target, GLuint texture);
void glEndVideoCaptureNV (GLuint video_capture_slot);
void glGetVideoCaptureivNV (GLuint video_capture_slot, GLenum pname, GLint *params);
void glGetVideoCaptureStreamivNV (GLuint video_capture_slot, GLuint stream, GLenum pname, GLint *params);
void glGetVideoCaptureStreamfvNV (GLuint video_capture_slot, GLuint stream, GLenum pname, GLfloat *params);
void glGetVideoCaptureStreamdvNV (GLuint video_capture_slot, GLuint stream, GLenum pname, GLdouble *params);
GLenum glVideoCaptureNV (GLuint video_capture_slot, GLuint *sequence_num, GLuint64EXT *capture_time);
void glVideoCaptureStreamParameterivNV (GLuint video_capture_slot, GLuint stream, GLenum pname, const(GLint)*params);
void glVideoCaptureStreamParameterfvNV (GLuint video_capture_slot, GLuint stream, GLenum pname, const(GLfloat)*params);
void glVideoCaptureStreamParameterdvNV (GLuint video_capture_slot, GLuint stream, GLenum pname, const(GLdouble)*params);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint video_capture_slot) PFNGLBEGINVIDEOCAPTURENVPROC;
alias void function (GLuint video_capture_slot, GLuint stream, GLenum frame_region, GLintptrARB offset) PFNGLBINDVIDEOCAPTURESTREAMBUFFERNVPROC;
alias void function (GLuint video_capture_slot, GLuint stream, GLenum frame_region, GLenum target, GLuint texture) PFNGLBINDVIDEOCAPTURESTREAMTEXTURENVPROC;
alias void function (GLuint video_capture_slot) PFNGLENDVIDEOCAPTURENVPROC;
alias void function (GLuint video_capture_slot, GLenum pname, GLint *params) PFNGLGETVIDEOCAPTUREIVNVPROC;
alias void function (GLuint video_capture_slot, GLuint stream, GLenum pname, GLint *params) PFNGLGETVIDEOCAPTURESTREAMIVNVPROC;
alias void function (GLuint video_capture_slot, GLuint stream, GLenum pname, GLfloat *params) PFNGLGETVIDEOCAPTURESTREAMFVNVPROC;
alias void function (GLuint video_capture_slot, GLuint stream, GLenum pname, GLdouble *params) PFNGLGETVIDEOCAPTURESTREAMDVNVPROC;
alias GLenum function (GLuint video_capture_slot, GLuint *sequence_num, GLuint64EXT *capture_time) PFNGLVIDEOCAPTURENVPROC;
alias void function (GLuint video_capture_slot, GLuint stream, GLenum pname, const(GLint)*params) PFNGLVIDEOCAPTURESTREAMPARAMETERIVNVPROC;
alias void function (GLuint video_capture_slot, GLuint stream, GLenum pname, const(GLfloat)*params) PFNGLVIDEOCAPTURESTREAMPARAMETERFVNVPROC;
alias void function (GLuint video_capture_slot, GLuint stream, GLenum pname, const(GLdouble)*params) PFNGLVIDEOCAPTURESTREAMPARAMETERDVNVPROC;
}

version (GL_NV_copy_image) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glCopyImageSubDataNV (GLuint srcName, GLenum srcTarget, GLint srcLevel, GLint srcX, GLint srcY, GLint srcZ, GLuint dstName, GLenum dstTarget, GLint dstLevel, GLint dstX, GLint dstY, GLint dstZ, GLsizei width, GLsizei height, GLsizei depth);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint srcName, GLenum srcTarget, GLint srcLevel, GLint srcX, GLint srcY, GLint srcZ, GLuint dstName, GLenum dstTarget, GLint dstLevel, GLint dstX, GLint dstY, GLint dstZ, GLsizei width, GLsizei height, GLsizei depth) PFNGLCOPYIMAGESUBDATANVPROC;
}

version (GL_EXT_separate_shader_objects) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glUseShaderProgramEXT (GLenum type, GLuint program);
void glActiveProgramEXT (GLuint program);
GLuint glCreateShaderProgramEXT (GLenum type, const(GLchar)*string_);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum type, GLuint program) PFNGLUSESHADERPROGRAMEXTPROC;
alias void function (GLuint program) PFNGLACTIVEPROGRAMEXTPROC;
alias GLuint function (GLenum type, const(GLchar)*string_) PFNGLCREATESHADERPROGRAMEXTPROC;
}

version (GL_NV_parameter_buffer_object2) {} else {
}

version (GL_NV_shader_buffer_load) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glMakeBufferResidentNV (GLenum target, GLenum access);
void glMakeBufferNonResidentNV (GLenum target);
GLboolean glIsBufferResidentNV (GLenum target);
void glMakeNamedBufferResidentNV (GLuint buffer, GLenum access);
void glMakeNamedBufferNonResidentNV (GLuint buffer);
GLboolean glIsNamedBufferResidentNV (GLuint buffer);
void glGetBufferParameterui64vNV (GLenum target, GLenum pname, GLuint64EXT *params);
void glGetNamedBufferParameterui64vNV (GLuint buffer, GLenum pname, GLuint64EXT *params);
void glGetIntegerui64vNV (GLenum value, GLuint64EXT *result);
void glUniformui64NV (GLint location, GLuint64EXT value);
void glUniformui64vNV (GLint location, GLsizei count, const(GLuint64EXT)*value);
void glGetUniformui64vNV (GLuint program, GLint location, GLuint64EXT *params);
void glProgramUniformui64NV (GLuint program, GLint location, GLuint64EXT value);
void glProgramUniformui64vNV (GLuint program, GLint location, GLsizei count, const(GLuint64EXT)*value);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum access) PFNGLMAKEBUFFERRESIDENTNVPROC;
alias void function (GLenum target) PFNGLMAKEBUFFERNONRESIDENTNVPROC;
alias GLboolean function (GLenum target) PFNGLISBUFFERRESIDENTNVPROC;
alias void function (GLuint buffer, GLenum access) PFNGLMAKENAMEDBUFFERRESIDENTNVPROC;
alias void function (GLuint buffer) PFNGLMAKENAMEDBUFFERNONRESIDENTNVPROC;
alias GLboolean function (GLuint buffer) PFNGLISNAMEDBUFFERRESIDENTNVPROC;
alias void function (GLenum target, GLenum pname, GLuint64EXT *params) PFNGLGETBUFFERPARAMETERUI64VNVPROC;
alias void function (GLuint buffer, GLenum pname, GLuint64EXT *params) PFNGLGETNAMEDBUFFERPARAMETERUI64VNVPROC;
alias void function (GLenum value, GLuint64EXT *result) PFNGLGETINTEGERUI64VNVPROC;
alias void function (GLint location, GLuint64EXT value) PFNGLUNIFORMUI64NVPROC;
alias void function (GLint location, GLsizei count, const(GLuint64EXT)*value) PFNGLUNIFORMUI64VNVPROC;
alias void function (GLuint program, GLint location, GLuint64EXT *params) PFNGLGETUNIFORMUI64VNVPROC;
alias void function (GLuint program, GLint location, GLuint64EXT value) PFNGLPROGRAMUNIFORMUI64NVPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLuint64EXT)*value) PFNGLPROGRAMUNIFORMUI64VNVPROC;
}

version (GL_NV_vertex_buffer_unified_memory) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBufferAddressRangeNV (GLenum pname, GLuint index, GLuint64EXT address, GLsizeiptr length);
void glVertexFormatNV (GLint size, GLenum type, GLsizei stride);
void glNormalFormatNV (GLenum type, GLsizei stride);
void glColorFormatNV (GLint size, GLenum type, GLsizei stride);
void glIndexFormatNV (GLenum type, GLsizei stride);
void glTexCoordFormatNV (GLint size, GLenum type, GLsizei stride);
void glEdgeFlagFormatNV (GLsizei stride);
void glSecondaryColorFormatNV (GLint size, GLenum type, GLsizei stride);
void glFogCoordFormatNV (GLenum type, GLsizei stride);
void glVertexAttribFormatNV (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride);
void glVertexAttribIFormatNV (GLuint index, GLint size, GLenum type, GLsizei stride);
void glGetIntegerui64i_vNV (GLenum value, GLuint index, GLuint64EXT *result);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum pname, GLuint index, GLuint64EXT address, GLsizeiptr length) PFNGLBUFFERADDRESSRANGENVPROC;
alias void function (GLint size, GLenum type, GLsizei stride) PFNGLVERTEXFORMATNVPROC;
alias void function (GLenum type, GLsizei stride) PFNGLNORMALFORMATNVPROC;
alias void function (GLint size, GLenum type, GLsizei stride) PFNGLCOLORFORMATNVPROC;
alias void function (GLenum type, GLsizei stride) PFNGLINDEXFORMATNVPROC;
alias void function (GLint size, GLenum type, GLsizei stride) PFNGLTEXCOORDFORMATNVPROC;
alias void function (GLsizei stride) PFNGLEDGEFLAGFORMATNVPROC;
alias void function (GLint size, GLenum type, GLsizei stride) PFNGLSECONDARYCOLORFORMATNVPROC;
alias void function (GLenum type, GLsizei stride) PFNGLFOGCOORDFORMATNVPROC;
alias void function (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride) PFNGLVERTEXATTRIBFORMATNVPROC;
alias void function (GLuint index, GLint size, GLenum type, GLsizei stride) PFNGLVERTEXATTRIBIFORMATNVPROC;
alias void function (GLenum value, GLuint index, GLuint64EXT *result) PFNGLGETINTEGERUI64I_VNVPROC;
}

version (GL_NV_texture_barrier) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTextureBarrierNV ();
} /* GL_GLEXT_PROTOTYPES */
alias void function () PFNGLTEXTUREBARRIERNVPROC;
}

version (GL_AMD_shader_stencil_export) {} else {
}

version (GL_AMD_seamless_cubemap_per_texture) {} else {
}

version (GL_AMD_conservative_depth) {} else {
}

version (GL_EXT_shader_image_load_store) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glBindImageTextureEXT (GLuint index, GLuint texture, GLint level, GLboolean layered, GLint layer, GLenum access, GLint format);
void glMemoryBarrierEXT (GLbitfield barriers);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint index, GLuint texture, GLint level, GLboolean layered, GLint layer, GLenum access, GLint format) PFNGLBINDIMAGETEXTUREEXTPROC;
alias void function (GLbitfield barriers) PFNGLMEMORYBARRIEREXTPROC;
}

version (GL_EXT_vertex_attrib_64bit) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glVertexAttribL1dEXT (GLuint index, GLdouble x);
void glVertexAttribL2dEXT (GLuint index, GLdouble x, GLdouble y);
void glVertexAttribL3dEXT (GLuint index, GLdouble x, GLdouble y, GLdouble z);
void glVertexAttribL4dEXT (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glVertexAttribL1dvEXT (GLuint index, const(GLdouble)*v);
void glVertexAttribL2dvEXT (GLuint index, const(GLdouble)*v);
void glVertexAttribL3dvEXT (GLuint index, const(GLdouble)*v);
void glVertexAttribL4dvEXT (GLuint index, const(GLdouble)*v);
void glVertexAttribLPointerEXT (GLuint index, GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer);
void glGetVertexAttribLdvEXT (GLuint index, GLenum pname, GLdouble *params);
void glVertexArrayVertexAttribLOffsetEXT (GLuint vaobj, GLuint buffer, GLuint index, GLint size, GLenum type, GLsizei stride, GLintptr offset);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint index, GLdouble x) PFNGLVERTEXATTRIBL1DEXTPROC;
alias void function (GLuint index, GLdouble x, GLdouble y) PFNGLVERTEXATTRIBL2DEXTPROC;
alias void function (GLuint index, GLdouble x, GLdouble y, GLdouble z) PFNGLVERTEXATTRIBL3DEXTPROC;
alias void function (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w) PFNGLVERTEXATTRIBL4DEXTPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIBL1DVEXTPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIBL2DVEXTPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIBL3DVEXTPROC;
alias void function (GLuint index, const(GLdouble)*v) PFNGLVERTEXATTRIBL4DVEXTPROC;
alias void function (GLuint index, GLint size, GLenum type, GLsizei stride, const(GLvoid)*pointer) PFNGLVERTEXATTRIBLPOINTEREXTPROC;
alias void function (GLuint index, GLenum pname, GLdouble *params) PFNGLGETVERTEXATTRIBLDVEXTPROC;
alias void function (GLuint vaobj, GLuint buffer, GLuint index, GLint size, GLenum type, GLsizei stride, GLintptr offset) PFNGLVERTEXARRAYVERTEXATTRIBLOFFSETEXTPROC;
}

version (GL_NV_gpu_program5) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glProgramSubroutineParametersuivNV (GLenum target, GLsizei count, const(GLuint)*params);
void glGetProgramSubroutineParameteruivNV (GLenum target, GLuint index, GLuint *param);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLsizei count, const(GLuint)*params) PFNGLPROGRAMSUBROUTINEPARAMETERSUIVNVPROC;
alias void function (GLenum target, GLuint index, GLuint *param) PFNGLGETPROGRAMSUBROUTINEPARAMETERUIVNVPROC;
}

version (GL_NV_gpu_shader5) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glUniform1i64NV (GLint location, GLint64EXT x);
void glUniform2i64NV (GLint location, GLint64EXT x, GLint64EXT y);
void glUniform3i64NV (GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z);
void glUniform4i64NV (GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z, GLint64EXT w);
void glUniform1i64vNV (GLint location, GLsizei count, const(GLint64EXT)*value);
void glUniform2i64vNV (GLint location, GLsizei count, const(GLint64EXT)*value);
void glUniform3i64vNV (GLint location, GLsizei count, const(GLint64EXT)*value);
void glUniform4i64vNV (GLint location, GLsizei count, const(GLint64EXT)*value);
void glUniform1ui64NV (GLint location, GLuint64EXT x);
void glUniform2ui64NV (GLint location, GLuint64EXT x, GLuint64EXT y);
void glUniform3ui64NV (GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z);
void glUniform4ui64NV (GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z, GLuint64EXT w);
void glUniform1ui64vNV (GLint location, GLsizei count, const(GLuint64EXT)*value);
void glUniform2ui64vNV (GLint location, GLsizei count, const(GLuint64EXT)*value);
void glUniform3ui64vNV (GLint location, GLsizei count, const(GLuint64EXT)*value);
void glUniform4ui64vNV (GLint location, GLsizei count, const(GLuint64EXT)*value);
void glGetUniformi64vNV (GLuint program, GLint location, GLint64EXT *params);
void glProgramUniform1i64NV (GLuint program, GLint location, GLint64EXT x);
void glProgramUniform2i64NV (GLuint program, GLint location, GLint64EXT x, GLint64EXT y);
void glProgramUniform3i64NV (GLuint program, GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z);
void glProgramUniform4i64NV (GLuint program, GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z, GLint64EXT w);
void glProgramUniform1i64vNV (GLuint program, GLint location, GLsizei count, const(GLint64EXT)*value);
void glProgramUniform2i64vNV (GLuint program, GLint location, GLsizei count, const(GLint64EXT)*value);
void glProgramUniform3i64vNV (GLuint program, GLint location, GLsizei count, const(GLint64EXT)*value);
void glProgramUniform4i64vNV (GLuint program, GLint location, GLsizei count, const(GLint64EXT)*value);
void glProgramUniform1ui64NV (GLuint program, GLint location, GLuint64EXT x);
void glProgramUniform2ui64NV (GLuint program, GLint location, GLuint64EXT x, GLuint64EXT y);
void glProgramUniform3ui64NV (GLuint program, GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z);
void glProgramUniform4ui64NV (GLuint program, GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z, GLuint64EXT w);
void glProgramUniform1ui64vNV (GLuint program, GLint location, GLsizei count, const(GLuint64EXT)*value);
void glProgramUniform2ui64vNV (GLuint program, GLint location, GLsizei count, const(GLuint64EXT)*value);
void glProgramUniform3ui64vNV (GLuint program, GLint location, GLsizei count, const(GLuint64EXT)*value);
void glProgramUniform4ui64vNV (GLuint program, GLint location, GLsizei count, const(GLuint64EXT)*value);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLint location, GLint64EXT x) PFNGLUNIFORM1I64NVPROC;
alias void function (GLint location, GLint64EXT x, GLint64EXT y) PFNGLUNIFORM2I64NVPROC;
alias void function (GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z) PFNGLUNIFORM3I64NVPROC;
alias void function (GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z, GLint64EXT w) PFNGLUNIFORM4I64NVPROC;
alias void function (GLint location, GLsizei count, const(GLint64EXT)*value) PFNGLUNIFORM1I64VNVPROC;
alias void function (GLint location, GLsizei count, const(GLint64EXT)*value) PFNGLUNIFORM2I64VNVPROC;
alias void function (GLint location, GLsizei count, const(GLint64EXT)*value) PFNGLUNIFORM3I64VNVPROC;
alias void function (GLint location, GLsizei count, const(GLint64EXT)*value) PFNGLUNIFORM4I64VNVPROC;
alias void function (GLint location, GLuint64EXT x) PFNGLUNIFORM1UI64NVPROC;
alias void function (GLint location, GLuint64EXT x, GLuint64EXT y) PFNGLUNIFORM2UI64NVPROC;
alias void function (GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z) PFNGLUNIFORM3UI64NVPROC;
alias void function (GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z, GLuint64EXT w) PFNGLUNIFORM4UI64NVPROC;
alias void function (GLint location, GLsizei count, const(GLuint64EXT)*value) PFNGLUNIFORM1UI64VNVPROC;
alias void function (GLint location, GLsizei count, const(GLuint64EXT)*value) PFNGLUNIFORM2UI64VNVPROC;
alias void function (GLint location, GLsizei count, const(GLuint64EXT)*value) PFNGLUNIFORM3UI64VNVPROC;
alias void function (GLint location, GLsizei count, const(GLuint64EXT)*value) PFNGLUNIFORM4UI64VNVPROC;
alias void function (GLuint program, GLint location, GLint64EXT *params) PFNGLGETUNIFORMI64VNVPROC;
alias void function (GLuint program, GLint location, GLint64EXT x) PFNGLPROGRAMUNIFORM1I64NVPROC;
alias void function (GLuint program, GLint location, GLint64EXT x, GLint64EXT y) PFNGLPROGRAMUNIFORM2I64NVPROC;
alias void function (GLuint program, GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z) PFNGLPROGRAMUNIFORM3I64NVPROC;
alias void function (GLuint program, GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z, GLint64EXT w) PFNGLPROGRAMUNIFORM4I64NVPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLint64EXT)*value) PFNGLPROGRAMUNIFORM1I64VNVPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLint64EXT)*value) PFNGLPROGRAMUNIFORM2I64VNVPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLint64EXT)*value) PFNGLPROGRAMUNIFORM3I64VNVPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLint64EXT)*value) PFNGLPROGRAMUNIFORM4I64VNVPROC;
alias void function (GLuint program, GLint location, GLuint64EXT x) PFNGLPROGRAMUNIFORM1UI64NVPROC;
alias void function (GLuint program, GLint location, GLuint64EXT x, GLuint64EXT y) PFNGLPROGRAMUNIFORM2UI64NVPROC;
alias void function (GLuint program, GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z) PFNGLPROGRAMUNIFORM3UI64NVPROC;
alias void function (GLuint program, GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z, GLuint64EXT w) PFNGLPROGRAMUNIFORM4UI64NVPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLuint64EXT)*value) PFNGLPROGRAMUNIFORM1UI64VNVPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLuint64EXT)*value) PFNGLPROGRAMUNIFORM2UI64VNVPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLuint64EXT)*value) PFNGLPROGRAMUNIFORM3UI64VNVPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLuint64EXT)*value) PFNGLPROGRAMUNIFORM4UI64VNVPROC;
}

version (GL_NV_shader_buffer_store) {} else {
}

version (GL_NV_tessellation_program5) {} else {
}

version (GL_NV_vertex_attrib_integer_64bit) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glVertexAttribL1i64NV (GLuint index, GLint64EXT x);
void glVertexAttribL2i64NV (GLuint index, GLint64EXT x, GLint64EXT y);
void glVertexAttribL3i64NV (GLuint index, GLint64EXT x, GLint64EXT y, GLint64EXT z);
void glVertexAttribL4i64NV (GLuint index, GLint64EXT x, GLint64EXT y, GLint64EXT z, GLint64EXT w);
void glVertexAttribL1i64vNV (GLuint index, const(GLint64EXT)*v);
void glVertexAttribL2i64vNV (GLuint index, const(GLint64EXT)*v);
void glVertexAttribL3i64vNV (GLuint index, const(GLint64EXT)*v);
void glVertexAttribL4i64vNV (GLuint index, const(GLint64EXT)*v);
void glVertexAttribL1ui64NV (GLuint index, GLuint64EXT x);
void glVertexAttribL2ui64NV (GLuint index, GLuint64EXT x, GLuint64EXT y);
void glVertexAttribL3ui64NV (GLuint index, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z);
void glVertexAttribL4ui64NV (GLuint index, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z, GLuint64EXT w);
void glVertexAttribL1ui64vNV (GLuint index, const(GLuint64EXT)*v);
void glVertexAttribL2ui64vNV (GLuint index, const(GLuint64EXT)*v);
void glVertexAttribL3ui64vNV (GLuint index, const(GLuint64EXT)*v);
void glVertexAttribL4ui64vNV (GLuint index, const(GLuint64EXT)*v);
void glGetVertexAttribLi64vNV (GLuint index, GLenum pname, GLint64EXT *params);
void glGetVertexAttribLui64vNV (GLuint index, GLenum pname, GLuint64EXT *params);
void glVertexAttribLFormatNV (GLuint index, GLint size, GLenum type, GLsizei stride);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLuint index, GLint64EXT x) PFNGLVERTEXATTRIBL1I64NVPROC;
alias void function (GLuint index, GLint64EXT x, GLint64EXT y) PFNGLVERTEXATTRIBL2I64NVPROC;
alias void function (GLuint index, GLint64EXT x, GLint64EXT y, GLint64EXT z) PFNGLVERTEXATTRIBL3I64NVPROC;
alias void function (GLuint index, GLint64EXT x, GLint64EXT y, GLint64EXT z, GLint64EXT w) PFNGLVERTEXATTRIBL4I64NVPROC;
alias void function (GLuint index, const(GLint64EXT)*v) PFNGLVERTEXATTRIBL1I64VNVPROC;
alias void function (GLuint index, const(GLint64EXT)*v) PFNGLVERTEXATTRIBL2I64VNVPROC;
alias void function (GLuint index, const(GLint64EXT)*v) PFNGLVERTEXATTRIBL3I64VNVPROC;
alias void function (GLuint index, const(GLint64EXT)*v) PFNGLVERTEXATTRIBL4I64VNVPROC;
alias void function (GLuint index, GLuint64EXT x) PFNGLVERTEXATTRIBL1UI64NVPROC;
alias void function (GLuint index, GLuint64EXT x, GLuint64EXT y) PFNGLVERTEXATTRIBL2UI64NVPROC;
alias void function (GLuint index, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z) PFNGLVERTEXATTRIBL3UI64NVPROC;
alias void function (GLuint index, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z, GLuint64EXT w) PFNGLVERTEXATTRIBL4UI64NVPROC;
alias void function (GLuint index, const(GLuint64EXT)*v) PFNGLVERTEXATTRIBL1UI64VNVPROC;
alias void function (GLuint index, const(GLuint64EXT)*v) PFNGLVERTEXATTRIBL2UI64VNVPROC;
alias void function (GLuint index, const(GLuint64EXT)*v) PFNGLVERTEXATTRIBL3UI64VNVPROC;
alias void function (GLuint index, const(GLuint64EXT)*v) PFNGLVERTEXATTRIBL4UI64VNVPROC;
alias void function (GLuint index, GLenum pname, GLint64EXT *params) PFNGLGETVERTEXATTRIBLI64VNVPROC;
alias void function (GLuint index, GLenum pname, GLuint64EXT *params) PFNGLGETVERTEXATTRIBLUI64VNVPROC;
alias void function (GLuint index, GLint size, GLenum type, GLsizei stride) PFNGLVERTEXATTRIBLFORMATNVPROC;
}

version (GL_NV_multisample_coverage) {} else {
}

version (GL_AMD_name_gen_delete) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glGenNamesAMD (GLenum identifier, GLuint num, GLuint *names);
void glDeleteNamesAMD (GLenum identifier, GLuint num, const(GLuint)*names);
GLboolean glIsNameAMD (GLenum identifier, GLuint name);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum identifier, GLuint num, GLuint *names) PFNGLGENNAMESAMDPROC;
alias void function (GLenum identifier, GLuint num, const(GLuint)*names) PFNGLDELETENAMESAMDPROC;
alias GLboolean function (GLenum identifier, GLuint name) PFNGLISNAMEAMDPROC;
}

version (GL_AMD_debug_output) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glDebugMessageEnableAMD (GLenum category, GLenum severity, GLsizei count, const(GLuint)*ids, GLboolean enabled);
void glDebugMessageInsertAMD (GLenum category, GLenum severity, GLuint id, GLsizei length, const(GLchar)*buf);
void glDebugMessageCallbackAMD (GLDEBUGPROCAMD callback, GLvoid *userParam);
GLuint glGetDebugMessageLogAMD (GLuint count, GLsizei bufsize, GLenum *categories, GLuint *severities, GLuint *ids, GLsizei *lengths, GLchar *message);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum category, GLenum severity, GLsizei count, const(GLuint)*ids, GLboolean enabled) PFNGLDEBUGMESSAGEENABLEAMDPROC;
alias void function (GLenum category, GLenum severity, GLuint id, GLsizei length, const(GLchar)*buf) PFNGLDEBUGMESSAGEINSERTAMDPROC;
alias void function (GLDEBUGPROCAMD callback, GLvoid *userParam) PFNGLDEBUGMESSAGECALLBACKAMDPROC;
alias GLuint function (GLuint count, GLsizei bufsize, GLenum *categories, GLuint *severities, GLuint *ids, GLsizei *lengths, GLchar *message) PFNGLGETDEBUGMESSAGELOGAMDPROC;
}

version (GL_NV_vdpau_interop) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glVDPAUInitNV (const(GLvoid)*vdpDevice, const(GLvoid)*getProcAddress);
void glVDPAUFiniNV ();
GLvdpauSurfaceNV glVDPAURegisterVideoSurfaceNV (const(GLvoid)*vdpSurface, GLenum target, GLsizei numTextureNames, const(GLuint)*textureNames);
GLvdpauSurfaceNV glVDPAURegisterOutputSurfaceNV (GLvoid *vdpSurface, GLenum target, GLsizei numTextureNames, const(GLuint)*textureNames);
void glVDPAUIsSurfaceNV (GLvdpauSurfaceNV surface);
void glVDPAUUnregisterSurfaceNV (GLvdpauSurfaceNV surface);
void glVDPAUGetSurfaceivNV (GLvdpauSurfaceNV surface, GLenum pname, GLsizei bufSize, GLsizei *length, GLint *values);
void glVDPAUSurfaceAccessNV (GLvdpauSurfaceNV surface, GLenum access);
void glVDPAUMapSurfacesNV (GLsizei numSurfaces, const(GLvdpauSurfaceNV)*surfaces);
void glVDPAUUnmapSurfacesNV (GLsizei numSurface, const(GLvdpauSurfaceNV)*surfaces);
} /* GL_GLEXT_PROTOTYPES */
alias void function (const(GLvoid)*vdpDevice, const(GLvoid)*getProcAddress) PFNGLVDPAUINITNVPROC;
alias void function () PFNGLVDPAUFININVPROC;
alias GLvdpauSurfaceNV function (const(GLvoid)*vdpSurface, GLenum target, GLsizei numTextureNames, const(GLuint)*textureNames) PFNGLVDPAUREGISTERVIDEOSURFACENVPROC;
alias GLvdpauSurfaceNV function (GLvoid *vdpSurface, GLenum target, GLsizei numTextureNames, const(GLuint)*textureNames) PFNGLVDPAUREGISTEROUTPUTSURFACENVPROC;
alias void function (GLvdpauSurfaceNV surface) PFNGLVDPAUISSURFACENVPROC;
alias void function (GLvdpauSurfaceNV surface) PFNGLVDPAUUNREGISTERSURFACENVPROC;
alias void function (GLvdpauSurfaceNV surface, GLenum pname, GLsizei bufSize, GLsizei *length, GLint *values) PFNGLVDPAUGETSURFACEIVNVPROC;
alias void function (GLvdpauSurfaceNV surface, GLenum access) PFNGLVDPAUSURFACEACCESSNVPROC;
alias void function (GLsizei numSurfaces, const(GLvdpauSurfaceNV)*surfaces) PFNGLVDPAUMAPSURFACESNVPROC;
alias void function (GLsizei numSurface, const(GLvdpauSurfaceNV)*surfaces) PFNGLVDPAUUNMAPSURFACESNVPROC;
}

version (GL_AMD_transform_feedback3_lines_triangles) {} else {
}

version (GL_AMD_depth_clamp_separate) {} else {
}

version (GL_EXT_texture_sRGB_decode) {} else {
}

version (GL_NV_texture_multisample) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTexImage2DMultisampleCoverageNV (GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLint internalFormat, GLsizei width, GLsizei height, GLboolean fixedSampleLocations);
void glTexImage3DMultisampleCoverageNV (GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedSampleLocations);
void glTextureImage2DMultisampleNV (GLuint texture, GLenum target, GLsizei samples, GLint internalFormat, GLsizei width, GLsizei height, GLboolean fixedSampleLocations);
void glTextureImage3DMultisampleNV (GLuint texture, GLenum target, GLsizei samples, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedSampleLocations);
void glTextureImage2DMultisampleCoverageNV (GLuint texture, GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLint internalFormat, GLsizei width, GLsizei height, GLboolean fixedSampleLocations);
void glTextureImage3DMultisampleCoverageNV (GLuint texture, GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedSampleLocations);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLint internalFormat, GLsizei width, GLsizei height, GLboolean fixedSampleLocations) PFNGLTEXIMAGE2DMULTISAMPLECOVERAGENVPROC;
alias void function (GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedSampleLocations) PFNGLTEXIMAGE3DMULTISAMPLECOVERAGENVPROC;
alias void function (GLuint texture, GLenum target, GLsizei samples, GLint internalFormat, GLsizei width, GLsizei height, GLboolean fixedSampleLocations) PFNGLTEXTUREIMAGE2DMULTISAMPLENVPROC;
alias void function (GLuint texture, GLenum target, GLsizei samples, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedSampleLocations) PFNGLTEXTUREIMAGE3DMULTISAMPLENVPROC;
alias void function (GLuint texture, GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLint internalFormat, GLsizei width, GLsizei height, GLboolean fixedSampleLocations) PFNGLTEXTUREIMAGE2DMULTISAMPLECOVERAGENVPROC;
alias void function (GLuint texture, GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedSampleLocations) PFNGLTEXTUREIMAGE3DMULTISAMPLECOVERAGENVPROC;
}

version (GL_AMD_blend_minmax_factor) {} else {
}

version (GL_AMD_sample_positions) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glSetMultisamplefvAMD (GLenum pname, GLuint index, const(GLfloat)*val);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum pname, GLuint index, const(GLfloat)*val) PFNGLSETMULTISAMPLEFVAMDPROC;
}

version (GL_EXT_x11_sync_object) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLsync glImportSyncEXT (GLenum external_sync_type, GLintptr external_sync, GLbitfield flags);
} /* GL_GLEXT_PROTOTYPES */
alias GLsync function (GLenum external_sync_type, GLintptr external_sync, GLbitfield flags) PFNGLIMPORTSYNCEXTPROC;
}

version (GL_AMD_multi_draw_indirect) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glMultiDrawArraysIndirectAMD (GLenum mode, const(GLvoid)*indirect, GLsizei primcount, GLsizei stride);
void glMultiDrawElementsIndirectAMD (GLenum mode, GLenum type, const(GLvoid)*indirect, GLsizei primcount, GLsizei stride);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum mode, const(GLvoid)*indirect, GLsizei primcount, GLsizei stride) PFNGLMULTIDRAWARRAYSINDIRECTAMDPROC;
alias void function (GLenum mode, GLenum type, const(GLvoid)*indirect, GLsizei primcount, GLsizei stride) PFNGLMULTIDRAWELEMENTSINDIRECTAMDPROC;
}

version (GL_EXT_framebuffer_multisample_blit_scaled) {} else {
}

version (GL_NV_path_rendering) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLuint glGenPathsNV (GLsizei range);
void glDeletePathsNV (GLuint path, GLsizei range);
GLboolean glIsPathNV (GLuint path);
void glPathCommandsNV (GLuint path, GLsizei numCommands, const(GLubyte)*commands, GLsizei numCoords, GLenum coordType, const(GLvoid)*coords);
void glPathCoordsNV (GLuint path, GLsizei numCoords, GLenum coordType, const(GLvoid)*coords);
void glPathSubCommandsNV (GLuint path, GLsizei commandStart, GLsizei commandsToDelete, GLsizei numCommands, const(GLubyte)*commands, GLsizei numCoords, GLenum coordType, const(GLvoid)*coords);
void glPathSubCoordsNV (GLuint path, GLsizei coordStart, GLsizei numCoords, GLenum coordType, const(GLvoid)*coords);
void glPathStringNV (GLuint path, GLenum format, GLsizei length, const(GLvoid)*pathString);
void glPathGlyphsNV (GLuint firstPathName, GLenum fontTarget, const(GLvoid)*fontName, GLbitfield fontStyle, GLsizei numGlyphs, GLenum type, const(GLvoid)*charcodes, GLenum handleMissingGlyphs, GLuint pathParameterTemplate, GLfloat emScale);
void glPathGlyphRangeNV (GLuint firstPathName, GLenum fontTarget, const(GLvoid)*fontName, GLbitfield fontStyle, GLuint firstGlyph, GLsizei numGlyphs, GLenum handleMissingGlyphs, GLuint pathParameterTemplate, GLfloat emScale);
void glWeightPathsNV (GLuint resultPath, GLsizei numPaths, const(GLuint)*paths, const(GLfloat)*weights);
void glCopyPathNV (GLuint resultPath, GLuint srcPath);
void glInterpolatePathsNV (GLuint resultPath, GLuint pathA, GLuint pathB, GLfloat weight);
void glTransformPathNV (GLuint resultPath, GLuint srcPath, GLenum transformType, const(GLfloat)*transformValues);
void glPathParameterivNV (GLuint path, GLenum pname, const(GLint)*value);
void glPathParameteriNV (GLuint path, GLenum pname, GLint value);
void glPathParameterfvNV (GLuint path, GLenum pname, const(GLfloat)*value);
void glPathParameterfNV (GLuint path, GLenum pname, GLfloat value);
void glPathDashArrayNV (GLuint path, GLsizei dashCount, const(GLfloat)*dashArray);
void glPathStencilFuncNV (GLenum func, GLint/*ref*/, GLuint mask);
void glPathStencilDepthOffsetNV (GLfloat factor, GLfloat units);
void glStencilFillPathNV (GLuint path, GLenum fillMode, GLuint mask);
void glStencilStrokePathNV (GLuint path, GLint reference, GLuint mask);
void glStencilFillPathInstancedNV (GLsizei numPaths, GLenum pathNameType, const(GLvoid)*paths, GLuint pathBase, GLenum fillMode, GLuint mask, GLenum transformType, const(GLfloat)*transformValues);
void glStencilStrokePathInstancedNV (GLsizei numPaths, GLenum pathNameType, const(GLvoid)*paths, GLuint pathBase, GLint reference, GLuint mask, GLenum transformType, const(GLfloat)*transformValues);
void glPathCoverDepthFuncNV (GLenum func);
void glPathColorGenNV (GLenum color, GLenum genMode, GLenum colorFormat, const(GLfloat)*coeffs);
void glPathTexGenNV (GLenum texCoordSet, GLenum genMode, GLint components, const(GLfloat)*coeffs);
void glPathFogGenNV (GLenum genMode);
void glCoverFillPathNV (GLuint path, GLenum coverMode);
void glCoverStrokePathNV (GLuint path, GLenum coverMode);
void glCoverFillPathInstancedNV (GLsizei numPaths, GLenum pathNameType, const(GLvoid)*paths, GLuint pathBase, GLenum coverMode, GLenum transformType, const(GLfloat)*transformValues);
void glCoverStrokePathInstancedNV (GLsizei numPaths, GLenum pathNameType, const(GLvoid)*paths, GLuint pathBase, GLenum coverMode, GLenum transformType, const(GLfloat)*transformValues);
void glGetPathParameterivNV (GLuint path, GLenum pname, GLint *value);
void glGetPathParameterfvNV (GLuint path, GLenum pname, GLfloat *value);
void glGetPathCommandsNV (GLuint path, GLubyte *commands);
void glGetPathCoordsNV (GLuint path, GLfloat *coords);
void glGetPathDashArrayNV (GLuint path, GLfloat *dashArray);
void glGetPathMetricsNV (GLbitfield metricQueryMask, GLsizei numPaths, GLenum pathNameType, const(GLvoid)*paths, GLuint pathBase, GLsizei stride, GLfloat *metrics);
void glGetPathMetricRangeNV (GLbitfield metricQueryMask, GLuint firstPathName, GLsizei numPaths, GLsizei stride, GLfloat *metrics);
void glGetPathSpacingNV (GLenum pathListMode, GLsizei numPaths, GLenum pathNameType, const(GLvoid)*paths, GLuint pathBase, GLfloat advanceScale, GLfloat kerningScale, GLenum transformType, GLfloat *returnedSpacing);
void glGetPathColorGenivNV (GLenum color, GLenum pname, GLint *value);
void glGetPathColorGenfvNV (GLenum color, GLenum pname, GLfloat *value);
void glGetPathTexGenivNV (GLenum texCoordSet, GLenum pname, GLint *value);
void glGetPathTexGenfvNV (GLenum texCoordSet, GLenum pname, GLfloat *value);
GLboolean glIsPointInFillPathNV (GLuint path, GLuint mask, GLfloat x, GLfloat y);
GLboolean glIsPointInStrokePathNV (GLuint path, GLfloat x, GLfloat y);
GLfloat glGetPathLengthNV (GLuint path, GLsizei startSegment, GLsizei numSegments);
GLboolean glPointAlongPathNV (GLuint path, GLsizei startSegment, GLsizei numSegments, GLfloat distance, GLfloat *x, GLfloat *y, GLfloat *tangentX, GLfloat *tangentY);
} /* GL_GLEXT_PROTOTYPES */
alias GLuint function (GLsizei range) PFNGLGENPATHSNVPROC;
alias void function (GLuint path, GLsizei range) PFNGLDELETEPATHSNVPROC;
alias GLboolean function (GLuint path) PFNGLISPATHNVPROC;
alias void function (GLuint path, GLsizei numCommands, const(GLubyte)*commands, GLsizei numCoords, GLenum coordType, const(GLvoid)*coords) PFNGLPATHCOMMANDSNVPROC;
alias void function (GLuint path, GLsizei numCoords, GLenum coordType, const(GLvoid)*coords) PFNGLPATHCOORDSNVPROC;
alias void function (GLuint path, GLsizei commandStart, GLsizei commandsToDelete, GLsizei numCommands, const(GLubyte)*commands, GLsizei numCoords, GLenum coordType, const(GLvoid)*coords) PFNGLPATHSUBCOMMANDSNVPROC;
alias void function (GLuint path, GLsizei coordStart, GLsizei numCoords, GLenum coordType, const(GLvoid)*coords) PFNGLPATHSUBCOORDSNVPROC;
alias void function (GLuint path, GLenum format, GLsizei length, const(GLvoid)*pathString) PFNGLPATHSTRINGNVPROC;
alias void function (GLuint firstPathName, GLenum fontTarget, const(GLvoid)*fontName, GLbitfield fontStyle, GLsizei numGlyphs, GLenum type, const(GLvoid)*charcodes, GLenum handleMissingGlyphs, GLuint pathParameterTemplate, GLfloat emScale) PFNGLPATHGLYPHSNVPROC;
alias void function (GLuint firstPathName, GLenum fontTarget, const(GLvoid)*fontName, GLbitfield fontStyle, GLuint firstGlyph, GLsizei numGlyphs, GLenum handleMissingGlyphs, GLuint pathParameterTemplate, GLfloat emScale) PFNGLPATHGLYPHRANGENVPROC;
alias void function (GLuint resultPath, GLsizei numPaths, const(GLuint)*paths, const(GLfloat)*weights) PFNGLWEIGHTPATHSNVPROC;
alias void function (GLuint resultPath, GLuint srcPath) PFNGLCOPYPATHNVPROC;
alias void function (GLuint resultPath, GLuint pathA, GLuint pathB, GLfloat weight) PFNGLINTERPOLATEPATHSNVPROC;
alias void function (GLuint resultPath, GLuint srcPath, GLenum transformType, const(GLfloat)*transformValues) PFNGLTRANSFORMPATHNVPROC;
alias void function (GLuint path, GLenum pname, const(GLint)*value) PFNGLPATHPARAMETERIVNVPROC;
alias void function (GLuint path, GLenum pname, GLint value) PFNGLPATHPARAMETERINVPROC;
alias void function (GLuint path, GLenum pname, const(GLfloat)*value) PFNGLPATHPARAMETERFVNVPROC;
alias void function (GLuint path, GLenum pname, GLfloat value) PFNGLPATHPARAMETERFNVPROC;
alias void function (GLuint path, GLsizei dashCount, const(GLfloat)*dashArray) PFNGLPATHDASHARRAYNVPROC;
alias void function (GLenum func, GLint/*ref*/, GLuint mask) PFNGLPATHSTENCILFUNCNVPROC;
alias void function (GLfloat factor, GLfloat units) PFNGLPATHSTENCILDEPTHOFFSETNVPROC;
alias void function (GLuint path, GLenum fillMode, GLuint mask) PFNGLSTENCILFILLPATHNVPROC;
alias void function (GLuint path, GLint reference, GLuint mask) PFNGLSTENCILSTROKEPATHNVPROC;
alias void function (GLsizei numPaths, GLenum pathNameType, const(GLvoid)*paths, GLuint pathBase, GLenum fillMode, GLuint mask, GLenum transformType, const(GLfloat)*transformValues) PFNGLSTENCILFILLPATHINSTANCEDNVPROC;
alias void function (GLsizei numPaths, GLenum pathNameType, const(GLvoid)*paths, GLuint pathBase, GLint reference, GLuint mask, GLenum transformType, const(GLfloat)*transformValues) PFNGLSTENCILSTROKEPATHINSTANCEDNVPROC;
alias void function (GLenum func) PFNGLPATHCOVERDEPTHFUNCNVPROC;
alias void function (GLenum color, GLenum genMode, GLenum colorFormat, const(GLfloat)*coeffs) PFNGLPATHCOLORGENNVPROC;
alias void function (GLenum texCoordSet, GLenum genMode, GLint components, const(GLfloat)*coeffs) PFNGLPATHTEXGENNVPROC;
alias void function (GLenum genMode) PFNGLPATHFOGGENNVPROC;
alias void function (GLuint path, GLenum coverMode) PFNGLCOVERFILLPATHNVPROC;
alias void function (GLuint path, GLenum coverMode) PFNGLCOVERSTROKEPATHNVPROC;
alias void function (GLsizei numPaths, GLenum pathNameType, const(GLvoid)*paths, GLuint pathBase, GLenum coverMode, GLenum transformType, const(GLfloat)*transformValues) PFNGLCOVERFILLPATHINSTANCEDNVPROC;
alias void function (GLsizei numPaths, GLenum pathNameType, const(GLvoid)*paths, GLuint pathBase, GLenum coverMode, GLenum transformType, const(GLfloat)*transformValues) PFNGLCOVERSTROKEPATHINSTANCEDNVPROC;
alias void function (GLuint path, GLenum pname, GLint *value) PFNGLGETPATHPARAMETERIVNVPROC;
alias void function (GLuint path, GLenum pname, GLfloat *value) PFNGLGETPATHPARAMETERFVNVPROC;
alias void function (GLuint path, GLubyte *commands) PFNGLGETPATHCOMMANDSNVPROC;
alias void function (GLuint path, GLfloat *coords) PFNGLGETPATHCOORDSNVPROC;
alias void function (GLuint path, GLfloat *dashArray) PFNGLGETPATHDASHARRAYNVPROC;
alias void function (GLbitfield metricQueryMask, GLsizei numPaths, GLenum pathNameType, const(GLvoid)*paths, GLuint pathBase, GLsizei stride, GLfloat *metrics) PFNGLGETPATHMETRICSNVPROC;
alias void function (GLbitfield metricQueryMask, GLuint firstPathName, GLsizei numPaths, GLsizei stride, GLfloat *metrics) PFNGLGETPATHMETRICRANGENVPROC;
alias void function (GLenum pathListMode, GLsizei numPaths, GLenum pathNameType, const(GLvoid)*paths, GLuint pathBase, GLfloat advanceScale, GLfloat kerningScale, GLenum transformType, GLfloat *returnedSpacing) PFNGLGETPATHSPACINGNVPROC;
alias void function (GLenum color, GLenum pname, GLint *value) PFNGLGETPATHCOLORGENIVNVPROC;
alias void function (GLenum color, GLenum pname, GLfloat *value) PFNGLGETPATHCOLORGENFVNVPROC;
alias void function (GLenum texCoordSet, GLenum pname, GLint *value) PFNGLGETPATHTEXGENIVNVPROC;
alias void function (GLenum texCoordSet, GLenum pname, GLfloat *value) PFNGLGETPATHTEXGENFVNVPROC;
alias GLboolean function (GLuint path, GLuint mask, GLfloat x, GLfloat y) PFNGLISPOINTINFILLPATHNVPROC;
alias GLboolean function (GLuint path, GLfloat x, GLfloat y) PFNGLISPOINTINSTROKEPATHNVPROC;
alias GLfloat function (GLuint path, GLsizei startSegment, GLsizei numSegments) PFNGLGETPATHLENGTHNVPROC;
alias GLboolean function (GLuint path, GLsizei startSegment, GLsizei numSegments, GLfloat distance, GLfloat *x, GLfloat *y, GLfloat *tangentX, GLfloat *tangentY) PFNGLPOINTALONGPATHNVPROC;
}

version (GL_AMD_pinned_memory) {} else {
}

version (GL_AMD_stencil_operation_extended) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glStencilOpValueAMD (GLenum face, GLuint value);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum face, GLuint value) PFNGLSTENCILOPVALUEAMDPROC;
}

version (GL_AMD_vertex_shader_viewport_index) {} else {
}

version (GL_AMD_vertex_shader_layer) {} else {
}

version (GL_NV_bindless_texture) {} else {
version (GL_GLEXT_PROTOTYPES) {
GLuint64 glGetTextureHandleNV (GLuint texture);
GLuint64 glGetTextureSamplerHandleNV (GLuint texture, GLuint sampler);
void glMakeTextureHandleResidentNV (GLuint64 handle);
void glMakeTextureHandleNonResidentNV (GLuint64 handle);
GLuint64 glGetImageHandleNV (GLuint texture, GLint level, GLboolean layered, GLint layer, GLenum format);
void glMakeImageHandleResidentNV (GLuint64 handle, GLenum access);
void glMakeImageHandleNonResidentNV (GLuint64 handle);
void glUniformHandleui64NV (GLint location, GLuint64 value);
void glUniformHandleui64vNV (GLint location, GLsizei count, const(GLuint64)*value);
void glProgramUniformHandleui64NV (GLuint program, GLint location, GLuint64 value);
void glProgramUniformHandleui64vNV (GLuint program, GLint location, GLsizei count, const(GLuint64)*values);
GLboolean glIsTextureHandleResidentNV (GLuint64 handle);
GLboolean glIsImageHandleResidentNV (GLuint64 handle);
} /* GL_GLEXT_PROTOTYPES */
alias GLuint64 function (GLuint texture) PFNGLGETTEXTUREHANDLENVPROC;
alias GLuint64 function (GLuint texture, GLuint sampler) PFNGLGETTEXTURESAMPLERHANDLENVPROC;
alias void function (GLuint64 handle) PFNGLMAKETEXTUREHANDLERESIDENTNVPROC;
alias void function (GLuint64 handle) PFNGLMAKETEXTUREHANDLENONRESIDENTNVPROC;
alias GLuint64 function (GLuint texture, GLint level, GLboolean layered, GLint layer, GLenum format) PFNGLGETIMAGEHANDLENVPROC;
alias void function (GLuint64 handle, GLenum access) PFNGLMAKEIMAGEHANDLERESIDENTNVPROC;
alias void function (GLuint64 handle) PFNGLMAKEIMAGEHANDLENONRESIDENTNVPROC;
alias void function (GLint location, GLuint64 value) PFNGLUNIFORMHANDLEUI64NVPROC;
alias void function (GLint location, GLsizei count, const(GLuint64)*value) PFNGLUNIFORMHANDLEUI64VNVPROC;
alias void function (GLuint program, GLint location, GLuint64 value) PFNGLPROGRAMUNIFORMHANDLEUI64NVPROC;
alias void function (GLuint program, GLint location, GLsizei count, const(GLuint64)*values) PFNGLPROGRAMUNIFORMHANDLEUI64VNVPROC;
alias GLboolean function (GLuint64 handle) PFNGLISTEXTUREHANDLERESIDENTNVPROC;
alias GLboolean function (GLuint64 handle) PFNGLISIMAGEHANDLERESIDENTNVPROC;
}

version (GL_NV_shader_atomic_float) {} else {
}

version (GL_AMD_query_buffer_object) {} else {
}

version (GL_AMD_sparse_texture) {} else {
version (GL_GLEXT_PROTOTYPES) {
void glTexStorageSparseAMD (GLenum target, GLenum internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLsizei layers, GLbitfield flags);
void glTextureStorageSparseAMD (GLuint texture, GLenum target, GLenum internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLsizei layers, GLbitfield flags);
} /* GL_GLEXT_PROTOTYPES */
alias void function (GLenum target, GLenum internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLsizei layers, GLbitfield flags) PFNGLTEXSTORAGESPARSEAMDPROC;
alias void function (GLuint texture, GLenum target, GLenum internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLsizei layers, GLbitfield flags) PFNGLTEXTURESTORAGESPARSEAMDPROC;
}

