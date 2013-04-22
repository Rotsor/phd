
.outputs c3_out_rq c1_activate_ac
.inputs c3_out_ac c1_activate_rq
.dummy dum1 dum2 dum3 dum4 dum5 dum6 dum7 dum8 dum9 dum10 dum11 dum12 dum13 dum14 dum15 dum16 dum17 dum18 dum19 dum20 dum21 dum22 dum23 dum24 dum25 dum26 dum27 dum28 dum29 dum30 dum31 dum32 dum33 dum34 dum35 dum36 dum37 dum38 dum39 dum40 dum41 dum42 dum43 dum44 dum45 dum46 dum47 dum48 dum49 dum50 dum51 dum52 dum53 dum54 dum55 dum56 dum57 dum58 dum59 dum60 dum61 dum62

.graph
node16_7 dum17 dum21
node12_15 c3_out_rq+
node12_50 dum9
node12_85 dum13
node13_16 dum15 dum19
node13_51 dum23 dum27
node13_86 dum31 dum35
node16_39 dum25 dum29
node16_74 dum33 dum37
dum1 dum57 dum61
dum2 c1_activate_ac+
dum3 dum41 dum45
dum4 dum49 dum53
dum5 dum55
dum6 dum59
c3_out_ac+ c3_out_rq-
c3_out_ac- node13_16 c3_out_rq+
c3_out_rq+ c3_out_ac+
c3_out_rq- c3_out_ac-
c1_activate_ac+ c1_activate_rq-
c1_activate_ac- c1_activate_rq+
c1_activate_rq+ dum1 c1_activate_ac+
c1_activate_rq- c1_activate_ac-
dum7 dum10
dum8 node13_51 dum9
dum9 dum7 dum17
dum10 dum8
dum11 dum14
dum12 node13_86 dum13
dum13 dum11 dum21
dum14 dum12
dum15 dum18
dum16 node16_7 dum7 dum17
dum17 node12_15 dum15
dum18 dum16
dum19 dum22
dum20 node16_7 dum11 dum21
dum21 node12_15 dum19
dum22 dum20
dum23 dum26
dum24 node16_39 dum25 dum39
dum25 node12_50 dum23
dum26 dum24
dum27 dum30
dum28 node16_39 dum29 dum43
dum29 node12_50 dum27
dum30 dum28
dum31 dum34
dum32 node16_74 dum33 dum47
dum33 node12_85 dum31
dum34 dum32
dum35 dum38
dum36 node16_74 dum37 dum51
dum37 node12_85 dum35
dum38 dum36
dum39 dum42
dum40 dum5 dum41
dum41 dum25 dum39
dum42 dum40
dum43 dum46
dum44 dum5 dum45
dum45 dum29 dum43
dum46 dum44
dum47 dum50
dum48 dum6 dum49
dum49 dum33 dum47
dum50 dum48
dum51 dum54
dum52 dum6 dum53
dum53 dum37 dum51
dum54 dum52
dum55 dum58
dum56 dum2 dum57
dum57 dum3 dum55
dum58 dum56
dum59 dum62
dum60 dum2 dum61
dum61 dum4 dum59
dum62 dum60

.marking { node16_7 node16_39 node16_74 <c3_out_ac-,c3_out_rq+> <c1_activate_ac-,c1_activate_rq+> <dum8,dum9> <dum12,dum13> <dum16,dum17> <dum20,dum21> <dum24,dum25> <dum28,dum29> <dum32,dum33> <dum36,dum37> <dum40,dum41> <dum44,dum45> <dum48,dum49> <dum52,dum53> <dum56,dum57> <dum60,dum61> }
.end
