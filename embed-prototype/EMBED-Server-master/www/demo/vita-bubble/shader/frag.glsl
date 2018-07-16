#ifdef GL_ES
precision highp float;
#endif

// Mercury library
/*hg_sdf.glsl*/

////////////////////////////////////////////////////////////
//    PROGRAM CODE
////////////////////////////////////////////////////////////

/* NUMERICAL CONSTANTS */
#define MAX_STEPS 32
#define DF_SMOOTH 1.2
#define EPS       0.001
#define EPS1      0.01
#define ROOTTHREE 0.57735027
#define HUGEVAL   1e20

/* SHADER VARS */
varying vec2 vUv;
uniform vec3 uCamCenter;
uniform vec3 uCamPos;
uniform vec3 uCamUp;
uniform float uAspect;
uniform float uTime;
uniform sampler2D uTexture;
uniform samplerCube uCubemap;
uniform float uGui0;
uniform float uGui1;
uniform float uGui2;
uniform float uGui3;
uniform float uGui4;
uniform float uGui5;
uniform float uGui6;
uniform float uGui7;
uniform float uGui8;
uniform float uGui9;

/* GLOBAL VARS */
float gMin = 0.0;
float gMax = HUGEVAL;

// ray tracing globals
bool currHit = false;
vec3 currPos, currNor;

// Distance function
/*distanceFunction.glsl*/

// source: inigo quilez
// normal from central difference
vec3 getNormal(in vec3 pos) {
	vec3 eps = vec3(EPS, 0.0, 0.0);
	vec3 nor;
	nor.x = distanceFunction(pos+eps.xyy) - distanceFunction(pos-eps.xyy);
	nor.y = distanceFunction(pos+eps.yxy) - distanceFunction(pos-eps.yxy);
	nor.z = distanceFunction(pos+eps.yyx) - distanceFunction(pos-eps.yyx);
	return normalize(nor);
}

int intersectSteps(in vec3 ro, in vec3 rd) {
	float t = 0.0;
	int steps = -1;

	for(int i=0; i<MAX_STEPS; ++i)
	{
		float dt = distanceFunction(ro + rd*t) * DF_SMOOTH;
		if(dt >= EPS) {
			steps++;
		}
		else {
			break;
		}
		t += dt;
	}
	return steps;
}

float intersectDist(in vec3 ro, in vec3 rd) {
	float t = gMin;
	float dist = -1.0;

	for(int i=0; i<MAX_STEPS; ++i)
	{
		float dt = distanceFunction(ro + rd*t) * DF_SMOOTH;

		if(dt < EPS) {
			dist = t;
			break;
		}

		t += dt;

		if(t > gMax)
			break;
	}

	return dist;
}

float rayMarch (in vec3 ro, in vec3 rd) {
	float t = intersectDist(ro, rd);
	if (t>0.0) {
		currHit = true;
		currPos = ro + rd*t;
		currNor = getNormal(currPos - rd * EPS);
	} else {
		currHit = false;
	}
	return t;
}

// Render
/*render.glsl*/

////////////////////////////////////////////////////////////
//    MAIN
////////////////////////////////////////////////////////////

void main(void) {
	hg_sdf_init();
	/* CAMERA RAY */
	vec3 C = normalize(uCamCenter-uCamPos);
	vec3 A = uAspect*normalize(cross(C,uCamUp));
	vec3 B = -normalize(uCamUp);

	// scale A and B by root3/3 : fov = 30 degrees
	vec3 rd = normalize( C + (2.0*vUv.x-1.0)*ROOTTHREE*A + (2.0*vUv.y-1.0)*ROOTTHREE*B );
	vec3 ro = uCamPos;

	// rendering
	gl_FragColor.a = 1.0;
	gl_FragColor.rgb = render(ro, rd);
}
