/* nVidia Tesla K40 Fan Shroud
 * Intended to bring active cooling to the passively cooled card
 * without blocking the power pins
 *
 * - Cooling channel measures 90 mm by 20 mm, with 2 mm of height lost to capacitors 20 mm inside
 * - Three bolt holes are present along a strip at the "top" of the channel,
 *   measuring 50 mm by 12 mm. The hole centerlines are 7 mm away from the channel edge,
 *   and spaced 17.5 mm apart from one another. 
 * - A 40 mm fan fits comfortably.
 * - A 60 mm fan fits at a 45-degree tilt.
 */

$fn = 256;
offset = 60 * sqrt(2) / 2;
opacity = 0.75;
plate_height = 2;
duct_height = 10 - plate_height;
duct_radius = 30;
truncation = 109.999;
channel_depth = 15.4;
channel_length = 88.5;
channel_width = 17.5;
screw_radius = 4.5;
 
module channel () {
    union () {
        difference () {
            // K40 body
            cube ([94, 35, 25.4]);
            // cooling air channel
            translate ([2, 2, -0.1])
                cube ([90, 18, 25.6]);
            // screw holes
            for (i = [0, 17.5, 35]) {
                translate ([52 + i, 28.5, -0.1])
                    cylinder (r=1.6, h=25.6);
            }
            // power pins
            for (j = [0, 1]) {
                for (i = [0, 1, 2, 3]) {
                    translate ([9 + 4.6 * i, 22.5 + 4.6 * j, 21.4])
                        cube ([4.5, 4.5, 4.7]);
                }
                for (i = [0, 1, 2]) {
                    translate ([28 + 4.6 * i, 22.5 + 4.6 * j, 21.4])
                        cube ([4.5, 4.5, 4.7]);
                }
            }
        }
    }
}
module fan_holes (l, w, h, r) {
    for (i = [-l / 2, l / 2]) {
        for (j = [-w / 2, w / 2]) {
            translate([i, j, 0])
                cylinder (r = r, h = h);
        }
    } 
}
module channel_holes (l, n, h, r) {
    for (i = [0 : n - 1]) {
        translate([i * l, 0, 0])
            cylinder (r = r, h = h);
    } 
}
module fan40 () {
/* The 40 mm fan measures 40.25 mm long by 40.25 mm wide by 20.25 mm high.
   Its mounting holes are spaced 32 mm apart. The channel measures 38 mm.   */
    color ([1, 0, 0]) {
        difference () {
            cube ([40.25, 40.25, 20.25]);
            translate ([20.125, 20.125, -0.1])
                cylinder (r = 19, h = 20.45);
            translate ([20.125, 20.125, -0.1]) 
                fan_holes(32, 32, 20.65, 1.75);
        }
    }
}
module fan60 () {
/* The 60 mm fan measures 60.05 mm long by 60.05 mm wide by 24.5 mm high.
   Its mounting holes are spaced 50 mm apart. The channel measures 55 mm.  */
    rotate (a=45) {
        difference () {
            cube ([60.05, 60.05, 24.5]);
            translate ([30.025, 30.025, -0.1])
                cylinder (r = 55 / 2, h = 24.7);
            translate ([30.025, 30.025, -0.1]) 
                fan_holes(50, 50, 24.7, 1.75);
        }
    }
}
module fan_plate (l) {
    union () {
        translate ([0, 0, duct_height - plate_height]) {
            rotate (a = 45)
                cube ([l, l, 2]);
        }
    }
}

module channel_plate (h) {
    translate ([-23, 61.5, -h])
        union () {
            translate ([6, -10, 0])
                cube ([47, 25, duct_height + h]);
            translate ([8, 5.33, - h / 2]) 
                cube ([43, 7, h / 2]);
    }
}
module channel_airway (l, w, h) {
    cube ([l, w, h]);
}
module duct_body (r, h) {
    translate ([0, 0, -plate_height])
        cylinder (r = r, h = h);
}
module mount () {
    difference () {
        intersection () {
            // clip one corner of the fan plate
            translate ([-80, 0, -20])
                cube ([truncation, truncation, 50]);
            union () {
                fan_plate(60);
                channel_plate(plate_height);
                translate ([0, offset, 0])
                    duct_body(30, duct_height);
                translate ([-60.5, 44.25, -channel_depth]) 
                    channel_airway (channel_length - 1.5, channel_width, channel_depth + duct_height);
            }
        }
        translate ([-11, 28.05 + offset, -0.005]) {
            channel_holes (17.5, 3, 25.4, screw_radius);
            translate ([0, 0, -1.5 * plate_height - 0.095])
                channel_holes (17.6, 3, 0.1 + 1.5 * plate_height, 1.8);
        }
        translate ([ 0, offset, 0])
            cylinder (r = duct_radius - 1, h = 2 * duct_height + 0.2);
        translate ([-offset - 16, 46.5, -channel_depth - 0.1])
            cube ([channel_length - 5, channel_width - 4, channel_depth + duct_height - plate_height]);
        intersection () {
            translate ([ 0, offset, -duct_height])
                cylinder (r = duct_radius-1, h= 2 * duct_height + 0.2);
            translate ([-30, 53.25, -8.5]) 
                rotate (a=[45, 0, 0])
                    cube ([55, 20, 20]);        
        }
        rotate (a = 45) {
            translate ([30.025, 30.025, -0.1])
                fan_holes(50, 50, 24.7, 2.5);
            translate ([30.025, 30.025, -30])
                fan_holes(50, 50, 30 + 2.995 * plate_height, 3.25);
        }
    }
}
translate ([-offset / 2, -3 * offset / 2, 10 - plate_height]) {
    rotate (a=[180, 0, 75]) {
        /*intersection () {
            translate ([2.5 * offset, 0, 0])
                cube ([3 * offset, 3 * offset, 2 * offset], center=true);

        union () {
        */
        /*
        translate ([0, 0, -26 - 2.625])
            //color ("black", opacity)
                channel();
        */
        /*
        translate ([63, -42, 10.5 - 2.25])
            intersection () {
                // clip one corner of the fan
                translate ([-59, 0, -0.01])
                    cube ([90, 90, 26]);
                color ("black", opacity)
                    fan60 ();
            }
        */
        translate ([63, -42, 0])
            mount ();
     }
     //}
    // }
}