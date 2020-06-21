#ifndef LWG_SDFHEX2D_INCLUDED
#define LWG_SDFHEX2D_INCLUDED

// Polygon SDF
float sdfHex2D(float2 uv) {
    uv = abs(uv * 2 - 1);
    return max(abs(uv.y), uv.x * 0.866025 + uv.y * 0.5);
}
half sdfHex2D_half(half2 uv) {
    uv = abs(uv * 2 - 1);
    return max(abs(uv.y), uv.x * 0.866025 + uv.y * 0.5);
}

// Polygon SDF Graph
void sdfHex2D_graph_float(float2 UV, out float SDF) {
    SDF = sdfHex2D(UV);
}
void sdfHex2D_graph_half(half2 UV, out half SDF) {
    SDF = sdfHex2D_half(UV);
}

#endif
