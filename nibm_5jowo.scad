include <threads_w_cut.scad>

$fa= 2;
$fs= 0.2;
$fn= 0;

// Min diameter of outer cylinder around nib module
nibm_module_mind= 4.5*2;
//height of top of inside of cylinder 
//in which nib goes freely
nibm_top_h= 18;
//height of thread we're screwing into
nibm_thread_h=4;
//height of bottom (below threads)
nibm_bottom_h=1;
// Height of printed part of nib module
nibm_h= nibm_top_h + nibm_bottom_h + nibm_thread_h;
// Diameter of the cylinder in wich nib goes freely
nibm_nib_d= 7.1;
// Height of the nib out of the module
nibm_nib_h= 17;

module nibm_cut(center= true)
{
    translate([0, 0, center ? - nibm_h/2 : 0])
    union()
    {
        translate([0, 0, nibm_bottom_h + nibm_thread_h - 0.01])
        cylinder(r=3.7, h= nibm_top_h + 1.01, center= false);
        translate([0, 0, nibm_bottom_h])
        metric_thread_w_entry (diameter= 6.5, pitch= 0.5, length= nibm_thread_h, internal=true, cut_bottom=true, cut_top=true);
        translate([0, 0, -1])
        cylinder(r=3.5, h= nibm_bottom_h + 1.01, center= false);
    }
}

module nubm_minimal(center= true)
{
    translate([0, 0, center ? - nibm_h/2 : 0])
    difference()
    {
        cylinder(d= nibm_module_mind, h= nibm_h, center= false);
       nibm_cut(center);
    }
}

nubm_minimal(center= false);