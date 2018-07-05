include <threads_w_cut.scad>
include <threads_w_step.scad>
include <slices.scad>
include <push_pull_mechanics.scad>
include <rough_handle.scad>

// Which nib to use
include <nibm_6noodlers.scad>

// Show/render parameters
//include <draft_view.scad>
include <fine_view.scad>

//What parts to construct
pp_show_back1=true;
pp_show_back2=true;
pp_show_piston=true;
pp_show_screw=true;
pp_show_pins=true;
pp_show_body=true;
pp_show_cup1=true;
pp_show_cup2=true;

pp_show_print_helper=false;

// How to place the parts
// If pp_ready_for_print true
//    than it will be presented redy for print
//      (pp_show_assemble does not work in this case)
//    otherwise everything will be turned and leveled
//       as if it is assempled.
// if pp_show_assemble true
//    than everything will be "assempled" in one place
//    otherwise it will be"exploded" view.
pp_show_assemble= false;
pp_ready_for_print= true;

//
// Printer limitation
//
// gap between surfaces to let them go freely
pp_tollerance= 0.3;
// dipperence in scree sizes to use them without
// polishing
pp_tread_d_tollerance= 0.4;
// thick enough wall (2 layers)
pp_min_wall= 0.7;

//
// Pre set pen styles
//
// Simple cylindric design with thread near nib
//include <simple_penV1.scad>
// Simple cylindric design with thread 30mm
// from nib and other thread for cup posting
include <simple_penV2.scad>

//
// Setup in-place (comment out preset above)
//
// Piston o-rings parameters
//
// diameter to fit all mechanisms and piston
// 9 is minimum for 0.4 nozzle 8 is absolut
// minimum and it is fragile
// Practically, it is o-rings outer diameter
//pp_try_d= 9; // [8-60]
// number of o-rings
//pp_oring_num=2; // [1-4]
// Thicknes of the O-ring (diameter of cirle
// which was turned to make torus of o-ring)
//pp_oring_d=2; // [0.5-5]
// how tightly will o-rings fit (0.3 looks good)
//pp_oring_compression=0.3; // [0.1-0.5]

//
// Parameters piston mechanism
//
// working length of the screw (piston travel)
//pp_screw_h= 20; // [5-40]
// "nonworking" part os the screw
// (how long part of piston will be still
// overlap with screw when piston pushed to far
// end, it should be long enough to do not break
// when you try to return the piston)
//pp_overlap_h= 4; // [3-7]
// screw pitch (length for 1 turn)
//pp_pitch= 7; // [5-12]
// number of rails * 2
//pp_rail_num=2; // [1-2]
// number of screw rails * 2
//pp_screw_num=2; // [1-2]

//
// Piston knob (handle) parameters
//
// The handle diameter
//pp_screw_handle_d=7;
// The handle length
//pp_screw_handle_h=7;
// The handle cuts depth
//pp_screw_handle_rough=0.3;

//
// Pen back parameters
//
// Back threads pitch
//pp_back_tread_pitch=1; // [0.75 -1.5]
// length of thread in the body
// (total length with all gaps for better
// print and work)
//pp_back_thread1=5; // [5-10]
// length back caup which cover piston turning knob
//pp_back_thread2=4; // [4-10]
// belt which allow screw/unscrew mechanism
// into the body
//pp_external_belt=3; // [3-10]
// dangerous thing if thread on the back more loose
// that cup thread (back will stuck in the cup forever)
//pp_back_thread_for_cup= false;
// bottom of the back cup thickness
//pp_back_back_h= pp_min_wall;

//
// Pen body Parameters
//
// Cup thread parameters on the body
// starts
//pp_body_thread_starts=4; // [1-4]
// length of the thread
//pp_body_thread_h=3; // [3-7]
// pitch of the thread
//pp_boby_thread_pitch=0.75; // [0.75-1.5]
// distance of between each thread turn
// (should be more or equal of pitch)
//pp_body_thread_size=1;
// Distance from the body end with nib to the
// cup thread start (should not prevent your
// comfort grip of the pen, so should be
// before or after place where you hold
// your fingers)
//pp_body_thread_interval= 30; // [0-50]
// Try (if above parameter allow) to put thread
// for posting pen cup on the other end of pen body
//pp_body_try_second_boby_thread= true;

