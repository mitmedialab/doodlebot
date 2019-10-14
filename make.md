# Make Your DoodleBot!

You can assemble your DoodleBot in just a few steps. 

## 1. Collect parts

First, you will need to gather a few parts.

(images go here)

### Electronics:
* 1x Arduino UNO or equivalent- adafruit.com/products/50
(Adafruit is now the US Manufacture for Genuine Arduinos! Get them from the source.)
* 2x Geared 5V Stepper- adafruit.com/products/858
* 1x ULN2803 Darlington Driver - adafruit.com/products/970
* 1x Half-size breadboard- adafruit.com/products/64
* 12x Male-male jumpers- adafruit.com/products/1956
(At least two should be 6", the rest can be 3".)
* 1x Micro servo- adafruit.com/products/169
* 1x Male pin header- digikey.com/short/t93cbd
* 1x 2 x AA Holder- digikey.com/short/tz5bd1
* 1x-3 x AA Holder- digikey.com/short/t5nw1c
* 1x-470 uF 25V capacitor - www.digikey.com/product-detail/en/ECA-1EM471/P5155-ND/245014
* 1x SPDT slide switch - www.digikey.com/product-detail/en/EG1218/EG1903-ND/101726
* 1x USB micro cable http://amzn.com/B00OC6WR22
* 5x AA Batteries

### Hardware:
* 2x 1 7/8" ID x 1/8" O-ring- mcmaster.com/#9452K96
* 1x Caster 5/8" bearing- mcmaster.com/#96455k58/=yskbki
* 10x M3 x 8mm pan head screw- mcmaster.com/#92005a118/=z80pbr
* 4x M3 x 6mm flat head screw- mcmaster.com/#91420a116/=yskru0
* 12x M3 Nut- mcmaster.com/#90591a250/=yskc6u3D
* 2x 1/4" thread forming 4-20 screws http://www.mcmaster.com/#90380A106

### Printed Parts:
* placeholder

### Supplies: 
* Phillips screw driver
* Hot glue gun
* Digital multi-meter
* Sharp knife
* Crayola colored markers

## 2. Test Firmware

Before we get too far into construction, lets load the test firmware on to the microcontroller. The test program just draws for boxes so we can check for proper direction and dimension.

1. Download the Arduino software from www.arduino.cc/en/Main/Software
2. Open the Arduino software.
3. Download the attached zip file and unzip it to the Arduino sketchbook location.
* You can find (or change) this location in the Arduino IDE: [File] -> [Preferences]-> "Sketchbook Location".
4. Load the test sketch: [File] -> [Sketchbook] -> [TIRL_Arduino_TEST]
5. Attach your Arduino to your computer with a USB cable.
6. In the Arduino IDE:
  * Set you board type: [Tools] -> [Board] -> Your board type.
  * Set your serial port: [Tools] -> [Port] -> Usually the last one listed.
7. Upload the sketch using the arrow icon.

If you have any problems, refer to www.arduino.cc/en/Guide/Troubleshooting for help.

## 3. Pen Holder and Battery Holders

1. Insert the nuts on the top side of the chassis (Image 1). You may have to press them in.
2. Install the Pen Holder with the Servo Bracket on the top side of the chassis (Image 2 & 3). 
3. Attach the battery holders on the bottom of the chassis using 3Mx6mm flat-head screws (Image 4)
  * You need at least 5xAA to properly power an Arduino via its onboard regulartor. Six would work as well. 
  * You want the weight shifted toward the caster, so put the 3xAA towards the back. 
  * Orient the holders so the leads are closest to the rectangular cable runs. 
4. Thread the battery leads through the rectangular cable runs (Image 4). 
5. Repeat for the other battery holder. 
**Note:** Unless specified, the remainder of the screws are 3Mx8mm pan head screws.

## Step 4. Stepper Brackets

1. Insert a nut into the stepper bracket and attach them to the top of the chassis with a screw (Image 1).
2. Insert the stepper into the bracket and attach with screws and nuts.
3. Repeat for the other bracket.

## Step 5. Caster

1. Insert the ball bearing into the caster. 
  * Do not force it in or it will break. Use a hair-drier or hot air gun to soften the material if needed.
2. Attach the caster to the bottom side of the chassis in front of the battery holder.
**Note:** If you need a different diameter, you can edit the openScad file (http://www.thingiverse.com/thing:1052674) to fit what ever you have on hand.

## Step 6. Breadboard and Brains
1. Remove one of the power rails using a sharp knife, cutting through the bottom adhesive (Image 1).
  * One rail has power (red) on outer edge, they other negative (blue). I'm keeping the first attached, and it will match the schematics and photos. If you use the other, just adjust the wires accordingly.
2. Holding the breadboard over the chassis rails, mark where they intersect the edge (Image 2).
3. Using a straight edge (like the removed power rail), mark the lines and cut through the backing (Image 3).
4. Place the breadboard on the chassis with the rails touching the exposed adhesive (Image 4).
5. Attach the Arduino to the other side of the chassis using 4-20 screws (Image 5).
