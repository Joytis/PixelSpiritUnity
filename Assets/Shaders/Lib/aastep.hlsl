#ifndef LWG_AASTEP_INCLUDED
#define LWG_AASTEP_INCLUDED

// Anti-aliasing step
real aastep(real threshold, real value) {
    real afwidth = 0.2 * length(real2(ddx(value), ddy(value)));
    return smoothstep(threshold - afwidth, threshold + afwidth, value);
}

#endif