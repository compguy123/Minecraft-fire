#version 150

in vec4 vPosition;
in vec4 vColor;
out vec4 color;

uniform mat4 ModelView;
uniform mat4 Projection;
uniform mat4 Look;
uniform mat4 Transformation;
uniform mat4 FireCheck;

uniform vec4 Color;
uniform vec4 ColorEnd;
uniform int Object;


void main() 
{
//object 1 is floor , 2 is logs , 3 is fire 
      // Set color based on gl_VertexID
if(Object == 1){
    float centerVertex = 300.0f; // beacuse i had 600 points to draw a face

    //interporate so vertex away from center get a darker shade of green
     color = mix(Color * vColor, ColorEnd * vColor ,abs(( centerVertex - gl_VertexID)) /  centerVertex); 
    color = color * vColor;
 }else{
    if(Object==2){

    //every 5 th veretx in the log is dark to give a  texture feel 
        if(gl_VertexID%5==0){
        color =vColor*Color/2;
        }else{
        color=vColor*Color;
        }
    }else{
      //the fire is a little brigher
        color= vColor*Color*1.2;
  
        }

 }
 
    gl_Position = Projection *Look *FireCheck* Transformation * ModelView * vPosition;
   
 }