//
// Cup Parameters
//
// how long will be cup after thread wich hold
// the pen body
//pp_cup_after_thread= 5; // [0-50]
//
// Parameters of the thread which connect
// two cup parts:
// pitch
//pp_cup_thread_pitch= 1; // [0.75-1.5]
// length
//pp_cup_thread_h= 7;
//
// Parameters of the clip:
// gap between clip and cup body
//pp_clip_gap=1; // [0.5 - 1.5]
// Next two parameters determin how springy clip is
//pp_clip_width= 4;
//pp_clip_thickness= 3;

// how much more internal thread to do
pp_internal_thread_h_ratio= 1.2;


// step enough to hold some load (rail, screw, etc.)
pp_holding_step= pp_min_wall * 1.5;

// borders of screw holder
pp_back_borders= pp_holding_step;
// screw_holder pin parameters
pp_back_holder_pin_h= pp_back_borders*2;
pp_back_holder_pin_w= pp_back_borders;

// Borders in piston
pp_piston_borders= pp_holding_step;




pp_d= max(pp_try_d, 8);
pp_oring_inner_d= pp_d - (2 * pp_oring_d)  + pp_oring_compression ;
pp_external_belt_d= pp_d + pp_back_tread_pitch*1.18 + pp_min_wall*2 + pp_tread_d_tollerance;
// Diameters ofouter/inner "cylinders" of piston mechanisms parts
pp_d1_1= pp_d - pp_tollerance*2;
pp_d1_2= pp_d1_1 - (pp_min_wall * 2 + pp_holding_step);
pp_d2_1= pp_d1_2 - pp_tollerance*2;
pp_d2_2= pp_d2_1 - (pp_min_wall * 2 + pp_holding_step );
pp_d3= pp_d2_2 - pp_tollerance * 2;

pp_holder_border_d= pp_d3 + pp_back_holder_pin_w*2 + pp_tollerance*2;

pp_belt_with_thread= max(pp_back_thread1, pp_back_borders*2 + pp_back_holder_pin_h + pp_tollerance*2);
pp_belt_with_thread_top= pp_belt_with_thread - pp_back_thread1;
pp_belt_with_thread_bottom= pp_belt_with_thread - (pp_back_borders*2 + pp_back_holder_pin_h + pp_tollerance*2);

// 0.5 + 1 + o-rings + 1 + 0.5
pp_piston_head_h=pp_piston_borders*3 + pp_oring_num*pp_oring_d;
pp_body_length= pp_screw_h*2 + pp_piston_head_h +   pp_back_thread1 * pp_internal_thread_h_ratio + nibm_h;

pp_cup_d2= pp_external_belt_d + pp_boby_thread_pitch*1.18 + pp_tollerance*2;
pp_cup_d1= pp_cup_d2 + 2 * pp_min_wall;
pp_cup_h_walls= pp_min_wall*1.5;
pp_cup_wide_part_h= pp_cup_after_thread + pp_body_thread_size + pp_body_thread_interval +pp_cup_h_walls;
pp_cup_narrow_part_d= nibm_nib_d + pp_min_wall * 2;
pp_gap= pp_cup_d1 + 1;

pp_back1_h_hole= pp_screw_handle_h + pp_tollerance + pp_back_thread2*pp_internal_thread_h_ratio;

pp_body_second_boby_thread= (!pp_back_thread_for_cup &&pp_body_try_second_boby_thread && (pp_body_thread_interval >= pp_external_belt + pp_back1_h_hole + pp_back_back_h));

echo("D:", pp_d1_1, pp_d1_2, pp_d2_1, pp_d2_2, pp_d3);
echo("Belt:", pp_belt_with_thread_top, pp_belt_with_thread, pp_belt_with_thread_bottom);
echo("Body length:", pp_body_length);

