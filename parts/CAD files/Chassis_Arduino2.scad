$fn = 64;


baseThickness = 2.4;
cornerRounding = 8;
plateOffset = 7;    // shift entire plate on x axis
railOffset = 16;     // plate lenght - railLength
M3holeDia = 3.5;
M3nutDia = 6.5;
holeOffset = M3holeDia * 1.2;
batteryOffset = 20;

cassis_wid = 94; // 94 for full Raspberry Pi, 84 for A+ ?
cassis_len = 144;

xArduinoOffset = 20;
yArduinoOffset = -4;

penDiameter = 15.0;
penRadius = penDiameter / 2;
baseLen = 34.5;
baseWid = 20;

railWidth = 4;

cutout_len = 45;
cutout_wid = 15;

difference(){
    
    union(){
        // cassis plate
        translate([-cassis_len / 2 - plateOffset, -cassis_wid / 2, 0])
        roundedCube(cassis_len, cassis_wid, baseThickness, cornerRounding);
        
        // rail
        translate([-cassis_len / 2 - plateOffset, 
                   cassis_wid / 2 - 25 + railWidth, baseThickness / 2])
            rotate([90, 0, 0])    
            roundedCube(cassis_len, 4, railWidth, 1);
        
        //rail
        translate([-cassis_len / 2 - plateOffset, 
                   -cassis_wid / 2 + 25, baseThickness / 2])
            rotate([90, 0, 0])    
            roundedCube(cassis_len, 4, railWidth, 1); 
     
        // Arduino mount standoffs
        rotate([0, 0, -90])
        translate([-40, -74, 0])
        union(){


        // Arduino mounts lower left (power jack)
        translate([xArduinoOffset, yArduinoOffset + 2.5, 0])
        color("lightblue")
        cylinder(standoffThickness, standoffDia / 2, standoffDia / 2);

        // upper left (USB)
        translate([xArduinoOffset + 1.3, yArduinoOffset+ (53.3 - 2.5), 0])
        color("lightblue")
        cylinder(standoffThickness, standoffDia / 2, standoffDia / 2);

        // upper right
        translate([xArduinoOffset + 1.3 + 50.8, yArduinoOffset +(53.3 - 2.5 - 15.2), 0])
        color("lightblue")
        cylinder(standoffThickness, standoffDia / 2, standoffDia / 2);

        // lower right
        translate([xArduinoOffset + 1.3 + 50.8, yArduinoOffset + (53.3 - 2.5 - 15.2 - 27.9), 0])
        color("lightblue")
        cylinder(standoffThickness, standoffDia / 2, standoffDia / 2);
        }
        
        //battery standoffs
        translate([batteryOffset, 0, baseThickness - 1])
        cylinder(baseThickness, d=standoffDia + 1, d=standoffDia + 1);  
        translate([batteryOffset + 15, 0, baseThickness - 1])
        cylinder(baseThickness, d=standoffDia + 1, d=standoffDia + 1);
        translate([batteryOffset + 30, 0, baseThickness - 1])
        cylinder(baseThickness, d=standoffDia + 1, d=standoffDia + 1);   

        translate([-batteryOffset, 0, baseThickness - 1])
        cylinder(baseThickness, d=standoffDia + 1, d=standoffDia + 1);  
        translate([-batteryOffset - 15, 0, baseThickness - 1])
        cylinder(baseThickness, d=standoffDia + 1, d=standoffDia + 1);
        translate([-batteryOffset - 30, 0, baseThickness - 1])
        cylinder(baseThickness, d=standoffDia + 1, d=standoffDia + 1);        
    }

    // center pen hole
    cylinder(baseThickness, penRadius, penRadius);


    // pen holder bolt holes (low left, counter-clockwise)
    translate([-baseWid / 2 + holeOffset, -baseLen / 2 + holeOffset, 0])
    cylinder(baseThickness, d=M3holeDia, d=M3holeDia);
    
    /*
    translate([baseWid / 2 - holeOffset, -baseLen / 2 + holeOffset, 0])
    cylinder(baseThickness, d=M3holeDia, d=M3holeDia);
    */
    translate([baseWid / 2 - holeOffset, baseLen / 2 - holeOffset, 0])
    cylinder(baseThickness, d=M3holeDia, d=M3holeDia);
    /*
    translate([-baseWid / 2 + holeOffset, baseLen / 2 - holeOffset, 0])
    cylinder(baseThickness, d=M3holeDia, d=M3holeDia);
    */

    // bracket bolt holes
    bracketOffset = 9.5;
    translate([11.8, cassis_wid / 2 - bracketOffset, 0])
    cylinder(baseThickness, d=M3holeDia, d=M3holeDia);    

    translate([-11.8, cassis_wid / 2 - bracketOffset, 0])
    cylinder(baseThickness, d=M3holeDia, d=M3holeDia);    

    translate([11.8, -cassis_wid / 2 + bracketOffset, 0])
    cylinder(baseThickness, d=M3holeDia, d=M3holeDia);    

    translate([-11.8, -cassis_wid / 2 + bracketOffset, 0])
    cylinder(baseThickness, d=M3holeDia, d=M3holeDia);   


    // cable runs
    translate([2, 22 - M3holeDia, 0])
    cube([M3holeDia * 2, M3holeDia, baseThickness, ]); 

    translate([-8, -22, 0])
    cube([M3holeDia * 2, M3holeDia, baseThickness, ]); 
   
   
    // caster mount
    translate([-cassis_len / 2 + 10 - plateOffset, -15, 0])
    cylinder(baseThickness, d=M3holeDia, d=M3holeDia);     
    translate([-cassis_len / 2 + 10 - plateOffset, 15, 0])
    cylinder(baseThickness, d=M3holeDia, d=M3holeDia);    
  
    // battery holes
    translate([batteryOffset, 0, 0])
    cylinder(baseThickness, d=M3holeDia, d=M3holeDia);  
    translate([batteryOffset + 15, 0, 0])
    cylinder(baseThickness, d=M3holeDia, d=M3holeDia);
    translate([batteryOffset + 30, 0, 0])
    cylinder(baseThickness, d=M3holeDia, d=M3holeDia);   

    translate([-batteryOffset, 0, 0])
    cylinder(baseThickness, d=M3holeDia, d=M3holeDia);  
    translate([-batteryOffset - 15, 0, 0])
    cylinder(baseThickness, d=M3holeDia, d=M3holeDia);
    translate([-batteryOffset - 30, 0, 0])
    cylinder(baseThickness, d=M3holeDia, d=M3holeDia); 



    // battery nut nolders
    translate([batteryOffset, 0, baseThickness - 1])
    cylinder(baseThickness, d=M3nutDia, d=M3nutDia, $fn=6);
    translate([batteryOffset + 15, 0, baseThickness - 1])
    cylinder(baseThickness, d=M3nutDia, d=M3nutDia, $fn=6);
    translate([batteryOffset + 30, 0, baseThickness - 1])
    cylinder(baseThickness, d=M3nutDia, d=M3nutDia, $fn=6);   

    translate([-batteryOffset, 0, baseThickness - 1])
    cylinder(baseThickness, d=M3nutDia, d=M3nutDia, $fn=6);  
    translate([-batteryOffset - 15, 0, baseThickness - 1])
    cylinder(baseThickness, d=M3nutDia, d=M3nutDia, $fn=6);
    translate([-batteryOffset - 30, 0, baseThickness - 1])
    cylinder(baseThickness, d=M3nutDia, d=M3nutDia, $fn=6);



 
    // cutouts?
    /*
    translate([- cutout_len / 2 + 35, -cassis_wid / 2 + 25, 0])
    cube([cutout_len, cutout_wid, baseThickness]);
    translate([- cutout_len / 2 + 35, cassis_wid / 2 - 25 - cutout_wid, 0])
    cube([cutout_len, cutout_wid, baseThickness]);

    translate([-cutout_len / 2 - 35, -cassis_wid / 2 + 25, 0])
    cube([cutout_len, cutout_wid, baseThickness]);
    translate([- cutout_len / 2 - 35, cassis_wid / 2 - 25 - cutout_wid, 0])
    cube([cutout_len - 18, cutout_wid, baseThickness]);
    //translate([- cutout_len / 2 - 35, - cutout_wid / 2, 0])
    //cube([cutout_len, cutout_wid, baseThickness]);
    */


    // standoffs drills
    rotate([0, 0, -90])
    translate([-40, -74, 0])
    union(){
    // Arduino mounts lower left (power jack)
    translate([xArduinoOffset, yArduinoOffset + 2.5, 0])
    color("lightblue")
    cylinder(standoffThickness, standoffHoleDia / 2, standoffHoleDia / 2);

    // upper left (USB)
    translate([xArduinoOffset+ 1.3, yArduinoOffset + (53.3 - 2.5), 0])
    color("lightblue")
    cylinder(standoffThickness, standoffHoleDia / 2, standoffHoleDia / 2);

    // cutout for solder joints
    translate([xArduinoOffset+ 1.3 - 1.5, yArduinoOffset + (53.3 - 2.5) -standoffThickness / 2, 5.5])
    color("lightblue")
    cube(standoffThickness, standoffThickness, 8);


    // upper right
    translate([xArduinoOffset + 1.3 + 50.8 , yArduinoOffset + (53.3 - 2.5 - 15.2), 0])
    color("lightblue")
    cylinder(standoffThickness, standoffHoleDia / 2, standoffHoleDia / 2);

    // lower right
    translate([xArduinoOffset + 1.3 + 50.8, yArduinoOffset + (53.3 - 2.5 - 15.2 - 27.9), 0])
    color("lightblue")
    cylinder(standoffThickness, standoffHoleDia / 2, standoffHoleDia / 2);
    }


 
}



