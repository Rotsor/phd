
.outputs c2_out_rq c1_activate_ac
.inputs c2_out_ac c1_activate_rq
.dummy dum1 dum2 dum3 dum4 dum5 dum6 dum7 dum8 dum9 dum10

.graph
dum1 dum5 dum9
dum2 c1_activate_ac+
c2_out_ac+ c2_out_rq-
c2_out_ac- c2_out_rq+ dum3 dum7
c2_out_rq+ c2_out_ac+
c2_out_rq- c2_out_ac-
c1_activate_ac+ c1_activate_rq-
c1_activate_ac- c1_activate_rq+
c1_activate_rq+ dum1 c1_activate_ac+
c1_activate_rq- c1_activate_ac-
dum3 dum6
dum4 dum2 dum5
dum5 c2_out_rq+ dum3
dum6 dum4
dum7 dum10
dum8 dum2 dum9
dum9 c2_out_rq+ dum7
dum10 dum8

.marking { <c2_out_ac-,c2_out_rq+> <c1_activate_ac-,c1_activate_rq+> <dum4,dum5> <dum8,dum9> }
.end