// Back1
if (pp_show_back1)
translate ([pp_show_assemble ? 0 : pp_gap, pp_show_assemble ? 0 : pp_gap, pp_ready_for_print ? 0 : - pp_back_back_h - pp_screw_handle_h - pp_tollerance - pp_back_thread2*pp_internal_thread_h_ratio - pp_back_thread1 - pp_external_belt - (pp_screw_h + pp_overlap_h)/2])
union(){
    cylinder(d= pp_external_belt_d, h= pp_back_back_h);
    difference()
    {
        translate([0, 0, pp_back_back_h - 0.01])
        union() {
            cylinder(d= pp_external_belt_d, h= pp_back1_h_hole + 0.01, center= false);
            if (pp_back_thread_for_cup)
            {
                metric_thread_w_entry (diameter=pp_external_belt_d + pp_boby_thread_pitch*1.18, pitch=pp_boby_thread_pitch, thread_size= pp_body_thread_size, length= pp_body_thread_h, internal= false, n_starts= pp_body_thread_starts, cut_bottom=true, cut_top=true);
            }
        }
        union()
        {
            translate([0, 0, pp_back_back_h - 0.01])
            cylinder(d=pp_screw_handle_d + 2 * pp_tollerance, h= pp_screw_handle_h + pp_tollerance + 0.02, center=false);
            translate([0, 0, pp_back_back_h + pp_screw_handle_h + pp_tollerance])
            thread_with_step(diameter=pp_d1_1+ pp_back_tread_pitch*1.18 + pp_tread_d_tollerance, pitch=pp_back_tread_pitch, length= pp_back_thread2*pp_internal_thread_h_ratio + 0.01, internal= true, cut_top=true, cut_bottom=false, step_bottom=false, step_to=pp_external_belt_d);
        }
    }
}

// Back2
if (pp_show_back2)
translate ([pp_show_assemble ? 0 : pp_gap, 0, pp_ready_for_print ? pp_back_thread2 + pp_back_thread1 + pp_external_belt + (pp_screw_h + pp_overlap_h)/2 : 0])
union(){
    // Piston holder
    difference(){
        cylinder(d=pp_d1_1, h= pp_screw_h + pp_overlap_h, center=true);
        rails(d1 = pp_d1_2 + pp_holding_step, d2= pp_d1_2, ratio=0.5, h= pp_screw_h + pp_overlap_h + 2, num= pp_rail_num);
    };
    // Screw holder
    difference(){
        union()
        {
            if (pp_belt_with_thread_top)
              translate([0, 0, - pp_belt_with_thread_top/2 - (pp_screw_h + pp_overlap_h)/2])
              cylinder(d= pp_d1_1, h= pp_belt_with_thread_top, center=true);
            // upper thread
            translate([0, 0, -pp_back_thread1 - (pp_screw_h + pp_overlap_h)/2])
            thread_with_step(diameter=pp_d1_1+ pp_back_tread_pitch*1.18, pitch=pp_back_tread_pitch, length= pp_back_thread1, , cut_top=true, cut_bottom= false, step_bottom=true, step_to=pp_external_belt_d);
            // belt
            translate([0, 0, -pp_back_thread1 - pp_external_belt - (pp_screw_h + pp_overlap_h)/2])
            cylinder(d= pp_external_belt_d, h= pp_external_belt, center= false);
            //lower thread
            translate([0, 0, - pp_back_thread2 - pp_back_thread1 - pp_external_belt - (pp_screw_h + pp_overlap_h)/2])
            thread_with_step(diameter=pp_d1_1+ pp_back_tread_pitch*1.18, pitch=pp_back_tread_pitch, length= pp_back_thread2, cut_top=false, cut_bottom=true, step_bottom=false, step_to=pp_external_belt_d);
        }
        translate([0, 0, - 1 - pp_belt_with_thread - pp_external_belt - pp_back_thread2 - (pp_screw_h + pp_overlap_h)/2])
        cylinder(d=pp_holder_border_d + pp_tollerance*2, h= pp_belt_with_thread + pp_external_belt + pp_back_thread2 + 2, center= false);
        // Pin's hole
        translate([pp_holder_border_d/2 -  pp_back_holder_pin_w/2 + pp_tollerance, 0, - pp_back_holder_pin_h/2 - (pp_screw_h + pp_overlap_h)/2 - pp_back_borders - pp_tollerance])
        cube([pp_back_holder_pin_w + pp_tollerance*2, pp_external_belt_d*2,
pp_back_holder_pin_h + pp_tollerance*2], center=true);
        translate([-pp_holder_border_d/2 +  pp_back_holder_pin_w/2 - pp_tollerance, 0, - pp_back_holder_pin_h/2 - (pp_screw_h + pp_overlap_h)/2 - pp_back_borders - pp_tollerance])
        cube([pp_back_holder_pin_w + pp_tollerance*2, pp_external_belt_d * 2, pp_back_holder_pin_h + pp_tollerance*2], center=true);
    }
};

