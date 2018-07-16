#define FX_REFLECTION 1

float rand(float x){
	return fract(sin(x * 12.9898) * 43758.5453);
}
float rand(vec2 co){
	return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

float posNorm(float x) {
	return (x + 1.0) * 0.5;
}

float bubble(vec3 p, float t, float s, float seed){
	float d = 0.0;
	float ds;
	float d1;
	float psinA0 = sin((t + 111.0 * seed) * 0.55);
	float psinB0 = sin((t + 222.0 * seed) * 0.47);
	float psinC0 = sin((t + 333.0 * seed) * 0.38);

	ds = 0.2 * s;
	d1 = fSphere(p + vec3(
		ds * psinA0,
		ds * psinB0,
		ds * psinA0),
		(0.5 + rand(seed) * 0.5) * s
	);
	d = d1;

	d1 = fSphere(p + vec3(
		ds * psinB0,
		-ds * psinA0,
		ds * psinA0),
		(0.5 + rand(seed * 2.0) * 0.5) * s
	);
	d = fOpUnionSoft(d, d1, 0.5);

	d1 = fSphere(p + vec3(
		ds * psinC0,
		-ds * psinB0,
		-ds * psinC0),
		(0.5 + rand(seed * 3.0) * 0.5) * s
	);
	d = fOpUnionSoft(d, d1, 0.5);

	d1 = fSphere(p + vec3(
		-ds * psinA0,
		ds * psinB0,
		ds * psinC0),
		(0.5 + rand(seed * 4.0) * 0.5) * s
	);
	d = fOpUnionSoft(d, d1, 0.5);
	return d;
}

float distanceFunction(in vec3 p) {
	float d = bubble(p + vec3(sin(uTime * 0.23), cos(uTime * 0.65), sin(uTime * 0.65)), uTime * 2.5, 1.0, 1.0);
	float d1 = bubble(p + vec3(cos((uTime + 200.0) * 0.1), sin(-uTime * 0.3), cos(uTime * 0.74)), uTime * 2.0, 1.0, 4.0);
	d = fOpUnionSoft(d, d1, 0.05);
	return d;

}
