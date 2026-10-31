include <BOSL2/std.scad>

$fn=100;


// FSN100
sleuf=2.8;


// GKS 55
width=147;
front_height=11;
back_height=9;

// Adapter
length=40;
excentric = 3.5;


module foot(slee_hoogte) {
difference(){

    cuboid([width+14, length+7, slee_hoogte+7], anchor=BOTTOM, chamfer=2, edges=[FWD+RIGHT,BACK+LEFT, FWD+LEFT,BACK+RIGHT]);
    up(7) fwd(3.5) cuboid([width, length, 11], anchor=BOTTOM);
    
    up(3.5/2) left(48) right(excentric-(54.6-sleuf) /2) cuboid([sleuf, length+7, 3.5]);
    
    // STRIP
    up(3) cuboid([15.5, length+7, 2.1], anchor=BOTTOM);
    
    // SCREW
    up(1) zcyl(d=4,h=5);
    up(0) zrot(45) cuboid([10, 10, 1.5], anchor=BOTTOM);
}
 
down(3) right(excentric) left(48) prismoid(size1=[49,length+7], size2=[48,length+7], h=3, shift=[-.5,0]);

up(7+slee_hoogte) right((width+17)/2-10) cuboid([10+7, length+7, 3], anchor=BOTTOM, chamfer=2, edges=[FWD+RIGHT, FWD+LEFT,BACK+RIGHT]);
//up(7+slee_hoogte) back(10) cuboid([width, 10+7, 3], anchor=BOTTOM);
up(7+slee_hoogte) back(length/2) cuboid([width, 7, 3], anchor=BOTTOM);

up(7+slee_hoogte) left((width+17)/2-10) cuboid([17, length+7, 3], anchor=BOTTOM, chamfer=2, edges=[FWD+RIGHT,BACK+LEFT, FWD+LEFT]);

}

foot(front_height);
fwd(100) yflip() foot(back_height);