// Piston
if (pp_show_piston)
translate([0,0,pp_ready_for_print? (pp_screw_h + pp_overlap_h)/2 + pp_piston_borders*3 + pp_oring_num*pp_oring_d :0])
rotate([pp_ready_for_print?180:0,0])
union()
{
    // Piston Boby
    difference(){
        overlap= 1;
        cyl_h= pp_screw_h + overlap*2;
        screw_h= pp_overlap_h + overlap*2;
        
        rails(d1 = pp_d2_1 + pp_holding_step, d2= pp_d2_1, ratio=0.5, h= pp_screw_h + pp_overlap_h, num= pp_rail_num);
        translate([0, 0, -(screw_h + cyl_h)/2 + overlap])
        union() {
            ext_d= pp_d2_2 + pp_holding_step;
            translate([0, 0, cyl_h/2 + pp_overlap_h + overlap])
            cylinder(d= ext_d, h= cyl_h, center=true);
            translate([0, 0, + screw_h/2])
            rotate([0, 0, 360/pp_pitch*overlap])
            push_pull_screw(d1=ext_d, d2= pp_d2_2, ratio=0.5, num= pp_screw_num, pitch=pp_pitch, h= screw_h);
      }    
    };
    // Piston_head
    //
    // Bottom border transition
    translate([0, 0, (pp_screw_h + pp_overlap_h)/2])
    cylinder(d1= pp_d2_1 + pp_holding_step, d2=pp_d1_1, h=pp_piston_borders/2, center=false);
    // Bottom border
    translate([0, 0, (pp_screw_h + pp_overlap_h)/2 + pp_piston_borders/2])
    cylinder(d=pp_d1_1, h=pp_piston_borders, center=false);
    // head body
    translate([0, 0, (pp_screw_h + pp_overlap_h)/2 + pp_piston_borders*1.5])
    cylinder(d=pp_oring_inner_d, h=pp_oring_num*pp_oring_d, center=false);
    // Bottom border-boby transition
    translate([0, 0, (pp_screw_h + pp_overlap_h)/2 + pp_piston_borders*1.5])
    cylinder(d1=pp_oring_inner_d + pp_oring_d*3/8, d2=pp_oring_inner_d, h=pp_oring_d/4, center=false);
    translate([0, 0, (pp_screw_h + pp_overlap_h)/2 + pp_piston_borders*1.5])
    cylinder(d1=pp_oring_inner_d + pp_oring_d/4, d2=pp_oring_inner_d, h= pp_oring_d*3/8, center=false);
    //Top border-boby transition
    translate([0, 0, (pp_screw_h + pp_overlap_h)/2 + pp_piston_borders*1.5 + pp_oring_num*pp_oring_d - pp_oring_d/4])
    cylinder(d2=pp_oring_inner_d + pp_oring_d*3/8, d1=pp_oring_inner_d, h=pp_oring_d/4, center=false);
    translate([0, 0, (pp_screw_h + pp_overlap_h)/2 + pp_piston_borders*1.5 + pp_oring_num*pp_oring_d - pp_oring_d*3/8])
    cylinder(d2=pp_oring_inner_d + pp_oring_d/4, d1=pp_oring_inner_d, h= pp_oring_d*3/8, center=false);
    // Top border
    translate([0, 0, (pp_screw_h + pp_overlap_h)/2 + pp_piston_borders*1.5 + pp_oring_num*pp_oring_d])
    cylinder(d=pp_d1_1, h=pp_piston_borders, center=false);
    // Top transition
    translate([0, 0, (pp_screw_h + pp_overlap_h)/2 + pp_piston_borders*2.5 + pp_oring_num*pp_oring_d])
    cylinder(d1=pp_d1_1, d2= pp_d1_1/2, h=pp_piston_borders/2, center=false);
};


