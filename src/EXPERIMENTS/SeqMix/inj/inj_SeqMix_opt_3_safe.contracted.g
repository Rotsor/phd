#Generated by JavaDesi Sat Jul 24 06:10:29 BST 2010
#Number of places: 41  Number of Transitions: 27

.inputs c1_activate_rq c2_out_ac 
.outputs c1_activate_ac c2_out_rq 
.dummy dum7 dum70 dum39 dum11 dum12 dum14 dum15 dum71 dum18 dum19 dum47 dum2 dum23 dum22 dum79 dum55 dum6 dum3 dum31 

.graph
p_287 dum6/160 dum12/30
p_256 dum11/24
node12_23_29 dum3/52
p_306 dum7/161
p_311 dum19/46
node12_5_40 c2_out_rq+/15
p_314 dum31/71 dum71/179
p_316 dum70/187 dum39/92
node12_80_50 dum15/36
p_292 dum23/60
p_324 c1_activate_ac+/1 dum55/136
p_320 dum47/113 dum79/197
p_223 dum2/51 dum14/35
p_232 dum22/59 dum18/45
dum55/136 c1_activate_ac+/1 p_292
c1_activate_ac+/1 c1_activate_rq-/2
c1_activate_rq-/2 c1_activate_ac-/4
c1_activate_ac-/4 c1_activate_rq+/5
c1_activate_rq+/5 dum31/71 p_306
c2_out_ac+/11 c2_out_rq-/12
c2_out_rq-/12 c2_out_ac-/14
c2_out_ac-/14 c2_out_rq+/15 p_223
c2_out_rq+/15 c2_out_ac+/11
dum11/24 dum12/30 node12_23_29
dum12/30 dum11/24 p_316
dum14/35 p_232 dum15/36
dum15/36 dum14/35 node12_5_40
dum7/161 dum6/160 node12_23_29
dum6/160 dum7/161 p_314
dum19/46 node12_80_50 dum18/45
dum18/45 p_320 dum19/46
dum2/51 dum3/52 p_287
dum70/187 p_311 dum47/113
dum3/52 node12_5_40 dum2/51
dum22/59 p_324 dum23/60
dum71/179 dum39/92 p_256
dum23/60 node12_80_50 dum22/59
dum31/71 p_306 dum71/179
dum79/197 dum55/136 p_292
dum39/92 p_256 dum70/187
dum47/113 p_311 dum79/197


.marking { <c1_activate_ac-/4,c1_activate_rq+/5> <c2_out_ac-/14,c2_out_rq+/15> <dum14/35,dum15/36> <dum18/45,dum19/46> <dum2/51,dum3/52> <dum22/59,dum23/60> <dum6/160,dum7/161> <dum12/30,dum11/24> }
.end