module roundedCube(xdim ,ydim ,zdim, rdim){
	hull(){ // https://youtu.be/gKOkJWiTgAY
		translate([rdim, rdim, 0]) cylinder(zdim, rdim, rdim);
		translate([xdim-rdim, rdim, 0]) cylinder(zdim, rdim, rdim);
		translate([rdim, ydim-rdim, 0]) cylinder(zdim, rdim, rdim);
		translate([xdim-rdim, ydim-rdim, 0]) cylinder(zdim, rdim, rdim);
	}
}

standoffDia = 7;
standoffThickness = 7;
standoffHoleDia = 2.5;


module Pi(){
    // Pi lower left 
    translate([3.5, 3.5, 0])
        color("pink")
        difference(){
            cylinder(standoffThickness, standoffDia / 2, standoffDia / 2);
            cylinder(standoffThickness, standoffHoleDia / 2, standoffHoleDia / 2);
        }

    // Pi upper left 
    translate([3.5, 3.5 + 49, 0])
        color("pink")
        difference(){
            cylinder(standoffThickness, standoffDia / 2, standoffDia / 2);
            cylinder(standoffThickness, standoffHoleDia / 2, standoffHoleDia / 2);
        }

    // Pi upper right 
    translate([3.5 + 58, 3.5 + 49, 0])
        color("pink")
        difference(){
            cylinder(standoffThickness, standoffDia / 2, standoffDia / 2);
            cylinder(standoffThickness, standoffHoleDia / 2, standoffHoleDia / 2);
        }