// Screw
//
if (pp_show_screw)
translate ([pp_show_assemble ? 0 : - pp_gap, 0, pp_ready_for_print ?pp_screw_handle_h + (pp_belt_with_thread_bottom + pp_external_belt + pp_back_thread2) + pp_back_borders*2 + (pp_back_holder_pin_h + pp_tollerance*2) + (pp_screw_h + pp_overlap_h)/2 : 0])
union() {
    // Screw Screw
    push_pull_screw(d1= pp_d3 + pp_holding_step, d2= pp_d3, ratio=0.5, num= pp_screw_num, pitch=pp_pitch, h= pp_screw_h + pp_overlap_h);
    // Screw_holder
    translate([0, 0, - pp_back_borders - (pp_screw_h + pp_overlap_h)/2])
    cylinder(d= pp_holder_border_d, h=pp_back_borders, center=false);
    translate([0, 0, -pp_back_borders - (pp_back_holder_pin_h + pp_tollerance*2) - (pp_screw_h + pp_overlap_h)/2])
    cylinder(d= pp_holder_border_d - (pp_back_holder_pin_w*2 + pp_tollerance*2), h= pp_back_holder_pin_h + pp_tollerance*2, center=false);
    translate([0, 0, - (pp_belt_with_thread_bottom + pp_external_belt + pp_back_thread2) - pp_back_borders*2 - (pp_back_holder_pin_h + pp_tollerance*2) - (pp_screw_h + pp_overlap_h)/2])
    cylinder(d= pp_holder_border_d, h= pp_back_borders + pp_belt_with_thread_bottom + pp_external_belt + pp_back_thread2, center=false);
    // Screw handler
    translate([0, 0, -pp_screw_handle_h/2 - (pp_belt_with_thread_bottom + pp_external_belt + pp_back_thread2) - pp_back_borders*2 - (pp_back_holder_pin_h + pp_tollerance*2) - (pp_screw_h + pp_overlap_h)/2])
    rough_handle(d= pp_screw_handle_d, h=pp_screw_handle_h, rough= pp_screw_handle_rough);
};

// Helps to print highest thing in the set
//
if (pp_show_print_helper)
translate ([pp_show_assemble ? - pp_gap : - pp_gap * 2, 0, 0])
rotate (45)
union()
{
    translate([0, 0, - pp_body_length/2 + (pp_screw_h + pp_overlap_h)/2])
    cube([pp_holder_border_d, pp_min_wall, pp_body_length], center= true);
    translate([0, 0, - pp_body_length/2 + (pp_screw_h + pp_overlap_h)/2])
    cube([pp_min_wall, pp_holder_border_d, pp_body_length], center= true);
}


// Pins for mechanism
if (pp_show_pins)
translate ([0, pp_show_assemble ? 0 : - pp_gap, pp_ready_for_print ? pp_back_holder_pin_h/2 : - pp_back_holder_pin_h/2 - (pp_screw_h + pp_overlap_h)/2 - pp_back_borders - pp_tollerance])
intersection()
{
    cylinder(d= pp_d1_1, h= pp_back_holder_pin_h + 2, center=true);
    union() {
        translate([pp_holder_border_d/2 -  pp_back_holder_pin_w/2 + pp_tollerance, 0, 0])
            cube([pp_back_holder_pin_w, pp_external_belt_d,
    pp_back_holder_pin_h], center=true);
            translate([-pp_holder_border_d/2 +  pp_back_holder_pin_w/2 - pp_tollerance, 0, 0])
            cube([pp_back_holder_pin_w, pp_external_belt_d,
    pp_back_holder_pin_h], center=true);
    }
};

