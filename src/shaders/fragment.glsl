uniform vec2 uResolution;
uniform float uTime;

#define R3D(a) mix(q*dot(p,q), p, cos(a)) + sin(a)*cross(p,q)

void mainImage(out vec4 o, in vec2 FC) {
    float i, j, D, d = 0.1, e;
    vec3 p, q = vec3(1.5), r = vec3(uResolution.xy, 0.0);
    o = vec4(0.0824, 0.2824, 1.0, 0.0);

    for (i = 0.; i++ < 64. && d > 1e-4;) {
        p = vec3((FC.xy - 0.5 * r.xy) / r.y, e);
        p = p * R3D(uTime);

        for (j = 0.; j++ < 9.;)
            p = abs(p * mix(p, q, 1.38)),
            p *= cos(exp(-p.z * p.x) / (D = (dot(p, p)))),
            d -= D / 1e4;

        e += d / j;
    }
    o += vec4(sqrt(p * p * q), 1) * 3. / i;
}

void main() {
    mainImage(gl_FragColor, gl_FragCoord.xy);
}
