#ifndef LWG_SDFCIRCLE2D_INCLUDED
#define LWG_SDFCIRCLE2D_INCLUDED

// Circle SDF
float sdfCircle2D(float2 uv) {
    return length(uv - 0.5) * 2;
}
half sdfCircle2D_half(half2 uv) {
    return length(uv - 0.5) * 2;
}

// Circle SDF Graph
void sdfCircle2D_graph_float(float2 UV, out float SDF) {
    SDF = sdfCircle2D(UV);
}
void sdfCircle2D_graph_half(half2 UV, out half SDF) {
    SDF = sdfCircle2D_half(UV);
}

#endif