// Body
if (pp_show_body)
translate ([0, pp_show_assemble ? 0 : pp_gap, pp_ready_for_print ? pp_body_length - (pp_screw_h + pp_overlap_h)/2 - pp_back_thread1*pp_internal_thread_h_ratio : 0])
rotate([pp_ready_for_print?180:0,0])
difference()
{
    translate([0, 0, - (pp_screw_h + pp_overlap_h)/2 - pp_back_thread1*pp_internal_thread_h_ratio])
    union()
    {
        cylinder(d= pp_external_belt_d, h= pp_body_length, center=false);
        translate([0, 0, pp_body_length - pp_body_thread_h - pp_body_thread_interval])
        metric_thread_w_entry (diameter=pp_external_belt_d + pp_boby_thread_pitch*1.18, pitch=pp_boby_thread_pitch, thread_size= pp_body_thread_size, length= pp_body_thread_h, internal= false, n_starts= pp_body_thread_starts, cut_bottom=true, cut_top=true);
        if (pp_body_second_boby_thread)
        {
            metric_thread_w_entry (diameter=pp_external_belt_d + pp_boby_thread_pitch*1.18, pitch=pp_boby_thread_pitch, thread_size= pp_body_thread_size, length= pp_body_thread_h, internal= false, n_starts= pp_body_thread_starts, cut_bottom=true, cut_top=true);
        }
    }
    // Cut for piston mechanism
    union()
    {
        translate([0, 0, pp_screw_h*2 + pp_piston_head_h - (pp_screw_h + pp_overlap_h)/2])
        nibm_cut(center=false);
        translate([0, 0, - (pp_screw_h + pp_overlap_h)/2 - pp_back_thread1*pp_internal_thread_h_ratio -1])
        cylinder(d= pp_d, h= pp_screw_h*2 + pp_piston_head_h +  pp_back_thread1*pp_internal_thread_h_ratio + 1.01, center=false);
        translate([0, 0, - (pp_screw_h + pp_overlap_h)/2 - pp_back_thread1*(pp_internal_thread_h_ratio + 0.001)])
        thread_with_step(diameter=pp_d1_1+ pp_back_tread_pitch*1.18 + pp_tread_d_tollerance, pitch=pp_back_tread_pitch, length= pp_back_thread1*(pp_internal_thread_h_ratio + 0.001), internal=true, cut_bottom=true, cut_top=false, step_bottom=true, step_to=pp_external_belt_d);
    }
}

// Cup lower part
if (pp_show_cup2)
translate ([pp_show_assemble ? 0 : - pp_gap, pp_show_assemble ? 0 : pp_gap, pp_ready_for_print ? pp_body_length + pp_cup_h_walls + nibm_nib_h: - (pp_screw_h + pp_overlap_h)/2  - pp_back_thread1*pp_internal_thread_h_ratio] )
rotate([pp_ready_for_print?180:0,0])
difference()
{
    // External
    union()
    {
        // Wide cylinder
        translate([0, 0, pp_body_length - pp_cup_wide_part_h + pp_cup_h_walls])
        cylinder(d= pp_cup_d1, h= pp_cup_wide_part_h, center= false);
        // Narrow cylynder
        translate([0, 0, pp_body_length + pp_cup_h_walls  - 0.01])
        cylinder(d= pp_cup_narrow_part_d, h= nibm_nib_h + 0.01, center= false);
        // Thread ower narrow cylinder to put top part on
        translate([0, 0, pp_body_length + pp_cup_h_walls])
        thread_with_step(diameter=pp_cup_narrow_part_d + pp_cup_thread_pitch*1.18, pitch= pp_cup_thread_pitch, length= pp_cup_thread_h, internal=false, cut_bottom=true, cut_top=true, step_bottom=true, step_to=pp_cup_d1);
    }
    // Cut
    union()
    {   
        // nib compartment
        translate([0, 0, pp_body_length  - 0.01])
        cylinder(d= nibm_nib_d, h= nibm_nib_h + 0.01, center= false);
        // thread to hold the pen
        translate([0, 0, pp_body_length - pp_body_thread_h - pp_body_thread_interval - 0.01])
            metric_thread_w_entry (diameter=pp_external_belt_d + pp_boby_thread_pitch*1.18 + pp_tread_d_tollerance, pitch=pp_boby_thread_pitch, thread_size= pp_body_thread_size, length= pp_body_thread_h + 0.01, internal= true, n_starts= pp_body_thread_starts, cut_bottom=true, cut_top=true);
        // place to get pen thread go through
        translate([0, 0, pp_body_length - pp_body_thread_h - pp_body_thread_interval - pp_cup_after_thread - 0.01])
        cylinder(d= pp_cup_d2, h= pp_cup_after_thread + 0.01, center= false);
        // place for pen body between nib and thread
        translate([0, 0, pp_body_length - pp_body_thread_interval - 0.01])
        cylinder(d= pp_external_belt_d + 2*pp_tollerance, h= pp_body_thread_interval + 0.01, center= false);
    };
}

