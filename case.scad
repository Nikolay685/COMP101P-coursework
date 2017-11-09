wall = 2;
w = 54;
d = 71;
h = 20;

translate([100,0,0]){ // top of the case
    difference(){
        cube(size = [w+(4*wall),d+(4*wall),10]);
        
        union(){
            union(){
                translate([2,2,2]){
                    cube(size = [w+(2*wall),d+(2*wall),10]);
                }
                translate([w+wall-1,23,0]){
                    cube(size = [4,50, 3]);
                }
            }
            translate([wall+1,33,0]){
                cube(size = [4,40, 3]);
            }
        }
    }
}
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
                                cube(size = [13,13,21]);
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
translate([0,-75,0]){ // Cable manager
    union(){
        union(){
            translate([-60,0,0]){//floor of the cable manager
                cube(size = [60,150,wall]);
            }

            union(){
                difference(){ // bottom hindge
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

                difference(){ // top hindge
                    intersection(){
                        translate([-30,140,0]){
                            rotate([0,90,0]){
                                cylinder(h = 5, r1 = 23, r2 = 23,$fn=60);
                            }
                        }

                        translate([-30,117,0]){
                            cube(23);
                        }
                    }
                    translate([-31,140,0]){
                        rotate([0,90,0]){
                            cylinder(h = 7, r1 = 20, r2 = 20,$fn=60);
                        }
                    }
                }
            }
        }
        
        difference(){ // cable holders
            union(){
                translate([-55,45,0]){
                    cube(size = [7,5,5.8]);
                }
                
                translate([-55,98,0]){
                    cube(size = [7,5,5.8]);
                }
            }
            
            translate([-51.5,120,4.5]){
                rotate([90,0,0]){
                    cylinder(h = 100, r1 = 2.5, r2 = 2.5, $fn = 60);
                }
            }
        }
        difference(){
            translate([-13,75,2]){
                cube(size = [13,75,13]);
            }
            translate([-13,150,15]){
                rotate([90,0,0]){
                    cylinder(h = 75, r1 = 13, r2 = 13, $fn = 60);
                }
            }
        }   
    }
}