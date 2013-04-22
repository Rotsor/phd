
.outputs c2_out_rq c1_activate_ac
.inputs c2_out_ac c1_activate_rq
.dummy dum1 dum2 dum3 dum4 dum5 dum6 dum7 dum8

.graph
c2_out_ac+ dum1
c2_out_ac- dum2
c2_out_rq+ c2_out_ac+
c2_out_rq- c2_out_ac-
c2_out_ac+/1 dum5
c2_out_ac-/1 dum6
c2_out_rq+/1 c2_out_ac+/1
c2_out_rq-/1 c2_out_ac-/1
c1_activate_ac+ c1_activate_rq-
c1_activate_ac- c1_activate_rq+
c1_activate_rq+ c1_activate_ac+ dum3
c1_activate_rq- c1_activate_ac-
dum1 dum4
dum2 dum3 dum7
dum3 c2_out_rq+
dum4 c2_out_rq-
dum5 dum8
dum6 c1_activate_ac+ dum7
dum7 c2_out_rq+/1
dum8 c2_out_rq-/1

.marking { <c1_activate_ac-,c1_activate_rq+> <dum2,dum3> <dum6,dum7> }
.end
