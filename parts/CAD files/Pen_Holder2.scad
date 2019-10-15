// pen holder for plotting robot




// Diameter of pen in mm.
penDiameter = 10.60;

union();

$fn = 64;

barrelDiameter = 15; // don't change or M3 holes shift

penRadius = penDiameter / 2;
barrelHieght = 28;
barrelWallThickness = 2;
baseThickness = 3;
cornerRounding = 2;
M3holeDia = 3.5;
M3nutDia = 6.6;
holeOffset = M3holeDia * 1.2;
baseLen = 34.5;
//baseWid = penDiameter + 2 * barrelWallThickness + 2;
baseWid = 20;
echo(baseWid);
echo(baseLen);


// servo bracket variables
servoOveralHeight = 34.5;
servoBodyHeight = 24;
servoBodyWidth = 13;
servoScrewDia = 1.5;
servoScrewOffset = 2;
servoHeightOffset = barrelHieght - 2;
servoFwdOffset = penRadius + barrelWallThickness + baseThickness + 11;



difference(){
	union(){
		penHolder();
		servoBracket();
	}
    // re-drill the hole covered by servoBracket
	//translate([0, 0, -baseThickness])
	//cylinder(2 * barrelHieght, penRadius, penRadius);

    translate([-20, -20, -40])
    cube([40, 40, 40]);

    rotate([0, 0, 0])
    union(){
		// bolt holes (low left, counter-clockwise)
		translate([-baseWid / 2 + holeOffset, -baseLen / 2 + holeOffset, 0])
		cylinder(baseThickness, d=M3holeDia, d=M3holeDia);
		translate([-baseWid / 2 + holeOffset, -baseLen / 2 + holeOffset, baseThickness / 2])
        rotate([0, 0, 30])
        cylinder(10, d=M3nutDia, d=M3nutDia, $fn=6);
        
        /*
		translate([baseWid / 2 - holeOffset, -baseLen / 2 + holeOffset, 0])
		cylinder(baseThickness, d=M3holeDia, d=M3holeDia);
		translate([baseWid / 2 - holeOffset, -baseLen / 2 + holeOffset, baseThickness / 2])
        rotate([0, 0, 30])
        cylinder(10, d=M3nutDia, d=M3nutDia, $fn=6);
        */ 
		translate([baseWid / 2 - holeOffset, baseLen / 2 - holeOffset, 0])
		cylinder(baseThickness, d=M3holeDia, d=M3holeDia);
		translate([baseWid / 2 - holeOffset, baseLen / 2 - holeOffset, baseThickness / 2])
        rotate([0, 0, 30])
        cylinder(, d=M3nutDia, d=M3nutDia, $fn=6);        
        /*
		translate([-baseWid / 2 + holeOffset, baseLen / 2 - holeOffset, 0])
		cylinder(baseThickness, d=M3holeDia, d=M3holeDia);
		translate([-baseWid / 2 + holeOffset, baseLen / 2 - holeOffset, baseThickness / 2])        
        rotate([0, 0, 30])
        cylinder(10, d=M3nutDia, d=M3nutDia, $fn=6); 
        */
		// pen hole
		cylinder(baseThickness, penRadius, penRadius);
    
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


module halfRoundedCube(xdim ,ydim ,zdim, rdim){
	hull(){ // only round two sides
		translate([0, rdim, 0]) cube([2, rdim * 2, zdim]);
		translate([xdim-rdim, rdim, 0]) cube([rdim, rdim * 2, zdim]);
		translate([rdim, ydim-rdim, 0]) cylinder(zdim, rdim, rdim);
		translate([xdim-rdim, ydim-rdim, 0]) cylinder(zdim, rdim, rdim);
	}
}


module halfRoundedCube2(xdim ,ydim ,zdim, rdim){
	hull(){ // https://youtu.be/gKOkJWiTgAY
		translate([rdim, rdim, 0]) cylinder(zdim, rdim, rdim);
		translate([xdim-rdim, 0, 0]) cube([rdim + 2, rdim * 2, zdim ]);
		translate([rdim, ydim-rdim, 0]) cylinder(zdim, rdim, rdim);
		translate([xdim-rdim, ydim-rdim, 0]) cube([zdim, rdim, rdim + 2]);
	}
}


module halfRoundedCube3(xdim ,ydim ,zdim, rdim){
	hull(){ // https://youtu.be/gKOkJWiTgAY
		translate([rdim, rdim, 0]) cylinder(zdim, rdim, rdim);
		translate([xdim-rdim, rdim, 0]) cylinder(zdim, rdim, rdim);
		translate([0, ydim-rdim, 0]) cube([zdim, rdim, rdim]);
		translate([xdim-rdim, ydim-rdim, 0]) cube([zdim, rdim, rdim + 1]);
	}
}



module penHolder(){
	// base plate
    rotate([0, 0, 0])
	difference(){
		translate([	-baseWid / 2, -baseLen / 2, 0])

		// base piece
		roundedCube(baseWid, baseLen, baseThickness, cornerRounding);
        //cube([baseWid, baseLen, baseThickness]);


		// bolt holes (low left, counter-clockwise)
		translate([-baseWid / 2 + holeOffset, -baseLen / 2 + holeOffset, 0])
		cylinder(baseThickness, d=M3holeDia, d=M3holeDia);
		translate([-baseWid / 2 + holeOffset, -baseLen / 2 + holeOffset, baseThickness / 2])
        rotate([0, 0, 30])
        cylinder(baseThickness, d=M3nutDia, d=M3nutDia, $fn=6);
        /*
		translate([baseWid / 2 - holeOffset, -baseLen / 2 + holeOffset, 0])
		cylinder(baseThickness, d=M3holeDia, d=M3holeDia);
		translate([baseWid / 2 - holeOffset, -baseLen / 2 + holeOffset, baseThickness / 2])
        rotate([0, 0, 30])
        cylinder(baseThickness, d=M3nutDia, d=M3nutDia, $fn=6);
        */
		translate([baseWid / 2 - holeOffset, baseLen / 2 - holeOffset, 0])
		cylinder(baseThickness, d=M3holeDia, d=M3holeDia);
		translate([baseWid / 2 - holeOffset, baseLen / 2 - holeOffset, baseThickness / 2])
        rotate([0, 0, 30])
        cylinder(baseThickness, d=M3nutDia, d=M3nutDia, $fn=6);        
        
        /*
		translate([-baseWid / 2 + holeOffset, baseLen / 2 - holeOffset, 0])
		cylinder(baseThickness, d=M3holeDia, d=M3holeDia);
		translate([-baseWid / 2 + holeOffset, baseLen / 2 - holeOffset, baseThickness / 2])        
        rotate([0, 0, 30])
        cylinder(baseThickness, d=M3nutDia, d=M3nutDia, $fn=6); 
        */
		// pen hole
		cylinder(baseThickness, penRadius, penRadius);
    };

	// x/y supports to servo bracket
	//translate([-penRadius - barrelWallThickness, 0, baseThickness])		
	//cube([barrelWallThickness, barrelDiameter / 2 + baseThickness / 2, barrelHieght]);
	//translate([-penRadius - barrelWallThickness, penRadius, baseThickness])		
	//cube([  penRadius + barrelWallThickness, 
    //        barrelWallThickness, barrelHieght]);

	// pen barrel
	translate([0, 0, baseThickness])
	difference(){
		// barrel
		cylinder(	barrelHieght, 
					penRadius + barrelWallThickness, 
					penRadius + barrelWallThickness );
		// bore
		cylinder(barrelHieght, penRadius, penRadius + 0.25);	
	}
}








module servoBracket(){
	// servo bracket face
	//rotate([0, 90, 90]) // (z, z, x) now
	//translate([	-servoHeightOffset, 0, servoFwdOffset])
    translate([-servoFwdOffset, 0, servoHeightOffset])
    rotate([0, 90, 0])

 
	difference(){
		// base 

		union(){

             // 45 degree support
            translate([(servoBodyWidth / 2 + baseThickness * 1.4), -servoOveralHeight / 2 - 1, 0])
            rotate([0, -37, 0]) 
            union(){
                //translate([servoBodyWidth, -servoOveralHeight/2, 0])
                translate([baseThickness / 1.41, 0, 0]) 
                rotate([0, 0 , 45])
                cube([servoOveralHeight/1.41, servoOveralHeight/1.41 + 2, baseThickness]);        
                cube([baseThickness / 1.41, servoOveralHeight + 2, baseThickness]);
                translate([0,  0, 0])
                cube([25, servoOveralHeight + 2, baseThickness + 1]);
            };  

			translate([-(   servoBodyWidth + 2 * baseThickness) / 2 -1 ,
						 	-servoOveralHeight / 2 - 1, 0])
			halfRoundedCube2(	servoBodyWidth + 2 * baseThickness,
							servoOveralHeight + 2, 
                            baseThickness + 1, cornerRounding);
            //translate([servoBodyWidth / 2, -servoOveralHeight / 2 - servoHeightOffset, 0])
            //difference(){
            //rotate([0, 0, 45]) 
            //cube([(servoBodyWidth + baseThickness) * 1.41, 
            //      (servoBodyWidth + baseThickness) * 1.41, baseThickness]);
            //cube([(servoBodyWidth + baseThickness) * 2, 
            //      (servoBodyWidth + baseThickness) * 2, baseThickness]);

            //}

            //translate([-servoBodyWidth, servoBodyWidth, 0])
            //cube([servoBodyWidth * 2, servoBodyWidth * 2, baseThickness]);
			//translate([ -(servoBodyWidth + 2 * baseThickness) / 2,
			//			-servoOveralHeight / 2 - baseThickness, 0])
			//cube([  servoBodyWidth + 2 * baseThickness, 
            //        2 * baseThickness, baseThickness]);
            
            // base piece
			//translate([ -(servoBodyWidth + 2 * baseThickness) / 2,
			//			-servoOveralHeight / 2, 0])
			//rotate([90, 0, 0])
			//halfRoundedCube(servoBodyWidth + 2 * baseThickness, 10, 
            //                baseThickness, cornerRounding);            
           
		}
        
        // cut off underneath
        translate([-50, -50, -100])
        cube([100, 100, 100]);
        
        // base holes
		translate([ -(servoBodyWidth + 2 * baseThickness) / 2 + M3holeDia,
					-servoOveralHeight / 2 + 1, 10 / 1.5])
		rotate([90, 0, 0])
		cylinder(baseThickness + 2, d=M3holeDia, d=M3holeDia);

		// body cutout
		translate([-servoBodyWidth / 2, -servoBodyHeight / 2, 0])
		cube([servoBodyWidth, servoBodyHeight / 2 - 0.6, baseThickness + 1]);

		translate([-servoBodyWidth / 2, 0.6, 0])
		cube([servoBodyWidth, servoBodyHeight / 2 - 0.6, baseThickness + 1]);

		// vertical screw holes
		translate([0, -servoBodyHeight / 2 - servoScrewOffset, 0])
		cylinder(baseThickness + 1, servoScrewDia / 2, servoScrewDia / 2);
		translate([0, servoBodyHeight / 2 + servoScrewOffset, 0])
		cylinder(baseThickness + 1, servoScrewDia / 2, servoScrewDia / 2);
        
        // zip-tie holes
        /*
		translate([-servoBodyWidth / 2, -servoBodyHeight / 2 - servoScrewOffset - 0.5, 0])
		cylinder(baseThickness, 1.5, 1.5);
		translate([-servoBodyWidth / 2, servoBodyHeight / 2 + servoScrewOffset + 0.5, 0])
		cylinder(baseThickness, 1.5, 1.5);     
        */
	}


}





