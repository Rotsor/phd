
.outputs c2_out_rq c1_activate_ac
.inputs c2_out_ac c1_activate_rq
.dummy dum1 dum2 dum3 dum4 dum5 dum6 dum7 dum8

.graph
node16 dum3 dum7
node12_13 c2_out_rq+
node13_14 dum1 dum5
c2_out_ac+ c2_out_rq-
c2_out_ac- node13_14 c2_out_rq+
c2_out_rq+ c2_out_ac+
c2_out_rq- c2_out_ac-
c1_activate_ac+ c1_activate_rq-
c1_activate_ac- c1_activate_rq+
c1_activate_rq+ c1_activate_ac+ dum3
c1_activate_rq- c1_activate_ac-
dum1 dum4
dum2 node16 dum3 dum7
dum3 node12_13 dum1
dum4 dum2
dum5 dum8
dum6 node16 c1_activate_ac+ dum7
dum7 node12_13 dum5
dum8 dum6

.marking { node16 <c2_out_ac-,c2_out_rq+> <c1_activate_ac-,c1_activate_rq+> <dum2,dum3> <dum6,dum7> }
.end
