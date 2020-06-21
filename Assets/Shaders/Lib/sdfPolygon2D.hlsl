#ifndef LWG_SDFPOLYGON2D_INCLUDED
#define LWG_SDFPOLYGON2D_INCLUDED

// Polygon SDF
float sdfPolygon2D(float2 uv, float sides) {
    uv = uv * 2. - 1.;
    float pi = 3.14159265359;
    float tau = 6.28318530718;
    float a = atan2(uv.x, uv.y) + pi;
    float r = length(uv);
    float v = tau / sides;
    return cos(floor(0.5 + a / v) * v - a) * r;
}
half sdfPolygon2D_half(half2 uv, half sides) {
    uv = uv * 2. - 1.;
    half pi = 3.14159265359;
    half tau = 6.28318530718;
    half a = atan2(uv.x, uv.y) + pi;
    half r = length(uv);
    half v = tau / sides;
    return cos(floor(0.5 + a / v) * v - a) * r;
}

// Polygon SDF Graph
void sdfPolygon2D_graph_float(float2 UV, float Sides, out float SDF) {
    SDF = sdfPolygon2D(UV, Sides);
}

void sdfPolygon2D_graph_half(half2 UV, half Sides, out half SDF) {
    SDF = sdfPolygon2D_half(UV, Sides);
}

#endif
