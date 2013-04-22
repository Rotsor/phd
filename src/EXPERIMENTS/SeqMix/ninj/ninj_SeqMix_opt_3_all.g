
.outputs c2_out_rq c1_activate_ac
.inputs c2_out_ac c1_activate_rq
.dummy dum1 dum2 dum3 dum4 dum5 dum6 dum7 dum8 dum9 dum10 dum11 dum12 dum13 dum14 dum15 dum16 dum17 dum18 dum19 dum20 dum21 dum22 dum23 dum24 dum25 dum26 dum27 dum28 dum29 dum30 dum31 dum32 dum33 dum34 dum35 dum36 dum37 dum38 dum39 dum40 dum41 dum42 dum43 dum44 dum45 dum46 dum47 dum48 dum49 dum50 dum51 dum52 dum53 dum54 dum55 dum56 dum57 dum58 dum59 dum60 dum61 dum62 dum63 dum64 dum65 dum66 dum67 dum68 dum69 dum70 dum71 dum72 dum73 dum74 dum75 dum76 dum77 dum78 dum79 dum80 dum81 dum82 dum83 dum84 dum85 dum86 dum87 dum88 dum89 dum90 dum91 dum92 dum93 dum94 dum95 dum96 dum97 dum98 dum99 dum100 dum101 dum102 dum103 dum104

.graph
node1 c2_out_rq+
node3 dum1 dum25
node5_2 c2_out_rq-
node7_4 dum2 dum26
node8_5 c2_out_rq+/1
node10_6 dum13 dum37
node12_7 c2_out_rq-/1
node14_9 dum14 dum38
node1_19 dum3
node1_82 dum15
node3_21 dum5 dum29
node3_84 dum17 dum41
node5_22 dum4
node5_85 dum16
node7_24 dum6 dum30
node7_87 dum18 dum42
node8_25 dum27
node8_88 dum39
node10_27 dum9 dum33
node10_90 dum21 dum45
node12_28 dum28
node12_91 dum40
node14_30 dum10 dum34
node14_93 dum22 dum46
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
c1_activate_rq+ c1_activate_ac+ dum83
c1_activate_rq- c1_activate_ac-
dum1 node3_21
dum2 node7_24
dum3 node1 dum1
dum4 node5_2 dum2
dum5 dum49
dum6 dum50
dum7 node1_19 dum5
dum8 node5_22 dum6
dum9 dum57
dum10 dum58
dum11 node8_25 dum9
dum12 node12_28 dum10
dum13 node3_84
dum14 node7_87
dum15 node8_5 dum13
dum16 node12_7 dum14
dum17 dum65
dum18 dum66
dum19 node1_82 dum17
dum20 node5_85 dum18
dum21 dum73
dum22 dum74
dum23 node8_88 dum21
dum24 node12_91 dum22
dum25 node10_27
dum26 node14_30
dum27 node1 dum25
dum28 node5_2 dum26
dum29 dum53
dum30 dum54
dum31 node1_19 dum29
dum32 node5_22 dum30
dum33 dum61
dum34 dum62
dum35 node8_25 dum33
dum36 node12_28 dum34
dum37 node10_90
dum38 node14_93
dum39 node8_5 dum37
dum40 node12_7 dum38
dum41 dum69
dum42 dum70
dum43 node1_82 dum41
dum44 node5_85 dum42
dum45 dum77
dum46 dum78
dum47 node8_88 dum45
dum48 node12_91 dum46
dum49 dum52
dum50 dum51 dum55
dum51 dum7
dum52 dum8
dum53 dum56
dum54 dum55 dum89
dum55 dum31
dum56 dum32
dum57 dum60
dum58 dum59 dum63
dum59 dum11
dum60 dum12
dum61 dum64
dum62 dum63 dum93
dum63 dum35
dum64 dum36
dum65 dum68
dum66 dum67 dum71
dum67 dum19
dum68 dum20
dum69 dum72
dum70 dum71 dum97
dum71 dum43
dum72 dum44
dum73 dum76
dum74 dum75 dum79
dum75 dum23
dum76 dum24
dum77 dum80
dum78 dum79 dum101
dum79 dum47
dum80 dum48
dum81 dum84
dum82 dum83 dum87
dum83 dum81 dum91
dum84 dum82
dum85 dum88
dum86 c1_activate_ac+ dum87
dum87 dum85 dum99
dum88 dum86
dum89 dum92
dum90 dum91 dum95
dum91 dum51 dum89
dum92 dum90
dum93 dum96
dum94 dum81 dum95
dum95 dum59 dum93
dum96 dum94
dum97 dum100
dum98 dum99 dum103
dum99 dum67 dum97
dum100 dum98
dum101 dum104
dum102 dum85 dum103
dum103 dum75 dum101
dum104 dum102

.marking { <c1_activate_ac-,c1_activate_rq+> <dum50,dum51> <dum54,dum55> <dum58,dum59> <dum62,dum63> <dum66,dum67> <dum70,dum71> <dum74,dum75> <dum78,dum79> <dum82,dum83> <dum86,dum87> <dum90,dum91> <dum94,dum95> <dum98,dum99> <dum102,dum103> }
.end
