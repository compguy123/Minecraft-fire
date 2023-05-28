#version 150

in vec4 color;

out vec4 fColor;

uniform int Object;
uniform float ScreenHeight;


void main()
{
 
 //object 1 is floor , 2 is logs , 3 is fire 
 // this is to use the lerp function. THe farther a value goes from center, the more intese
float center = ScreenHeight / 2.0;
float distance = abs(gl_FragCoord.y - center);
float max_distance = center ;
float fog = (max_distance - distance) / max_distance;
//make fog max 0 or 1 so the ratio is consitent 
fog = clamp(fog, 0.0, 1);
   if (Object == 1 ) {
  // i use the lerp to add fog on the grass
vec4 fogColor = mix(vec4(0.4, .4, .4, 1.0)*3, color, fog);
      fColor =fogColor;
   } else if (Object == 2) {

// i use lerp to add redness to logs. 
vec4 fogColor = mix(vec4(0.6, 0, 0, 1.0)*3, color, fog);
      fColor= fogColor;
   } else {
      fColor =color;
   }


}
