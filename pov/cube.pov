// cube.pov created by IVREAD.
// Original data in cube.iv
 
#version 3.0
#include "colors.inc"
#include "shapes.inc"
global_settings { assumed_gamma 2.2 }
 
camera { 
 right < 4/3, 0, 0>
 up < 0, 1, 0 >
 sky < 0, 1, 0 >
 angle 20
 location < 0, 0, -300 >
 look_at < 0, 0, 0>
}
 
light_source { < 20, 50, -100 > color White }
 
background { color SkyBlue }
 
#declare RedText = texture { 
  pigment { color rgb < 0.8, 0.2, 0.2> } 
  finish { ambient 0.2 diffuse 0.5 }
}
 
#declare GreenText = texture { 
  pigment { color rgb < 0.2, 0.8, 0.2> } 
  finish { ambient 0.2 diffuse 0.5 }
}
 
#declare BlueText = texture { 
  pigment { color rgb < 0.2, 0.2, 0.8> } 
  finish { ambient 0.2 diffuse 0.5 }
}
mesh {
  smooth_triangle { 
< -0.500, -0.500, 1.000>, < 0.00, 0.00, 1.00>,
< 0.500, -0.500, 1.000>, < 0.00, 0.00, 1.00>,
< 0.500, 0.500, 1.000>, < 0.00, 0.00, 1.00>
texture { RedText } }
  smooth_triangle { 
< -0.500, -0.500, 1.000>, < 0.00, 0.00, 1.00>,
< 0.500, 0.500, 1.000>, < 0.00, 0.00, 1.00>,
< -0.500, 0.500, 1.000>, < 0.00, 0.00, 1.00>
texture { RedText } }
  smooth_triangle { 
< 0.500, -0.500, 0.000>, < 0.00, 0.00, -1.00>,
< -0.500, -0.500, 0.000>, < 0.00, 0.00, -1.00>,
< -0.500, 0.500, 0.000>, < 0.00, 0.00, -1.00>
texture { BlueText } }
  smooth_triangle { 
< 0.500, -0.500, 0.000>, < 0.00, 0.00, -1.00>,
< -0.500, 0.500, 0.000>, < 0.00, 0.00, -1.00>,
< 0.500, 0.500, 0.000>, < 0.00, 0.00, -1.00>
texture { BlueText } }
  smooth_triangle { 
< -0.500, -0.500, 0.000>, < -1.00, 0.00, 0.00>,
< -0.500, -0.500, 1.000>, < -1.00, 0.00, 0.00>,
< -0.500, 0.500, 1.000>, < -1.00, 0.00, 0.00>
texture { GreenText } }
  smooth_triangle { 
< -0.500, -0.500, 0.000>, < -1.00, 0.00, 0.00>,
< -0.500, 0.500, 1.000>, < -1.00, 0.00, 0.00>,
< -0.500, 0.500, 0.000>, < -1.00, 0.00, 0.00>
texture { GreenText } }
  smooth_triangle { 
< 0.500, -0.500, 1.000>, < 1.00, 0.00, 0.00>,
< 0.500, -0.500, 0.000>, < 1.00, 0.00, 0.00>,
< 0.500, 0.500, 0.000>, < 1.00, 0.00, 0.00>
texture { BlueText } }
  smooth_triangle { 
< 0.500, -0.500, 1.000>, < 1.00, 0.00, 0.00>,
< 0.500, 0.500, 0.000>, < 1.00, 0.00, 0.00>,
< 0.500, 0.500, 1.000>, < 1.00, 0.00, 0.00>
texture { BlueText } }
  smooth_triangle { 
< -0.500, -0.500, 0.000>, < 0.00, -1.00, 0.00>,
< 0.500, -0.500, 0.000>, < 0.00, -1.00, 0.00>,
< 0.500, -0.500, 1.000>, < 0.00, -1.00, 0.00>
texture { GreenText } }
  smooth_triangle { 
< -0.500, -0.500, 0.000>, < 0.00, -1.00, 0.00>,
< 0.500, -0.500, 1.000>, < 0.00, -1.00, 0.00>,
< -0.500, -0.500, 1.000>, < 0.00, -1.00, 0.00>
texture { GreenText } }
  smooth_triangle { 
< -0.500, 0.500, 1.000>, < 0.00, 1.00, 0.00>,
< 0.500, 0.500, 1.000>, < 0.00, 1.00, 0.00>,
< 0.500, 0.500, 0.000>, < 0.00, 1.00, 0.00>
texture { BlueText } }
  smooth_triangle { 
< -0.500, 0.500, 1.000>, < 0.00, 1.00, 0.00>,
< 0.500, 0.500, 0.000>, < 0.00, 1.00, 0.00>,
< -0.500, 0.500, 0.000>, < 0.00, 1.00, 0.00>
texture { BlueText } }
}
