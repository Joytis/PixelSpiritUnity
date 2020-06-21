#ifndef LWG_SDFTRIANGLE2D_INCLUDED
#define LWG_SDFTRIANGLE2D_INCLUDED

// Triangle SDF
float sdfTriangle2D(float2 uv) {
    uv = (uv * 2 - 1) * 2 ;
    return max(abs(uv.x) * 0.866025 + uv.y * 0.5, -uv.y * 0.5);
}
half sdfTriangle2D_half(half2 uv) {
    uv = (uv * 2 - 1) * 2 ;
    return max(abs(uv.x) * 0.866025 + uv.y * 0.5, -uv.y * 0.5);
}

// Triangle SDF
void sdfTriangle2D_graph_float(float2 UV, out float SDF) {
    SDF = sdfTriangle2D(UV);
}
void sdfTriangle2D_graph_half(half2 UV, out half SDF) {
    SDF = sdfTriangle2D_half(UV);
}

#endif