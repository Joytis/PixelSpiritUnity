#ifndef LWG_SDFSHADERLIB_INCLUDED
#define LWG_SDFSHADERLIB_INCLUDED

// Anti-aliasing step
float aastep(float threshold, float value) {
    float afwidth = 0.7 * length(float2(ddx(value), ddy(value)));
    return smoothstep(threshold-afwidth, threshold+afwidth, value);
}
half aastep(half threshold, half value) {
    half afwidth = 0.7 * length(half2(ddx(value), ddy(value)));
    return smoothstep(threshold-afwidth, threshold+afwidth, value);
}

// Fill Sample
void sdfFill2D_float(float SDF, float Size, out float Out) {
    Out = 1. - aastep(Size, SDF);
}
void sdfFill2D_half(half SDF, half Size, out half Out) {
    Out = 1. - aastep(Size, SDF);
}

// Stoke Sample
void sdfStroke2D_float(float SDF, float Stroke, float Width, out float Out) {
    float offset = Width * .5;
    float res = aastep(Stroke, SDF + offset) - aastep(Stroke, SDF - offset);
    Out = clamp(res, 0., 1.);
}
void sdfStroke2D_half(half SDF, half Stroke, half Width, out half Out) {
    half offset = Width * .5;
    half res = aastep(Stroke, SDF + offset) - aastep(Stroke, SDF - offset);
    Out = clamp(res, 0., 1.);
}

// Circle SDF
void sdfCircle2D_float(float2 UV, out float SDF) {
    SDF = length(UV-.5) * 2.;
}
void sdfCircle2D_half(half2 UV, out half SDF) {
    SDF = length(UV-.5) * 2.;
}

// Rect SDF
void sdfRect2D_float(float2 UV, float2 Size, out float SDF) {
    UV = UV*2.-1.;
    SDF = max(abs(UV.x/Size.x),
              abs(UV.y/Size.y));
}
void sdfRect2D_half(half2 UV, half2 Size, out half SDF) {
    UV = UV*2.-1.;
    SDF = max(abs(UV.x/Size.x),
              abs(UV.y/Size.y));
}

// Rect SDF
void sdfCross2D_float(float2 UV, float Size, out float SDF) {
    float2 size = float2(.25, Size);
    float sdf1;
    sdfRect2D_float(UV.xy, size.xy, sdf1);
    float sdf2;
    sdfRect2D_float(UV.xy, size.yx, sdf2);
    SDF = min(sdf1, sdf2);
}
void sdfCross2D_half(half2 UV, half Size, out half SDF) {
    half2 size = half2(.25, Size);
    half sdf1;
    sdfRect2D_half(UV.xy, size.xy, sdf1);
    half sdf2;
    sdfRect2D_half(UV.xy, size.yx, sdf2);
    SDF = min(sdf1, sdf2);
}

// Triangle SDF
void sdfTriangle2D_float(float2 UV, out float SDF) {
    UV = (UV * 2.-1.) * 2.;
    SDF = max(abs(UV.x) * 0.866025 + UV.y * 0.5, -UV.y * 0.5);
}
void sdfTriangle2D_half(half2 UV, out half SDF) {
    UV = (UV * 2.-1.) * 2.;
    SDF = max(abs(UV.x) * 0.866025 + UV.y * 0.5, -UV.y * 0.5);
}

// Diamond SDF
void sdfDiamond2D_float(float2 UV, out float SDF) {
    float sdf1;
    sdfTriangle2D_float(UV, sdf1);
    float sdf2;
    sdfTriangle2D_float(float2(UV.x, 1. - UV.y), sdf2);
    SDF = max(sdf1, sdf2);
}
void sdfDiamond2D_half(half2 UV, out half SDF) {
    half sdf1;
    sdfTriangle2D_half(UV, sdf1);
    half sdf2;
    sdfTriangle2D_half(float2(UV.x, 1. - UV.y), sdf2);
    SDF = max(sdf1, sdf2);
}

// Vesica SDF
void sdfVesica2D_float(float2 UV, float Separation, out float SDF) {
    float2 offset = float2(Separation * .5, 0.);
    float sdf1;
    sdfCircle2D_float(UV - offset, sdf1);
    float sdf2;
    sdfCircle2D_float(UV + offset, sdf2);
    SDF = max(sdf1, sdf2);
}
void sdfVesica2D_half(half2 UV, half Separation, out half SDF) {
    half2 offset = half2(Separation * .5, 0.);
    half sdf1;
    sdfCircle2D_half(UV - offset, sdf1);
    half sdf2;
    sdfCircle2D_half(UV + offset, sdf2);
    SDF = max(sdf1, sdf2);
}

// Polygon SDF
void sdfPolygon2D_float(float2 UV, float Vertices, out float SDF) {
    UV = UV * 2. - 1.;
    float at = atan2(UV.x, UV.y) + PI;
    float r = length(UV);
    float v = (2 * PI)/Vertices;
    SDF = cos(floor(.5 + at / v) * v - at) * r;
}
void sdfPolygon2D_half(half2 UV, half Vertices, out half SDF) {
    UV = UV * 2. - 1.;
    half at = atan2(UV.x, UV.y) + PI;
    half r = length(UV);
    half v = (2 * PI)/Vertices;
    SDF = cos(floor(.5 + at / v) * v - at) * r;
}


#endif