    // Pi lower right 
    translate([3.5 + 58, 3.5, 0])
        color("pink")
        difference(){
            cylinder(standoffThickness, standoffDia / 2, standoffDia / 2);
            cylinder(standoffThickness, standoffHoleDia / 2, standoffHoleDia / 2);
        }
}

module Arduino(){
    

    // Arduino lower left (power jack)
    translate([14, 2.5, 0])
        color("lightblue")
        difference(){
            cylinder(standoffThickness, standoffDia / 2, standoffDia / 2);
            cylinder(standoffThickness, standoffHoleDia / 2, standoffHoleDia / 2);
        }

    // upper left (USB)
    translate([14 + 1.3, (53.3 - 2.5), 0])
        color("lightblue")
        difference(){
            cylinder(standoffThickness, standoffDia / 2, standoffDia / 2);
            cylinder(standoffThickness, standoffHoleDia / 2, standoffHoleDia / 2);
        }

    // upper right
    translate([14 + 1.3 + 50.8, (53.3 - 2.5 - 15.2), 0])
        color("lightblue")
        difference(){
            cylinder(standoffThickness, standoffDia / 2, standoffDia / 2);
            cylinder(standoffThickness, standoffHoleDia / 2, standoffHoleDia / 2);
        }

    // lower right
    translate([14 + 1.3 + 50.8, (53.3 - 2.5 - 15.2 - 27.9), 0])
        color("lightblue")
        difference(){
            cylinder(standoffThickness, standoffDia / 2, standoffDia / 2);
            cylinder(standoffThickness, standoffHoleDia / 2, standoffHoleDia / 2);
        }
}



module mounts(){
    difference(){
        union(){
            //Arduino();
            translate([14 - 3.5, -1, 0])
            Pi();
        }
        // redrill holes
        translate([13.5 + 1.3, (53.3 - 2.5), 0])
            cylinder(standoffThickness, standoffHoleDia / 2, standoffHoleDia / 2);
        translate([13.5 - 3.5, -1, 0])
            translate([3.5, 3.5 + 49, 0])
            cylinder(standoffThickness, standoffHoleDia / 2, standoffHoleDia / 2);  
    }
}

rotate([0, 0, -90])
translate([-40, -74, 0]);

//mounts();