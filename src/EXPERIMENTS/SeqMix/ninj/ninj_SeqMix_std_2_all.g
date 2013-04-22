
.outputs c2_out_rq c1_activate_ac
.inputs c2_out_ac c1_activate_rq
.dummy dum1 dum2 dum3 dum4 dum5 dum6 dum7 dum8 dum9 dum10 dum11 dum12 dum13 dum14 dum15 dum16 dum17 dum18 dum19 dum20 dum21 dum22 dum23 dum24 dum25 dum26 dum27 dum28 dum29 dum30 dum31 dum32 dum33 dum34 dum35 dum36 dum37 dum38 dum39 dum40

.graph
node0_1 dum3 dum7 dum11 dum15
node1_2 c2_out_rq+
node3_4 dum1 dum9
node4_5 dum4 dum12
node5_6 c2_out_rq-
node7_8 dum2 dum10
node8_9 c2_out_rq+/1
node0_31 dum19 dum23
node0_61 dum27 dum31
node10_11 dum5 dum13
node11_12 dum8 dum16
node12_13 c2_out_rq-/1
node14_15 dum6 dum14
c2_out_ac+ node3_4
c2_out_ac- node7_8
c2_out_rq+ c2_out_ac+
c2_out_rq- c2_out_ac-
c2_out_ac+/1 node10_11
c2_out_ac-/1 node14_15
c2_out_rq+/1 c2_out_ac+/1
c2_out_rq-/1 c2_out_ac-/1
c1_activate_ac+ c1_activate_rq-
c1_activate_ac- c1_activate_rq+
c1_activate_rq+ c1_activate_ac+ dum35
c1_activate_rq- c1_activate_ac-
dum1 node4_5 dum17
dum2 node0_1 dum18
dum3 node1_2 dum1
dum4 node5_6 dum2
dum5 node11_12 dum25
dum6 node0_1 dum26
dum7 node8_9 dum5
dum8 node12_13 dum6
dum9 node4_5 dum21
dum10 node0_1 dum22
dum11 node1_2 dum9
dum12 node5_6 dum10
dum13 node11_12 dum29
dum14 node0_1 dum30
dum15 node8_9 dum13
dum16 node12_13 dum14
dum17 dum20
dum18 node0_31 dum19 dum23
dum19 dum3 dum17
dum20 dum4 dum18
dum21 dum24
dum22 node0_31 dum23 dum33
dum23 dum11 dum21
dum24 dum12 dum22
dum25 dum28
dum26 node0_61 dum27 dum31
dum27 dum7 dum25
dum28 dum8 dum26
dum29 dum32
dum30 node0_61 dum31 dum37
dum31 dum15 dum29
dum32 dum16 dum30
dum33 dum36
dum34 dum35 dum39
dum35 dum19 dum33
dum36 dum34
dum37 dum40
dum38 c1_activate_ac+ dum39
dum39 dum27 dum37
dum40 dum38

.marking { node0_1 node0_31 node0_61 <c1_activate_ac-,c1_activate_rq+> <dum18,dum19> <dum22,dum23> <dum26,dum27> <dum30,dum31> <dum34,dum35> <dum38,dum39> }
.end
