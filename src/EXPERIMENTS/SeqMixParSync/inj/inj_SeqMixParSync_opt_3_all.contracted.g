#Generated by JavaDesi Sat Jul 24 06:06:18 BST 2010
#Number of places: 15  Number of Transitions: 10

.inputs c1_activate_rq c2_out_ac 
.outputs c1_activate_ac c2_out_rq 
.dummy dum81 dum89 

.graph
p_376 c1_activate_ac+/1 dum81/213
p_356 c2_out_rq+/15
p_365 c2_out_rq+/15
p_386 c1_activate_ac+/1 dum89/233
c1_activate_ac+/1 c1_activate_rq-/2
c1_activate_rq-/2 c1_activate_ac-/4
c1_activate_ac-/4 c1_activate_rq+/5
c1_activate_rq+/5 p_356 dum81/213 dum89/233 p_365
c2_out_ac+/11 c2_out_rq-/12
c2_out_rq-/12 c2_out_ac-/14
c2_out_ac-/14 p_386 p_376 c2_out_rq+/15
c2_out_rq+/15 c2_out_ac+/11
dum81/213 p_356 c1_activate_ac+/1
dum89/233 p_365 c1_activate_ac+/1


.marking { <c1_activate_ac-/4,c1_activate_rq+/5> <c2_out_ac-/14,c2_out_rq+/15> }
.end
