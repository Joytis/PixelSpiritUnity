#ifndef LWG_SDFFILL2D_INCLUDED
#define LWG_SDFFILL2D_INCLUDED

#include "./aastep.hlsl"

// Fill Sample
float sdfFill2D(float sdf, float size) {
    return 1 - aastep(size, sdf);
}
half sdfFill2D_half(half sdf, half size) {
    return 1 - aastep(size, sdf);
}

// Fill Sample Graph
void sdfFill2D_graph_float(float SDF, float Size, out float Out) {
    Out = sdfFill2D(SDF, Size);
}
void sdfFill2D_graph_half(half SDF, half Size, out half Out) {
    Out = sdfFill2D_half(SDF, Size);
}

#endif