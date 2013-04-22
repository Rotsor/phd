
.outputs c2_out_rq c1_activate_ac
.inputs c2_out_ac c1_activate_rq
.dummy dum1 dum2 dum3 dum4 dum5 dum6 dum7 dum8 dum9 dum10 dum11 dum12 dum13 dum14 dum15 dum16 dum17 dum18 dum19 dum20 dum21 dum22 dum23 dum24 dum25 dum26 dum27 dum28 dum29 dum30 dum31 dum32 dum33 dum34 dum35 dum36 dum37 dum38 dum39 dum40 dum41 dum42 dum43 dum44 dum45 dum46 dum47 dum48 dum49 dum50 dum51 dum52 dum53 dum54 dum55 dum56 dum57 dum58 dum59 dum60 dum61 dum62 dum63 dum64 dum65 dum66 dum67 dum68 dum69 dum70 dum71 dum72 dum73 dum74 dum75 dum76 dum77 dum78 dum79 dum80

.graph
node16 dum3 dum15
node12_13 c2_out_rq+
node12_43 dum3
node12_75 dum7
node13_14 dum1 dum13
node13_44 dum5 dum9
node13_76 dum25 dum29
node16_47 dum7 dum11
node16_79 dum27 dum31
node12_107 dum11
node12_139 dum15
node12_171 dum19
node12_203 dum23
node13_108 dum33 dum37
node13_140 dum17 dum21
node13_172 dum41 dum45
node13_204 dum49 dum53
node16_111 dum35 dum39
node16_143 dum19 dum23
node16_175 dum43 dum47
node16_207 dum51 dum55
c2_out_ac+ c2_out_rq-
c2_out_ac- node13_14 c2_out_rq+
c2_out_rq+ c2_out_ac+
c2_out_rq- c2_out_ac-
c1_activate_ac+ c1_activate_rq-
c1_activate_ac- c1_activate_rq+
c1_activate_rq+ c1_activate_ac+ dum59
c1_activate_rq- c1_activate_ac-
dum1 dum4
dum2 node16 node13_44 dum3
dum3 node12_13 dum1
dum4 dum2
dum5 dum8
dum6 node13_76 node16_47 dum7
dum7 node12_43 dum5
dum8 dum6
dum9 dum12
dum10 node16_47 node13_108 dum11
dum11 node12_43 dum9
dum12 dum10
dum13 dum16
dum14 node16 node13_140 dum15
dum15 node12_13 dum13
dum16 dum14
dum17 dum20
dum18 node13_172 node16_143 dum19
dum19 node12_139 dum17
dum20 dum18
dum21 dum24
dum22 node13_204 node16_143 dum23
dum23 node12_139 dum21
dum24 dum22
dum25 dum28
dum26 node16_79 dum27 dum31
dum27 node12_75 dum25
dum28 dum26
dum29 dum32
dum30 node16_79 dum31 dum65
dum31 node12_75 dum29
dum32 dum30
dum33 dum36
dum34 node16_111 dum35 dum39
dum35 node12_107 dum33
dum36 dum34
dum37 dum40
dum38 node16_111 dum39 dum69
dum39 node12_107 dum37
dum40 dum38
dum41 dum44
dum42 node16_175 dum43 dum47
dum43 node12_171 dum41
dum44 dum42
dum45 dum48
dum46 node16_175 dum47 dum73
dum47 node12_171 dum45
dum48 dum46
dum49 dum52
dum50 node16_207 dum51 dum55
dum51 node12_203 dum49
dum52 dum50
dum53 dum56
dum54 node16_207 dum55 dum77
dum55 node12_203 dum53
dum56 dum54
dum57 dum60
dum58 dum59 dum63
dum59 dum57 dum67
dum60 dum58
dum61 dum64
dum62 c1_activate_ac+ dum63
dum63 dum61 dum75
dum64 dum62
dum65 dum68
dum66 dum67 dum71
dum67 dum27 dum65
dum68 dum66
dum69 dum72
dum70 dum57 dum71
dum71 dum35 dum69
dum72 dum70
dum73 dum76
dum74 dum75 dum79
dum75 dum43 dum73
dum76 dum74
dum77 dum80
dum78 dum61 dum79
dum79 dum51 dum77
dum80 dum78

.marking { node16 node16_47 node16_79 node16_111 node16_143 node16_175 node16_207 <c2_out_ac-,c2_out_rq+> <c1_activate_ac-,c1_activate_rq+> <dum2,dum3> <dum6,dum7> <dum10,dum11> <dum14,dum15> <dum18,dum19> <dum22,dum23> <dum26,dum27> <dum30,dum31> <dum34,dum35> <dum38,dum39> <dum42,dum43> <dum46,dum47> <dum50,dum51> <dum54,dum55> <dum58,dum59> <dum62,dum63> <dum66,dum67> <dum70,dum71> <dum74,dum75> <dum78,dum79> }
.end
