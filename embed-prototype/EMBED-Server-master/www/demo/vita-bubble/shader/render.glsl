
/**
 * Adjusts the hue of a color.
 *
 * @name czm_hue
 * @glslFunction
 *
 * @param {vec3} rgb The color.
 * @param {float} adjustment The amount to adjust the hue of the color in radians.
 *
 * @returns {float} The color with the hue adjusted.
 *
 * @example
 * vec3 adjustHue = czm_hue(color, czm_pi); // The same as czm_hue(color, -czm_pi)
 */
vec3 czm_hue(vec3 rgb, float adjustment)
{
    const mat3 toYIQ = mat3(0.299,     0.587,     0.114,
                            0.595716, -0.274453, -0.321263,
                            0.211456, -0.522591,  0.311135);
    const mat3 toRGB = mat3(1.0,  0.9563,  0.6210,
                            1.0, -0.2721, -0.6474,
                            1.0, -1.107,   1.7046);

    vec3 yiq = toYIQ * rgb;
    float hue = atan(yiq.z, yiq.y) + adjustment;
    float chroma = sqrt(yiq.z * yiq.z + yiq.y * yiq.y);

    vec3 color = vec3(yiq.x, chroma * cos(hue), chroma * sin(hue));
    return toRGB * color;
}
/**
 * Adjusts the saturation of a color.
 *
 * @name czm_saturation
 * @glslFunction
 *
 * @param {vec3} rgb The color.
 * @param {float} adjustment The amount to adjust the saturation of the color.
 *
 * @returns {float} The color with the saturation adjusted.
 *
 * @example
 * vec3 greyScale = czm_saturation(color, 0.0);
 * vec3 doubleSaturation = czm_saturation(color, 2.0);
 */
vec3 czm_saturation(vec3 rgb, float adjustment)
{
    // Algorithm from Chapter 16 of OpenGL Shading Language
    const vec3 W = vec3(0.2125, 0.7154, 0.0721);
    vec3 intensity = vec3(dot(rgb, W));
    return mix(intensity, rgb, adjustment);
}
/////////////////////
vec3 Geoffrey(float t) {
	vec3 r = t * 5.1 - vec3(1.8, 1.14, 0.3);
	return (cos(1.9 * sin(1.0 - r * r)));
}
vec3 mOil(vec3 ro, vec3 rd) {
	return Geoffrey(
		cos(rd.y * 3.0 + uTime * 0.3) +
		sin(rd.x + cos(3.0 * rd.y + uTime * 0.78) +
		rd.x * 1.0 +
		uTime )
	);
}
/////////////////////
vec3 mCubemap(in vec3 ro, in vec3 v) {
	float M = max(max(abs(v.x), abs(v.y)), abs(v.z));
	float scale = (float(128) - 1.) / float(128) *0.5;
	if (abs(v.x) != M) v.x *= scale;
	if (abs(v.y) != M) v.y *= scale;
	if (abs(v.z) != M) v.z *= scale;
	return textureCube(uCubemap, v).xyz;
}
/////////////////////
vec2 B(vec2 a){
	return vec2(log(length(a)),atan(a.y,a.x)-6.);
}
vec3 mFractal(in vec3 ro, in vec3 rd){
	float t = uTime * (uGui0 * 2.0);
	vec2 E = rd.xy * (10.0* cos(t / 10.0 ));
	vec2 e_=E;
	float c= 10.0 + uGui1 * 20.0;
	const int i_max=30;
	for(int i=0; i<i_max; i++){
		e_= B(vec2(e_.x, abs(e_.y))) + vec2(0.1 * sin(t / 10.0) - (uGui3 * 0.3), 5.0 + 0.1 * cos(t /  5.0));
		c += length(e_);
		if (i >= int(uGui2 * 20.0 + 10.0)) {
			break;
		}
	}
	float d = log2(log2(c * 0.05)) * (10.0);
	return czm_saturation(
		czm_hue(
			vec3(0.5 + 0.7 * cos(d), 0.5 + 0.55 * cos(d - 0.7), 0.7 + 0.7 * cos(d - 0.7)),
			PI + uGui4 * PI
		),
		uGui5
	);
}
/////////////////////
vec3 renderRay(vec3 ro, vec3 rd) {
	vec3 _rd = rd;
	vec3 col = mFractal(ro, rd);
	rayMarch(ro, rd);
	if(currHit) {
		rd = normalize(reflect(rd, currNor));
		vec3 oilBase = mOil(currPos, rd);
		vec3 haloBase = max(normalize(_rd * currNor), vec3(0.0));
		float haloMask = pow(min(haloBase.r + haloBase.g + haloBase.b, 1.0), 1.3);
		vec3 oil = oilBase * haloMask;
		col = min(col, vec3(1.0) - vec3(haloMask));
		col = max(col, oil);
	}
	return col;
}


vec3 render(in vec3 ro, in vec3 rd) {
	vec3 _rd = rd;
	vec3 _ro = ro;
	vec3 col = renderRay(ro, rd);
	if(currHit) {
		vec3 _currPos = currPos;
		vec3 _curNor = currNor;
		rd = normalize(reflect(rd, currNor));
		vec3 reflection = renderRay(currPos + rd * EPS1, rd);
		col = mix(col,max(col, reflection),0.3);
		vec3 transparency = renderRay(_currPos + _rd * vec3(2.0), _rd);
		col = mix(col,transparency,0.3);
	}
	return col;
}
