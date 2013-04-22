
.outputs c2_out_rq c1_activate_ac
.inputs c2_out_ac c1_activate_rq
.dummy dum1 dum2 dum3 dum4 dum5 dum6 dum7 dum8 dum9 dum10 dum11 dum12 dum13 dum14 dum15 dum16 dum17 dum18 dum19 dum20 dum21 dum22 dum23 dum24 dum25 dum26 dum27 dum28 dum29 dum30 dum31 dum32

.graph
node12_5 c2_out_rq+
node13_6 dum1 dum5
node12_23 dum3
node12_42 dum7
node13_24 dum9 dum13
node13_43 dum17 dum21
c2_out_ac+ c2_out_rq-
c2_out_ac- node13_6 c2_out_rq+
c2_out_rq+ c2_out_ac+
c2_out_rq- c2_out_ac-
c1_activate_ac+ c1_activate_rq-
c1_activate_ac- c1_activate_rq+
c1_activate_rq+ c1_activate_ac+ dum27
c1_activate_rq- c1_activate_ac-
dum1 dum4
dum2 node13_24 dum3
dum3 node12_5 dum1
dum4 dum2
dum5 dum8
dum6 node13_43 dum7
dum7 node12_5 dum5
dum8 dum6
dum9 dum12
dum10 dum11 dum15
dum11 node12_23 dum9
dum12 dum10
dum13 dum16
dum14 dum15 dum25
dum15 node12_23 dum13
dum16 dum14
dum17 dum20
dum18 dum19 dum23
dum19 node12_42 dum17
dum20 dum18
dum21 dum24
dum22 dum23 dum29
dum23 node12_42 dum21
dum24 dum22
dum25 dum28
dum26 dum27 dum31
dum27 dum11 dum25
dum28 dum26
dum29 dum32
dum30 c1_activate_ac+ dum31
dum31 dum19 dum29
dum32 dum30

.marking { <c2_out_ac-,c2_out_rq+> <c1_activate_ac-,c1_activate_rq+> <dum2,dum3> <dum6,dum7> <dum10,dum11> <dum14,dum15> <dum18,dum19> <dum22,dum23> <dum26,dum27> <dum30,dum31> }
.end
