
.outputs c3_out_rq c1_activate_ac
.inputs c3_out_ac c1_activate_rq
.dummy dum1 dum2 dum3 dum4 dum5 dum6 dum7 dum8 dum9 dum10 dum11 dum12 dum13 dum14 dum15 dum16 dum17 dum18

.graph
node16_7 dum5 dum9
node12_15 c3_out_rq+
node13_16 dum3 dum7
dum1 dum13 dum17
dum2 c1_activate_ac+
c3_out_ac+ c3_out_rq-
c3_out_ac- node13_16 c3_out_rq+
c3_out_rq+ c3_out_ac+
c3_out_rq- c3_out_ac-
c1_activate_ac+ c1_activate_rq-
c1_activate_ac- c1_activate_rq+
c1_activate_rq+ dum1 c1_activate_ac+
c1_activate_rq- c1_activate_ac-
dum3 dum6
dum4 node16_7 dum5 dum11
dum5 node12_15 dum3
dum6 dum4
dum7 dum10
dum8 node16_7 dum9 dum15
dum9 node12_15 dum7
dum10 dum8
dum11 dum14
dum12 dum2 dum13
dum13 dum5 dum11
dum14 dum12
dum15 dum18
dum16 dum2 dum17
dum17 dum9 dum15
dum18 dum16

.marking { node16_7 <c3_out_ac-,c3_out_rq+> <c1_activate_ac-,c1_activate_rq+> <dum4,dum5> <dum8,dum9> <dum12,dum13> <dum16,dum17> }
.end
