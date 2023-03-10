if(!settings.multipleView) settings.batchView=false;
defaultfilename="artbook-26";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

settings.prc=false;
defaultpen(fontsize(11 pt));
defaultpen(linewidth(0.7pt));
//settings.render=1;

import three;
import math;
import solids;
currentprojection=perspective(1,1,1);
size(200,0);
real rho=1, phi=60, z=1.5/2;
real r=1.1;
pen p=black;
draw(Label("$x$",1),O--r*X,p,Arrow3);
draw(Label("$y$",1),O--r*Y,p,Arrow3);
draw(Label("$z$",1),O--r*Z,p,Arrow3);
label("$\rm O$",(0,0,0),-1.5Y-X);
triple Q=(rho*Cos(phi),rho*Sin(phi),z);
dot("$(x,y,z)$",Q);
draw(Q--(Q.x,Q.y,0),dashed+blue);
draw(O--rho*dir(90,phi),dashed+blue);
draw((0,0,Q.z)--Q,dashed+blue);
draw("$\varphi$",arc(O,0.15*X,0.15*dir(90,phi)),align=6*dir(90,phi/3)+Z,Arrow3);
draw("$\rho$",(0,0,0)--(Q.x,Q.y,0),align=-Y+2X,DotMargin3);
draw("$r$",O--Q,align=2*dir(90,phi),Arrow3,DotMargin3);
revolution hyperboloid=revolution(graph(new triple(real z) {return (1,0,z);},0,1.5,20,operator ..),axis=Z);
draw(surface(hyperboloid),yellow+opacity(0.3),render(compression=Low,merge=true));
draw(hyperboloid,3,orange+0.15mm,longitudinalpen=nullpen);
