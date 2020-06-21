#ifndef LWG_29THESUN_INCLUDED
#define LWG_29THESUN_INCLUDED

#include "../Lib/sdfFill2D.hlsl"
#include "../Lib/sdfStroke2D.hlsl"
#include "../Lib/sdfPolygon2D.hlsl"
#include "../Lib/sdfStar2D.hlsl"

float2 rotate(float2 st, float a) {
    st = mul(float2x2(cos(a),-sin(a), sin(a),cos(a)), (st-.5));
    return st+.5;
}

void lwg29TheSun_float(float2 UV, out float Out) {
    float3 color = float3(0, 0, 0);
    //START
    float bg = sdfStar2D(UV, 16, 0.1);
    color += sdfFill2D(bg,1.3);
    float l = 0.;
    for (float i = 0.; i < 8.; i++) {
        float2 xy = rotate(UV, PI / 4 * i);
        xy.y -= .3;
        float tri = sdfPolygon2D(xy,3);
        color += sdfFill2D(tri,.3);
        l += sdfStroke2D(tri,.3,.03);
    }
    color *= 1.-l;
    float c = sdfPolygon2D(UV,8);
    color -= sdfStroke2D(c,.15,.04);
    //END
    Out = float4(color,1.);
}

#endif