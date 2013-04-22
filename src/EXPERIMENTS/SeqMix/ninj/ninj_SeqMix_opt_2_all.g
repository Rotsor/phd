
.outputs c2_out_rq c1_activate_ac
.inputs c2_out_ac c1_activate_rq
.dummy dum1 dum2 dum3 dum4 dum5 dum6 dum7 dum8 dum9 dum10 dum11 dum12 dum13 dum14 dum15 dum16 dum17 dum18 dum19 dum20 dum21 dum22 dum23 dum24 dum25 dum26 dum27 dum28 dum29 dum30 dum31 dum32 dum33 dum34 dum35 dum36 dum37 dum38 dum39 dum40

.graph
node1 c2_out_rq+
node3 dum1 dum9
node5_2 c2_out_rq-
node7_4 dum2 dum10
node8_5 c2_out_rq+/1
node10_6 dum5 dum13
node12_7 c2_out_rq-/1
node14_9 dum6 dum14
c2_out_ac+ node3
c2_out_ac- node7_4
c2_out_rq+ c2_out_ac+
c2_out_rq- c2_out_ac-
c2_out_ac+/1 node10_6
c2_out_ac-/1 node14_9
c2_out_rq+/1 c2_out_ac+/1
c2_out_rq-/1 c2_out_ac-/1
c1_activate_ac+ c1_activate_rq-
c1_activate_ac- c1_activate_rq+
c1_activate_rq+ c1_activate_ac+ dum35
c1_activate_rq- c1_activate_ac-
dum1 dum17
dum2 dum18
dum3 node1 dum1
dum4 node5_2 dum2
dum5 dum25
dum6 dum26
dum7 node8_5 dum5
dum8 node12_7 dum6
dum9 dum21
dum10 dum22
dum11 node1 dum9
dum12 node5_2 dum10
dum13 dum29
dum14 dum30
dum15 node8_5 dum13
dum16 node12_7 dum14
dum17 dum20
dum18 dum19 dum23
dum19 dum3
dum20 dum4
dum21 dum24
dum22 dum23 dum33
dum23 dum11
dum24 dum12
dum25 dum28
dum26 dum27 dum31
dum27 dum7
dum28 dum8
dum29 dum32
dum30 dum31 dum37
dum31 dum15
dum32 dum16
dum33 dum36
dum34 dum35 dum39
dum35 dum19 dum33
dum36 dum34
dum37 dum40
dum38 c1_activate_ac+ dum39
dum39 dum27 dum37
dum40 dum38

.marking { <c1_activate_ac-,c1_activate_rq+> <dum18,dum19> <dum22,dum23> <dum26,dum27> <dum30,dum31> <dum34,dum35> <dum38,dum39> }
.end
