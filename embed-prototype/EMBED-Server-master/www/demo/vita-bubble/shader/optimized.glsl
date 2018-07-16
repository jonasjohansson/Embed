precision highp float;
varying vec2 vUv;
uniform vec3 uCamCenter;
uniform vec3 uCamPos;
uniform vec3 uCamUp;
uniform float uAspect;
uniform float uTime;
uniform float uGui0;
uniform float uGui1;
uniform float uGui2;
uniform float uGui3;
uniform float uGui4;
uniform float uGui5;
bool currHit;
vec3 currPos;
vec3 currNor;
void main ()
{
  currHit = bool(0);
  vec3 tmpvar_1;
  tmpvar_1 = normalize((uCamCenter - uCamPos));
  vec3 tmpvar_2;
  tmpvar_2 = normalize(((tmpvar_1 +
    ((((2.0 * vUv.x) - 1.0) * 0.5773503) * (uAspect * normalize((
      (tmpvar_1.yzx * uCamUp.zxy)
     -
      (tmpvar_1.zxy * uCamUp.yzx)
    ))))
  ) + (
    (((2.0 * vUv.y) - 1.0) * 0.5773503)
   *
    -(normalize(uCamUp))
  )));
  gl_FragColor.w = 1.0;
  vec3 col_3;
  vec3 col_4;
  float c_6;
  vec2 e_a7;
  float t_8;
  float tmpvar_9;
  tmpvar_9 = (uTime * (uGui0 * 2.0));
  t_8 = tmpvar_9;
  e_a7 = (tmpvar_2.xy * (10.0 * cos(
    (tmpvar_9 / 10.0)
  )));
  c_6 = (10.0 + (uGui1 * 20.0));
  for (highp int i_5 = 0; i_5 < 30; i_5++) {
    vec2 tmpvar_10;
    tmpvar_10.x = e_a7.x;
    tmpvar_10.y = abs(e_a7.y);
    float tmpvar_11;
    tmpvar_11 = log(sqrt(dot (tmpvar_10, tmpvar_10)));
    float tmpvar_12;
    float tmpvar_13;
    tmpvar_13 = (min (abs(
      (tmpvar_10.y / e_a7.x)
    ), 1.0) / max (abs(
      (tmpvar_10.y / e_a7.x)
    ), 1.0));
    float tmpvar_14;
    tmpvar_14 = (tmpvar_13 * tmpvar_13);
    tmpvar_14 = (((
      ((((
        ((((-0.01213232 * tmpvar_14) + 0.05368138) * tmpvar_14) - 0.1173503)
       * tmpvar_14) + 0.1938925) * tmpvar_14) - 0.3326756)
     * tmpvar_14) + 0.9999793) * tmpvar_13);
    tmpvar_14 = (tmpvar_14 + (float(
      (abs((tmpvar_10.y / e_a7.x)) > 1.0)
    ) * (
      (tmpvar_14 * -2.0)
     + 1.570796)));
    tmpvar_12 = (tmpvar_14 * sign((tmpvar_10.y / e_a7.x)));
    if ((abs(e_a7.x) > (1e-08 * abs(tmpvar_10.y)))) {
      if ((e_a7.x < 0.0)) {
        if ((tmpvar_10.y >= 0.0)) {
          tmpvar_12 += 3.141593;
        } else {
          tmpvar_12 = (tmpvar_12 - 3.141593);
        };
      };
    } else {
      tmpvar_12 = (sign(tmpvar_10.y) * 1.570796);
    };
    vec2 tmpvar_15;
    tmpvar_15.x = tmpvar_11;
    tmpvar_15.y = (tmpvar_12 - 6.0);
    vec2 tmpvar_16;
    tmpvar_16.x = ((0.1 * sin(
      (t_8 / 10.0)
    )) - (uGui3 * 0.3));
    tmpvar_16.y = (5.0 + (0.1 * cos(
      (t_8 / 5.0)
    )));
    e_a7 = (tmpvar_15 + tmpvar_16);
    c_6 = (c_6 + sqrt(dot (e_a7, e_a7)));
    if ((i_5 >= int((
      (uGui2 * 20.0)
     + 10.0)))) {
      break;
    };
  };
  float tmpvar_17;
  tmpvar_17 = (log2(log2(
    (c_6 * 0.05)
  )) * 10.0);
  vec3 tmpvar_18;
  tmpvar_18.x = (0.5 + (0.7 * cos(tmpvar_17)));
  tmpvar_18.y = (0.5 + (0.55 * cos(
    (tmpvar_17 - 0.7)
  )));
  tmpvar_18.z = (0.7 + (0.7 * cos(
    (tmpvar_17 - 0.7)
  )));
  vec3 tmpvar_19;
  float adjustment_20;
  adjustment_20 = (3.141593 + (uGui4 * 3.141593));
  vec3 tmpvar_21;
  tmpvar_21 = (mat3(0.299, 0.587, 0.114, 0.595716, -0.274453, -0.321263, 0.211456, -0.522591, 0.311135) * tmpvar_18);
  float tmpvar_22;
  float tmpvar_23;
  tmpvar_23 = (min (abs(
    (tmpvar_21.z / tmpvar_21.y)
  ), 1.0) / max (abs(
    (tmpvar_21.z / tmpvar_21.y)
  ), 1.0));
  float tmpvar_24;
  tmpvar_24 = (tmpvar_23 * tmpvar_23);
  tmpvar_24 = (((
    ((((
      ((((-0.01213232 * tmpvar_24) + 0.05368138) * tmpvar_24) - 0.1173503)
     * tmpvar_24) + 0.1938925) * tmpvar_24) - 0.3326756)
   * tmpvar_24) + 0.9999793) * tmpvar_23);
  tmpvar_24 = (tmpvar_24 + (float(
    (abs((tmpvar_21.z / tmpvar_21.y)) > 1.0)
  ) * (
    (tmpvar_24 * -2.0)
   + 1.570796)));
  tmpvar_22 = (tmpvar_24 * sign((tmpvar_21.z / tmpvar_21.y)));
  if ((abs(tmpvar_21.y) > (1e-08 * abs(tmpvar_21.z)))) {
    if ((tmpvar_21.y < 0.0)) {
      if ((tmpvar_21.z >= 0.0)) {
        tmpvar_22 += 3.141593;
      } else {
        tmpvar_22 = (tmpvar_22 - 3.141593);
      };
    };
  } else {
    tmpvar_22 = (sign(tmpvar_21.z) * 1.570796);
  };
  float tmpvar_25;
  tmpvar_25 = (tmpvar_22 + adjustment_20);
  float tmpvar_26;
  tmpvar_26 = sqrt(((tmpvar_21.z * tmpvar_21.z) + (tmpvar_21.y * tmpvar_21.y)));
  vec3 tmpvar_27;
  tmpvar_27.x = tmpvar_21.x;
  tmpvar_27.y = (tmpvar_26 * cos(tmpvar_25));
  tmpvar_27.z = (tmpvar_26 * sin(tmpvar_25));
  tmpvar_19 = (mat3(1.0, 0.9563, 0.621, 1.0, -0.2721, -0.6474, 1.0, -1.107, 1.7046) * tmpvar_27);
  vec3 tmpvar_28;
  tmpvar_28 = mix (vec3(dot (tmpvar_19, vec3(0.2125, 0.7154, 0.0721))), tmpvar_19, uGui5);
  col_4 = tmpvar_28;
  vec3 ro_29;
  ro_29 = uCamPos;
  vec3 rd_30;
  rd_30 = tmpvar_2;
  float dist_32;
  float t_33;
  t_33 = 0.0;
  dist_32 = -1.0;
  for (highp int i_31 = 0; i_31 < 32; i_31++) {
    vec3 p_34;
    p_34 = (ro_29 + (rd_30 * t_33));
    vec3 tmpvar_35;
    tmpvar_35.x = sin((uTime * 0.23));
    float tmpvar_36;
    tmpvar_36 = (uTime * 0.65);
    tmpvar_35.y = cos(tmpvar_36);
    tmpvar_35.z = sin(tmpvar_36);
    vec3 p_37;
    p_37 = (p_34 + tmpvar_35);
    float t_38;
    t_38 = (uTime * 2.5);
    float tmpvar_39;
    tmpvar_39 = sin(((t_38 + 111.0) * 0.55));
    float tmpvar_40;
    tmpvar_40 = sin(((t_38 + 222.0) * 0.47));
    float tmpvar_41;
    tmpvar_41 = sin(((t_38 + 333.0) * 0.38));
    vec3 tmpvar_42;
    tmpvar_42.x = (0.2 * tmpvar_39);
    tmpvar_42.y = (0.2 * tmpvar_40);
    tmpvar_42.z = (0.2 * tmpvar_39);
    float tmpvar_43;
    vec3 p_44;
    p_44 = (p_37 + tmpvar_42);
    tmpvar_43 = (sqrt(dot (p_44, p_44)) - 0.9707031);
    vec3 tmpvar_45;
    tmpvar_45.x = (0.2 * tmpvar_40);
    tmpvar_45.y = (-0.2 * tmpvar_39);
    tmpvar_45.z = (0.2 * tmpvar_39);
    float tmpvar_46;
    vec3 p_47;
    p_47 = (p_37 + tmpvar_45);
    tmpvar_46 = (sqrt(dot (p_47, p_47)) - 0.5429688);
    float tmpvar_48;
    float tmpvar_49;
    tmpvar_49 = max ((0.5 - abs(
      (tmpvar_43 - tmpvar_46)
    )), 0.0);
    tmpvar_48 = (min (tmpvar_43, tmpvar_46) - ((
      (tmpvar_49 * tmpvar_49)
     * 0.25) / 0.5));
    vec3 tmpvar_50;
    tmpvar_50.x = (0.2 * tmpvar_41);
    tmpvar_50.y = (-0.2 * tmpvar_40);
    tmpvar_50.z = (-0.2 * tmpvar_41);
    float tmpvar_51;
    vec3 p_52;
    p_52 = (p_37 + tmpvar_50);
    tmpvar_51 = (sqrt(dot (p_52, p_52)) - 0.7949219);
    float tmpvar_53;
    float tmpvar_54;
    tmpvar_54 = max ((0.5 - abs(
      (tmpvar_48 - tmpvar_51)
    )), 0.0);
    tmpvar_53 = (min (tmpvar_48, tmpvar_51) - ((
      (tmpvar_54 * tmpvar_54)
     * 0.25) / 0.5));
    vec3 tmpvar_55;
    tmpvar_55.x = (-0.2 * tmpvar_39);
    tmpvar_55.y = (0.2 * tmpvar_40);
    tmpvar_55.z = (0.2 * tmpvar_41);
    float tmpvar_56;
    vec3 p_57;
    p_57 = (p_37 + tmpvar_55);
    tmpvar_56 = (sqrt(dot (p_57, p_57)) - 0.6835938);
    float tmpvar_58;
    float tmpvar_59;
    tmpvar_59 = max ((0.5 - abs(
      (tmpvar_53 - tmpvar_56)
    )), 0.0);
    tmpvar_58 = (min (tmpvar_53, tmpvar_56) - ((
      (tmpvar_59 * tmpvar_59)
     * 0.25) / 0.5));
    vec3 tmpvar_60;
    tmpvar_60.x = cos(((uTime + 200.0) * 0.1));
    tmpvar_60.y = sin((-(uTime) * 0.3));
    tmpvar_60.z = cos((uTime * 0.74));
    vec3 p_61;
    p_61 = (p_34 + tmpvar_60);
    float t_62;
    t_62 = (uTime * 2.0);
    float tmpvar_63;
    tmpvar_63 = sin(((t_62 + 444.0) * 0.55));
    float tmpvar_64;
    tmpvar_64 = sin(((t_62 + 888.0) * 0.47));
    float tmpvar_65;
    tmpvar_65 = sin(((t_62 + 1332.0) * 0.38));
    vec3 tmpvar_66;
    tmpvar_66.x = (0.2 * tmpvar_63);
    tmpvar_66.y = (0.2 * tmpvar_64);
    tmpvar_66.z = (0.2 * tmpvar_63);
    float tmpvar_67;
    vec3 p_68;
    p_68 = (p_61 + tmpvar_66);
    tmpvar_67 = (sqrt(dot (p_68, p_68)) - 0.6835938);
    vec3 tmpvar_69;
    tmpvar_69.x = (0.2 * tmpvar_64);
    tmpvar_69.y = (-0.2 * tmpvar_63);
    tmpvar_69.z = (0.2 * tmpvar_63);
    float tmpvar_70;
    vec3 p_71;
    p_71 = (p_61 + tmpvar_69);
    tmpvar_70 = (sqrt(dot (p_71, p_71)) - 0.5874023);
    float tmpvar_72;
    float tmpvar_73;
    tmpvar_73 = max ((0.5 - abs(
      (tmpvar_67 - tmpvar_70)
    )), 0.0);
    tmpvar_72 = (min (tmpvar_67, tmpvar_70) - ((
      (tmpvar_73 * tmpvar_73)
     * 0.25) / 0.5));
    vec3 tmpvar_74;
    tmpvar_74.x = (0.2 * tmpvar_65);
    tmpvar_74.y = (-0.2 * tmpvar_64);
    tmpvar_74.z = (-0.2 * tmpvar_65);
    float tmpvar_75;
    vec3 p_76;
    p_76 = (p_61 + tmpvar_74);
    tmpvar_75 = (sqrt(dot (p_76, p_76)) - 0.6621094);
    float tmpvar_77;
    float tmpvar_78;
    tmpvar_78 = max ((0.5 - abs(
      (tmpvar_72 - tmpvar_75)
    )), 0.0);
    tmpvar_77 = (min (tmpvar_72, tmpvar_75) - ((
      (tmpvar_78 * tmpvar_78)
     * 0.25) / 0.5));
    vec3 tmpvar_79;
    tmpvar_79.x = (-0.2 * tmpvar_63);
    tmpvar_79.y = (0.2 * tmpvar_64);
    tmpvar_79.z = (0.2 * tmpvar_65);
    float tmpvar_80;
    vec3 p_81;
    p_81 = (p_61 + tmpvar_79);
    tmpvar_80 = (sqrt(dot (p_81, p_81)) - 0.6035156);
    float tmpvar_82;
    float tmpvar_83;
    tmpvar_83 = max ((0.5 - abs(
      (tmpvar_77 - tmpvar_80)
    )), 0.0);
    tmpvar_82 = (min (tmpvar_77, tmpvar_80) - ((
      (tmpvar_83 * tmpvar_83)
     * 0.25) / 0.5));
    float tmpvar_84;
    tmpvar_84 = max ((0.05 - abs(
      (tmpvar_58 - tmpvar_82)
    )), 0.0);
    float tmpvar_85;
    tmpvar_85 = ((min (tmpvar_58, tmpvar_82) - (
      ((tmpvar_84 * tmpvar_84) * 0.25)
     / 0.05)) * 1.2);
    if ((tmpvar_85 < 0.001)) {
      dist_32 = t_33;
      break;
    };
    t_33 = (t_33 + tmpvar_85);
    if ((t_33 > 1e+20)) {
      break;
    };
  };
  if ((dist_32 > 0.0)) {
    currHit = bool(1);
    currPos = (uCamPos + (tmpvar_2 * dist_32));
    vec3 pos_86;
    pos_86 = (currPos - (tmpvar_2 * 0.001));
    vec3 nor_87;
    vec3 p_88;
    p_88 = (pos_86 + vec3(0.001, 0.0, 0.0));
    vec3 tmpvar_89;
    float tmpvar_90;
    tmpvar_90 = (uTime * 0.23);
    tmpvar_89.x = sin(tmpvar_90);
    float tmpvar_91;
    tmpvar_91 = (uTime * 0.65);
    tmpvar_89.y = cos(tmpvar_91);
    tmpvar_89.z = sin(tmpvar_91);
    vec3 p_92;
    p_92 = (p_88 + tmpvar_89);
    float tmpvar_93;
    tmpvar_93 = (uTime * 2.5);
    float tmpvar_94;
    tmpvar_94 = sin(((tmpvar_93 + 111.0) * 0.55));
    float tmpvar_95;
    tmpvar_95 = sin(((tmpvar_93 + 222.0) * 0.47));
    float tmpvar_96;
    tmpvar_96 = sin(((tmpvar_93 + 333.0) * 0.38));
    vec3 tmpvar_97;
    tmpvar_97.x = (0.2 * tmpvar_94);
    tmpvar_97.y = (0.2 * tmpvar_95);
    tmpvar_97.z = (0.2 * tmpvar_94);
    float tmpvar_98;
    vec3 p_99;
    p_99 = (p_92 + tmpvar_97);
    tmpvar_98 = (sqrt(dot (p_99, p_99)) - 0.9707031);
    vec3 tmpvar_100;
    tmpvar_100.x = (0.2 * tmpvar_95);
    tmpvar_100.y = (-0.2 * tmpvar_94);
    tmpvar_100.z = (0.2 * tmpvar_94);
    float tmpvar_101;
    vec3 p_102;
    p_102 = (p_92 + tmpvar_100);
    tmpvar_101 = (sqrt(dot (p_102, p_102)) - 0.5429688);
    float tmpvar_103;
    float tmpvar_104;
    tmpvar_104 = max ((0.5 - abs(
      (tmpvar_98 - tmpvar_101)
    )), 0.0);
    tmpvar_103 = (min (tmpvar_98, tmpvar_101) - ((
      (tmpvar_104 * tmpvar_104)
     * 0.25) / 0.5));
    vec3 tmpvar_105;
    tmpvar_105.x = (0.2 * tmpvar_96);
    tmpvar_105.y = (-0.2 * tmpvar_95);
    tmpvar_105.z = (-0.2 * tmpvar_96);
    float tmpvar_106;
    vec3 p_107;
    p_107 = (p_92 + tmpvar_105);
    tmpvar_106 = (sqrt(dot (p_107, p_107)) - 0.7949219);
    float tmpvar_108;
    float tmpvar_109;
    tmpvar_109 = max ((0.5 - abs(
      (tmpvar_103 - tmpvar_106)
    )), 0.0);
    tmpvar_108 = (min (tmpvar_103, tmpvar_106) - ((
      (tmpvar_109 * tmpvar_109)
     * 0.25) / 0.5));
    vec3 tmpvar_110;
    tmpvar_110.x = (-0.2 * tmpvar_94);
    tmpvar_110.y = (0.2 * tmpvar_95);
    tmpvar_110.z = (0.2 * tmpvar_96);
    float tmpvar_111;
    vec3 p_112;
    p_112 = (p_92 + tmpvar_110);
    tmpvar_111 = (sqrt(dot (p_112, p_112)) - 0.6835938);
    float tmpvar_113;
    float tmpvar_114;
    tmpvar_114 = max ((0.5 - abs(
      (tmpvar_108 - tmpvar_111)
    )), 0.0);
    tmpvar_113 = (min (tmpvar_108, tmpvar_111) - ((
      (tmpvar_114 * tmpvar_114)
     * 0.25) / 0.5));
    vec3 tmpvar_115;
    float tmpvar_116;
    tmpvar_116 = (uTime + 200.0);
    tmpvar_115.x = cos((tmpvar_116 * 0.1));
    float tmpvar_117;
    tmpvar_117 = -(uTime);
    tmpvar_115.y = sin((tmpvar_117 * 0.3));
    float tmpvar_118;
    tmpvar_118 = (uTime * 0.74);
    tmpvar_115.z = cos(tmpvar_118);
    vec3 p_119;
    p_119 = (p_88 + tmpvar_115);
    float tmpvar_120;
    tmpvar_120 = (uTime * 2.0);
    float tmpvar_121;
    tmpvar_121 = sin(((tmpvar_120 + 444.0) * 0.55));
    float tmpvar_122;
    tmpvar_122 = sin(((tmpvar_120 + 888.0) * 0.47));
    float tmpvar_123;
    tmpvar_123 = sin(((tmpvar_120 + 1332.0) * 0.38));
    vec3 tmpvar_124;
    tmpvar_124.x = (0.2 * tmpvar_121);
    tmpvar_124.y = (0.2 * tmpvar_122);
    tmpvar_124.z = (0.2 * tmpvar_121);
    float tmpvar_125;
    vec3 p_126;
    p_126 = (p_119 + tmpvar_124);
    tmpvar_125 = (sqrt(dot (p_126, p_126)) - 0.6835938);
    vec3 tmpvar_127;
    tmpvar_127.x = (0.2 * tmpvar_122);
    tmpvar_127.y = (-0.2 * tmpvar_121);
    tmpvar_127.z = (0.2 * tmpvar_121);
    float tmpvar_128;
    vec3 p_129;
    p_129 = (p_119 + tmpvar_127);
    tmpvar_128 = (sqrt(dot (p_129, p_129)) - 0.5874023);
    float tmpvar_130;
    float tmpvar_131;
    tmpvar_131 = max ((0.5 - abs(
      (tmpvar_125 - tmpvar_128)
    )), 0.0);
    tmpvar_130 = (min (tmpvar_125, tmpvar_128) - ((
      (tmpvar_131 * tmpvar_131)
     * 0.25) / 0.5));
    vec3 tmpvar_132;
    tmpvar_132.x = (0.2 * tmpvar_123);
    tmpvar_132.y = (-0.2 * tmpvar_122);
    tmpvar_132.z = (-0.2 * tmpvar_123);
    float tmpvar_133;
    vec3 p_134;
    p_134 = (p_119 + tmpvar_132);
    tmpvar_133 = (sqrt(dot (p_134, p_134)) - 0.6621094);
    float tmpvar_135;
    float tmpvar_136;
    tmpvar_136 = max ((0.5 - abs(
      (tmpvar_130 - tmpvar_133)
    )), 0.0);
    tmpvar_135 = (min (tmpvar_130, tmpvar_133) - ((
      (tmpvar_136 * tmpvar_136)
     * 0.25) / 0.5));
    vec3 tmpvar_137;
    tmpvar_137.x = (-0.2 * tmpvar_121);
    tmpvar_137.y = (0.2 * tmpvar_122);
    tmpvar_137.z = (0.2 * tmpvar_123);
    float tmpvar_138;
    vec3 p_139;
    p_139 = (p_119 + tmpvar_137);
    tmpvar_138 = (sqrt(dot (p_139, p_139)) - 0.6035156);
    float tmpvar_140;
    float tmpvar_141;
    tmpvar_141 = max ((0.5 - abs(
      (tmpvar_135 - tmpvar_138)
    )), 0.0);
    tmpvar_140 = (min (tmpvar_135, tmpvar_138) - ((
      (tmpvar_141 * tmpvar_141)
     * 0.25) / 0.5));
    float tmpvar_142;
    tmpvar_142 = max ((0.05 - abs(
      (tmpvar_113 - tmpvar_140)
    )), 0.0);
    vec3 p_143;
    p_143 = (pos_86 - vec3(0.001, 0.0, 0.0));
    vec3 tmpvar_144;
    tmpvar_144.x = sin(tmpvar_90);
    tmpvar_144.y = cos(tmpvar_91);
    tmpvar_144.z = sin(tmpvar_91);
    vec3 p_145;
    p_145 = (p_143 + tmpvar_144);
    float tmpvar_146;
    tmpvar_146 = sin(((tmpvar_93 + 111.0) * 0.55));
    float tmpvar_147;
    tmpvar_147 = sin(((tmpvar_93 + 222.0) * 0.47));
    float tmpvar_148;
    tmpvar_148 = sin(((tmpvar_93 + 333.0) * 0.38));
    vec3 tmpvar_149;
    tmpvar_149.x = (0.2 * tmpvar_146);
    tmpvar_149.y = (0.2 * tmpvar_147);
    tmpvar_149.z = (0.2 * tmpvar_146);
    float tmpvar_150;
    vec3 p_151;
    p_151 = (p_145 + tmpvar_149);
    tmpvar_150 = (sqrt(dot (p_151, p_151)) - 0.9707031);
    vec3 tmpvar_152;
    tmpvar_152.x = (0.2 * tmpvar_147);
    tmpvar_152.y = (-0.2 * tmpvar_146);
    tmpvar_152.z = (0.2 * tmpvar_146);
    float tmpvar_153;
    vec3 p_154;
    p_154 = (p_145 + tmpvar_152);
    tmpvar_153 = (sqrt(dot (p_154, p_154)) - 0.5429688);
    float tmpvar_155;
    float tmpvar_156;
    tmpvar_156 = max ((0.5 - abs(
      (tmpvar_150 - tmpvar_153)
    )), 0.0);
    tmpvar_155 = (min (tmpvar_150, tmpvar_153) - ((
      (tmpvar_156 * tmpvar_156)
     * 0.25) / 0.5));
    vec3 tmpvar_157;
    tmpvar_157.x = (0.2 * tmpvar_148);
    tmpvar_157.y = (-0.2 * tmpvar_147);
    tmpvar_157.z = (-0.2 * tmpvar_148);
    float tmpvar_158;
    vec3 p_159;
    p_159 = (p_145 + tmpvar_157);
    tmpvar_158 = (sqrt(dot (p_159, p_159)) - 0.7949219);
    float tmpvar_160;
    float tmpvar_161;
    tmpvar_161 = max ((0.5 - abs(
      (tmpvar_155 - tmpvar_158)
    )), 0.0);
    tmpvar_160 = (min (tmpvar_155, tmpvar_158) - ((
      (tmpvar_161 * tmpvar_161)
     * 0.25) / 0.5));
    vec3 tmpvar_162;
    tmpvar_162.x = (-0.2 * tmpvar_146);
    tmpvar_162.y = (0.2 * tmpvar_147);
    tmpvar_162.z = (0.2 * tmpvar_148);
    float tmpvar_163;
    vec3 p_164;
    p_164 = (p_145 + tmpvar_162);
    tmpvar_163 = (sqrt(dot (p_164, p_164)) - 0.6835938);
    float tmpvar_165;
    float tmpvar_166;
    tmpvar_166 = max ((0.5 - abs(
      (tmpvar_160 - tmpvar_163)
    )), 0.0);
    tmpvar_165 = (min (tmpvar_160, tmpvar_163) - ((
      (tmpvar_166 * tmpvar_166)
     * 0.25) / 0.5));
    vec3 tmpvar_167;
    tmpvar_167.x = cos((tmpvar_116 * 0.1));
    tmpvar_167.y = sin((tmpvar_117 * 0.3));
    tmpvar_167.z = cos(tmpvar_118);
    vec3 p_168;
    p_168 = (p_143 + tmpvar_167);
    float tmpvar_169;
    tmpvar_169 = sin(((tmpvar_120 + 444.0) * 0.55));
    float tmpvar_170;
    tmpvar_170 = sin(((tmpvar_120 + 888.0) * 0.47));
    float tmpvar_171;
    tmpvar_171 = sin(((tmpvar_120 + 1332.0) * 0.38));
    vec3 tmpvar_172;
    tmpvar_172.x = (0.2 * tmpvar_169);
    tmpvar_172.y = (0.2 * tmpvar_170);
    tmpvar_172.z = (0.2 * tmpvar_169);
    float tmpvar_173;
    vec3 p_174;
    p_174 = (p_168 + tmpvar_172);
    tmpvar_173 = (sqrt(dot (p_174, p_174)) - 0.6835938);
    vec3 tmpvar_175;
    tmpvar_175.x = (0.2 * tmpvar_170);
    tmpvar_175.y = (-0.2 * tmpvar_169);
    tmpvar_175.z = (0.2 * tmpvar_169);
    float tmpvar_176;
    vec3 p_177;
    p_177 = (p_168 + tmpvar_175);
    tmpvar_176 = (sqrt(dot (p_177, p_177)) - 0.5874023);
    float tmpvar_178;
    float tmpvar_179;
    tmpvar_179 = max ((0.5 - abs(
      (tmpvar_173 - tmpvar_176)
    )), 0.0);
    tmpvar_178 = (min (tmpvar_173, tmpvar_176) - ((
      (tmpvar_179 * tmpvar_179)
     * 0.25) / 0.5));
    vec3 tmpvar_180;
    tmpvar_180.x = (0.2 * tmpvar_171);
    tmpvar_180.y = (-0.2 * tmpvar_170);
    tmpvar_180.z = (-0.2 * tmpvar_171);
    float tmpvar_181;
    vec3 p_182;
    p_182 = (p_168 + tmpvar_180);
    tmpvar_181 = (sqrt(dot (p_182, p_182)) - 0.6621094);
    float tmpvar_183;
    float tmpvar_184;
    tmpvar_184 = max ((0.5 - abs(
      (tmpvar_178 - tmpvar_181)
    )), 0.0);
    tmpvar_183 = (min (tmpvar_178, tmpvar_181) - ((
      (tmpvar_184 * tmpvar_184)
     * 0.25) / 0.5));
    vec3 tmpvar_185;
    tmpvar_185.x = (-0.2 * tmpvar_169);
    tmpvar_185.y = (0.2 * tmpvar_170);
    tmpvar_185.z = (0.2 * tmpvar_171);
    float tmpvar_186;
    vec3 p_187;
    p_187 = (p_168 + tmpvar_185);
    tmpvar_186 = (sqrt(dot (p_187, p_187)) - 0.6035156);
    float tmpvar_188;
    float tmpvar_189;
    tmpvar_189 = max ((0.5 - abs(
      (tmpvar_183 - tmpvar_186)
    )), 0.0);
    tmpvar_188 = (min (tmpvar_183, tmpvar_186) - ((
      (tmpvar_189 * tmpvar_189)
     * 0.25) / 0.5));
    float tmpvar_190;
    tmpvar_190 = max ((0.05 - abs(
      (tmpvar_165 - tmpvar_188)
    )), 0.0);
    nor_87.x = ((min (tmpvar_113, tmpvar_140) - (
      ((tmpvar_142 * tmpvar_142) * 0.25)
     / 0.05)) - (min (tmpvar_165, tmpvar_188) - (
      ((tmpvar_190 * tmpvar_190) * 0.25)
     / 0.05)));
    vec3 p_191;
    p_191 = (pos_86 + vec3(0.0, 0.001, 0.0));
    vec3 tmpvar_192;
    tmpvar_192.x = sin(tmpvar_90);
    tmpvar_192.y = cos(tmpvar_91);
    tmpvar_192.z = sin(tmpvar_91);
    vec3 p_193;
    p_193 = (p_191 + tmpvar_192);
    float tmpvar_194;
    tmpvar_194 = sin(((tmpvar_93 + 111.0) * 0.55));
    float tmpvar_195;
    tmpvar_195 = sin(((tmpvar_93 + 222.0) * 0.47));
    float tmpvar_196;
    tmpvar_196 = sin(((tmpvar_93 + 333.0) * 0.38));
    vec3 tmpvar_197;
    tmpvar_197.x = (0.2 * tmpvar_194);
    tmpvar_197.y = (0.2 * tmpvar_195);
    tmpvar_197.z = (0.2 * tmpvar_194);
    float tmpvar_198;
    vec3 p_199;
    p_199 = (p_193 + tmpvar_197);
    tmpvar_198 = (sqrt(dot (p_199, p_199)) - 0.9707031);
    vec3 tmpvar_200;
    tmpvar_200.x = (0.2 * tmpvar_195);
    tmpvar_200.y = (-0.2 * tmpvar_194);
    tmpvar_200.z = (0.2 * tmpvar_194);
    float tmpvar_201;
    vec3 p_202;
    p_202 = (p_193 + tmpvar_200);
    tmpvar_201 = (sqrt(dot (p_202, p_202)) - 0.5429688);
    float tmpvar_203;
    float tmpvar_204;
    tmpvar_204 = max ((0.5 - abs(
      (tmpvar_198 - tmpvar_201)
    )), 0.0);
    tmpvar_203 = (min (tmpvar_198, tmpvar_201) - ((
      (tmpvar_204 * tmpvar_204)
     * 0.25) / 0.5));
    vec3 tmpvar_205;
    tmpvar_205.x = (0.2 * tmpvar_196);
    tmpvar_205.y = (-0.2 * tmpvar_195);
    tmpvar_205.z = (-0.2 * tmpvar_196);
    float tmpvar_206;
    vec3 p_207;
    p_207 = (p_193 + tmpvar_205);
    tmpvar_206 = (sqrt(dot (p_207, p_207)) - 0.7949219);
    float tmpvar_208;
    float tmpvar_209;
    tmpvar_209 = max ((0.5 - abs(
      (tmpvar_203 - tmpvar_206)
    )), 0.0);
    tmpvar_208 = (min (tmpvar_203, tmpvar_206) - ((
      (tmpvar_209 * tmpvar_209)
     * 0.25) / 0.5));
    vec3 tmpvar_210;
    tmpvar_210.x = (-0.2 * tmpvar_194);
    tmpvar_210.y = (0.2 * tmpvar_195);
    tmpvar_210.z = (0.2 * tmpvar_196);
    float tmpvar_211;
    vec3 p_212;
    p_212 = (p_193 + tmpvar_210);
    tmpvar_211 = (sqrt(dot (p_212, p_212)) - 0.6835938);
    float tmpvar_213;
    float tmpvar_214;
    tmpvar_214 = max ((0.5 - abs(
      (tmpvar_208 - tmpvar_211)
    )), 0.0);
    tmpvar_213 = (min (tmpvar_208, tmpvar_211) - ((
      (tmpvar_214 * tmpvar_214)
     * 0.25) / 0.5));
    vec3 tmpvar_215;
    tmpvar_215.x = cos((tmpvar_116 * 0.1));
    tmpvar_215.y = sin((tmpvar_117 * 0.3));
    tmpvar_215.z = cos(tmpvar_118);
    vec3 p_216;
    p_216 = (p_191 + tmpvar_215);
    float tmpvar_217;
    tmpvar_217 = sin(((tmpvar_120 + 444.0) * 0.55));
    float tmpvar_218;
    tmpvar_218 = sin(((tmpvar_120 + 888.0) * 0.47));
    float tmpvar_219;
    tmpvar_219 = sin(((tmpvar_120 + 1332.0) * 0.38));
    vec3 tmpvar_220;
    tmpvar_220.x = (0.2 * tmpvar_217);
    tmpvar_220.y = (0.2 * tmpvar_218);
    tmpvar_220.z = (0.2 * tmpvar_217);
    float tmpvar_221;
    vec3 p_222;
    p_222 = (p_216 + tmpvar_220);
    tmpvar_221 = (sqrt(dot (p_222, p_222)) - 0.6835938);
    vec3 tmpvar_223;
    tmpvar_223.x = (0.2 * tmpvar_218);
    tmpvar_223.y = (-0.2 * tmpvar_217);
    tmpvar_223.z = (0.2 * tmpvar_217);
    float tmpvar_224;
    vec3 p_225;
    p_225 = (p_216 + tmpvar_223);
    tmpvar_224 = (sqrt(dot (p_225, p_225)) - 0.5874023);
    float tmpvar_226;
    float tmpvar_227;
    tmpvar_227 = max ((0.5 - abs(
      (tmpvar_221 - tmpvar_224)
    )), 0.0);
    tmpvar_226 = (min (tmpvar_221, tmpvar_224) - ((
      (tmpvar_227 * tmpvar_227)
     * 0.25) / 0.5));
    vec3 tmpvar_228;
    tmpvar_228.x = (0.2 * tmpvar_219);
    tmpvar_228.y = (-0.2 * tmpvar_218);
    tmpvar_228.z = (-0.2 * tmpvar_219);
    float tmpvar_229;
    vec3 p_230;
    p_230 = (p_216 + tmpvar_228);
    tmpvar_229 = (sqrt(dot (p_230, p_230)) - 0.6621094);
    float tmpvar_231;
    float tmpvar_232;
    tmpvar_232 = max ((0.5 - abs(
      (tmpvar_226 - tmpvar_229)
    )), 0.0);
    tmpvar_231 = (min (tmpvar_226, tmpvar_229) - ((
      (tmpvar_232 * tmpvar_232)
     * 0.25) / 0.5));
    vec3 tmpvar_233;
    tmpvar_233.x = (-0.2 * tmpvar_217);
    tmpvar_233.y = (0.2 * tmpvar_218);
    tmpvar_233.z = (0.2 * tmpvar_219);
    float tmpvar_234;
    vec3 p_235;
    p_235 = (p_216 + tmpvar_233);
    tmpvar_234 = (sqrt(dot (p_235, p_235)) - 0.6035156);
    float tmpvar_236;
    float tmpvar_237;
    tmpvar_237 = max ((0.5 - abs(
      (tmpvar_231 - tmpvar_234)
    )), 0.0);
    tmpvar_236 = (min (tmpvar_231, tmpvar_234) - ((
      (tmpvar_237 * tmpvar_237)
     * 0.25) / 0.5));
    float tmpvar_238;
    tmpvar_238 = max ((0.05 - abs(
      (tmpvar_213 - tmpvar_236)
    )), 0.0);
    vec3 p_239;
    p_239 = (pos_86 - vec3(0.0, 0.001, 0.0));
    vec3 tmpvar_240;
    tmpvar_240.x = sin(tmpvar_90);
    tmpvar_240.y = cos(tmpvar_91);
    tmpvar_240.z = sin(tmpvar_91);
    vec3 p_241;
    p_241 = (p_239 + tmpvar_240);
    float tmpvar_242;
    tmpvar_242 = sin(((tmpvar_93 + 111.0) * 0.55));
    float tmpvar_243;
    tmpvar_243 = sin(((tmpvar_93 + 222.0) * 0.47));
    float tmpvar_244;
    tmpvar_244 = sin(((tmpvar_93 + 333.0) * 0.38));
    vec3 tmpvar_245;
    tmpvar_245.x = (0.2 * tmpvar_242);
    tmpvar_245.y = (0.2 * tmpvar_243);
    tmpvar_245.z = (0.2 * tmpvar_242);
    float tmpvar_246;
    vec3 p_247;
    p_247 = (p_241 + tmpvar_245);
    tmpvar_246 = (sqrt(dot (p_247, p_247)) - 0.9707031);
    vec3 tmpvar_248;
    tmpvar_248.x = (0.2 * tmpvar_243);
    tmpvar_248.y = (-0.2 * tmpvar_242);
    tmpvar_248.z = (0.2 * tmpvar_242);
    float tmpvar_249;
    vec3 p_250;
    p_250 = (p_241 + tmpvar_248);
    tmpvar_249 = (sqrt(dot (p_250, p_250)) - 0.5429688);
    float tmpvar_251;
    float tmpvar_252;
    tmpvar_252 = max ((0.5 - abs(
      (tmpvar_246 - tmpvar_249)
    )), 0.0);
    tmpvar_251 = (min (tmpvar_246, tmpvar_249) - ((
      (tmpvar_252 * tmpvar_252)
     * 0.25) / 0.5));
    vec3 tmpvar_253;
    tmpvar_253.x = (0.2 * tmpvar_244);
    tmpvar_253.y = (-0.2 * tmpvar_243);
    tmpvar_253.z = (-0.2 * tmpvar_244);
    float tmpvar_254;
    vec3 p_255;
    p_255 = (p_241 + tmpvar_253);
    tmpvar_254 = (sqrt(dot (p_255, p_255)) - 0.7949219);
    float tmpvar_256;
    float tmpvar_257;
    tmpvar_257 = max ((0.5 - abs(
      (tmpvar_251 - tmpvar_254)
    )), 0.0);
    tmpvar_256 = (min (tmpvar_251, tmpvar_254) - ((
      (tmpvar_257 * tmpvar_257)
     * 0.25) / 0.5));
    vec3 tmpvar_258;
    tmpvar_258.x = (-0.2 * tmpvar_242);
    tmpvar_258.y = (0.2 * tmpvar_243);
    tmpvar_258.z = (0.2 * tmpvar_244);
    float tmpvar_259;
    vec3 p_260;
    p_260 = (p_241 + tmpvar_258);
    tmpvar_259 = (sqrt(dot (p_260, p_260)) - 0.6835938);
    float tmpvar_261;
    float tmpvar_262;
    tmpvar_262 = max ((0.5 - abs(
      (tmpvar_256 - tmpvar_259)
    )), 0.0);
    tmpvar_261 = (min (tmpvar_256, tmpvar_259) - ((
      (tmpvar_262 * tmpvar_262)
     * 0.25) / 0.5));
    vec3 tmpvar_263;
    tmpvar_263.x = cos((tmpvar_116 * 0.1));
    tmpvar_263.y = sin((tmpvar_117 * 0.3));
    tmpvar_263.z = cos(tmpvar_118);
    vec3 p_264;
    p_264 = (p_239 + tmpvar_263);
    float tmpvar_265;
    tmpvar_265 = sin(((tmpvar_120 + 444.0) * 0.55));
    float tmpvar_266;
    tmpvar_266 = sin(((tmpvar_120 + 888.0) * 0.47));
    float tmpvar_267;
    tmpvar_267 = sin(((tmpvar_120 + 1332.0) * 0.38));
    vec3 tmpvar_268;
    tmpvar_268.x = (0.2 * tmpvar_265);
    tmpvar_268.y = (0.2 * tmpvar_266);
    tmpvar_268.z = (0.2 * tmpvar_265);
    float tmpvar_269;
    vec3 p_270;
    p_270 = (p_264 + tmpvar_268);
    tmpvar_269 = (sqrt(dot (p_270, p_270)) - 0.6835938);
    vec3 tmpvar_271;
    tmpvar_271.x = (0.2 * tmpvar_266);
    tmpvar_271.y = (-0.2 * tmpvar_265);
    tmpvar_271.z = (0.2 * tmpvar_265);
    float tmpvar_272;
    vec3 p_273;
    p_273 = (p_264 + tmpvar_271);
    tmpvar_272 = (sqrt(dot (p_273, p_273)) - 0.5874023);
    float tmpvar_274;
    float tmpvar_275;
    tmpvar_275 = max ((0.5 - abs(
      (tmpvar_269 - tmpvar_272)
    )), 0.0);
    tmpvar_274 = (min (tmpvar_269, tmpvar_272) - ((
      (tmpvar_275 * tmpvar_275)
     * 0.25) / 0.5));
    vec3 tmpvar_276;
    tmpvar_276.x = (0.2 * tmpvar_267);
    tmpvar_276.y = (-0.2 * tmpvar_266);
    tmpvar_276.z = (-0.2 * tmpvar_267);
    float tmpvar_277;
    vec3 p_278;
    p_278 = (p_264 + tmpvar_276);
    tmpvar_277 = (sqrt(dot (p_278, p_278)) - 0.6621094);
    float tmpvar_279;
    float tmpvar_280;
    tmpvar_280 = max ((0.5 - abs(
      (tmpvar_274 - tmpvar_277)
    )), 0.0);
    tmpvar_279 = (min (tmpvar_274, tmpvar_277) - ((
      (tmpvar_280 * tmpvar_280)
     * 0.25) / 0.5));
    vec3 tmpvar_281;
    tmpvar_281.x = (-0.2 * tmpvar_265);
    tmpvar_281.y = (0.2 * tmpvar_266);
    tmpvar_281.z = (0.2 * tmpvar_267);
    float tmpvar_282;
    vec3 p_283;
    p_283 = (p_264 + tmpvar_281);
    tmpvar_282 = (sqrt(dot (p_283, p_283)) - 0.6035156);
    float tmpvar_284;
    float tmpvar_285;
    tmpvar_285 = max ((0.5 - abs(
      (tmpvar_279 - tmpvar_282)
    )), 0.0);
    tmpvar_284 = (min (tmpvar_279, tmpvar_282) - ((
      (tmpvar_285 * tmpvar_285)
     * 0.25) / 0.5));
    float tmpvar_286;
    tmpvar_286 = max ((0.05 - abs(
      (tmpvar_261 - tmpvar_284)
    )), 0.0);
    nor_87.y = ((min (tmpvar_213, tmpvar_236) - (
      ((tmpvar_238 * tmpvar_238) * 0.25)
     / 0.05)) - (min (tmpvar_261, tmpvar_284) - (
      ((tmpvar_286 * tmpvar_286) * 0.25)
     / 0.05)));
    vec3 p_287;
    p_287 = (pos_86 + vec3(0.0, 0.0, 0.001));
    vec3 tmpvar_288;
    tmpvar_288.x = sin(tmpvar_90);
    tmpvar_288.y = cos(tmpvar_91);
    tmpvar_288.z = sin(tmpvar_91);
    vec3 p_289;
    p_289 = (p_287 + tmpvar_288);
    float tmpvar_290;
    tmpvar_290 = sin(((tmpvar_93 + 111.0) * 0.55));
    float tmpvar_291;
    tmpvar_291 = sin(((tmpvar_93 + 222.0) * 0.47));
    float tmpvar_292;
    tmpvar_292 = sin(((tmpvar_93 + 333.0) * 0.38));
    vec3 tmpvar_293;
    tmpvar_293.x = (0.2 * tmpvar_290);
    tmpvar_293.y = (0.2 * tmpvar_291);
    tmpvar_293.z = (0.2 * tmpvar_290);
    float tmpvar_294;
    vec3 p_295;
    p_295 = (p_289 + tmpvar_293);
    tmpvar_294 = (sqrt(dot (p_295, p_295)) - 0.9707031);
    vec3 tmpvar_296;
    tmpvar_296.x = (0.2 * tmpvar_291);
    tmpvar_296.y = (-0.2 * tmpvar_290);
    tmpvar_296.z = (0.2 * tmpvar_290);
    float tmpvar_297;
    vec3 p_298;
    p_298 = (p_289 + tmpvar_296);
    tmpvar_297 = (sqrt(dot (p_298, p_298)) - 0.5429688);
    float tmpvar_299;
    float tmpvar_300;
    tmpvar_300 = max ((0.5 - abs(
      (tmpvar_294 - tmpvar_297)
    )), 0.0);
    tmpvar_299 = (min (tmpvar_294, tmpvar_297) - ((
      (tmpvar_300 * tmpvar_300)
     * 0.25) / 0.5));
    vec3 tmpvar_301;
    tmpvar_301.x = (0.2 * tmpvar_292);
    tmpvar_301.y = (-0.2 * tmpvar_291);
    tmpvar_301.z = (-0.2 * tmpvar_292);
    float tmpvar_302;
    vec3 p_303;
    p_303 = (p_289 + tmpvar_301);
    tmpvar_302 = (sqrt(dot (p_303, p_303)) - 0.7949219);
    float tmpvar_304;
    float tmpvar_305;
    tmpvar_305 = max ((0.5 - abs(
      (tmpvar_299 - tmpvar_302)
    )), 0.0);
    tmpvar_304 = (min (tmpvar_299, tmpvar_302) - ((
      (tmpvar_305 * tmpvar_305)
     * 0.25) / 0.5));
    vec3 tmpvar_306;
    tmpvar_306.x = (-0.2 * tmpvar_290);
    tmpvar_306.y = (0.2 * tmpvar_291);
    tmpvar_306.z = (0.2 * tmpvar_292);
    float tmpvar_307;
    vec3 p_308;
    p_308 = (p_289 + tmpvar_306);
    tmpvar_307 = (sqrt(dot (p_308, p_308)) - 0.6835938);
    float tmpvar_309;
    float tmpvar_310;
    tmpvar_310 = max ((0.5 - abs(
      (tmpvar_304 - tmpvar_307)
    )), 0.0);
    tmpvar_309 = (min (tmpvar_304, tmpvar_307) - ((
      (tmpvar_310 * tmpvar_310)
     * 0.25) / 0.5));
    vec3 tmpvar_311;
    tmpvar_311.x = cos((tmpvar_116 * 0.1));
    tmpvar_311.y = sin((tmpvar_117 * 0.3));
    tmpvar_311.z = cos(tmpvar_118);
    vec3 p_312;
    p_312 = (p_287 + tmpvar_311);
    float tmpvar_313;
    tmpvar_313 = sin(((tmpvar_120 + 444.0) * 0.55));
    float tmpvar_314;
    tmpvar_314 = sin(((tmpvar_120 + 888.0) * 0.47));
    float tmpvar_315;
    tmpvar_315 = sin(((tmpvar_120 + 1332.0) * 0.38));
    vec3 tmpvar_316;
    tmpvar_316.x = (0.2 * tmpvar_313);
    tmpvar_316.y = (0.2 * tmpvar_314);
    tmpvar_316.z = (0.2 * tmpvar_313);
    float tmpvar_317;
    vec3 p_318;
    p_318 = (p_312 + tmpvar_316);
    tmpvar_317 = (sqrt(dot (p_318, p_318)) - 0.6835938);
    vec3 tmpvar_319;
    tmpvar_319.x = (0.2 * tmpvar_314);
    tmpvar_319.y = (-0.2 * tmpvar_313);
    tmpvar_319.z = (0.2 * tmpvar_313);
    float tmpvar_320;
    vec3 p_321;
    p_321 = (p_312 + tmpvar_319);
    tmpvar_320 = (sqrt(dot (p_321, p_321)) - 0.5874023);
    float tmpvar_322;
    float tmpvar_323;
    tmpvar_323 = max ((0.5 - abs(
      (tmpvar_317 - tmpvar_320)
    )), 0.0);
    tmpvar_322 = (min (tmpvar_317, tmpvar_320) - ((
      (tmpvar_323 * tmpvar_323)
     * 0.25) / 0.5));
    vec3 tmpvar_324;
    tmpvar_324.x = (0.2 * tmpvar_315);
    tmpvar_324.y = (-0.2 * tmpvar_314);
    tmpvar_324.z = (-0.2 * tmpvar_315);
    float tmpvar_325;
    vec3 p_326;
    p_326 = (p_312 + tmpvar_324);
    tmpvar_325 = (sqrt(dot (p_326, p_326)) - 0.6621094);
    float tmpvar_327;
    float tmpvar_328;
    tmpvar_328 = max ((0.5 - abs(
      (tmpvar_322 - tmpvar_325)
    )), 0.0);
    tmpvar_327 = (min (tmpvar_322, tmpvar_325) - ((
      (tmpvar_328 * tmpvar_328)
     * 0.25) / 0.5));
    vec3 tmpvar_329;
    tmpvar_329.x = (-0.2 * tmpvar_313);
    tmpvar_329.y = (0.2 * tmpvar_314);
    tmpvar_329.z = (0.2 * tmpvar_315);
    float tmpvar_330;
    vec3 p_331;
    p_331 = (p_312 + tmpvar_329);
    tmpvar_330 = (sqrt(dot (p_331, p_331)) - 0.6035156);
    float tmpvar_332;
    float tmpvar_333;
    tmpvar_333 = max ((0.5 - abs(
      (tmpvar_327 - tmpvar_330)
    )), 0.0);
    tmpvar_332 = (min (tmpvar_327, tmpvar_330) - ((
      (tmpvar_333 * tmpvar_333)
     * 0.25) / 0.5));
    float tmpvar_334;
    tmpvar_334 = max ((0.05 - abs(
      (tmpvar_309 - tmpvar_332)
    )), 0.0);
    vec3 p_335;
    p_335 = (pos_86 - vec3(0.0, 0.0, 0.001));
    vec3 tmpvar_336;
    tmpvar_336.x = sin(tmpvar_90);
    tmpvar_336.y = cos(tmpvar_91);
    tmpvar_336.z = sin(tmpvar_91);
    vec3 p_337;
    p_337 = (p_335 + tmpvar_336);
    float tmpvar_338;
    tmpvar_338 = sin(((tmpvar_93 + 111.0) * 0.55));
    float tmpvar_339;
    tmpvar_339 = sin(((tmpvar_93 + 222.0) * 0.47));
    float tmpvar_340;
    tmpvar_340 = sin(((tmpvar_93 + 333.0) * 0.38));
    vec3 tmpvar_341;
    tmpvar_341.x = (0.2 * tmpvar_338);
    tmpvar_341.y = (0.2 * tmpvar_339);
    tmpvar_341.z = (0.2 * tmpvar_338);
    float tmpvar_342;
    vec3 p_343;
    p_343 = (p_337 + tmpvar_341);
    tmpvar_342 = (sqrt(dot (p_343, p_343)) - 0.9707031);
    vec3 tmpvar_344;
    tmpvar_344.x = (0.2 * tmpvar_339);
    tmpvar_344.y = (-0.2 * tmpvar_338);
    tmpvar_344.z = (0.2 * tmpvar_338);
    float tmpvar_345;
    vec3 p_346;
    p_346 = (p_337 + tmpvar_344);
    tmpvar_345 = (sqrt(dot (p_346, p_346)) - 0.5429688);
    float tmpvar_347;
    float tmpvar_348;
    tmpvar_348 = max ((0.5 - abs(
      (tmpvar_342 - tmpvar_345)
    )), 0.0);
    tmpvar_347 = (min (tmpvar_342, tmpvar_345) - ((
      (tmpvar_348 * tmpvar_348)
     * 0.25) / 0.5));
    vec3 tmpvar_349;
    tmpvar_349.x = (0.2 * tmpvar_340);
    tmpvar_349.y = (-0.2 * tmpvar_339);
    tmpvar_349.z = (-0.2 * tmpvar_340);
    float tmpvar_350;
    vec3 p_351;
    p_351 = (p_337 + tmpvar_349);
    tmpvar_350 = (sqrt(dot (p_351, p_351)) - 0.7949219);
    float tmpvar_352;
    float tmpvar_353;
    tmpvar_353 = max ((0.5 - abs(
      (tmpvar_347 - tmpvar_350)
    )), 0.0);
    tmpvar_352 = (min (tmpvar_347, tmpvar_350) - ((
      (tmpvar_353 * tmpvar_353)
     * 0.25) / 0.5));
    vec3 tmpvar_354;
    tmpvar_354.x = (-0.2 * tmpvar_338);
    tmpvar_354.y = (0.2 * tmpvar_339);
    tmpvar_354.z = (0.2 * tmpvar_340);
    float tmpvar_355;
    vec3 p_356;
    p_356 = (p_337 + tmpvar_354);
    tmpvar_355 = (sqrt(dot (p_356, p_356)) - 0.6835938);
    float tmpvar_357;
    float tmpvar_358;
    tmpvar_358 = max ((0.5 - abs(
      (tmpvar_352 - tmpvar_355)
    )), 0.0);
    tmpvar_357 = (min (tmpvar_352, tmpvar_355) - ((
      (tmpvar_358 * tmpvar_358)
     * 0.25) / 0.5));
    vec3 tmpvar_359;
    tmpvar_359.x = cos((tmpvar_116 * 0.1));
    tmpvar_359.y = sin((tmpvar_117 * 0.3));
    tmpvar_359.z = cos(tmpvar_118);
    vec3 p_360;
    p_360 = (p_335 + tmpvar_359);
    float tmpvar_361;
    tmpvar_361 = sin(((tmpvar_120 + 444.0) * 0.55));
    float tmpvar_362;
    tmpvar_362 = sin(((tmpvar_120 + 888.0) * 0.47));
    float tmpvar_363;
    tmpvar_363 = sin(((tmpvar_120 + 1332.0) * 0.38));
    vec3 tmpvar_364;
    tmpvar_364.x = (0.2 * tmpvar_361);
    tmpvar_364.y = (0.2 * tmpvar_362);
    tmpvar_364.z = (0.2 * tmpvar_361);
    float tmpvar_365;
    vec3 p_366;
    p_366 = (p_360 + tmpvar_364);
    tmpvar_365 = (sqrt(dot (p_366, p_366)) - 0.6835938);
    vec3 tmpvar_367;
    tmpvar_367.x = (0.2 * tmpvar_362);
    tmpvar_367.y = (-0.2 * tmpvar_361);
    tmpvar_367.z = (0.2 * tmpvar_361);
    float tmpvar_368;
    vec3 p_369;
    p_369 = (p_360 + tmpvar_367);
    tmpvar_368 = (sqrt(dot (p_369, p_369)) - 0.5874023);
    float tmpvar_370;
    float tmpvar_371;
    tmpvar_371 = max ((0.5 - abs(
      (tmpvar_365 - tmpvar_368)
    )), 0.0);
    tmpvar_370 = (min (tmpvar_365, tmpvar_368) - ((
      (tmpvar_371 * tmpvar_371)
     * 0.25) / 0.5));
    vec3 tmpvar_372;
    tmpvar_372.x = (0.2 * tmpvar_363);
    tmpvar_372.y = (-0.2 * tmpvar_362);
    tmpvar_372.z = (-0.2 * tmpvar_363);
    float tmpvar_373;
    vec3 p_374;
    p_374 = (p_360 + tmpvar_372);
    tmpvar_373 = (sqrt(dot (p_374, p_374)) - 0.6621094);
    float tmpvar_375;
    float tmpvar_376;
    tmpvar_376 = max ((0.5 - abs(
      (tmpvar_370 - tmpvar_373)
    )), 0.0);
    tmpvar_375 = (min (tmpvar_370, tmpvar_373) - ((
      (tmpvar_376 * tmpvar_376)
     * 0.25) / 0.5));
    vec3 tmpvar_377;
    tmpvar_377.x = (-0.2 * tmpvar_361);
    tmpvar_377.y = (0.2 * tmpvar_362);
    tmpvar_377.z = (0.2 * tmpvar_363);
    float tmpvar_378;
    vec3 p_379;
    p_379 = (p_360 + tmpvar_377);
    tmpvar_378 = (sqrt(dot (p_379, p_379)) - 0.6035156);
    float tmpvar_380;
    float tmpvar_381;
    tmpvar_381 = max ((0.5 - abs(
      (tmpvar_375 - tmpvar_378)
    )), 0.0);
    tmpvar_380 = (min (tmpvar_375, tmpvar_378) - ((
      (tmpvar_381 * tmpvar_381)
     * 0.25) / 0.5));
    float tmpvar_382;
    tmpvar_382 = max ((0.05 - abs(
      (tmpvar_357 - tmpvar_380)
    )), 0.0);
    nor_87.z = ((min (tmpvar_309, tmpvar_332) - (
      ((tmpvar_334 * tmpvar_334) * 0.25)
     / 0.05)) - (min (tmpvar_357, tmpvar_380) - (
      ((tmpvar_382 * tmpvar_382) * 0.25)
     / 0.05)));
    currNor = normalize(nor_87);
  } else {
    currHit = bool(0);
  };
  if (currHit) {
    vec3 tmpvar_383;
    tmpvar_383 = normalize((tmpvar_2 - (2.0 *
      (dot (currNor, tmpvar_2) * currNor)
    )));
    vec3 tmpvar_384;
    tmpvar_384 = (((
      cos(((tmpvar_383.y * 3.0) + (uTime * 0.3)))
     +
      sin((((tmpvar_383.x +
        cos(((3.0 * tmpvar_383.y) + (uTime * 0.78)))
      ) + tmpvar_383.x) + uTime))
    ) * 5.1) - vec3(1.8, 1.14, 0.3));
    vec3 tmpvar_385;
    tmpvar_385 = max (normalize((tmpvar_2 * currNor)), vec3(0.0, 0.0, 0.0));
    float tmpvar_386;
    tmpvar_386 = pow (min ((
      (tmpvar_385.x + tmpvar_385.y)
     + tmpvar_385.z), 1.0), 1.3);
    col_4 = max (min (tmpvar_28, (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_386))), (cos(
      (1.9 * sin((1.0 - (tmpvar_384 * tmpvar_384))))
    ) * tmpvar_386));
  };
  col_3 = col_4;
  if (currHit) {
    vec3 _currPos_387;
    _currPos_387 = currPos;
    vec3 tmpvar_388;
    tmpvar_388 = normalize((tmpvar_2 - (2.0 *
      (dot (currNor, tmpvar_2) * currNor)
    )));
    vec3 ro_389;
    ro_389 = (currPos + (tmpvar_388 * 0.01));
    vec3 col_390;
    float c_392;
    vec2 e_a393;
    float t_394;
    float tmpvar_395;
    tmpvar_395 = (uTime * (uGui0 * 2.0));
    t_394 = tmpvar_395;
    e_a393 = (tmpvar_388.xy * (10.0 * cos(
      (tmpvar_395 / 10.0)
    )));
    c_392 = (10.0 + (uGui1 * 20.0));
    for (highp int i_391 = 0; i_391 < 30; i_391++) {
      vec2 tmpvar_396;
      tmpvar_396.x = e_a393.x;
      tmpvar_396.y = abs(e_a393.y);
      float tmpvar_397;
      tmpvar_397 = log(sqrt(dot (tmpvar_396, tmpvar_396)));
      float tmpvar_398;
      float tmpvar_399;
      tmpvar_399 = (min (abs(
        (tmpvar_396.y / e_a393.x)
      ), 1.0) / max (abs(
        (tmpvar_396.y / e_a393.x)
      ), 1.0));
      float tmpvar_400;
      tmpvar_400 = (tmpvar_399 * tmpvar_399);
      tmpvar_400 = (((
        ((((
          ((((-0.01213232 * tmpvar_400) + 0.05368138) * tmpvar_400) - 0.1173503)
         * tmpvar_400) + 0.1938925) * tmpvar_400) - 0.3326756)
       * tmpvar_400) + 0.9999793) * tmpvar_399);
      tmpvar_400 = (tmpvar_400 + (float(
        (abs((tmpvar_396.y / e_a393.x)) > 1.0)
      ) * (
        (tmpvar_400 * -2.0)
       + 1.570796)));
      tmpvar_398 = (tmpvar_400 * sign((tmpvar_396.y / e_a393.x)));
      if ((abs(e_a393.x) > (1e-08 * abs(tmpvar_396.y)))) {
        if ((e_a393.x < 0.0)) {
          if ((tmpvar_396.y >= 0.0)) {
            tmpvar_398 += 3.141593;
          } else {
            tmpvar_398 = (tmpvar_398 - 3.141593);
          };
        };
      } else {
        tmpvar_398 = (sign(tmpvar_396.y) * 1.570796);
      };
      vec2 tmpvar_401;
      tmpvar_401.x = tmpvar_397;
      tmpvar_401.y = (tmpvar_398 - 6.0);
      vec2 tmpvar_402;
      tmpvar_402.x = ((0.1 * sin(
        (t_394 / 10.0)
      )) - (uGui3 * 0.3));
      tmpvar_402.y = (5.0 + (0.1 * cos(
        (t_394 / 5.0)
      )));
      e_a393 = (tmpvar_401 + tmpvar_402);
      c_392 = (c_392 + sqrt(dot (e_a393, e_a393)));
      if ((i_391 >= int((
        (uGui2 * 20.0)
       + 10.0)))) {
        break;
      };
    };
    float tmpvar_403;
    tmpvar_403 = (log2(log2(
      (c_392 * 0.05)
    )) * 10.0);
    vec3 tmpvar_404;
    tmpvar_404.x = (0.5 + (0.7 * cos(tmpvar_403)));
    tmpvar_404.y = (0.5 + (0.55 * cos(
      (tmpvar_403 - 0.7)
    )));
    tmpvar_404.z = (0.7 + (0.7 * cos(
      (tmpvar_403 - 0.7)
    )));
    vec3 tmpvar_405;
    float adjustment_406;
    adjustment_406 = (3.141593 + (uGui4 * 3.141593));
    vec3 tmpvar_407;
    tmpvar_407 = (mat3(0.299, 0.587, 0.114, 0.595716, -0.274453, -0.321263, 0.211456, -0.522591, 0.311135) * tmpvar_404);
    float tmpvar_408;
    float tmpvar_409;
    tmpvar_409 = (min (abs(
      (tmpvar_407.z / tmpvar_407.y)
    ), 1.0) / max (abs(
      (tmpvar_407.z / tmpvar_407.y)
    ), 1.0));
    float tmpvar_410;
    tmpvar_410 = (tmpvar_409 * tmpvar_409);
    tmpvar_410 = (((
      ((((
        ((((-0.01213232 * tmpvar_410) + 0.05368138) * tmpvar_410) - 0.1173503)
       * tmpvar_410) + 0.1938925) * tmpvar_410) - 0.3326756)
     * tmpvar_410) + 0.9999793) * tmpvar_409);
    tmpvar_410 = (tmpvar_410 + (float(
      (abs((tmpvar_407.z / tmpvar_407.y)) > 1.0)
    ) * (
      (tmpvar_410 * -2.0)
     + 1.570796)));
    tmpvar_408 = (tmpvar_410 * sign((tmpvar_407.z / tmpvar_407.y)));
    if ((abs(tmpvar_407.y) > (1e-08 * abs(tmpvar_407.z)))) {
      if ((tmpvar_407.y < 0.0)) {
        if ((tmpvar_407.z >= 0.0)) {
          tmpvar_408 += 3.141593;
        } else {
          tmpvar_408 = (tmpvar_408 - 3.141593);
        };
      };
    } else {
      tmpvar_408 = (sign(tmpvar_407.z) * 1.570796);
    };
    float tmpvar_411;
    tmpvar_411 = (tmpvar_408 + adjustment_406);
    float tmpvar_412;
    tmpvar_412 = sqrt(((tmpvar_407.z * tmpvar_407.z) + (tmpvar_407.y * tmpvar_407.y)));
    vec3 tmpvar_413;
    tmpvar_413.x = tmpvar_407.x;
    tmpvar_413.y = (tmpvar_412 * cos(tmpvar_411));
    tmpvar_413.z = (tmpvar_412 * sin(tmpvar_411));
    tmpvar_405 = (mat3(1.0, 0.9563, 0.621, 1.0, -0.2721, -0.6474, 1.0, -1.107, 1.7046) * tmpvar_413);
    vec3 tmpvar_414;
    tmpvar_414 = mix (vec3(dot (tmpvar_405, vec3(0.2125, 0.7154, 0.0721))), tmpvar_405, uGui5);
    col_390 = tmpvar_414;
    vec3 ro_415;
    ro_415 = ro_389;
    vec3 rd_416;
    rd_416 = tmpvar_388;
    float dist_418;
    float t_419;
    t_419 = 0.0;
    dist_418 = -1.0;
    for (highp int i_417 = 0; i_417 < 32; i_417++) {
      vec3 p_420;
      p_420 = (ro_415 + (rd_416 * t_419));
      vec3 tmpvar_421;
      tmpvar_421.x = sin((uTime * 0.23));
      float tmpvar_422;
      tmpvar_422 = (uTime * 0.65);
      tmpvar_421.y = cos(tmpvar_422);
      tmpvar_421.z = sin(tmpvar_422);
      vec3 p_423;
      p_423 = (p_420 + tmpvar_421);
      float t_424;
      t_424 = (uTime * 2.5);
      float tmpvar_425;
      tmpvar_425 = sin(((t_424 + 111.0) * 0.55));
      float tmpvar_426;
      tmpvar_426 = sin(((t_424 + 222.0) * 0.47));
      float tmpvar_427;
      tmpvar_427 = sin(((t_424 + 333.0) * 0.38));
      vec3 tmpvar_428;
      tmpvar_428.x = (0.2 * tmpvar_425);
      tmpvar_428.y = (0.2 * tmpvar_426);
      tmpvar_428.z = (0.2 * tmpvar_425);
      float tmpvar_429;
      vec3 p_430;
      p_430 = (p_423 + tmpvar_428);
      tmpvar_429 = (sqrt(dot (p_430, p_430)) - 0.9707031);
      vec3 tmpvar_431;
      tmpvar_431.x = (0.2 * tmpvar_426);
      tmpvar_431.y = (-0.2 * tmpvar_425);
      tmpvar_431.z = (0.2 * tmpvar_425);
      float tmpvar_432;
      vec3 p_433;
      p_433 = (p_423 + tmpvar_431);
      tmpvar_432 = (sqrt(dot (p_433, p_433)) - 0.5429688);
      float tmpvar_434;
      float tmpvar_435;
      tmpvar_435 = max ((0.5 - abs(
        (tmpvar_429 - tmpvar_432)
      )), 0.0);
      tmpvar_434 = (min (tmpvar_429, tmpvar_432) - ((
        (tmpvar_435 * tmpvar_435)
       * 0.25) / 0.5));
      vec3 tmpvar_436;
      tmpvar_436.x = (0.2 * tmpvar_427);
      tmpvar_436.y = (-0.2 * tmpvar_426);
      tmpvar_436.z = (-0.2 * tmpvar_427);
      float tmpvar_437;
      vec3 p_438;
      p_438 = (p_423 + tmpvar_436);
      tmpvar_437 = (sqrt(dot (p_438, p_438)) - 0.7949219);
      float tmpvar_439;
      float tmpvar_440;
      tmpvar_440 = max ((0.5 - abs(
        (tmpvar_434 - tmpvar_437)
      )), 0.0);
      tmpvar_439 = (min (tmpvar_434, tmpvar_437) - ((
        (tmpvar_440 * tmpvar_440)
       * 0.25) / 0.5));
      vec3 tmpvar_441;
      tmpvar_441.x = (-0.2 * tmpvar_425);
      tmpvar_441.y = (0.2 * tmpvar_426);
      tmpvar_441.z = (0.2 * tmpvar_427);
      float tmpvar_442;
      vec3 p_443;
      p_443 = (p_423 + tmpvar_441);
      tmpvar_442 = (sqrt(dot (p_443, p_443)) - 0.6835938);
      float tmpvar_444;
      float tmpvar_445;
      tmpvar_445 = max ((0.5 - abs(
        (tmpvar_439 - tmpvar_442)
      )), 0.0);
      tmpvar_444 = (min (tmpvar_439, tmpvar_442) - ((
        (tmpvar_445 * tmpvar_445)
       * 0.25) / 0.5));
      vec3 tmpvar_446;
      tmpvar_446.x = cos(((uTime + 200.0) * 0.1));
      tmpvar_446.y = sin((-(uTime) * 0.3));
      tmpvar_446.z = cos((uTime * 0.74));
      vec3 p_447;
      p_447 = (p_420 + tmpvar_446);
      float t_448;
      t_448 = (uTime * 2.0);
      float tmpvar_449;
      tmpvar_449 = sin(((t_448 + 444.0) * 0.55));
      float tmpvar_450;
      tmpvar_450 = sin(((t_448 + 888.0) * 0.47));
      float tmpvar_451;
      tmpvar_451 = sin(((t_448 + 1332.0) * 0.38));
      vec3 tmpvar_452;
      tmpvar_452.x = (0.2 * tmpvar_449);
      tmpvar_452.y = (0.2 * tmpvar_450);
      tmpvar_452.z = (0.2 * tmpvar_449);
      float tmpvar_453;
      vec3 p_454;
      p_454 = (p_447 + tmpvar_452);
      tmpvar_453 = (sqrt(dot (p_454, p_454)) - 0.6835938);
      vec3 tmpvar_455;
      tmpvar_455.x = (0.2 * tmpvar_450);
      tmpvar_455.y = (-0.2 * tmpvar_449);
      tmpvar_455.z = (0.2 * tmpvar_449);
      float tmpvar_456;
      vec3 p_457;
      p_457 = (p_447 + tmpvar_455);
      tmpvar_456 = (sqrt(dot (p_457, p_457)) - 0.5874023);
      float tmpvar_458;
      float tmpvar_459;
      tmpvar_459 = max ((0.5 - abs(
        (tmpvar_453 - tmpvar_456)
      )), 0.0);
      tmpvar_458 = (min (tmpvar_453, tmpvar_456) - ((
        (tmpvar_459 * tmpvar_459)
       * 0.25) / 0.5));
      vec3 tmpvar_460;
      tmpvar_460.x = (0.2 * tmpvar_451);
      tmpvar_460.y = (-0.2 * tmpvar_450);
      tmpvar_460.z = (-0.2 * tmpvar_451);
      float tmpvar_461;
      vec3 p_462;
      p_462 = (p_447 + tmpvar_460);
      tmpvar_461 = (sqrt(dot (p_462, p_462)) - 0.6621094);
      float tmpvar_463;
      float tmpvar_464;
      tmpvar_464 = max ((0.5 - abs(
        (tmpvar_458 - tmpvar_461)
      )), 0.0);
      tmpvar_463 = (min (tmpvar_458, tmpvar_461) - ((
        (tmpvar_464 * tmpvar_464)
       * 0.25) / 0.5));
      vec3 tmpvar_465;
      tmpvar_465.x = (-0.2 * tmpvar_449);
      tmpvar_465.y = (0.2 * tmpvar_450);
      tmpvar_465.z = (0.2 * tmpvar_451);
      float tmpvar_466;
      vec3 p_467;
      p_467 = (p_447 + tmpvar_465);
      tmpvar_466 = (sqrt(dot (p_467, p_467)) - 0.6035156);
      float tmpvar_468;
      float tmpvar_469;
      tmpvar_469 = max ((0.5 - abs(
        (tmpvar_463 - tmpvar_466)
      )), 0.0);
      tmpvar_468 = (min (tmpvar_463, tmpvar_466) - ((
        (tmpvar_469 * tmpvar_469)
       * 0.25) / 0.5));
      float tmpvar_470;
      tmpvar_470 = max ((0.05 - abs(
        (tmpvar_444 - tmpvar_468)
      )), 0.0);
      float tmpvar_471;
      tmpvar_471 = ((min (tmpvar_444, tmpvar_468) - (
        ((tmpvar_470 * tmpvar_470) * 0.25)
       / 0.05)) * 1.2);
      if ((tmpvar_471 < 0.001)) {
        dist_418 = t_419;
        break;
      };
      t_419 = (t_419 + tmpvar_471);
      if ((t_419 > 1e+20)) {
        break;
      };
    };
    if ((dist_418 > 0.0)) {
      currHit = bool(1);
      currPos = (ro_389 + (tmpvar_388 * dist_418));
      vec3 pos_472;
      pos_472 = (currPos - (tmpvar_388 * 0.001));
      vec3 nor_473;
      vec3 p_474;
      p_474 = (pos_472 + vec3(0.001, 0.0, 0.0));
      vec3 tmpvar_475;
      float tmpvar_476;
      tmpvar_476 = (uTime * 0.23);
      tmpvar_475.x = sin(tmpvar_476);
      float tmpvar_477;
      tmpvar_477 = (uTime * 0.65);
      tmpvar_475.y = cos(tmpvar_477);
      tmpvar_475.z = sin(tmpvar_477);
      vec3 p_478;
      p_478 = (p_474 + tmpvar_475);
      float tmpvar_479;
      tmpvar_479 = (uTime * 2.5);
      float tmpvar_480;
      tmpvar_480 = sin(((tmpvar_479 + 111.0) * 0.55));
      float tmpvar_481;
      tmpvar_481 = sin(((tmpvar_479 + 222.0) * 0.47));
      float tmpvar_482;
      tmpvar_482 = sin(((tmpvar_479 + 333.0) * 0.38));
      vec3 tmpvar_483;
      tmpvar_483.x = (0.2 * tmpvar_480);
      tmpvar_483.y = (0.2 * tmpvar_481);
      tmpvar_483.z = (0.2 * tmpvar_480);
      float tmpvar_484;
      vec3 p_485;
      p_485 = (p_478 + tmpvar_483);
      tmpvar_484 = (sqrt(dot (p_485, p_485)) - 0.9707031);
      vec3 tmpvar_486;
      tmpvar_486.x = (0.2 * tmpvar_481);
      tmpvar_486.y = (-0.2 * tmpvar_480);
      tmpvar_486.z = (0.2 * tmpvar_480);
      float tmpvar_487;
      vec3 p_488;
      p_488 = (p_478 + tmpvar_486);
      tmpvar_487 = (sqrt(dot (p_488, p_488)) - 0.5429688);
      float tmpvar_489;
      float tmpvar_490;
      tmpvar_490 = max ((0.5 - abs(
        (tmpvar_484 - tmpvar_487)
      )), 0.0);
      tmpvar_489 = (min (tmpvar_484, tmpvar_487) - ((
        (tmpvar_490 * tmpvar_490)
       * 0.25) / 0.5));
      vec3 tmpvar_491;
      tmpvar_491.x = (0.2 * tmpvar_482);
      tmpvar_491.y = (-0.2 * tmpvar_481);
      tmpvar_491.z = (-0.2 * tmpvar_482);
      float tmpvar_492;
      vec3 p_493;
      p_493 = (p_478 + tmpvar_491);
      tmpvar_492 = (sqrt(dot (p_493, p_493)) - 0.7949219);
      float tmpvar_494;
      float tmpvar_495;
      tmpvar_495 = max ((0.5 - abs(
        (tmpvar_489 - tmpvar_492)
      )), 0.0);
      tmpvar_494 = (min (tmpvar_489, tmpvar_492) - ((
        (tmpvar_495 * tmpvar_495)
       * 0.25) / 0.5));
      vec3 tmpvar_496;
      tmpvar_496.x = (-0.2 * tmpvar_480);
      tmpvar_496.y = (0.2 * tmpvar_481);
      tmpvar_496.z = (0.2 * tmpvar_482);
      float tmpvar_497;
      vec3 p_498;
      p_498 = (p_478 + tmpvar_496);
      tmpvar_497 = (sqrt(dot (p_498, p_498)) - 0.6835938);
      float tmpvar_499;
      float tmpvar_500;
      tmpvar_500 = max ((0.5 - abs(
        (tmpvar_494 - tmpvar_497)
      )), 0.0);
      tmpvar_499 = (min (tmpvar_494, tmpvar_497) - ((
        (tmpvar_500 * tmpvar_500)
       * 0.25) / 0.5));
      vec3 tmpvar_501;
      float tmpvar_502;
      tmpvar_502 = (uTime + 200.0);
      tmpvar_501.x = cos((tmpvar_502 * 0.1));
      float tmpvar_503;
      tmpvar_503 = -(uTime);
      tmpvar_501.y = sin((tmpvar_503 * 0.3));
      float tmpvar_504;
      tmpvar_504 = (uTime * 0.74);
      tmpvar_501.z = cos(tmpvar_504);
      vec3 p_505;
      p_505 = (p_474 + tmpvar_501);
      float tmpvar_506;
      tmpvar_506 = (uTime * 2.0);
      float tmpvar_507;
      tmpvar_507 = sin(((tmpvar_506 + 444.0) * 0.55));
      float tmpvar_508;
      tmpvar_508 = sin(((tmpvar_506 + 888.0) * 0.47));
      float tmpvar_509;
      tmpvar_509 = sin(((tmpvar_506 + 1332.0) * 0.38));
      vec3 tmpvar_510;
      tmpvar_510.x = (0.2 * tmpvar_507);
      tmpvar_510.y = (0.2 * tmpvar_508);
      tmpvar_510.z = (0.2 * tmpvar_507);
      float tmpvar_511;
      vec3 p_512;
      p_512 = (p_505 + tmpvar_510);
      tmpvar_511 = (sqrt(dot (p_512, p_512)) - 0.6835938);
      vec3 tmpvar_513;
      tmpvar_513.x = (0.2 * tmpvar_508);
      tmpvar_513.y = (-0.2 * tmpvar_507);
      tmpvar_513.z = (0.2 * tmpvar_507);
      float tmpvar_514;
      vec3 p_515;
      p_515 = (p_505 + tmpvar_513);
      tmpvar_514 = (sqrt(dot (p_515, p_515)) - 0.5874023);
      float tmpvar_516;
      float tmpvar_517;
      tmpvar_517 = max ((0.5 - abs(
        (tmpvar_511 - tmpvar_514)
      )), 0.0);
      tmpvar_516 = (min (tmpvar_511, tmpvar_514) - ((
        (tmpvar_517 * tmpvar_517)
       * 0.25) / 0.5));
      vec3 tmpvar_518;
      tmpvar_518.x = (0.2 * tmpvar_509);
      tmpvar_518.y = (-0.2 * tmpvar_508);
      tmpvar_518.z = (-0.2 * tmpvar_509);
      float tmpvar_519;
      vec3 p_520;
      p_520 = (p_505 + tmpvar_518);
      tmpvar_519 = (sqrt(dot (p_520, p_520)) - 0.6621094);
      float tmpvar_521;
      float tmpvar_522;
      tmpvar_522 = max ((0.5 - abs(
        (tmpvar_516 - tmpvar_519)
      )), 0.0);
      tmpvar_521 = (min (tmpvar_516, tmpvar_519) - ((
        (tmpvar_522 * tmpvar_522)
       * 0.25) / 0.5));
      vec3 tmpvar_523;
      tmpvar_523.x = (-0.2 * tmpvar_507);
      tmpvar_523.y = (0.2 * tmpvar_508);
      tmpvar_523.z = (0.2 * tmpvar_509);
      float tmpvar_524;
      vec3 p_525;
      p_525 = (p_505 + tmpvar_523);
      tmpvar_524 = (sqrt(dot (p_525, p_525)) - 0.6035156);
      float tmpvar_526;
      float tmpvar_527;
      tmpvar_527 = max ((0.5 - abs(
        (tmpvar_521 - tmpvar_524)
      )), 0.0);
      tmpvar_526 = (min (tmpvar_521, tmpvar_524) - ((
        (tmpvar_527 * tmpvar_527)
       * 0.25) / 0.5));
      float tmpvar_528;
      tmpvar_528 = max ((0.05 - abs(
        (tmpvar_499 - tmpvar_526)
      )), 0.0);
      vec3 p_529;
      p_529 = (pos_472 - vec3(0.001, 0.0, 0.0));
      vec3 tmpvar_530;
      tmpvar_530.x = sin(tmpvar_476);
      tmpvar_530.y = cos(tmpvar_477);
      tmpvar_530.z = sin(tmpvar_477);
      vec3 p_531;
      p_531 = (p_529 + tmpvar_530);
      float tmpvar_532;
      tmpvar_532 = sin(((tmpvar_479 + 111.0) * 0.55));
      float tmpvar_533;
      tmpvar_533 = sin(((tmpvar_479 + 222.0) * 0.47));
      float tmpvar_534;
      tmpvar_534 = sin(((tmpvar_479 + 333.0) * 0.38));
      vec3 tmpvar_535;
      tmpvar_535.x = (0.2 * tmpvar_532);
      tmpvar_535.y = (0.2 * tmpvar_533);
      tmpvar_535.z = (0.2 * tmpvar_532);
      float tmpvar_536;
      vec3 p_537;
      p_537 = (p_531 + tmpvar_535);
      tmpvar_536 = (sqrt(dot (p_537, p_537)) - 0.9707031);
      vec3 tmpvar_538;
      tmpvar_538.x = (0.2 * tmpvar_533);
      tmpvar_538.y = (-0.2 * tmpvar_532);
      tmpvar_538.z = (0.2 * tmpvar_532);
      float tmpvar_539;
      vec3 p_540;
      p_540 = (p_531 + tmpvar_538);
      tmpvar_539 = (sqrt(dot (p_540, p_540)) - 0.5429688);
      float tmpvar_541;
      float tmpvar_542;
      tmpvar_542 = max ((0.5 - abs(
        (tmpvar_536 - tmpvar_539)
      )), 0.0);
      tmpvar_541 = (min (tmpvar_536, tmpvar_539) - ((
        (tmpvar_542 * tmpvar_542)
       * 0.25) / 0.5));
      vec3 tmpvar_543;
      tmpvar_543.x = (0.2 * tmpvar_534);
      tmpvar_543.y = (-0.2 * tmpvar_533);
      tmpvar_543.z = (-0.2 * tmpvar_534);
      float tmpvar_544;
      vec3 p_545;
      p_545 = (p_531 + tmpvar_543);
      tmpvar_544 = (sqrt(dot (p_545, p_545)) - 0.7949219);
      float tmpvar_546;
      float tmpvar_547;
      tmpvar_547 = max ((0.5 - abs(
        (tmpvar_541 - tmpvar_544)
      )), 0.0);
      tmpvar_546 = (min (tmpvar_541, tmpvar_544) - ((
        (tmpvar_547 * tmpvar_547)
       * 0.25) / 0.5));
      vec3 tmpvar_548;
      tmpvar_548.x = (-0.2 * tmpvar_532);
      tmpvar_548.y = (0.2 * tmpvar_533);
      tmpvar_548.z = (0.2 * tmpvar_534);
      float tmpvar_549;
      vec3 p_550;
      p_550 = (p_531 + tmpvar_548);
      tmpvar_549 = (sqrt(dot (p_550, p_550)) - 0.6835938);
      float tmpvar_551;
      float tmpvar_552;
      tmpvar_552 = max ((0.5 - abs(
        (tmpvar_546 - tmpvar_549)
      )), 0.0);
      tmpvar_551 = (min (tmpvar_546, tmpvar_549) - ((
        (tmpvar_552 * tmpvar_552)
       * 0.25) / 0.5));
      vec3 tmpvar_553;
      tmpvar_553.x = cos((tmpvar_502 * 0.1));
      tmpvar_553.y = sin((tmpvar_503 * 0.3));
      tmpvar_553.z = cos(tmpvar_504);
      vec3 p_554;
      p_554 = (p_529 + tmpvar_553);
      float tmpvar_555;
      tmpvar_555 = sin(((tmpvar_506 + 444.0) * 0.55));
      float tmpvar_556;
      tmpvar_556 = sin(((tmpvar_506 + 888.0) * 0.47));
      float tmpvar_557;
      tmpvar_557 = sin(((tmpvar_506 + 1332.0) * 0.38));
      vec3 tmpvar_558;
      tmpvar_558.x = (0.2 * tmpvar_555);
      tmpvar_558.y = (0.2 * tmpvar_556);
      tmpvar_558.z = (0.2 * tmpvar_555);
      float tmpvar_559;
      vec3 p_560;
      p_560 = (p_554 + tmpvar_558);
      tmpvar_559 = (sqrt(dot (p_560, p_560)) - 0.6835938);
      vec3 tmpvar_561;
      tmpvar_561.x = (0.2 * tmpvar_556);
      tmpvar_561.y = (-0.2 * tmpvar_555);
      tmpvar_561.z = (0.2 * tmpvar_555);
      float tmpvar_562;
      vec3 p_563;
      p_563 = (p_554 + tmpvar_561);
      tmpvar_562 = (sqrt(dot (p_563, p_563)) - 0.5874023);
      float tmpvar_564;
      float tmpvar_565;
      tmpvar_565 = max ((0.5 - abs(
        (tmpvar_559 - tmpvar_562)
      )), 0.0);
      tmpvar_564 = (min (tmpvar_559, tmpvar_562) - ((
        (tmpvar_565 * tmpvar_565)
       * 0.25) / 0.5));
      vec3 tmpvar_566;
      tmpvar_566.x = (0.2 * tmpvar_557);
      tmpvar_566.y = (-0.2 * tmpvar_556);
      tmpvar_566.z = (-0.2 * tmpvar_557);
      float tmpvar_567;
      vec3 p_568;
      p_568 = (p_554 + tmpvar_566);
      tmpvar_567 = (sqrt(dot (p_568, p_568)) - 0.6621094);
      float tmpvar_569;
      float tmpvar_570;
      tmpvar_570 = max ((0.5 - abs(
        (tmpvar_564 - tmpvar_567)
      )), 0.0);
      tmpvar_569 = (min (tmpvar_564, tmpvar_567) - ((
        (tmpvar_570 * tmpvar_570)
       * 0.25) / 0.5));
      vec3 tmpvar_571;
      tmpvar_571.x = (-0.2 * tmpvar_555);
      tmpvar_571.y = (0.2 * tmpvar_556);
      tmpvar_571.z = (0.2 * tmpvar_557);
      float tmpvar_572;
      vec3 p_573;
      p_573 = (p_554 + tmpvar_571);
      tmpvar_572 = (sqrt(dot (p_573, p_573)) - 0.6035156);
      float tmpvar_574;
      float tmpvar_575;
      tmpvar_575 = max ((0.5 - abs(
        (tmpvar_569 - tmpvar_572)
      )), 0.0);
      tmpvar_574 = (min (tmpvar_569, tmpvar_572) - ((
        (tmpvar_575 * tmpvar_575)
       * 0.25) / 0.5));
      float tmpvar_576;
      tmpvar_576 = max ((0.05 - abs(
        (tmpvar_551 - tmpvar_574)
      )), 0.0);
      nor_473.x = ((min (tmpvar_499, tmpvar_526) - (
        ((tmpvar_528 * tmpvar_528) * 0.25)
       / 0.05)) - (min (tmpvar_551, tmpvar_574) - (
        ((tmpvar_576 * tmpvar_576) * 0.25)
       / 0.05)));
      vec3 p_577;
      p_577 = (pos_472 + vec3(0.0, 0.001, 0.0));
      vec3 tmpvar_578;
      tmpvar_578.x = sin(tmpvar_476);
      tmpvar_578.y = cos(tmpvar_477);
      tmpvar_578.z = sin(tmpvar_477);
      vec3 p_579;
      p_579 = (p_577 + tmpvar_578);
      float tmpvar_580;
      tmpvar_580 = sin(((tmpvar_479 + 111.0) * 0.55));
      float tmpvar_581;
      tmpvar_581 = sin(((tmpvar_479 + 222.0) * 0.47));
      float tmpvar_582;
      tmpvar_582 = sin(((tmpvar_479 + 333.0) * 0.38));
      vec3 tmpvar_583;
      tmpvar_583.x = (0.2 * tmpvar_580);
      tmpvar_583.y = (0.2 * tmpvar_581);
      tmpvar_583.z = (0.2 * tmpvar_580);
      float tmpvar_584;
      vec3 p_585;
      p_585 = (p_579 + tmpvar_583);
      tmpvar_584 = (sqrt(dot (p_585, p_585)) - 0.9707031);
      vec3 tmpvar_586;
      tmpvar_586.x = (0.2 * tmpvar_581);
      tmpvar_586.y = (-0.2 * tmpvar_580);
      tmpvar_586.z = (0.2 * tmpvar_580);
      float tmpvar_587;
      vec3 p_588;
      p_588 = (p_579 + tmpvar_586);
      tmpvar_587 = (sqrt(dot (p_588, p_588)) - 0.5429688);
      float tmpvar_589;
      float tmpvar_590;
      tmpvar_590 = max ((0.5 - abs(
        (tmpvar_584 - tmpvar_587)
      )), 0.0);
      tmpvar_589 = (min (tmpvar_584, tmpvar_587) - ((
        (tmpvar_590 * tmpvar_590)
       * 0.25) / 0.5));
      vec3 tmpvar_591;
      tmpvar_591.x = (0.2 * tmpvar_582);
      tmpvar_591.y = (-0.2 * tmpvar_581);
      tmpvar_591.z = (-0.2 * tmpvar_582);
      float tmpvar_592;
      vec3 p_593;
      p_593 = (p_579 + tmpvar_591);
      tmpvar_592 = (sqrt(dot (p_593, p_593)) - 0.7949219);
      float tmpvar_594;
      float tmpvar_595;
      tmpvar_595 = max ((0.5 - abs(
        (tmpvar_589 - tmpvar_592)
      )), 0.0);
      tmpvar_594 = (min (tmpvar_589, tmpvar_592) - ((
        (tmpvar_595 * tmpvar_595)
       * 0.25) / 0.5));
      vec3 tmpvar_596;
      tmpvar_596.x = (-0.2 * tmpvar_580);
      tmpvar_596.y = (0.2 * tmpvar_581);
      tmpvar_596.z = (0.2 * tmpvar_582);
      float tmpvar_597;
      vec3 p_598;
      p_598 = (p_579 + tmpvar_596);
      tmpvar_597 = (sqrt(dot (p_598, p_598)) - 0.6835938);
      float tmpvar_599;
      float tmpvar_600;
      tmpvar_600 = max ((0.5 - abs(
        (tmpvar_594 - tmpvar_597)
      )), 0.0);
      tmpvar_599 = (min (tmpvar_594, tmpvar_597) - ((
        (tmpvar_600 * tmpvar_600)
       * 0.25) / 0.5));
      vec3 tmpvar_601;
      tmpvar_601.x = cos((tmpvar_502 * 0.1));
      tmpvar_601.y = sin((tmpvar_503 * 0.3));
      tmpvar_601.z = cos(tmpvar_504);
      vec3 p_602;
      p_602 = (p_577 + tmpvar_601);
      float tmpvar_603;
      tmpvar_603 = sin(((tmpvar_506 + 444.0) * 0.55));
      float tmpvar_604;
      tmpvar_604 = sin(((tmpvar_506 + 888.0) * 0.47));
      float tmpvar_605;
      tmpvar_605 = sin(((tmpvar_506 + 1332.0) * 0.38));
      vec3 tmpvar_606;
      tmpvar_606.x = (0.2 * tmpvar_603);
      tmpvar_606.y = (0.2 * tmpvar_604);
      tmpvar_606.z = (0.2 * tmpvar_603);
      float tmpvar_607;
      vec3 p_608;
      p_608 = (p_602 + tmpvar_606);
      tmpvar_607 = (sqrt(dot (p_608, p_608)) - 0.6835938);
      vec3 tmpvar_609;
      tmpvar_609.x = (0.2 * tmpvar_604);
      tmpvar_609.y = (-0.2 * tmpvar_603);
      tmpvar_609.z = (0.2 * tmpvar_603);
      float tmpvar_610;
      vec3 p_611;
      p_611 = (p_602 + tmpvar_609);
      tmpvar_610 = (sqrt(dot (p_611, p_611)) - 0.5874023);
      float tmpvar_612;
      float tmpvar_613;
      tmpvar_613 = max ((0.5 - abs(
        (tmpvar_607 - tmpvar_610)
      )), 0.0);
      tmpvar_612 = (min (tmpvar_607, tmpvar_610) - ((
        (tmpvar_613 * tmpvar_613)
       * 0.25) / 0.5));
      vec3 tmpvar_614;
      tmpvar_614.x = (0.2 * tmpvar_605);
      tmpvar_614.y = (-0.2 * tmpvar_604);
      tmpvar_614.z = (-0.2 * tmpvar_605);
      float tmpvar_615;
      vec3 p_616;
      p_616 = (p_602 + tmpvar_614);
      tmpvar_615 = (sqrt(dot (p_616, p_616)) - 0.6621094);
      float tmpvar_617;
      float tmpvar_618;
      tmpvar_618 = max ((0.5 - abs(
        (tmpvar_612 - tmpvar_615)
      )), 0.0);
      tmpvar_617 = (min (tmpvar_612, tmpvar_615) - ((
        (tmpvar_618 * tmpvar_618)
       * 0.25) / 0.5));
      vec3 tmpvar_619;
      tmpvar_619.x = (-0.2 * tmpvar_603);
      tmpvar_619.y = (0.2 * tmpvar_604);
      tmpvar_619.z = (0.2 * tmpvar_605);
      float tmpvar_620;
      vec3 p_621;
      p_621 = (p_602 + tmpvar_619);
      tmpvar_620 = (sqrt(dot (p_621, p_621)) - 0.6035156);
      float tmpvar_622;
      float tmpvar_623;
      tmpvar_623 = max ((0.5 - abs(
        (tmpvar_617 - tmpvar_620)
      )), 0.0);
      tmpvar_622 = (min (tmpvar_617, tmpvar_620) - ((
        (tmpvar_623 * tmpvar_623)
       * 0.25) / 0.5));
      float tmpvar_624;
      tmpvar_624 = max ((0.05 - abs(
        (tmpvar_599 - tmpvar_622)
      )), 0.0);
      vec3 p_625;
      p_625 = (pos_472 - vec3(0.0, 0.001, 0.0));
      vec3 tmpvar_626;
      tmpvar_626.x = sin(tmpvar_476);
      tmpvar_626.y = cos(tmpvar_477);
      tmpvar_626.z = sin(tmpvar_477);
      vec3 p_627;
      p_627 = (p_625 + tmpvar_626);
      float tmpvar_628;
      tmpvar_628 = sin(((tmpvar_479 + 111.0) * 0.55));
      float tmpvar_629;
      tmpvar_629 = sin(((tmpvar_479 + 222.0) * 0.47));
      float tmpvar_630;
      tmpvar_630 = sin(((tmpvar_479 + 333.0) * 0.38));
      vec3 tmpvar_631;
      tmpvar_631.x = (0.2 * tmpvar_628);
      tmpvar_631.y = (0.2 * tmpvar_629);
      tmpvar_631.z = (0.2 * tmpvar_628);
      float tmpvar_632;
      vec3 p_633;
      p_633 = (p_627 + tmpvar_631);
      tmpvar_632 = (sqrt(dot (p_633, p_633)) - 0.9707031);
      vec3 tmpvar_634;
      tmpvar_634.x = (0.2 * tmpvar_629);
      tmpvar_634.y = (-0.2 * tmpvar_628);
      tmpvar_634.z = (0.2 * tmpvar_628);
      float tmpvar_635;
      vec3 p_636;
      p_636 = (p_627 + tmpvar_634);
      tmpvar_635 = (sqrt(dot (p_636, p_636)) - 0.5429688);
      float tmpvar_637;
      float tmpvar_638;
      tmpvar_638 = max ((0.5 - abs(
        (tmpvar_632 - tmpvar_635)
      )), 0.0);
      tmpvar_637 = (min (tmpvar_632, tmpvar_635) - ((
        (tmpvar_638 * tmpvar_638)
       * 0.25) / 0.5));
      vec3 tmpvar_639;
      tmpvar_639.x = (0.2 * tmpvar_630);
      tmpvar_639.y = (-0.2 * tmpvar_629);
      tmpvar_639.z = (-0.2 * tmpvar_630);
      float tmpvar_640;
      vec3 p_641;
      p_641 = (p_627 + tmpvar_639);
      tmpvar_640 = (sqrt(dot (p_641, p_641)) - 0.7949219);
      float tmpvar_642;
      float tmpvar_643;
      tmpvar_643 = max ((0.5 - abs(
        (tmpvar_637 - tmpvar_640)
      )), 0.0);
      tmpvar_642 = (min (tmpvar_637, tmpvar_640) - ((
        (tmpvar_643 * tmpvar_643)
       * 0.25) / 0.5));
      vec3 tmpvar_644;
      tmpvar_644.x = (-0.2 * tmpvar_628);
      tmpvar_644.y = (0.2 * tmpvar_629);
      tmpvar_644.z = (0.2 * tmpvar_630);
      float tmpvar_645;
      vec3 p_646;
      p_646 = (p_627 + tmpvar_644);
      tmpvar_645 = (sqrt(dot (p_646, p_646)) - 0.6835938);
      float tmpvar_647;
      float tmpvar_648;
      tmpvar_648 = max ((0.5 - abs(
        (tmpvar_642 - tmpvar_645)
      )), 0.0);
      tmpvar_647 = (min (tmpvar_642, tmpvar_645) - ((
        (tmpvar_648 * tmpvar_648)
       * 0.25) / 0.5));
      vec3 tmpvar_649;
      tmpvar_649.x = cos((tmpvar_502 * 0.1));
      tmpvar_649.y = sin((tmpvar_503 * 0.3));
      tmpvar_649.z = cos(tmpvar_504);
      vec3 p_650;
      p_650 = (p_625 + tmpvar_649);
      float tmpvar_651;
      tmpvar_651 = sin(((tmpvar_506 + 444.0) * 0.55));
      float tmpvar_652;
      tmpvar_652 = sin(((tmpvar_506 + 888.0) * 0.47));
      float tmpvar_653;
      tmpvar_653 = sin(((tmpvar_506 + 1332.0) * 0.38));
      vec3 tmpvar_654;
      tmpvar_654.x = (0.2 * tmpvar_651);
      tmpvar_654.y = (0.2 * tmpvar_652);
      tmpvar_654.z = (0.2 * tmpvar_651);
      float tmpvar_655;
      vec3 p_656;
      p_656 = (p_650 + tmpvar_654);
      tmpvar_655 = (sqrt(dot (p_656, p_656)) - 0.6835938);
      vec3 tmpvar_657;
      tmpvar_657.x = (0.2 * tmpvar_652);
      tmpvar_657.y = (-0.2 * tmpvar_651);
      tmpvar_657.z = (0.2 * tmpvar_651);
      float tmpvar_658;
      vec3 p_659;
      p_659 = (p_650 + tmpvar_657);
      tmpvar_658 = (sqrt(dot (p_659, p_659)) - 0.5874023);
      float tmpvar_660;
      float tmpvar_661;
      tmpvar_661 = max ((0.5 - abs(
        (tmpvar_655 - tmpvar_658)
      )), 0.0);
      tmpvar_660 = (min (tmpvar_655, tmpvar_658) - ((
        (tmpvar_661 * tmpvar_661)
       * 0.25) / 0.5));
      vec3 tmpvar_662;
      tmpvar_662.x = (0.2 * tmpvar_653);
      tmpvar_662.y = (-0.2 * tmpvar_652);
      tmpvar_662.z = (-0.2 * tmpvar_653);
      float tmpvar_663;
      vec3 p_664;
      p_664 = (p_650 + tmpvar_662);
      tmpvar_663 = (sqrt(dot (p_664, p_664)) - 0.6621094);
      float tmpvar_665;
      float tmpvar_666;
      tmpvar_666 = max ((0.5 - abs(
        (tmpvar_660 - tmpvar_663)
      )), 0.0);
      tmpvar_665 = (min (tmpvar_660, tmpvar_663) - ((
        (tmpvar_666 * tmpvar_666)
       * 0.25) / 0.5));
      vec3 tmpvar_667;
      tmpvar_667.x = (-0.2 * tmpvar_651);
      tmpvar_667.y = (0.2 * tmpvar_652);
      tmpvar_667.z = (0.2 * tmpvar_653);
      float tmpvar_668;
      vec3 p_669;
      p_669 = (p_650 + tmpvar_667);
      tmpvar_668 = (sqrt(dot (p_669, p_669)) - 0.6035156);
      float tmpvar_670;
      float tmpvar_671;
      tmpvar_671 = max ((0.5 - abs(
        (tmpvar_665 - tmpvar_668)
      )), 0.0);
      tmpvar_670 = (min (tmpvar_665, tmpvar_668) - ((
        (tmpvar_671 * tmpvar_671)
       * 0.25) / 0.5));
      float tmpvar_672;
      tmpvar_672 = max ((0.05 - abs(
        (tmpvar_647 - tmpvar_670)
      )), 0.0);
      nor_473.y = ((min (tmpvar_599, tmpvar_622) - (
        ((tmpvar_624 * tmpvar_624) * 0.25)
       / 0.05)) - (min (tmpvar_647, tmpvar_670) - (
        ((tmpvar_672 * tmpvar_672) * 0.25)
       / 0.05)));
      vec3 p_673;
      p_673 = (pos_472 + vec3(0.0, 0.0, 0.001));
      vec3 tmpvar_674;
      tmpvar_674.x = sin(tmpvar_476);
      tmpvar_674.y = cos(tmpvar_477);
      tmpvar_674.z = sin(tmpvar_477);
      vec3 p_675;
      p_675 = (p_673 + tmpvar_674);
      float tmpvar_676;
      tmpvar_676 = sin(((tmpvar_479 + 111.0) * 0.55));
      float tmpvar_677;
      tmpvar_677 = sin(((tmpvar_479 + 222.0) * 0.47));
      float tmpvar_678;
      tmpvar_678 = sin(((tmpvar_479 + 333.0) * 0.38));
      vec3 tmpvar_679;
      tmpvar_679.x = (0.2 * tmpvar_676);
      tmpvar_679.y = (0.2 * tmpvar_677);
      tmpvar_679.z = (0.2 * tmpvar_676);
      float tmpvar_680;
      vec3 p_681;
      p_681 = (p_675 + tmpvar_679);
      tmpvar_680 = (sqrt(dot (p_681, p_681)) - 0.9707031);
      vec3 tmpvar_682;
      tmpvar_682.x = (0.2 * tmpvar_677);
      tmpvar_682.y = (-0.2 * tmpvar_676);
      tmpvar_682.z = (0.2 * tmpvar_676);
      float tmpvar_683;
      vec3 p_684;
      p_684 = (p_675 + tmpvar_682);
      tmpvar_683 = (sqrt(dot (p_684, p_684)) - 0.5429688);
      float tmpvar_685;
      float tmpvar_686;
      tmpvar_686 = max ((0.5 - abs(
        (tmpvar_680 - tmpvar_683)
      )), 0.0);
      tmpvar_685 = (min (tmpvar_680, tmpvar_683) - ((
        (tmpvar_686 * tmpvar_686)
       * 0.25) / 0.5));
      vec3 tmpvar_687;
      tmpvar_687.x = (0.2 * tmpvar_678);
      tmpvar_687.y = (-0.2 * tmpvar_677);
      tmpvar_687.z = (-0.2 * tmpvar_678);
      float tmpvar_688;
      vec3 p_689;
      p_689 = (p_675 + tmpvar_687);
      tmpvar_688 = (sqrt(dot (p_689, p_689)) - 0.7949219);
      float tmpvar_690;
      float tmpvar_691;
      tmpvar_691 = max ((0.5 - abs(
        (tmpvar_685 - tmpvar_688)
      )), 0.0);
      tmpvar_690 = (min (tmpvar_685, tmpvar_688) - ((
        (tmpvar_691 * tmpvar_691)
       * 0.25) / 0.5));
      vec3 tmpvar_692;
      tmpvar_692.x = (-0.2 * tmpvar_676);
      tmpvar_692.y = (0.2 * tmpvar_677);
      tmpvar_692.z = (0.2 * tmpvar_678);
      float tmpvar_693;
      vec3 p_694;
      p_694 = (p_675 + tmpvar_692);
      tmpvar_693 = (sqrt(dot (p_694, p_694)) - 0.6835938);
      float tmpvar_695;
      float tmpvar_696;
      tmpvar_696 = max ((0.5 - abs(
        (tmpvar_690 - tmpvar_693)
      )), 0.0);
      tmpvar_695 = (min (tmpvar_690, tmpvar_693) - ((
        (tmpvar_696 * tmpvar_696)
       * 0.25) / 0.5));
      vec3 tmpvar_697;
      tmpvar_697.x = cos((tmpvar_502 * 0.1));
      tmpvar_697.y = sin((tmpvar_503 * 0.3));
      tmpvar_697.z = cos(tmpvar_504);
      vec3 p_698;
      p_698 = (p_673 + tmpvar_697);
      float tmpvar_699;
      tmpvar_699 = sin(((tmpvar_506 + 444.0) * 0.55));
      float tmpvar_700;
      tmpvar_700 = sin(((tmpvar_506 + 888.0) * 0.47));
      float tmpvar_701;
      tmpvar_701 = sin(((tmpvar_506 + 1332.0) * 0.38));
      vec3 tmpvar_702;
      tmpvar_702.x = (0.2 * tmpvar_699);
      tmpvar_702.y = (0.2 * tmpvar_700);
      tmpvar_702.z = (0.2 * tmpvar_699);
      float tmpvar_703;
      vec3 p_704;
      p_704 = (p_698 + tmpvar_702);
      tmpvar_703 = (sqrt(dot (p_704, p_704)) - 0.6835938);
      vec3 tmpvar_705;
      tmpvar_705.x = (0.2 * tmpvar_700);
      tmpvar_705.y = (-0.2 * tmpvar_699);
      tmpvar_705.z = (0.2 * tmpvar_699);
      float tmpvar_706;
      vec3 p_707;
      p_707 = (p_698 + tmpvar_705);
      tmpvar_706 = (sqrt(dot (p_707, p_707)) - 0.5874023);
      float tmpvar_708;
      float tmpvar_709;
      tmpvar_709 = max ((0.5 - abs(
        (tmpvar_703 - tmpvar_706)
      )), 0.0);
      tmpvar_708 = (min (tmpvar_703, tmpvar_706) - ((
        (tmpvar_709 * tmpvar_709)
       * 0.25) / 0.5));
      vec3 tmpvar_710;
      tmpvar_710.x = (0.2 * tmpvar_701);
      tmpvar_710.y = (-0.2 * tmpvar_700);
      tmpvar_710.z = (-0.2 * tmpvar_701);
      float tmpvar_711;
      vec3 p_712;
      p_712 = (p_698 + tmpvar_710);
      tmpvar_711 = (sqrt(dot (p_712, p_712)) - 0.6621094);
      float tmpvar_713;
      float tmpvar_714;
      tmpvar_714 = max ((0.5 - abs(
        (tmpvar_708 - tmpvar_711)
      )), 0.0);
      tmpvar_713 = (min (tmpvar_708, tmpvar_711) - ((
        (tmpvar_714 * tmpvar_714)
       * 0.25) / 0.5));
      vec3 tmpvar_715;
      tmpvar_715.x = (-0.2 * tmpvar_699);
      tmpvar_715.y = (0.2 * tmpvar_700);
      tmpvar_715.z = (0.2 * tmpvar_701);
      float tmpvar_716;
      vec3 p_717;
      p_717 = (p_698 + tmpvar_715);
      tmpvar_716 = (sqrt(dot (p_717, p_717)) - 0.6035156);
      float tmpvar_718;
      float tmpvar_719;
      tmpvar_719 = max ((0.5 - abs(
        (tmpvar_713 - tmpvar_716)
      )), 0.0);
      tmpvar_718 = (min (tmpvar_713, tmpvar_716) - ((
        (tmpvar_719 * tmpvar_719)
       * 0.25) / 0.5));
      float tmpvar_720;
      tmpvar_720 = max ((0.05 - abs(
        (tmpvar_695 - tmpvar_718)
      )), 0.0);
      vec3 p_721;
      p_721 = (pos_472 - vec3(0.0, 0.0, 0.001));
      vec3 tmpvar_722;
      tmpvar_722.x = sin(tmpvar_476);
      tmpvar_722.y = cos(tmpvar_477);
      tmpvar_722.z = sin(tmpvar_477);
      vec3 p_723;
      p_723 = (p_721 + tmpvar_722);
      float tmpvar_724;
      tmpvar_724 = sin(((tmpvar_479 + 111.0) * 0.55));
      float tmpvar_725;
      tmpvar_725 = sin(((tmpvar_479 + 222.0) * 0.47));
      float tmpvar_726;
      tmpvar_726 = sin(((tmpvar_479 + 333.0) * 0.38));
      vec3 tmpvar_727;
      tmpvar_727.x = (0.2 * tmpvar_724);
      tmpvar_727.y = (0.2 * tmpvar_725);
      tmpvar_727.z = (0.2 * tmpvar_724);
      float tmpvar_728;
      vec3 p_729;
      p_729 = (p_723 + tmpvar_727);
      tmpvar_728 = (sqrt(dot (p_729, p_729)) - 0.9707031);
      vec3 tmpvar_730;
      tmpvar_730.x = (0.2 * tmpvar_725);
      tmpvar_730.y = (-0.2 * tmpvar_724);
      tmpvar_730.z = (0.2 * tmpvar_724);
      float tmpvar_731;
      vec3 p_732;
      p_732 = (p_723 + tmpvar_730);
      tmpvar_731 = (sqrt(dot (p_732, p_732)) - 0.5429688);
      float tmpvar_733;
      float tmpvar_734;
      tmpvar_734 = max ((0.5 - abs(
        (tmpvar_728 - tmpvar_731)
      )), 0.0);
      tmpvar_733 = (min (tmpvar_728, tmpvar_731) - ((
        (tmpvar_734 * tmpvar_734)
       * 0.25) / 0.5));
      vec3 tmpvar_735;
      tmpvar_735.x = (0.2 * tmpvar_726);
      tmpvar_735.y = (-0.2 * tmpvar_725);
      tmpvar_735.z = (-0.2 * tmpvar_726);
      float tmpvar_736;
      vec3 p_737;
      p_737 = (p_723 + tmpvar_735);
      tmpvar_736 = (sqrt(dot (p_737, p_737)) - 0.7949219);
      float tmpvar_738;
      float tmpvar_739;
      tmpvar_739 = max ((0.5 - abs(
        (tmpvar_733 - tmpvar_736)
      )), 0.0);
      tmpvar_738 = (min (tmpvar_733, tmpvar_736) - ((
        (tmpvar_739 * tmpvar_739)
       * 0.25) / 0.5));
      vec3 tmpvar_740;
      tmpvar_740.x = (-0.2 * tmpvar_724);
      tmpvar_740.y = (0.2 * tmpvar_725);
      tmpvar_740.z = (0.2 * tmpvar_726);
      float tmpvar_741;
      vec3 p_742;
      p_742 = (p_723 + tmpvar_740);
      tmpvar_741 = (sqrt(dot (p_742, p_742)) - 0.6835938);
      float tmpvar_743;
      float tmpvar_744;
      tmpvar_744 = max ((0.5 - abs(
        (tmpvar_738 - tmpvar_741)
      )), 0.0);
      tmpvar_743 = (min (tmpvar_738, tmpvar_741) - ((
        (tmpvar_744 * tmpvar_744)
       * 0.25) / 0.5));
      vec3 tmpvar_745;
      tmpvar_745.x = cos((tmpvar_502 * 0.1));
      tmpvar_745.y = sin((tmpvar_503 * 0.3));
      tmpvar_745.z = cos(tmpvar_504);
      vec3 p_746;
      p_746 = (p_721 + tmpvar_745);
      float tmpvar_747;
      tmpvar_747 = sin(((tmpvar_506 + 444.0) * 0.55));
      float tmpvar_748;
      tmpvar_748 = sin(((tmpvar_506 + 888.0) * 0.47));
      float tmpvar_749;
      tmpvar_749 = sin(((tmpvar_506 + 1332.0) * 0.38));
      vec3 tmpvar_750;
      tmpvar_750.x = (0.2 * tmpvar_747);
      tmpvar_750.y = (0.2 * tmpvar_748);
      tmpvar_750.z = (0.2 * tmpvar_747);
      float tmpvar_751;
      vec3 p_752;
      p_752 = (p_746 + tmpvar_750);
      tmpvar_751 = (sqrt(dot (p_752, p_752)) - 0.6835938);
      vec3 tmpvar_753;
      tmpvar_753.x = (0.2 * tmpvar_748);
      tmpvar_753.y = (-0.2 * tmpvar_747);
      tmpvar_753.z = (0.2 * tmpvar_747);
      float tmpvar_754;
      vec3 p_755;
      p_755 = (p_746 + tmpvar_753);
      tmpvar_754 = (sqrt(dot (p_755, p_755)) - 0.5874023);
      float tmpvar_756;
      float tmpvar_757;
      tmpvar_757 = max ((0.5 - abs(
        (tmpvar_751 - tmpvar_754)
      )), 0.0);
      tmpvar_756 = (min (tmpvar_751, tmpvar_754) - ((
        (tmpvar_757 * tmpvar_757)
       * 0.25) / 0.5));
      vec3 tmpvar_758;
      tmpvar_758.x = (0.2 * tmpvar_749);
      tmpvar_758.y = (-0.2 * tmpvar_748);
      tmpvar_758.z = (-0.2 * tmpvar_749);
      float tmpvar_759;
      vec3 p_760;
      p_760 = (p_746 + tmpvar_758);
      tmpvar_759 = (sqrt(dot (p_760, p_760)) - 0.6621094);
      float tmpvar_761;
      float tmpvar_762;
      tmpvar_762 = max ((0.5 - abs(
        (tmpvar_756 - tmpvar_759)
      )), 0.0);
      tmpvar_761 = (min (tmpvar_756, tmpvar_759) - ((
        (tmpvar_762 * tmpvar_762)
       * 0.25) / 0.5));
      vec3 tmpvar_763;
      tmpvar_763.x = (-0.2 * tmpvar_747);
      tmpvar_763.y = (0.2 * tmpvar_748);
      tmpvar_763.z = (0.2 * tmpvar_749);
      float tmpvar_764;
      vec3 p_765;
      p_765 = (p_746 + tmpvar_763);
      tmpvar_764 = (sqrt(dot (p_765, p_765)) - 0.6035156);
      float tmpvar_766;
      float tmpvar_767;
      tmpvar_767 = max ((0.5 - abs(
        (tmpvar_761 - tmpvar_764)
      )), 0.0);
      tmpvar_766 = (min (tmpvar_761, tmpvar_764) - ((
        (tmpvar_767 * tmpvar_767)
       * 0.25) / 0.5));
      float tmpvar_768;
      tmpvar_768 = max ((0.05 - abs(
        (tmpvar_743 - tmpvar_766)
      )), 0.0);
      nor_473.z = ((min (tmpvar_695, tmpvar_718) - (
        ((tmpvar_720 * tmpvar_720) * 0.25)
       / 0.05)) - (min (tmpvar_743, tmpvar_766) - (
        ((tmpvar_768 * tmpvar_768) * 0.25)
       / 0.05)));
      currNor = normalize(nor_473);
    } else {
      currHit = bool(0);
    };
    if (currHit) {
      vec3 tmpvar_769;
      tmpvar_769 = normalize((tmpvar_388 - (2.0 *
        (dot (currNor, tmpvar_388) * currNor)
      )));
      vec3 tmpvar_770;
      tmpvar_770 = (((
        cos(((tmpvar_769.y * 3.0) + (uTime * 0.3)))
       +
        sin((((tmpvar_769.x +
          cos(((3.0 * tmpvar_769.y) + (uTime * 0.78)))
        ) + tmpvar_769.x) + uTime))
      ) * 5.1) - vec3(1.8, 1.14, 0.3));
      vec3 tmpvar_771;
      tmpvar_771 = max (normalize((tmpvar_388 * currNor)), vec3(0.0, 0.0, 0.0));
      float tmpvar_772;
      tmpvar_772 = pow (min ((
        (tmpvar_771.x + tmpvar_771.y)
       + tmpvar_771.z), 1.0), 1.3);
      col_390 = max (min (tmpvar_414, (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_772))), (cos(
        (1.9 * sin((1.0 - (tmpvar_770 * tmpvar_770))))
      ) * tmpvar_772));
    };
    vec3 tmpvar_773;
    tmpvar_773 = mix (col_4, max (col_4, col_390), 0.3);
    col_3 = tmpvar_773;
    vec3 ro_774;
    ro_774 = (_currPos_387 + (tmpvar_2 * vec3(2.0, 2.0, 2.0)));
    vec3 col_775;
    float c_777;
    vec2 e_a778;
    float t_779;
    float tmpvar_780;
    tmpvar_780 = (uTime * (uGui0 * 2.0));
    t_779 = tmpvar_780;
    e_a778 = (tmpvar_2.xy * (10.0 * cos(
      (tmpvar_780 / 10.0)
    )));
    c_777 = (10.0 + (uGui1 * 20.0));
    for (highp int i_776 = 0; i_776 < 30; i_776++) {
      vec2 tmpvar_781;
      tmpvar_781.x = e_a778.x;
      tmpvar_781.y = abs(e_a778.y);
      float tmpvar_782;
      tmpvar_782 = log(sqrt(dot (tmpvar_781, tmpvar_781)));
      float tmpvar_783;
      float tmpvar_784;
      tmpvar_784 = (min (abs(
        (tmpvar_781.y / e_a778.x)
      ), 1.0) / max (abs(
        (tmpvar_781.y / e_a778.x)
      ), 1.0));
      float tmpvar_785;
      tmpvar_785 = (tmpvar_784 * tmpvar_784);
      tmpvar_785 = (((
        ((((
          ((((-0.01213232 * tmpvar_785) + 0.05368138) * tmpvar_785) - 0.1173503)
         * tmpvar_785) + 0.1938925) * tmpvar_785) - 0.3326756)
       * tmpvar_785) + 0.9999793) * tmpvar_784);
      tmpvar_785 = (tmpvar_785 + (float(
        (abs((tmpvar_781.y / e_a778.x)) > 1.0)
      ) * (
        (tmpvar_785 * -2.0)
       + 1.570796)));
      tmpvar_783 = (tmpvar_785 * sign((tmpvar_781.y / e_a778.x)));
      if ((abs(e_a778.x) > (1e-08 * abs(tmpvar_781.y)))) {
        if ((e_a778.x < 0.0)) {
          if ((tmpvar_781.y >= 0.0)) {
            tmpvar_783 += 3.141593;
          } else {
            tmpvar_783 = (tmpvar_783 - 3.141593);
          };
        };
      } else {
        tmpvar_783 = (sign(tmpvar_781.y) * 1.570796);
      };
      vec2 tmpvar_786;
      tmpvar_786.x = tmpvar_782;
      tmpvar_786.y = (tmpvar_783 - 6.0);
      vec2 tmpvar_787;
      tmpvar_787.x = ((0.1 * sin(
        (t_779 / 10.0)
      )) - (uGui3 * 0.3));
      tmpvar_787.y = (5.0 + (0.1 * cos(
        (t_779 / 5.0)
      )));
      e_a778 = (tmpvar_786 + tmpvar_787);
      c_777 = (c_777 + sqrt(dot (e_a778, e_a778)));
      if ((i_776 >= int((
        (uGui2 * 20.0)
       + 10.0)))) {
        break;
      };
    };
    float tmpvar_788;
    tmpvar_788 = (log2(log2(
      (c_777 * 0.05)
    )) * 10.0);
    vec3 tmpvar_789;
    tmpvar_789.x = (0.5 + (0.7 * cos(tmpvar_788)));
    tmpvar_789.y = (0.5 + (0.55 * cos(
      (tmpvar_788 - 0.7)
    )));
    tmpvar_789.z = (0.7 + (0.7 * cos(
      (tmpvar_788 - 0.7)
    )));
    vec3 tmpvar_790;
    float adjustment_791;
    adjustment_791 = (3.141593 + (uGui4 * 3.141593));
    vec3 tmpvar_792;
    tmpvar_792 = (mat3(0.299, 0.587, 0.114, 0.595716, -0.274453, -0.321263, 0.211456, -0.522591, 0.311135) * tmpvar_789);
    float tmpvar_793;
    float tmpvar_794;
    tmpvar_794 = (min (abs(
      (tmpvar_792.z / tmpvar_792.y)
    ), 1.0) / max (abs(
      (tmpvar_792.z / tmpvar_792.y)
    ), 1.0));
    float tmpvar_795;
    tmpvar_795 = (tmpvar_794 * tmpvar_794);
    tmpvar_795 = (((
      ((((
        ((((-0.01213232 * tmpvar_795) + 0.05368138) * tmpvar_795) - 0.1173503)
       * tmpvar_795) + 0.1938925) * tmpvar_795) - 0.3326756)
     * tmpvar_795) + 0.9999793) * tmpvar_794);
    tmpvar_795 = (tmpvar_795 + (float(
      (abs((tmpvar_792.z / tmpvar_792.y)) > 1.0)
    ) * (
      (tmpvar_795 * -2.0)
     + 1.570796)));
    tmpvar_793 = (tmpvar_795 * sign((tmpvar_792.z / tmpvar_792.y)));
    if ((abs(tmpvar_792.y) > (1e-08 * abs(tmpvar_792.z)))) {
      if ((tmpvar_792.y < 0.0)) {
        if ((tmpvar_792.z >= 0.0)) {
          tmpvar_793 += 3.141593;
        } else {
          tmpvar_793 = (tmpvar_793 - 3.141593);
        };
      };
    } else {
      tmpvar_793 = (sign(tmpvar_792.z) * 1.570796);
    };
    float tmpvar_796;
    tmpvar_796 = (tmpvar_793 + adjustment_791);
    float tmpvar_797;
    tmpvar_797 = sqrt(((tmpvar_792.z * tmpvar_792.z) + (tmpvar_792.y * tmpvar_792.y)));
    vec3 tmpvar_798;
    tmpvar_798.x = tmpvar_792.x;
    tmpvar_798.y = (tmpvar_797 * cos(tmpvar_796));
    tmpvar_798.z = (tmpvar_797 * sin(tmpvar_796));
    tmpvar_790 = (mat3(1.0, 0.9563, 0.621, 1.0, -0.2721, -0.6474, 1.0, -1.107, 1.7046) * tmpvar_798);
    vec3 tmpvar_799;
    tmpvar_799 = mix (vec3(dot (tmpvar_790, vec3(0.2125, 0.7154, 0.0721))), tmpvar_790, uGui5);
    col_775 = tmpvar_799;
    vec3 ro_800;
    ro_800 = ro_774;
    vec3 rd_801;
    rd_801 = tmpvar_2;
    float dist_803;
    float t_804;
    t_804 = 0.0;
    dist_803 = -1.0;
    for (highp int i_802 = 0; i_802 < 32; i_802++) {
      vec3 p_805;
      p_805 = (ro_800 + (rd_801 * t_804));
      vec3 tmpvar_806;
      tmpvar_806.x = sin((uTime * 0.23));
      float tmpvar_807;
      tmpvar_807 = (uTime * 0.65);
      tmpvar_806.y = cos(tmpvar_807);
      tmpvar_806.z = sin(tmpvar_807);
      vec3 p_808;
      p_808 = (p_805 + tmpvar_806);
      float t_809;
      t_809 = (uTime * 2.5);
      float tmpvar_810;
      tmpvar_810 = sin(((t_809 + 111.0) * 0.55));
      float tmpvar_811;
      tmpvar_811 = sin(((t_809 + 222.0) * 0.47));
      float tmpvar_812;
      tmpvar_812 = sin(((t_809 + 333.0) * 0.38));
      vec3 tmpvar_813;
      tmpvar_813.x = (0.2 * tmpvar_810);
      tmpvar_813.y = (0.2 * tmpvar_811);
      tmpvar_813.z = (0.2 * tmpvar_810);
      float tmpvar_814;
      vec3 p_815;
      p_815 = (p_808 + tmpvar_813);
      tmpvar_814 = (sqrt(dot (p_815, p_815)) - 0.9707031);
      vec3 tmpvar_816;
      tmpvar_816.x = (0.2 * tmpvar_811);
      tmpvar_816.y = (-0.2 * tmpvar_810);
      tmpvar_816.z = (0.2 * tmpvar_810);
      float tmpvar_817;
      vec3 p_818;
      p_818 = (p_808 + tmpvar_816);
      tmpvar_817 = (sqrt(dot (p_818, p_818)) - 0.5429688);
      float tmpvar_819;
      float tmpvar_820;
      tmpvar_820 = max ((0.5 - abs(
        (tmpvar_814 - tmpvar_817)
      )), 0.0);
      tmpvar_819 = (min (tmpvar_814, tmpvar_817) - ((
        (tmpvar_820 * tmpvar_820)
       * 0.25) / 0.5));
      vec3 tmpvar_821;
      tmpvar_821.x = (0.2 * tmpvar_812);
      tmpvar_821.y = (-0.2 * tmpvar_811);
      tmpvar_821.z = (-0.2 * tmpvar_812);
      float tmpvar_822;
      vec3 p_823;
      p_823 = (p_808 + tmpvar_821);
      tmpvar_822 = (sqrt(dot (p_823, p_823)) - 0.7949219);
      float tmpvar_824;
      float tmpvar_825;
      tmpvar_825 = max ((0.5 - abs(
        (tmpvar_819 - tmpvar_822)
      )), 0.0);
      tmpvar_824 = (min (tmpvar_819, tmpvar_822) - ((
        (tmpvar_825 * tmpvar_825)
       * 0.25) / 0.5));
      vec3 tmpvar_826;
      tmpvar_826.x = (-0.2 * tmpvar_810);
      tmpvar_826.y = (0.2 * tmpvar_811);
      tmpvar_826.z = (0.2 * tmpvar_812);
      float tmpvar_827;
      vec3 p_828;
      p_828 = (p_808 + tmpvar_826);
      tmpvar_827 = (sqrt(dot (p_828, p_828)) - 0.6835938);
      float tmpvar_829;
      float tmpvar_830;
      tmpvar_830 = max ((0.5 - abs(
        (tmpvar_824 - tmpvar_827)
      )), 0.0);
      tmpvar_829 = (min (tmpvar_824, tmpvar_827) - ((
        (tmpvar_830 * tmpvar_830)
       * 0.25) / 0.5));
      vec3 tmpvar_831;
      tmpvar_831.x = cos(((uTime + 200.0) * 0.1));
      tmpvar_831.y = sin((-(uTime) * 0.3));
      tmpvar_831.z = cos((uTime * 0.74));
      vec3 p_832;
      p_832 = (p_805 + tmpvar_831);
      float t_833;
      t_833 = (uTime * 2.0);
      float tmpvar_834;
      tmpvar_834 = sin(((t_833 + 444.0) * 0.55));
      float tmpvar_835;
      tmpvar_835 = sin(((t_833 + 888.0) * 0.47));
      float tmpvar_836;
      tmpvar_836 = sin(((t_833 + 1332.0) * 0.38));
      vec3 tmpvar_837;
      tmpvar_837.x = (0.2 * tmpvar_834);
      tmpvar_837.y = (0.2 * tmpvar_835);
      tmpvar_837.z = (0.2 * tmpvar_834);
      float tmpvar_838;
      vec3 p_839;
      p_839 = (p_832 + tmpvar_837);
      tmpvar_838 = (sqrt(dot (p_839, p_839)) - 0.6835938);
      vec3 tmpvar_840;
      tmpvar_840.x = (0.2 * tmpvar_835);
      tmpvar_840.y = (-0.2 * tmpvar_834);
      tmpvar_840.z = (0.2 * tmpvar_834);
      float tmpvar_841;
      vec3 p_842;
      p_842 = (p_832 + tmpvar_840);
      tmpvar_841 = (sqrt(dot (p_842, p_842)) - 0.5874023);
      float tmpvar_843;
      float tmpvar_844;
      tmpvar_844 = max ((0.5 - abs(
        (tmpvar_838 - tmpvar_841)
      )), 0.0);
      tmpvar_843 = (min (tmpvar_838, tmpvar_841) - ((
        (tmpvar_844 * tmpvar_844)
       * 0.25) / 0.5));
      vec3 tmpvar_845;
      tmpvar_845.x = (0.2 * tmpvar_836);
      tmpvar_845.y = (-0.2 * tmpvar_835);
      tmpvar_845.z = (-0.2 * tmpvar_836);
      float tmpvar_846;
      vec3 p_847;
      p_847 = (p_832 + tmpvar_845);
      tmpvar_846 = (sqrt(dot (p_847, p_847)) - 0.6621094);
      float tmpvar_848;
      float tmpvar_849;
      tmpvar_849 = max ((0.5 - abs(
        (tmpvar_843 - tmpvar_846)
      )), 0.0);
      tmpvar_848 = (min (tmpvar_843, tmpvar_846) - ((
        (tmpvar_849 * tmpvar_849)
       * 0.25) / 0.5));
      vec3 tmpvar_850;
      tmpvar_850.x = (-0.2 * tmpvar_834);
      tmpvar_850.y = (0.2 * tmpvar_835);
      tmpvar_850.z = (0.2 * tmpvar_836);
      float tmpvar_851;
      vec3 p_852;
      p_852 = (p_832 + tmpvar_850);
      tmpvar_851 = (sqrt(dot (p_852, p_852)) - 0.6035156);
      float tmpvar_853;
      float tmpvar_854;
      tmpvar_854 = max ((0.5 - abs(
        (tmpvar_848 - tmpvar_851)
      )), 0.0);
      tmpvar_853 = (min (tmpvar_848, tmpvar_851) - ((
        (tmpvar_854 * tmpvar_854)
       * 0.25) / 0.5));
      float tmpvar_855;
      tmpvar_855 = max ((0.05 - abs(
        (tmpvar_829 - tmpvar_853)
      )), 0.0);
      float tmpvar_856;
      tmpvar_856 = ((min (tmpvar_829, tmpvar_853) - (
        ((tmpvar_855 * tmpvar_855) * 0.25)
       / 0.05)) * 1.2);
      if ((tmpvar_856 < 0.001)) {
        dist_803 = t_804;
        break;
      };
      t_804 = (t_804 + tmpvar_856);
      if ((t_804 > 1e+20)) {
        break;
      };
    };
    if ((dist_803 > 0.0)) {
      currHit = bool(1);
      currPos = (ro_774 + (tmpvar_2 * dist_803));
      vec3 pos_857;
      pos_857 = (currPos - (tmpvar_2 * 0.001));
      vec3 nor_858;
      vec3 p_859;
      p_859 = (pos_857 + vec3(0.001, 0.0, 0.0));
      vec3 tmpvar_860;
      float tmpvar_861;
      tmpvar_861 = (uTime * 0.23);
      tmpvar_860.x = sin(tmpvar_861);
      float tmpvar_862;
      tmpvar_862 = (uTime * 0.65);
      tmpvar_860.y = cos(tmpvar_862);
      tmpvar_860.z = sin(tmpvar_862);
      vec3 p_863;
      p_863 = (p_859 + tmpvar_860);
      float tmpvar_864;
      tmpvar_864 = (uTime * 2.5);
      float tmpvar_865;
      tmpvar_865 = sin(((tmpvar_864 + 111.0) * 0.55));
      float tmpvar_866;
      tmpvar_866 = sin(((tmpvar_864 + 222.0) * 0.47));
      float tmpvar_867;
      tmpvar_867 = sin(((tmpvar_864 + 333.0) * 0.38));
      vec3 tmpvar_868;
      tmpvar_868.x = (0.2 * tmpvar_865);
      tmpvar_868.y = (0.2 * tmpvar_866);
      tmpvar_868.z = (0.2 * tmpvar_865);
      float tmpvar_869;
      vec3 p_870;
      p_870 = (p_863 + tmpvar_868);
      tmpvar_869 = (sqrt(dot (p_870, p_870)) - 0.9707031);
      vec3 tmpvar_871;
      tmpvar_871.x = (0.2 * tmpvar_866);
      tmpvar_871.y = (-0.2 * tmpvar_865);
      tmpvar_871.z = (0.2 * tmpvar_865);
      float tmpvar_872;
      vec3 p_873;
      p_873 = (p_863 + tmpvar_871);
      tmpvar_872 = (sqrt(dot (p_873, p_873)) - 0.5429688);
      float tmpvar_874;
      float tmpvar_875;
      tmpvar_875 = max ((0.5 - abs(
        (tmpvar_869 - tmpvar_872)
      )), 0.0);
      tmpvar_874 = (min (tmpvar_869, tmpvar_872) - ((
        (tmpvar_875 * tmpvar_875)
       * 0.25) / 0.5));
      vec3 tmpvar_876;
      tmpvar_876.x = (0.2 * tmpvar_867);
      tmpvar_876.y = (-0.2 * tmpvar_866);
      tmpvar_876.z = (-0.2 * tmpvar_867);
      float tmpvar_877;
      vec3 p_878;
      p_878 = (p_863 + tmpvar_876);
      tmpvar_877 = (sqrt(dot (p_878, p_878)) - 0.7949219);
      float tmpvar_879;
      float tmpvar_880;
      tmpvar_880 = max ((0.5 - abs(
        (tmpvar_874 - tmpvar_877)
      )), 0.0);
      tmpvar_879 = (min (tmpvar_874, tmpvar_877) - ((
        (tmpvar_880 * tmpvar_880)
       * 0.25) / 0.5));
      vec3 tmpvar_881;
      tmpvar_881.x = (-0.2 * tmpvar_865);
      tmpvar_881.y = (0.2 * tmpvar_866);
      tmpvar_881.z = (0.2 * tmpvar_867);
      float tmpvar_882;
      vec3 p_883;
      p_883 = (p_863 + tmpvar_881);
      tmpvar_882 = (sqrt(dot (p_883, p_883)) - 0.6835938);
      float tmpvar_884;
      float tmpvar_885;
      tmpvar_885 = max ((0.5 - abs(
        (tmpvar_879 - tmpvar_882)
      )), 0.0);
      tmpvar_884 = (min (tmpvar_879, tmpvar_882) - ((
        (tmpvar_885 * tmpvar_885)
       * 0.25) / 0.5));
      vec3 tmpvar_886;
      float tmpvar_887;
      tmpvar_887 = (uTime + 200.0);
      tmpvar_886.x = cos((tmpvar_887 * 0.1));
      float tmpvar_888;
      tmpvar_888 = -(uTime);
      tmpvar_886.y = sin((tmpvar_888 * 0.3));
      float tmpvar_889;
      tmpvar_889 = (uTime * 0.74);
      tmpvar_886.z = cos(tmpvar_889);
      vec3 p_890;
      p_890 = (p_859 + tmpvar_886);
      float tmpvar_891;
      tmpvar_891 = (uTime * 2.0);
      float tmpvar_892;
      tmpvar_892 = sin(((tmpvar_891 + 444.0) * 0.55));
      float tmpvar_893;
      tmpvar_893 = sin(((tmpvar_891 + 888.0) * 0.47));
      float tmpvar_894;
      tmpvar_894 = sin(((tmpvar_891 + 1332.0) * 0.38));
      vec3 tmpvar_895;
      tmpvar_895.x = (0.2 * tmpvar_892);
      tmpvar_895.y = (0.2 * tmpvar_893);
      tmpvar_895.z = (0.2 * tmpvar_892);
      float tmpvar_896;
      vec3 p_897;
      p_897 = (p_890 + tmpvar_895);
      tmpvar_896 = (sqrt(dot (p_897, p_897)) - 0.6835938);
      vec3 tmpvar_898;
      tmpvar_898.x = (0.2 * tmpvar_893);
      tmpvar_898.y = (-0.2 * tmpvar_892);
      tmpvar_898.z = (0.2 * tmpvar_892);
      float tmpvar_899;
      vec3 p_900;
      p_900 = (p_890 + tmpvar_898);
      tmpvar_899 = (sqrt(dot (p_900, p_900)) - 0.5874023);
      float tmpvar_901;
      float tmpvar_902;
      tmpvar_902 = max ((0.5 - abs(
        (tmpvar_896 - tmpvar_899)
      )), 0.0);
      tmpvar_901 = (min (tmpvar_896, tmpvar_899) - ((
        (tmpvar_902 * tmpvar_902)
       * 0.25) / 0.5));
      vec3 tmpvar_903;
      tmpvar_903.x = (0.2 * tmpvar_894);
      tmpvar_903.y = (-0.2 * tmpvar_893);
      tmpvar_903.z = (-0.2 * tmpvar_894);
      float tmpvar_904;
      vec3 p_905;
      p_905 = (p_890 + tmpvar_903);
      tmpvar_904 = (sqrt(dot (p_905, p_905)) - 0.6621094);
      float tmpvar_906;
      float tmpvar_907;
      tmpvar_907 = max ((0.5 - abs(
        (tmpvar_901 - tmpvar_904)
      )), 0.0);
      tmpvar_906 = (min (tmpvar_901, tmpvar_904) - ((
        (tmpvar_907 * tmpvar_907)
       * 0.25) / 0.5));
      vec3 tmpvar_908;
      tmpvar_908.x = (-0.2 * tmpvar_892);
      tmpvar_908.y = (0.2 * tmpvar_893);
      tmpvar_908.z = (0.2 * tmpvar_894);
      float tmpvar_909;
      vec3 p_910;
      p_910 = (p_890 + tmpvar_908);
      tmpvar_909 = (sqrt(dot (p_910, p_910)) - 0.6035156);
      float tmpvar_911;
      float tmpvar_912;
      tmpvar_912 = max ((0.5 - abs(
        (tmpvar_906 - tmpvar_909)
      )), 0.0);
      tmpvar_911 = (min (tmpvar_906, tmpvar_909) - ((
        (tmpvar_912 * tmpvar_912)
       * 0.25) / 0.5));
      float tmpvar_913;
      tmpvar_913 = max ((0.05 - abs(
        (tmpvar_884 - tmpvar_911)
      )), 0.0);
      vec3 p_914;
      p_914 = (pos_857 - vec3(0.001, 0.0, 0.0));
      vec3 tmpvar_915;
      tmpvar_915.x = sin(tmpvar_861);
      tmpvar_915.y = cos(tmpvar_862);
      tmpvar_915.z = sin(tmpvar_862);
      vec3 p_916;
      p_916 = (p_914 + tmpvar_915);
      float tmpvar_917;
      tmpvar_917 = sin(((tmpvar_864 + 111.0) * 0.55));
      float tmpvar_918;
      tmpvar_918 = sin(((tmpvar_864 + 222.0) * 0.47));
      float tmpvar_919;
      tmpvar_919 = sin(((tmpvar_864 + 333.0) * 0.38));
      vec3 tmpvar_920;
      tmpvar_920.x = (0.2 * tmpvar_917);
      tmpvar_920.y = (0.2 * tmpvar_918);
      tmpvar_920.z = (0.2 * tmpvar_917);
      float tmpvar_921;
      vec3 p_922;
      p_922 = (p_916 + tmpvar_920);
      tmpvar_921 = (sqrt(dot (p_922, p_922)) - 0.9707031);
      vec3 tmpvar_923;
      tmpvar_923.x = (0.2 * tmpvar_918);
      tmpvar_923.y = (-0.2 * tmpvar_917);
      tmpvar_923.z = (0.2 * tmpvar_917);
      float tmpvar_924;
      vec3 p_925;
      p_925 = (p_916 + tmpvar_923);
      tmpvar_924 = (sqrt(dot (p_925, p_925)) - 0.5429688);
      float tmpvar_926;
      float tmpvar_927;
      tmpvar_927 = max ((0.5 - abs(
        (tmpvar_921 - tmpvar_924)
      )), 0.0);
      tmpvar_926 = (min (tmpvar_921, tmpvar_924) - ((
        (tmpvar_927 * tmpvar_927)
       * 0.25) / 0.5));
      vec3 tmpvar_928;
      tmpvar_928.x = (0.2 * tmpvar_919);
      tmpvar_928.y = (-0.2 * tmpvar_918);
      tmpvar_928.z = (-0.2 * tmpvar_919);
      float tmpvar_929;
      vec3 p_930;
      p_930 = (p_916 + tmpvar_928);
      tmpvar_929 = (sqrt(dot (p_930, p_930)) - 0.7949219);
      float tmpvar_931;
      float tmpvar_932;
      tmpvar_932 = max ((0.5 - abs(
        (tmpvar_926 - tmpvar_929)
      )), 0.0);
      tmpvar_931 = (min (tmpvar_926, tmpvar_929) - ((
        (tmpvar_932 * tmpvar_932)
       * 0.25) / 0.5));
      vec3 tmpvar_933;
      tmpvar_933.x = (-0.2 * tmpvar_917);
      tmpvar_933.y = (0.2 * tmpvar_918);
      tmpvar_933.z = (0.2 * tmpvar_919);
      float tmpvar_934;
      vec3 p_935;
      p_935 = (p_916 + tmpvar_933);
      tmpvar_934 = (sqrt(dot (p_935, p_935)) - 0.6835938);
      float tmpvar_936;
      float tmpvar_937;
      tmpvar_937 = max ((0.5 - abs(
        (tmpvar_931 - tmpvar_934)
      )), 0.0);
      tmpvar_936 = (min (tmpvar_931, tmpvar_934) - ((
        (tmpvar_937 * tmpvar_937)
       * 0.25) / 0.5));
      vec3 tmpvar_938;
      tmpvar_938.x = cos((tmpvar_887 * 0.1));
      tmpvar_938.y = sin((tmpvar_888 * 0.3));
      tmpvar_938.z = cos(tmpvar_889);
      vec3 p_939;
      p_939 = (p_914 + tmpvar_938);
      float tmpvar_940;
      tmpvar_940 = sin(((tmpvar_891 + 444.0) * 0.55));
      float tmpvar_941;
      tmpvar_941 = sin(((tmpvar_891 + 888.0) * 0.47));
      float tmpvar_942;
      tmpvar_942 = sin(((tmpvar_891 + 1332.0) * 0.38));
      vec3 tmpvar_943;
      tmpvar_943.x = (0.2 * tmpvar_940);
      tmpvar_943.y = (0.2 * tmpvar_941);
      tmpvar_943.z = (0.2 * tmpvar_940);
      float tmpvar_944;
      vec3 p_945;
      p_945 = (p_939 + tmpvar_943);
      tmpvar_944 = (sqrt(dot (p_945, p_945)) - 0.6835938);
      vec3 tmpvar_946;
      tmpvar_946.x = (0.2 * tmpvar_941);
      tmpvar_946.y = (-0.2 * tmpvar_940);
      tmpvar_946.z = (0.2 * tmpvar_940);
      float tmpvar_947;
      vec3 p_948;
      p_948 = (p_939 + tmpvar_946);
      tmpvar_947 = (sqrt(dot (p_948, p_948)) - 0.5874023);
      float tmpvar_949;
      float tmpvar_950;
      tmpvar_950 = max ((0.5 - abs(
        (tmpvar_944 - tmpvar_947)
      )), 0.0);
      tmpvar_949 = (min (tmpvar_944, tmpvar_947) - ((
        (tmpvar_950 * tmpvar_950)
       * 0.25) / 0.5));
      vec3 tmpvar_951;
      tmpvar_951.x = (0.2 * tmpvar_942);
      tmpvar_951.y = (-0.2 * tmpvar_941);
      tmpvar_951.z = (-0.2 * tmpvar_942);
      float tmpvar_952;
      vec3 p_953;
      p_953 = (p_939 + tmpvar_951);
      tmpvar_952 = (sqrt(dot (p_953, p_953)) - 0.6621094);
      float tmpvar_954;
      float tmpvar_955;
      tmpvar_955 = max ((0.5 - abs(
        (tmpvar_949 - tmpvar_952)
      )), 0.0);
      tmpvar_954 = (min (tmpvar_949, tmpvar_952) - ((
        (tmpvar_955 * tmpvar_955)
       * 0.25) / 0.5));
      vec3 tmpvar_956;
      tmpvar_956.x = (-0.2 * tmpvar_940);
      tmpvar_956.y = (0.2 * tmpvar_941);
      tmpvar_956.z = (0.2 * tmpvar_942);
      float tmpvar_957;
      vec3 p_958;
      p_958 = (p_939 + tmpvar_956);
      tmpvar_957 = (sqrt(dot (p_958, p_958)) - 0.6035156);
      float tmpvar_959;
      float tmpvar_960;
      tmpvar_960 = max ((0.5 - abs(
        (tmpvar_954 - tmpvar_957)
      )), 0.0);
      tmpvar_959 = (min (tmpvar_954, tmpvar_957) - ((
        (tmpvar_960 * tmpvar_960)
       * 0.25) / 0.5));
      float tmpvar_961;
      tmpvar_961 = max ((0.05 - abs(
        (tmpvar_936 - tmpvar_959)
      )), 0.0);
      nor_858.x = ((min (tmpvar_884, tmpvar_911) - (
        ((tmpvar_913 * tmpvar_913) * 0.25)
       / 0.05)) - (min (tmpvar_936, tmpvar_959) - (
        ((tmpvar_961 * tmpvar_961) * 0.25)
       / 0.05)));
      vec3 p_962;
      p_962 = (pos_857 + vec3(0.0, 0.001, 0.0));
      vec3 tmpvar_963;
      tmpvar_963.x = sin(tmpvar_861);
      tmpvar_963.y = cos(tmpvar_862);
      tmpvar_963.z = sin(tmpvar_862);
      vec3 p_964;
      p_964 = (p_962 + tmpvar_963);
      float tmpvar_965;
      tmpvar_965 = sin(((tmpvar_864 + 111.0) * 0.55));
      float tmpvar_966;
      tmpvar_966 = sin(((tmpvar_864 + 222.0) * 0.47));
      float tmpvar_967;
      tmpvar_967 = sin(((tmpvar_864 + 333.0) * 0.38));
      vec3 tmpvar_968;
      tmpvar_968.x = (0.2 * tmpvar_965);
      tmpvar_968.y = (0.2 * tmpvar_966);
      tmpvar_968.z = (0.2 * tmpvar_965);
      float tmpvar_969;
      vec3 p_970;
      p_970 = (p_964 + tmpvar_968);
      tmpvar_969 = (sqrt(dot (p_970, p_970)) - 0.9707031);
      vec3 tmpvar_971;
      tmpvar_971.x = (0.2 * tmpvar_966);
      tmpvar_971.y = (-0.2 * tmpvar_965);
      tmpvar_971.z = (0.2 * tmpvar_965);
      float tmpvar_972;
      vec3 p_973;
      p_973 = (p_964 + tmpvar_971);
      tmpvar_972 = (sqrt(dot (p_973, p_973)) - 0.5429688);
      float tmpvar_974;
      float tmpvar_975;
      tmpvar_975 = max ((0.5 - abs(
        (tmpvar_969 - tmpvar_972)
      )), 0.0);
      tmpvar_974 = (min (tmpvar_969, tmpvar_972) - ((
        (tmpvar_975 * tmpvar_975)
       * 0.25) / 0.5));
      vec3 tmpvar_976;
      tmpvar_976.x = (0.2 * tmpvar_967);
      tmpvar_976.y = (-0.2 * tmpvar_966);
      tmpvar_976.z = (-0.2 * tmpvar_967);
      float tmpvar_977;
      vec3 p_978;
      p_978 = (p_964 + tmpvar_976);
      tmpvar_977 = (sqrt(dot (p_978, p_978)) - 0.7949219);
      float tmpvar_979;
      float tmpvar_980;
      tmpvar_980 = max ((0.5 - abs(
        (tmpvar_974 - tmpvar_977)
      )), 0.0);
      tmpvar_979 = (min (tmpvar_974, tmpvar_977) - ((
        (tmpvar_980 * tmpvar_980)
       * 0.25) / 0.5));
      vec3 tmpvar_981;
      tmpvar_981.x = (-0.2 * tmpvar_965);
      tmpvar_981.y = (0.2 * tmpvar_966);
      tmpvar_981.z = (0.2 * tmpvar_967);
      float tmpvar_982;
      vec3 p_983;
      p_983 = (p_964 + tmpvar_981);
      tmpvar_982 = (sqrt(dot (p_983, p_983)) - 0.6835938);
      float tmpvar_984;
      float tmpvar_985;
      tmpvar_985 = max ((0.5 - abs(
        (tmpvar_979 - tmpvar_982)
      )), 0.0);
      tmpvar_984 = (min (tmpvar_979, tmpvar_982) - ((
        (tmpvar_985 * tmpvar_985)
       * 0.25) / 0.5));
      vec3 tmpvar_986;
      tmpvar_986.x = cos((tmpvar_887 * 0.1));
      tmpvar_986.y = sin((tmpvar_888 * 0.3));
      tmpvar_986.z = cos(tmpvar_889);
      vec3 p_987;
      p_987 = (p_962 + tmpvar_986);
      float tmpvar_988;
      tmpvar_988 = sin(((tmpvar_891 + 444.0) * 0.55));
      float tmpvar_989;
      tmpvar_989 = sin(((tmpvar_891 + 888.0) * 0.47));
      float tmpvar_990;
      tmpvar_990 = sin(((tmpvar_891 + 1332.0) * 0.38));
      vec3 tmpvar_991;
      tmpvar_991.x = (0.2 * tmpvar_988);
      tmpvar_991.y = (0.2 * tmpvar_989);
      tmpvar_991.z = (0.2 * tmpvar_988);
      float tmpvar_992;
      vec3 p_993;
      p_993 = (p_987 + tmpvar_991);
      tmpvar_992 = (sqrt(dot (p_993, p_993)) - 0.6835938);
      vec3 tmpvar_994;
      tmpvar_994.x = (0.2 * tmpvar_989);
      tmpvar_994.y = (-0.2 * tmpvar_988);
      tmpvar_994.z = (0.2 * tmpvar_988);
      float tmpvar_995;
      vec3 p_996;
      p_996 = (p_987 + tmpvar_994);
      tmpvar_995 = (sqrt(dot (p_996, p_996)) - 0.5874023);
      float tmpvar_997;
      float tmpvar_998;
      tmpvar_998 = max ((0.5 - abs(
        (tmpvar_992 - tmpvar_995)
      )), 0.0);
      tmpvar_997 = (min (tmpvar_992, tmpvar_995) - ((
        (tmpvar_998 * tmpvar_998)
       * 0.25) / 0.5));
      vec3 tmpvar_999;
      tmpvar_999.x = (0.2 * tmpvar_990);
      tmpvar_999.y = (-0.2 * tmpvar_989);
      tmpvar_999.z = (-0.2 * tmpvar_990);
      float tmpvar_1000;
      vec3 p_1001;
      p_1001 = (p_987 + tmpvar_999);
      tmpvar_1000 = (sqrt(dot (p_1001, p_1001)) - 0.6621094);
      float tmpvar_1002;
      float tmpvar_1003;
      tmpvar_1003 = max ((0.5 - abs(
        (tmpvar_997 - tmpvar_1000)
      )), 0.0);
      tmpvar_1002 = (min (tmpvar_997, tmpvar_1000) - ((
        (tmpvar_1003 * tmpvar_1003)
       * 0.25) / 0.5));
      vec3 tmpvar_1004;
      tmpvar_1004.x = (-0.2 * tmpvar_988);
      tmpvar_1004.y = (0.2 * tmpvar_989);
      tmpvar_1004.z = (0.2 * tmpvar_990);
      float tmpvar_1005;
      vec3 p_1006;
      p_1006 = (p_987 + tmpvar_1004);
      tmpvar_1005 = (sqrt(dot (p_1006, p_1006)) - 0.6035156);
      float tmpvar_1007;
      float tmpvar_1008;
      tmpvar_1008 = max ((0.5 - abs(
        (tmpvar_1002 - tmpvar_1005)
      )), 0.0);
      tmpvar_1007 = (min (tmpvar_1002, tmpvar_1005) - ((
        (tmpvar_1008 * tmpvar_1008)
       * 0.25) / 0.5));
      float tmpvar_1009;
      tmpvar_1009 = max ((0.05 - abs(
        (tmpvar_984 - tmpvar_1007)
      )), 0.0);
      vec3 p_1010;
      p_1010 = (pos_857 - vec3(0.0, 0.001, 0.0));
      vec3 tmpvar_1011;
      tmpvar_1011.x = sin(tmpvar_861);
      tmpvar_1011.y = cos(tmpvar_862);
      tmpvar_1011.z = sin(tmpvar_862);
      vec3 p_1012;
      p_1012 = (p_1010 + tmpvar_1011);
      float tmpvar_1013;
      tmpvar_1013 = sin(((tmpvar_864 + 111.0) * 0.55));
      float tmpvar_1014;
      tmpvar_1014 = sin(((tmpvar_864 + 222.0) * 0.47));
      float tmpvar_1015;
      tmpvar_1015 = sin(((tmpvar_864 + 333.0) * 0.38));
      vec3 tmpvar_1016;
      tmpvar_1016.x = (0.2 * tmpvar_1013);
      tmpvar_1016.y = (0.2 * tmpvar_1014);
      tmpvar_1016.z = (0.2 * tmpvar_1013);
      float tmpvar_1017;
      vec3 p_1018;
      p_1018 = (p_1012 + tmpvar_1016);
      tmpvar_1017 = (sqrt(dot (p_1018, p_1018)) - 0.9707031);
      vec3 tmpvar_1019;
      tmpvar_1019.x = (0.2 * tmpvar_1014);
      tmpvar_1019.y = (-0.2 * tmpvar_1013);
      tmpvar_1019.z = (0.2 * tmpvar_1013);
      float tmpvar_1020;
      vec3 p_1021;
      p_1021 = (p_1012 + tmpvar_1019);
      tmpvar_1020 = (sqrt(dot (p_1021, p_1021)) - 0.5429688);
      float tmpvar_1022;
      float tmpvar_1023;
      tmpvar_1023 = max ((0.5 - abs(
        (tmpvar_1017 - tmpvar_1020)
      )), 0.0);
      tmpvar_1022 = (min (tmpvar_1017, tmpvar_1020) - ((
        (tmpvar_1023 * tmpvar_1023)
       * 0.25) / 0.5));
      vec3 tmpvar_1024;
      tmpvar_1024.x = (0.2 * tmpvar_1015);
      tmpvar_1024.y = (-0.2 * tmpvar_1014);
      tmpvar_1024.z = (-0.2 * tmpvar_1015);
      float tmpvar_1025;
      vec3 p_1026;
      p_1026 = (p_1012 + tmpvar_1024);
      tmpvar_1025 = (sqrt(dot (p_1026, p_1026)) - 0.7949219);
      float tmpvar_1027;
      float tmpvar_1028;
      tmpvar_1028 = max ((0.5 - abs(
        (tmpvar_1022 - tmpvar_1025)
      )), 0.0);
      tmpvar_1027 = (min (tmpvar_1022, tmpvar_1025) - ((
        (tmpvar_1028 * tmpvar_1028)
       * 0.25) / 0.5));
      vec3 tmpvar_1029;
      tmpvar_1029.x = (-0.2 * tmpvar_1013);
      tmpvar_1029.y = (0.2 * tmpvar_1014);
      tmpvar_1029.z = (0.2 * tmpvar_1015);
      float tmpvar_1030;
      vec3 p_1031;
      p_1031 = (p_1012 + tmpvar_1029);
      tmpvar_1030 = (sqrt(dot (p_1031, p_1031)) - 0.6835938);
      float tmpvar_1032;
      float tmpvar_1033;
      tmpvar_1033 = max ((0.5 - abs(
        (tmpvar_1027 - tmpvar_1030)
      )), 0.0);
      tmpvar_1032 = (min (tmpvar_1027, tmpvar_1030) - ((
        (tmpvar_1033 * tmpvar_1033)
       * 0.25) / 0.5));
      vec3 tmpvar_1034;
      tmpvar_1034.x = cos((tmpvar_887 * 0.1));
      tmpvar_1034.y = sin((tmpvar_888 * 0.3));
      tmpvar_1034.z = cos(tmpvar_889);
      vec3 p_1035;
      p_1035 = (p_1010 + tmpvar_1034);
      float tmpvar_1036;
      tmpvar_1036 = sin(((tmpvar_891 + 444.0) * 0.55));
      float tmpvar_1037;
      tmpvar_1037 = sin(((tmpvar_891 + 888.0) * 0.47));
      float tmpvar_1038;
      tmpvar_1038 = sin(((tmpvar_891 + 1332.0) * 0.38));
      vec3 tmpvar_1039;
      tmpvar_1039.x = (0.2 * tmpvar_1036);
      tmpvar_1039.y = (0.2 * tmpvar_1037);
      tmpvar_1039.z = (0.2 * tmpvar_1036);
      float tmpvar_1040;
      vec3 p_1041;
      p_1041 = (p_1035 + tmpvar_1039);
      tmpvar_1040 = (sqrt(dot (p_1041, p_1041)) - 0.6835938);
      vec3 tmpvar_1042;
      tmpvar_1042.x = (0.2 * tmpvar_1037);
      tmpvar_1042.y = (-0.2 * tmpvar_1036);
      tmpvar_1042.z = (0.2 * tmpvar_1036);
      float tmpvar_1043;
      vec3 p_1044;
      p_1044 = (p_1035 + tmpvar_1042);
      tmpvar_1043 = (sqrt(dot (p_1044, p_1044)) - 0.5874023);
      float tmpvar_1045;
      float tmpvar_1046;
      tmpvar_1046 = max ((0.5 - abs(
        (tmpvar_1040 - tmpvar_1043)
      )), 0.0);
      tmpvar_1045 = (min (tmpvar_1040, tmpvar_1043) - ((
        (tmpvar_1046 * tmpvar_1046)
       * 0.25) / 0.5));
      vec3 tmpvar_1047;
      tmpvar_1047.x = (0.2 * tmpvar_1038);
      tmpvar_1047.y = (-0.2 * tmpvar_1037);
      tmpvar_1047.z = (-0.2 * tmpvar_1038);
      float tmpvar_1048;
      vec3 p_1049;
      p_1049 = (p_1035 + tmpvar_1047);
      tmpvar_1048 = (sqrt(dot (p_1049, p_1049)) - 0.6621094);
      float tmpvar_1050;
      float tmpvar_1051;
      tmpvar_1051 = max ((0.5 - abs(
        (tmpvar_1045 - tmpvar_1048)
      )), 0.0);
      tmpvar_1050 = (min (tmpvar_1045, tmpvar_1048) - ((
        (tmpvar_1051 * tmpvar_1051)
       * 0.25) / 0.5));
      vec3 tmpvar_1052;
      tmpvar_1052.x = (-0.2 * tmpvar_1036);
      tmpvar_1052.y = (0.2 * tmpvar_1037);
      tmpvar_1052.z = (0.2 * tmpvar_1038);
      float tmpvar_1053;
      vec3 p_1054;
      p_1054 = (p_1035 + tmpvar_1052);
      tmpvar_1053 = (sqrt(dot (p_1054, p_1054)) - 0.6035156);
      float tmpvar_1055;
      float tmpvar_1056;
      tmpvar_1056 = max ((0.5 - abs(
        (tmpvar_1050 - tmpvar_1053)
      )), 0.0);
      tmpvar_1055 = (min (tmpvar_1050, tmpvar_1053) - ((
        (tmpvar_1056 * tmpvar_1056)
       * 0.25) / 0.5));
      float tmpvar_1057;
      tmpvar_1057 = max ((0.05 - abs(
        (tmpvar_1032 - tmpvar_1055)
      )), 0.0);
      nor_858.y = ((min (tmpvar_984, tmpvar_1007) - (
        ((tmpvar_1009 * tmpvar_1009) * 0.25)
       / 0.05)) - (min (tmpvar_1032, tmpvar_1055) - (
        ((tmpvar_1057 * tmpvar_1057) * 0.25)
       / 0.05)));
      vec3 p_1058;
      p_1058 = (pos_857 + vec3(0.0, 0.0, 0.001));
      vec3 tmpvar_1059;
      tmpvar_1059.x = sin(tmpvar_861);
      tmpvar_1059.y = cos(tmpvar_862);
      tmpvar_1059.z = sin(tmpvar_862);
      vec3 p_1060;
      p_1060 = (p_1058 + tmpvar_1059);
      float tmpvar_1061;
      tmpvar_1061 = sin(((tmpvar_864 + 111.0) * 0.55));
      float tmpvar_1062;
      tmpvar_1062 = sin(((tmpvar_864 + 222.0) * 0.47));
      float tmpvar_1063;
      tmpvar_1063 = sin(((tmpvar_864 + 333.0) * 0.38));
      vec3 tmpvar_1064;
      tmpvar_1064.x = (0.2 * tmpvar_1061);
      tmpvar_1064.y = (0.2 * tmpvar_1062);
      tmpvar_1064.z = (0.2 * tmpvar_1061);
      float tmpvar_1065;
      vec3 p_1066;
      p_1066 = (p_1060 + tmpvar_1064);
      tmpvar_1065 = (sqrt(dot (p_1066, p_1066)) - 0.9707031);
      vec3 tmpvar_1067;
      tmpvar_1067.x = (0.2 * tmpvar_1062);
      tmpvar_1067.y = (-0.2 * tmpvar_1061);
      tmpvar_1067.z = (0.2 * tmpvar_1061);
      float tmpvar_1068;
      vec3 p_1069;
      p_1069 = (p_1060 + tmpvar_1067);
      tmpvar_1068 = (sqrt(dot (p_1069, p_1069)) - 0.5429688);
      float tmpvar_1070;
      float tmpvar_1071;
      tmpvar_1071 = max ((0.5 - abs(
        (tmpvar_1065 - tmpvar_1068)
      )), 0.0);
      tmpvar_1070 = (min (tmpvar_1065, tmpvar_1068) - ((
        (tmpvar_1071 * tmpvar_1071)
       * 0.25) / 0.5));
      vec3 tmpvar_1072;
      tmpvar_1072.x = (0.2 * tmpvar_1063);
      tmpvar_1072.y = (-0.2 * tmpvar_1062);
      tmpvar_1072.z = (-0.2 * tmpvar_1063);
      float tmpvar_1073;
      vec3 p_1074;
      p_1074 = (p_1060 + tmpvar_1072);
      tmpvar_1073 = (sqrt(dot (p_1074, p_1074)) - 0.7949219);
      float tmpvar_1075;
      float tmpvar_1076;
      tmpvar_1076 = max ((0.5 - abs(
        (tmpvar_1070 - tmpvar_1073)
      )), 0.0);
      tmpvar_1075 = (min (tmpvar_1070, tmpvar_1073) - ((
        (tmpvar_1076 * tmpvar_1076)
       * 0.25) / 0.5));
      vec3 tmpvar_1077;
      tmpvar_1077.x = (-0.2 * tmpvar_1061);
      tmpvar_1077.y = (0.2 * tmpvar_1062);
      tmpvar_1077.z = (0.2 * tmpvar_1063);
      float tmpvar_1078;
      vec3 p_1079;
      p_1079 = (p_1060 + tmpvar_1077);
      tmpvar_1078 = (sqrt(dot (p_1079, p_1079)) - 0.6835938);
      float tmpvar_1080;
      float tmpvar_1081;
      tmpvar_1081 = max ((0.5 - abs(
        (tmpvar_1075 - tmpvar_1078)
      )), 0.0);
      tmpvar_1080 = (min (tmpvar_1075, tmpvar_1078) - ((
        (tmpvar_1081 * tmpvar_1081)
       * 0.25) / 0.5));
      vec3 tmpvar_1082;
      tmpvar_1082.x = cos((tmpvar_887 * 0.1));
      tmpvar_1082.y = sin((tmpvar_888 * 0.3));
      tmpvar_1082.z = cos(tmpvar_889);
      vec3 p_1083;
      p_1083 = (p_1058 + tmpvar_1082);
      float tmpvar_1084;
      tmpvar_1084 = sin(((tmpvar_891 + 444.0) * 0.55));
      float tmpvar_1085;
      tmpvar_1085 = sin(((tmpvar_891 + 888.0) * 0.47));
      float tmpvar_1086;
      tmpvar_1086 = sin(((tmpvar_891 + 1332.0) * 0.38));
      vec3 tmpvar_1087;
      tmpvar_1087.x = (0.2 * tmpvar_1084);
      tmpvar_1087.y = (0.2 * tmpvar_1085);
      tmpvar_1087.z = (0.2 * tmpvar_1084);
      float tmpvar_1088;
      vec3 p_1089;
      p_1089 = (p_1083 + tmpvar_1087);
      tmpvar_1088 = (sqrt(dot (p_1089, p_1089)) - 0.6835938);
      vec3 tmpvar_1090;
      tmpvar_1090.x = (0.2 * tmpvar_1085);
      tmpvar_1090.y = (-0.2 * tmpvar_1084);
      tmpvar_1090.z = (0.2 * tmpvar_1084);
      float tmpvar_1091;
      vec3 p_1092;
      p_1092 = (p_1083 + tmpvar_1090);
      tmpvar_1091 = (sqrt(dot (p_1092, p_1092)) - 0.5874023);
      float tmpvar_1093;
      float tmpvar_1094;
      tmpvar_1094 = max ((0.5 - abs(
        (tmpvar_1088 - tmpvar_1091)
      )), 0.0);
      tmpvar_1093 = (min (tmpvar_1088, tmpvar_1091) - ((
        (tmpvar_1094 * tmpvar_1094)
       * 0.25) / 0.5));
      vec3 tmpvar_1095;
      tmpvar_1095.x = (0.2 * tmpvar_1086);
      tmpvar_1095.y = (-0.2 * tmpvar_1085);
      tmpvar_1095.z = (-0.2 * tmpvar_1086);
      float tmpvar_1096;
      vec3 p_1097;
      p_1097 = (p_1083 + tmpvar_1095);
      tmpvar_1096 = (sqrt(dot (p_1097, p_1097)) - 0.6621094);
      float tmpvar_1098;
      float tmpvar_1099;
      tmpvar_1099 = max ((0.5 - abs(
        (tmpvar_1093 - tmpvar_1096)
      )), 0.0);
      tmpvar_1098 = (min (tmpvar_1093, tmpvar_1096) - ((
        (tmpvar_1099 * tmpvar_1099)
       * 0.25) / 0.5));
      vec3 tmpvar_1100;
      tmpvar_1100.x = (-0.2 * tmpvar_1084);
      tmpvar_1100.y = (0.2 * tmpvar_1085);
      tmpvar_1100.z = (0.2 * tmpvar_1086);
      float tmpvar_1101;
      vec3 p_1102;
      p_1102 = (p_1083 + tmpvar_1100);
      tmpvar_1101 = (sqrt(dot (p_1102, p_1102)) - 0.6035156);
      float tmpvar_1103;
      float tmpvar_1104;
      tmpvar_1104 = max ((0.5 - abs(
        (tmpvar_1098 - tmpvar_1101)
      )), 0.0);
      tmpvar_1103 = (min (tmpvar_1098, tmpvar_1101) - ((
        (tmpvar_1104 * tmpvar_1104)
       * 0.25) / 0.5));
      float tmpvar_1105;
      tmpvar_1105 = max ((0.05 - abs(
        (tmpvar_1080 - tmpvar_1103)
      )), 0.0);
      vec3 p_1106;
      p_1106 = (pos_857 - vec3(0.0, 0.0, 0.001));
      vec3 tmpvar_1107;
      tmpvar_1107.x = sin(tmpvar_861);
      tmpvar_1107.y = cos(tmpvar_862);
      tmpvar_1107.z = sin(tmpvar_862);
      vec3 p_1108;
      p_1108 = (p_1106 + tmpvar_1107);
      float tmpvar_1109;
      tmpvar_1109 = sin(((tmpvar_864 + 111.0) * 0.55));
      float tmpvar_1110;
      tmpvar_1110 = sin(((tmpvar_864 + 222.0) * 0.47));
      float tmpvar_1111;
      tmpvar_1111 = sin(((tmpvar_864 + 333.0) * 0.38));
      vec3 tmpvar_1112;
      tmpvar_1112.x = (0.2 * tmpvar_1109);
      tmpvar_1112.y = (0.2 * tmpvar_1110);
      tmpvar_1112.z = (0.2 * tmpvar_1109);
      float tmpvar_1113;
      vec3 p_1114;
      p_1114 = (p_1108 + tmpvar_1112);
      tmpvar_1113 = (sqrt(dot (p_1114, p_1114)) - 0.9707031);
      vec3 tmpvar_1115;
      tmpvar_1115.x = (0.2 * tmpvar_1110);
      tmpvar_1115.y = (-0.2 * tmpvar_1109);
      tmpvar_1115.z = (0.2 * tmpvar_1109);
      float tmpvar_1116;
      vec3 p_1117;
      p_1117 = (p_1108 + tmpvar_1115);
      tmpvar_1116 = (sqrt(dot (p_1117, p_1117)) - 0.5429688);
      float tmpvar_1118;
      float tmpvar_1119;
      tmpvar_1119 = max ((0.5 - abs(
        (tmpvar_1113 - tmpvar_1116)
      )), 0.0);
      tmpvar_1118 = (min (tmpvar_1113, tmpvar_1116) - ((
        (tmpvar_1119 * tmpvar_1119)
       * 0.25) / 0.5));
      vec3 tmpvar_1120;
      tmpvar_1120.x = (0.2 * tmpvar_1111);
      tmpvar_1120.y = (-0.2 * tmpvar_1110);
      tmpvar_1120.z = (-0.2 * tmpvar_1111);
      float tmpvar_1121;
      vec3 p_1122;
      p_1122 = (p_1108 + tmpvar_1120);
      tmpvar_1121 = (sqrt(dot (p_1122, p_1122)) - 0.7949219);
      float tmpvar_1123;
      float tmpvar_1124;
      tmpvar_1124 = max ((0.5 - abs(
        (tmpvar_1118 - tmpvar_1121)
      )), 0.0);
      tmpvar_1123 = (min (tmpvar_1118, tmpvar_1121) - ((
        (tmpvar_1124 * tmpvar_1124)
       * 0.25) / 0.5));
      vec3 tmpvar_1125;
      tmpvar_1125.x = (-0.2 * tmpvar_1109);
      tmpvar_1125.y = (0.2 * tmpvar_1110);
      tmpvar_1125.z = (0.2 * tmpvar_1111);
      float tmpvar_1126;
      vec3 p_1127;
      p_1127 = (p_1108 + tmpvar_1125);
      tmpvar_1126 = (sqrt(dot (p_1127, p_1127)) - 0.6835938);
      float tmpvar_1128;
      float tmpvar_1129;
      tmpvar_1129 = max ((0.5 - abs(
        (tmpvar_1123 - tmpvar_1126)
      )), 0.0);
      tmpvar_1128 = (min (tmpvar_1123, tmpvar_1126) - ((
        (tmpvar_1129 * tmpvar_1129)
       * 0.25) / 0.5));
      vec3 tmpvar_1130;
      tmpvar_1130.x = cos((tmpvar_887 * 0.1));
      tmpvar_1130.y = sin((tmpvar_888 * 0.3));
      tmpvar_1130.z = cos(tmpvar_889);
      vec3 p_1131;
      p_1131 = (p_1106 + tmpvar_1130);
      float tmpvar_1132;
      tmpvar_1132 = sin(((tmpvar_891 + 444.0) * 0.55));
      float tmpvar_1133;
      tmpvar_1133 = sin(((tmpvar_891 + 888.0) * 0.47));
      float tmpvar_1134;
      tmpvar_1134 = sin(((tmpvar_891 + 1332.0) * 0.38));
      vec3 tmpvar_1135;
      tmpvar_1135.x = (0.2 * tmpvar_1132);
      tmpvar_1135.y = (0.2 * tmpvar_1133);
      tmpvar_1135.z = (0.2 * tmpvar_1132);
      float tmpvar_1136;
      vec3 p_1137;
      p_1137 = (p_1131 + tmpvar_1135);
      tmpvar_1136 = (sqrt(dot (p_1137, p_1137)) - 0.6835938);
      vec3 tmpvar_1138;
      tmpvar_1138.x = (0.2 * tmpvar_1133);
      tmpvar_1138.y = (-0.2 * tmpvar_1132);
      tmpvar_1138.z = (0.2 * tmpvar_1132);
      float tmpvar_1139;
      vec3 p_1140;
      p_1140 = (p_1131 + tmpvar_1138);
      tmpvar_1139 = (sqrt(dot (p_1140, p_1140)) - 0.5874023);
      float tmpvar_1141;
      float tmpvar_1142;
      tmpvar_1142 = max ((0.5 - abs(
        (tmpvar_1136 - tmpvar_1139)
      )), 0.0);
      tmpvar_1141 = (min (tmpvar_1136, tmpvar_1139) - ((
        (tmpvar_1142 * tmpvar_1142)
       * 0.25) / 0.5));
      vec3 tmpvar_1143;
      tmpvar_1143.x = (0.2 * tmpvar_1134);
      tmpvar_1143.y = (-0.2 * tmpvar_1133);
      tmpvar_1143.z = (-0.2 * tmpvar_1134);
      float tmpvar_1144;
      vec3 p_1145;
      p_1145 = (p_1131 + tmpvar_1143);
      tmpvar_1144 = (sqrt(dot (p_1145, p_1145)) - 0.6621094);
      float tmpvar_1146;
      float tmpvar_1147;
      tmpvar_1147 = max ((0.5 - abs(
        (tmpvar_1141 - tmpvar_1144)
      )), 0.0);
      tmpvar_1146 = (min (tmpvar_1141, tmpvar_1144) - ((
        (tmpvar_1147 * tmpvar_1147)
       * 0.25) / 0.5));
      vec3 tmpvar_1148;
      tmpvar_1148.x = (-0.2 * tmpvar_1132);
      tmpvar_1148.y = (0.2 * tmpvar_1133);
      tmpvar_1148.z = (0.2 * tmpvar_1134);
      float tmpvar_1149;
      vec3 p_1150;
      p_1150 = (p_1131 + tmpvar_1148);
      tmpvar_1149 = (sqrt(dot (p_1150, p_1150)) - 0.6035156);
      float tmpvar_1151;
      float tmpvar_1152;
      tmpvar_1152 = max ((0.5 - abs(
        (tmpvar_1146 - tmpvar_1149)
      )), 0.0);
      tmpvar_1151 = (min (tmpvar_1146, tmpvar_1149) - ((
        (tmpvar_1152 * tmpvar_1152)
       * 0.25) / 0.5));
      float tmpvar_1153;
      tmpvar_1153 = max ((0.05 - abs(
        (tmpvar_1128 - tmpvar_1151)
      )), 0.0);
      nor_858.z = ((min (tmpvar_1080, tmpvar_1103) - (
        ((tmpvar_1105 * tmpvar_1105) * 0.25)
       / 0.05)) - (min (tmpvar_1128, tmpvar_1151) - (
        ((tmpvar_1153 * tmpvar_1153) * 0.25)
       / 0.05)));
      currNor = normalize(nor_858);
    } else {
      currHit = bool(0);
    };
    if (currHit) {
      vec3 tmpvar_1154;
      tmpvar_1154 = normalize((tmpvar_2 - (2.0 *
        (dot (currNor, tmpvar_2) * currNor)
      )));
      vec3 tmpvar_1155;
      tmpvar_1155 = (((
        cos(((tmpvar_1154.y * 3.0) + (uTime * 0.3)))
       +
        sin((((tmpvar_1154.x +
          cos(((3.0 * tmpvar_1154.y) + (uTime * 0.78)))
        ) + tmpvar_1154.x) + uTime))
      ) * 5.1) - vec3(1.8, 1.14, 0.3));
      vec3 tmpvar_1156;
      tmpvar_1156 = max (normalize((tmpvar_2 * currNor)), vec3(0.0, 0.0, 0.0));
      float tmpvar_1157;
      tmpvar_1157 = pow (min ((
        (tmpvar_1156.x + tmpvar_1156.y)
       + tmpvar_1156.z), 1.0), 1.3);
      col_775 = max (min (tmpvar_799, (vec3(1.0, 1.0, 1.0) - vec3(tmpvar_1157))), (cos(
        (1.9 * sin((1.0 - (tmpvar_1155 * tmpvar_1155))))
      ) * tmpvar_1157));
    };
    col_3 = mix (tmpvar_773, col_775, 0.3);
  };
  gl_FragColor.xyz = col_3;
}
