wall = 2;
w = 54;
d = 71;
h = 20;


difference(){ // main case (no top, no cable manager)
    cube(size = [w+(2*wall),d+(2*wall),h+(2*wall)]); // main  box
    union(){
        union(){
            union(){
                union(){
                    union(){
                        union(){
                            translate([wall,wall,wall]){ // thickness of the walls
                                cube(size = [w,d,h+(2*wall)]); // inner cube
                            }
                            translate([9+wall,-1,1.5 + wall]){ // usb hole
                                cube(size = [13,13,22]);
                            }
                        }
                        translate([45+wall,6,8+wall]){ // charger hall
                            rotate([90,0,0]){
                                cylinder(h=8, r1=5, r2=5);
                                }
                            }
                    }
                    translate([2+wall,18 + wall,-1]){ // bottom left hole
                        cylinder(h=7, r1=1.5, r2=1.5, $fn=20);
                    }
                }
                translate([52+ wall,18 + wall,-1]){ // bottom right hole
                    cylinder(h=7, r1=1.5, r2=1.5, $fn=20);
                }
            }
            translate([18+wall,68 + wall,-1]){ // top left hole
                cylinder(h=7, r1=1.5, r2=1.5, $fn=20);
            }
        }
        translate([46 + wall,68 + wall,-1]){ // top right hole
            cylinder(h=7, r1=1.5, r2=1.5, $fn=20);
        }
    }
}

translate([-60,0,0]){//floor of the cable manager
    cube(size = [60,150,wall]);
}
difference(){
    intersection(){
        translate([-30,10,0]){
            rotate([0,90,0]){
                cylinder(h = 5, r1 = 23, r2 = 23,$fn=60);
            }
        }

        translate([-30,10,0]){
            cube(23);
        }
    }
    
    translate([-31,10,0]){
            rotate([0,90,0]){
                cylinder(h = 7, r1 = 20, r2 = 20,$fn=60);
            }
        }
}

translate([-30,140,0]){
    rotate([0,90,0]){
        cylinder(h = 5, r1 = 20, r2 = 20);
    }
}