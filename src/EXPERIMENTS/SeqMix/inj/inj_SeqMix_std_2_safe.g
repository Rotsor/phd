
.outputs c2_out_rq c1_activate_ac
.inputs c2_out_ac c1_activate_rq
.dummy dum1 dum2 dum3 dum4 dum5 dum6 dum7 dum8 dum9 dum10 dum11 dum12 dum13 dum14 dum15 dum16 dum17 dum18 dum19 dum20 dum21 dum22 dum23 dum24 dum25 dum26 dum27 dum28 dum29 dum30 dum31 dum32

.graph
node16 dum3 dum7
node12_13 c2_out_rq+
node12_43 dum3
node12_75 dum7
node13_14 dum1 dum5
node13_44 dum9 dum13
node13_76 dum17 dum21
node16_47 dum11 dum15
node16_79 dum19 dum23
c2_out_ac+ c2_out_rq-
c2_out_ac- node13_14 c2_out_rq+
c2_out_rq+ c2_out_ac+
c2_out_rq- c2_out_ac-
c1_activate_ac+ c1_activate_rq-
c1_activate_ac- c1_activate_rq+
c1_activate_rq+ c1_activate_ac+ dum27
c1_activate_rq- c1_activate_ac-
dum1 dum4
dum2 node16 node13_44 dum3
dum3 node12_13 dum1
dum4 dum2
dum5 dum8
dum6 node16 node13_76 dum7
dum7 node12_13 dum5
dum8 dum6
dum9 dum12
dum10 node16_47 dum11 dum15
dum11 node12_43 dum9
dum12 dum10
dum13 dum16
dum14 node16_47 dum15 dum25
dum15 node12_43 dum13
dum16 dum14
dum17 dum20
dum18 node16_79 dum19 dum23
dum19 node12_75 dum17
dum20 dum18
dum21 dum24
dum22 node16_79 dum23 dum29
dum23 node12_75 dum21
dum24 dum22
dum25 dum28
dum26 dum27 dum31
dum27 dum11 dum25
dum28 dum26
dum29 dum32
dum30 c1_activate_ac+ dum31
dum31 dum19 dum29
dum32 dum30

.marking { node16 node16_47 node16_79 <c2_out_ac-,c2_out_rq+> <c1_activate_ac-,c1_activate_rq+> <dum2,dum3> <dum6,dum7> <dum10,dum11> <dum14,dum15> <dum18,dum19> <dum22,dum23> <dum26,dum27> <dum30,dum31> }
.end
