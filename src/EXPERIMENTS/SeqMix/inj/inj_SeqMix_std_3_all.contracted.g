#Generated by JavaDesi Sat Jul 24 06:10:28 BST 2010
#Number of places: 57  Number of Transitions: 36

.inputs c1_activate_rq c2_out_ac 
.outputs c1_activate_ac c2_out_rq 
.dummy dum7 dum11 dum12 dum14 dum15 dum18 dum19 dum2 dum23 dum22 dum27 dum26 dum30 dum3 dum31 dum34 dum38 dum35 dum39 dum42 dum43 dum46 dum47 dum51 dum50 dum55 dum54 dum6 

.graph
p_274 dum6/167 dum12/31
p_278 dum50/139 dum54/151
p_256 dum34/93 dum38/105
p_265 dum42/115 dum46/127
node12_43_30 dum3/55
node12_13_42 c2_out_rq+/15
node16_40 dum3/55 dum15/37
node16_143_51 dum19/48 dum23/63
node12_139_53 dum15/37
node16_79_76 dum27/72 dum31/74
node12_75_78 dum7/168
node12_107_100 dum11/24
node16_111_98 dum39/96 dum35/94
node12_171_122 dum19/48
node16_175_120 dum47/118 dum43/116
node16_207_144 dum51/140 dum55/142
node12_203_146 dum23/63
p_231 dum2/54 dum14/36
p_224 dum7/168 dum11/24
p_248 dum30/84 dum26/71
p_240 dum22/62 dum18/47
c1_activate_ac+/1 c1_activate_rq-/2
dum50/139 dum55/142 node16_207_144
c1_activate_rq-/2 c1_activate_ac-/4
c1_activate_ac-/4 c1_activate_rq+/5
dum51/140 node12_203_146 dum50/139
c1_activate_rq+/5 dum27/72
dum55/142 dum54/151 node12_203_146
c2_out_ac+/11 c2_out_rq-/12
c2_out_rq-/12 c2_out_ac-/14
c2_out_ac-/14 c2_out_rq+/15 p_231
c2_out_rq+/15 c2_out_ac+/11
dum11/24 dum12/31 node12_43_30
dum12/31 p_256 dum11/24 p_224
dum54/151 node16_207_144 c1_activate_ac+/1
dum7/168 dum6/167 node12_43_30
dum14/36 dum15/37 node16_40 p_240
dum15/37 node12_13_42 dum14/36
dum6/167 dum7/168 p_248 p_224
dum18/47 node16_143_51 dum19/48 p_265
dum19/48 dum18/47 node12_139_53
dum3/55 dum2/54 node12_13_42
dum2/54 p_274 node16_40 dum3/55
dum23/63 dum22/62 node12_139_53
dum22/62 node16_143_51 dum23/63 p_278
dum26/71 node16_79_76 dum31/74
dum27/72 node12_75_78 dum26/71
dum31/74 dum30/84 node12_75_78
dum30/84 dum35/94 node16_79_76
dum34/93 node16_111_98 dum39/96
dum35/94 dum34/93 node12_107_100
dum39/96 node12_107_100 dum38/105
dum38/105 node16_111_98 dum43/116
dum47/118 dum46/127 node12_171_122
dum43/116 dum42/115 node12_171_122
dum42/115 dum47/118 node16_175_120
dum46/127 dum51/140 node16_175_120


.marking { <c1_activate_ac-/4,c1_activate_rq+/5> <c2_out_ac-/14,c2_out_rq+/15> <dum14/36,dum15/37> node16_40 node16_143_51 <dum18/47,dum19/48> <dum2/54,dum3/55> <dum22/62,dum23/63> node16_79_76 node16_111_98 node16_175_120 node16_207_144 <dum6/167,dum7/168> <dum12/31,dum11/24> p_224 }
.end
