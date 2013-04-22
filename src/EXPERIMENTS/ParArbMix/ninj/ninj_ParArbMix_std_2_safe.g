
.outputs c3_out_rq c1_activate_ac
.inputs c3_out_ac c1_activate_rq
.dummy dum1 dum2 dum3 dum4 dum5 dum6 dum7 dum8 dum9 dum10 dum11 dum12 dum13 dum14 dum15 dum16 dum17 dum18 dum19 dum20 dum21 dum22 dum23 dum24 dum25 dum26 dum27 dum28 dum29 dum30 dum31 dum32 dum33 dum34 dum35 dum36 dum37 dum38 dum39 dum40 dum41 dum42 dum43 dum44 dum45 dum46 dum47 dum48 dum49 dum50 dum51 dum52 dum53 dum54 dum55 dum56 dum57 dum58 dum59 dum60 dum61 dum62 dum63 dum64 dum65 dum66 dum67 dum68 dum69 dum70

.graph
node18 dum21
node19 dum7 dum39
node20 dum11 dum43
node0_1 dum9 dum41
node1_2 dum7 dum39
node2_3 dum10 dum42
node3_4 dum8 dum40
node4_5 dum13 dum45
node5_6 dum11 dum43
node6_7 dum14 dum46
node7_8 dum12 dum44
node0_19 dum17 dum21
node0_73 dum25 dum29
node0_127 dum33 dum37
node17_18 dum17
dum1 dum65 dum69
dum2 c1_activate_ac+
dum3 dum49 dum53
dum4 dum57 dum61
dum5 dum63
dum6 dum67
c3_out_ac+ dum15
c3_out_ac- dum16
c3_out_rq+ c3_out_ac+
c3_out_rq- c3_out_ac-
c3_out_ac+/1 dum19
c3_out_ac-/1 dum20
c3_out_rq+/1 c3_out_ac+/1
c3_out_rq-/1 c3_out_ac-/1
c1_activate_ac+ c1_activate_rq-
c1_activate_ac- c1_activate_rq+
c1_activate_rq+ dum1 c1_activate_ac+
c1_activate_rq- c1_activate_ac-
dum7 node2_3 dum23
dum8 node0_1 dum24
dum9 node1_2 node17_18 dum7
dum10 node3_4 dum8
dum11 node6_7 dum31
dum12 node4_5 dum32
dum13 node18 node5_6 dum11
dum14 node7_8 dum12
dum15 dum18
dum16 node19 node0_19 dum17
dum17 c3_out_rq+ dum15
dum18 c3_out_rq- dum16
dum19 dum22
dum20 node20 node0_19 dum21
dum21 c3_out_rq+/1 dum19
dum22 c3_out_rq-/1 dum20
dum23 dum26
dum24 node0_73 dum25 dum47
dum25 dum9 dum23
dum26 dum10 dum24
dum27 dum30
dum28 node0_73 dum29 dum51
dum29 dum27 dum41
dum30 dum28 dum42
dum31 dum34
dum32 node0_127 dum33 dum55
dum33 dum13 dum31
dum34 dum14 dum32
dum35 dum38
dum36 node0_127 dum37 dum59
dum37 dum35 dum45
dum38 dum36 dum46
dum39 node2_3 dum27
dum40 node0_1 dum28
dum41 node1_2 node17_18 dum39
dum42 node3_4 dum40
dum43 node6_7 dum35
dum44 node4_5 dum36
dum45 node18 node5_6 dum43
dum46 node7_8 dum44
dum47 dum50
dum48 dum5 dum49
dum49 dum25 dum47
dum50 dum48
dum51 dum54
dum52 dum5 dum53
dum53 dum29 dum51
dum54 dum52
dum55 dum58
dum56 dum6 dum57
dum57 dum33 dum55
dum58 dum56
dum59 dum62
dum60 dum6 dum61
dum61 dum37 dum59
dum62 dum60
dum63 dum66
dum64 dum2 dum65
dum65 dum3 dum63
dum66 dum64
dum67 dum70
dum68 dum2 dum69
dum69 dum4 dum67
dum70 dum68

.marking { node0_1 node4_5 node0_19 node0_73 node0_127 <c1_activate_ac-,c1_activate_rq+> <dum16,dum17> <dum20,dum21> <dum24,dum25> <dum28,dum29> <dum32,dum33> <dum36,dum37> <dum48,dum49> <dum52,dum53> <dum56,dum57> <dum60,dum61> <dum64,dum65> <dum68,dum69> }
.end
