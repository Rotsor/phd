#Generated by JavaDesi Sat Jul 24 06:04:18 BST 2010
#Number of places: 43  Number of Transitions: 25

.inputs c1_activate_rq c2_out_ac 
.outputs c1_activate_ac c2_out_rq 
.dummy dum89 dum91 dum85 dum87 dum32 dum81 dum83 dum72 dum77 dum48 dum64 dum7 dum94 

.graph
p_743 dum77/512 dum32/378
p_764 dum48/426 dum81/520
p_820 dum89/532 dum72/492
p_819 c2_out_rq+/25
p_804 dum64/474 dum85/526
p_806 c2_out_rq+/25
p_812 dum72/492 dum89/532
p_798 dum64/474 dum85/526
p_773 c2_out_rq+/23
p_771 dum48/426 dum81/520
p_836 dum77/512 dum32/378
p_837 c2_out_rq+/23
p_842 c1_activate_ac+/1 dum87/488
p_843 dum91/508 c1_activate_ac+/1
p_840 dum83/442 dum7/262
p_845 dum7/262 dum94/541
c1_activate_ac+/1 c1_activate_rq-/2
c1_activate_rq-/2 c1_activate_ac-/4
c1_activate_ac-/4 c1_activate_rq+/5
c1_activate_rq+/5 dum48/426 dum32/378 p_773 p_771 p_836 p_837
c2_out_ac+/11 c2_out_rq-/27
c2_out_ac+/14 c2_out_rq-/29
c2_out_ac-/17 p_764 c2_out_rq+/23 p_743
c2_out_ac-/20 p_812 p_798 c2_out_rq+/25
c2_out_rq+/23 c2_out_ac+/11
c2_out_rq+/25 c2_out_ac+/14
c2_out_rq-/27 c2_out_ac-/17
c2_out_rq-/29 c2_out_ac-/20
dum77/512 dum7/262 p_845
dum85/526 p_842 c1_activate_ac+/1
dum81/520 dum7/262 p_840
dum89/532 p_843 c1_activate_ac+/1
dum94/541 dum77/512 p_836 p_837
dum7/262 dum72/492 p_804 p_820 dum64/474 p_806 p_819
dum32/378 dum94/541 p_845
dum83/442 p_773 p_771 dum81/520
dum48/426 dum83/442 p_840
dum64/474 p_842 dum87/488
dum91/508 p_820 p_819 dum89/532
dum72/492 dum91/508 p_843
dum87/488 p_804 p_806 dum85/526


.marking { <c1_activate_ac-/4,c1_activate_rq+/5> <c2_out_ac-/17,c2_out_rq+/23> <c2_out_ac-/20,c2_out_rq+/25> }
.end
