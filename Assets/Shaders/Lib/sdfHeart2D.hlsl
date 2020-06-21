#ifndef LWG_SDFHEART2D_INCLUDED
#define LWG_SDFHEART2D_INCLUDED

// Polygon SDF
float sdfHeart2D(float2 uv) {
    uv -= float2(.5,.8);
    float r = length(uv)*5.;
    uv = normalize(uv);
    return r - 
         ((uv.y*pow(abs(uv.x),0.67))/ 
         (uv.y+1.5)-(2.)*uv.y+1.26);
}
half sdfHeart2D_half(half2 uv) {
    uv -= half2(.5,.8);
    half r = length(uv)*5.;
    uv = normalize(uv);
    return r - 
         ((uv.y*pow(abs(uv.x),0.67))/ 
         (uv.y+1.5)-(2.)*uv.y+1.26);
}

// Polygon SDF Graph
void sdfHeart2D_graph_float(float2 UV, out float SDF) {
    SDF = sdfHeart2D(UV);
}
void sdfHeart2D_graph_half(half2 UV, out half SDF) {
    SDF = sdfHeart2D_half(UV);
}

#endif
