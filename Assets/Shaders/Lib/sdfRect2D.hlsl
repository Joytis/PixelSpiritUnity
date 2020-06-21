#ifndef LWG_SDFRECT2D_INCLUDED
#define LWG_SDFRECT2D_INCLUDED

// Rect SDF
float sdfRect2D(float2 uv, float2 size) {
    uv = uv * 2 - 1;
    return max(abs(uv.x/size.x),
              abs(uv.y/size.y));
}
half sdfRect2D_half(half2 uv, half2 size) {
    uv = uv * 2 - 1;
    return max(abs(uv.x/size.x),
              abs(uv.y/size.y));
}

// Rect SDF Graph
void sdfRect2D_graph_float(float2 UV, float2 Size, out float SDF) {
    SDF = sdfRect2D(UV, Size);
}
void sdfRect2D_graph_half(half2 UV, half2 Size, out half SDF) {
    SDF = sdfRect2D_half(UV, Size);
}

#endif