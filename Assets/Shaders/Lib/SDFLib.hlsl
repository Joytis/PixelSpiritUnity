#ifndef LWG_SDFSHADERLIB_INCLUDED
#define LWG_SDFSHADERLIB_INCLUDED

// Circle SDF
void sdfCircle2D_float(float2 UV, out float SDF) {
    SDF = length(UV-.5)*2.;
}
void sdfCircle2D_half(half2 UV, out half SDF) {
    SDF = length(UV-.5)*2.;
}

// Rect SDF
void sdfRect2D_float(float2 UV, float2 Size, out float SDF) {
    UV = UV*2.-1.;
    SDF = max( abs(UV.x/Size.x),
                abs(UV.y/Size.y) );
}
void sdfRect2D_half(half2 UV, half2 Size, out half SDF) {
    UV = UV*2.-1.;
    SDF = max( abs(UV.x/Size.x),
                abs(UV.y/Size.y) );
}

#endif