// Cup upper part and clip
if (pp_show_cup1)
    translate ([pp_show_assemble ? 0 : - pp_gap, pp_show_assemble ? 0 : - pp_gap, pp_ready_for_print ? pp_body_length + pp_cup_h_walls + nibm_nib_h: - (pp_screw_h + pp_overlap_h)/2  - pp_back_thread1*pp_internal_thread_h_ratio])
rotate([pp_ready_for_print?180:0,0])
difference()
{
    base= pp_body_length + pp_cup_h_walls;
    //Body
    union()
    {
        translate([0, 0, base])
        cylinder(d= pp_cup_d1, h=nibm_nib_h, center= false);
        intersection()
        {
            union()
            {
                translate([0, 0, base - pp_cup_wide_part_h - 2*(pp_clip_gap + pp_clip_thickness)])
                cylinder(d= pp_cup_d1 + 2*(pp_clip_gap + pp_clip_thickness), h= nibm_nib_h + pp_cup_wide_part_h, celter= false);
                translate([0, 0, base - 2*(pp_clip_gap + pp_clip_thickness) + nibm_nib_h])
                cylinder(d1= pp_cup_d1 + 2*(pp_clip_gap + pp_clip_thickness), d2= pp_cup_d1, h= 2*(pp_clip_gap + pp_clip_thickness), celter= false);
            }
            translate([-pp_clip_width/2, 0, base - pp_cup_wide_part_h - 2*(pp_clip_gap + pp_clip_thickness)])
            cube([pp_clip_width, pp_cup_d1 + 2*(pp_clip_gap + pp_clip_thickness), pp_body_length +pp_cup_wide_part_h + 2*(pp_clip_gap + pp_clip_thickness)], celter= false);
        }
    }
    // Cut
    union()
    {
        // hole for lower pat to get in
        translate([0, 0, base  - 0.01])
            cylinder(d= pp_cup_narrow_part_d + pp_tollerance*2, h= nibm_nib_h + 0.02, center= false);
        // thread to connect lower part
        translate([0, 0, base -0.01])
            thread_with_step(diameter=pp_cup_narrow_part_d + pp_cup_thread_pitch*1.18 + pp_tread_d_tollerance, pitch= pp_cup_thread_pitch, length= pp_cup_thread_h * pp_internal_thread_h_ratio + 0.02, internal=true, cut_bottom=true, cut_top=true, step_bottom=true, step_to=pp_cup_d1);
        // cut of clip
        translate([0, 0, base - (pp_cup_wide_part_h - pp_clip_gap) - 0.01])
        cylinder(d= pp_cup_d1+ 2* pp_clip_gap,
        h= pp_cup_wide_part_h - pp_clip_gap + 0.01, celter= false);
        translate([0, 0, base - pp_cup_wide_part_h])
        cylinder(d2= pp_cup_d1+ 2* pp_clip_gap, d1= pp_cup_d1, 
        h= pp_clip_gap, celter= false);
        translate([0, 0, base - pp_cup_wide_part_h - pp_clip_gap/2])
        cylinder(d= pp_cup_d1, 
        h= pp_clip_gap, celter= false);
        translate([0, 0, base - pp_cup_wide_part_h - 2*(pp_clip_gap + pp_clip_thickness) - 0.01])
        cylinder(d2= pp_cup_d1, d1= pp_cup_d1 + 2*(pp_clip_gap + pp_clip_thickness), 
        h= 2*(pp_clip_gap + pp_clip_thickness) + 0.01, celter= false);
    }
}
