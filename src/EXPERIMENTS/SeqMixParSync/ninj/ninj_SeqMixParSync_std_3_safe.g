
.outputs c2_out_rq c1_activate_ac
.inputs c2_out_ac c1_activate_rq
.dummy dum1 dum2 dum3 dum4 dum5 dum6 dum7 dum8 dum9 dum10 dum11 dum12 dum13 dum14 dum15 dum16 dum17 dum18 dum19 dum20 dum21 dum22 dum23 dum24 dum25 dum26 dum27 dum28 dum29 dum30 dum31 dum32 dum33 dum34 dum35 dum36 dum37 dum38 dum39 dum40 dum41 dum42 dum43 dum44 dum45 dum46 dum47 dum48 dum49 dum50 dum51 dum52 dum53 dum54 dum55 dum56 dum57 dum58 dum59 dum60 dum61 dum62 dum63 dum64 dum65 dum66 dum67 dum68 dum69 dum70 dum71 dum72 dum73 dum74 dum75 dum76 dum77 dum78 dum79 dum80 dum81 dum82 dum83 dum84 dum85 dum86 dum87 dum88 dum89 dum90 dum91 dum92 dum93 dum94 dum95 dum96 dum97 dum98

.graph
node0_1 dum25 dum41
node1_2 dum23 dum39
node2_3 dum26 dum42
node3_4 dum24 dum40
node4_5 dum13 dum37
node5_6 dum11 dum35
node6_7 dum14 dum38
node7_8 dum12 dum36
node0_32 dum17 dum21
node0_130 dum29 dum33
node12_13 c2_out_rq+
node13_14 c2_out_rq+
node14_15 dum11 dum35
node15_16 dum23 dum39
dum1 dum77 dum81
dum2 c1_activate_ac+
dum3 dum45 dum49
dum4 dum53 dum57
dum5 dum61 dum65
dum6 dum69 dum73
dum7 dum83
dum8 dum87
dum9 dum91
dum10 dum95
c2_out_ac+ c2_out_rq-
c2_out_ac- node14_15 node15_16 c2_out_rq+
c2_out_rq+ c2_out_ac+
c2_out_rq- c2_out_ac-
c1_activate_ac+ c1_activate_rq-
c1_activate_ac- c1_activate_rq+
c1_activate_rq+ dum1 c1_activate_ac+
c1_activate_rq- c1_activate_ac-
dum11 node6_7 dum15
dum12 node4_5 dum16
dum13 node5_6 node12_13 dum11
dum14 node7_8 dum12
dum15 dum18
dum16 node0_32 dum17 dum43 dum47
dum17 dum13 dum15
dum18 dum14 dum16
dum19 dum22
dum20 node0_32 dum21 dum51 dum55
dum21 dum19 dum37
dum22 dum20 dum38
dum23 node2_3 dum27
dum24 node0_1 dum28
dum25 node1_2 node13_14 dum23
dum26 node3_4 dum24
dum27 dum30
dum28 node0_130 dum29 dum59 dum63
dum29 dum25 dum27
dum30 dum26 dum28
dum31 dum34
dum32 node0_130 dum33 dum67 dum71
dum33 dum31 dum41
dum34 dum32 dum42
dum35 node6_7 dum19
dum36 node4_5 dum20
dum37 node5_6 node12_13 dum35
dum38 node7_8 dum36
dum39 node2_3 dum31
dum40 node0_1 dum32
dum41 node1_2 node13_14 dum39
dum42 node3_4 dum40
dum43 dum46
dum44 dum7 dum45
dum45 dum17 dum43
dum46 dum44
dum47 dum50
dum48 dum7 dum49
dum49 dum17 dum47
dum50 dum48
dum51 dum54
dum52 dum8 dum53
dum53 dum21 dum51
dum54 dum52
dum55 dum58
dum56 dum8 dum57
dum57 dum21 dum55
dum58 dum56
dum59 dum62
dum60 dum9 dum61
dum61 dum29 dum59
dum62 dum60
dum63 dum66
dum64 dum9 dum65
dum65 dum29 dum63
dum66 dum64
dum67 dum70
dum68 dum10 dum69
dum69 dum33 dum67
dum70 dum68
dum71 dum74
dum72 dum10 dum73
dum73 dum33 dum71
dum74 dum72
dum75 dum78
dum76 dum2 dum77
dum77 dum75 dum85
dum78 dum76
dum79 dum82
dum80 dum2 dum81
dum81 dum79 dum93
dum82 dum80
dum83 dum86
dum84 dum85 dum89
dum85 dum3 dum83
dum86 dum84
dum87 dum90
dum88 dum75 dum89
dum89 dum4 dum87
dum90 dum88
dum91 dum94
dum92 dum93 dum97
dum93 dum5 dum91
dum94 dum92
dum95 dum98
dum96 dum79 dum97
dum97 dum6 dum95
dum98 dum96

.marking { node0_1 node4_5 node0_32 node0_130 <c2_out_ac-,c2_out_rq+> <c1_activate_ac-,c1_activate_rq+> <dum16,dum17> <dum20,dum21> <dum28,dum29> <dum32,dum33> <dum44,dum45> <dum48,dum49> <dum52,dum53> <dum56,dum57> <dum60,dum61> <dum64,dum65> <dum68,dum69> <dum72,dum73> <dum76,dum77> <dum80,dum81> <dum84,dum85> <dum88,dum89> <dum92,dum93> <dum96,dum97> }
.end
