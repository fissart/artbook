if(!settings.multipleView) settings.batchView=false;
defaultfilename="artbook-33";
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

settings.render=-1;
import graph3;
import solids;
size(300,0);
currentprojection=perspective(3,3,1);

pen color1=green+opacity(0.25);
pen color2=red;
real alpha=350;

real f(real x) {return 2x^2-x^3;}
pair F(real x) {return (x,f(x));}
triple F3(real x) {return (x,f(x),0);}

ngraph=12;

real x1=0.7476;
real x2=1.7787;
real x3=1.8043;

path[] p={graph(F,x1,x2,Spline),
graph(F,0.7,x1,Spline)--graph(F,x2,x3,Spline)&cycle,
graph(F,0,0.7,Spline)--graph(F,x3,2,Spline)};

pen[] pn=new pen[] {color1,color2,color1};

render render=render(compression=0);

for(int i=0; i < p.length; ++i) {
revolution a=revolution(path3(p[i]),Y,0.5,alpha);
draw(surface(a),pn[i],render);

surface s=surface(p[i]--cycle);
draw(s,pn[i],render);
draw(rotate(alpha,Y)*s,pn[i],render);
}

draw((4/3,0,0)--F3(4/3),dashed);
xtick("$\frac{4}{3}$",(4/3,0,0));

xaxis3(Label("$x$",1),Arrow3);
zaxis3(Label("$z$",1),Arrow3);
yaxis3(Label("$y$",1),ymax=1.25,dashed,Arrow3);
arrow("$y=2x^2-x^3$",F3(1.6),X+Y,0.75cm,red);
draw(arc(1.1Y,0.3,90,0,7.5,180),Arrow3);
