#Generated by JavaDesi Sat Jul 24 06:00:48 BST 2010
#Number of places: 128  Number of Transitions: 68

.inputs c1_activate_rq c3_out_ac 
.outputs c1_activate_ac c3_out_rq 
.dummy dum49 dum48 dum57 dum56 dum60 dum112 dum113 dum116 dum117 dum45 dum121 dum120 dum44 dum77 dum76 dum124 dum125 dum128 dum129 dum133 dum132 dum137 dum136 dum61 dum141 dum140 dum145 dum144 dum149 dum148 dum72 dum152 dum73 dum157 dum153 dum156 dum164 dum165 dum160 dum161 dum172 dum173 dum169 dum168 dum181 dum180 dum176 dum177 dum188 dum189 dum184 dum185 dum196 dum193 dum192 dum201 dum200 dum197 dum205 dum204 

.graph
node16_109_70 dum113/66 dum117/78
p_1028 dum200/348 dum204/360
node16_144_97 dum121/93 dum125/105
node16_179_119 dum129/115 dum133/132
p_1223 dum60/739 dum56/727
p_1228 dum73/752
p_1226 dum112/65 dum116/77
p_1232 dum120/92 dum124/104
p_1235 dum77/763
p_1246 dum136/141 dum140/158
node16_214_146 dum141/159 dum137/142
p_1242 dum72/771 dum76/781
p_1255 dum160/222 dum164/234
p_1252 dum133/132
p_1251 dum144/168 dum148/180
node16_249_173 dum145/169 dum149/181
p_1248 dum129/115
p_1263 dum157/208
p_1260 dum188/306 dum184/296
p_1257 dum153/196
p_1268 dum161/223
p_1266 dum172/259 dum168/242
node16_284_200 dum153/196 dum157/208
p_1182 dum45/666
p_1195 dum57/677
p_1199 dum156/207 dum152/195
node16_319_227 dum161/223 dum165/31
p_1200 dum49/690
node16_354_247 dum173/260 dum169/243
p_1208 dum44/696 dum48/706
p_1214 dum61/721
p_1212 dum128/114 dum132/131
node16_389_274 dum181/287 dum177/270
node16_424_299 dum189/56 dum185/45
node16_459_324 dum193/320 dum197/332
node16_494_353 dum201/349 dum205/361
node12_15_701 c3_out_rq+/15
node16_7_699 dum45/666 dum49/690
node16_39_730 dum61/721 dum57/677
node16_74_774 dum77/763 dum73/752
p_888 dum165/31
p_894 dum185/45
p_898 dum189/56
p_1013 dum196/331 dum192/319
p_987 dum180/286 dum176/269
c1_activate_ac+/1 c1_activate_rq-/2
c1_activate_rq-/2 c1_activate_ac-/4
c1_activate_ac-/4 c1_activate_rq+/5
c1_activate_rq+/5 dum113/66 dum169/243 dum173/260 dum145/169 dum149/181 dum201/349 dum205/361 dum137/142 dum141/159 dum193/320 dum197/332 dum121/93 dum181/287 dum125/105 dum177/270 dum117/78
c3_out_ac+/11 c3_out_rq-/12
c3_out_rq-/12 c3_out_ac-/14
c3_out_ac-/14 c3_out_rq+/15 p_1208
c3_out_rq+/15 c3_out_ac+/11
dum165/31 p_1257 dum164/234
dum185/45 p_1263 dum184/296
dum189/56 p_1263 dum188/306
dum112/65 c1_activate_ac+/1 node16_109_70
dum113/66 p_1228 dum112/65
dum116/77 node16_109_70 c1_activate_ac+/1
dum117/78 dum116/77 p_1228
dum121/93 p_1235 dum120/92
dum120/92 node16_144_97 c1_activate_ac+/1
dum124/104 node16_144_97 c1_activate_ac+/1
dum125/105 dum124/104 p_1235
dum129/115 dum128/114 p_1214
dum128/114 node16_179_119 p_1246 dum129/115
dum136/141 c1_activate_ac+/1 node16_214_146
dum137/142 p_1248 dum136/141
dum57/677 dum56/727 p_1182
dum132/131 node16_179_119 dum133/132 p_1251
dum133/132 p_1214 dum132/131
dum44/696 p_1223 node16_7_699 dum45/666
dum140/158 c1_activate_ac+/1 node16_214_146
dum141/159 dum140/158 p_1248
dum49/690 node12_15_701 dum48/706
dum145/169 p_1252 dum144/168
dum144/168 c1_activate_ac+/1 node16_249_173
dum45/666 node12_15_701 dum44/696
dum148/180 c1_activate_ac+/1 node16_249_173
dum149/181 p_1252 dum148/180
dum156/207 node16_284_200 dum157/208 p_1260
dum60/739 node16_39_730 dum61/721 p_1212
dum153/196 p_1200 dum152/195
dum152/195 p_1255 node16_284_200 dum153/196
dum77/763 p_1195 dum76/781
dum160/222 p_1266 dum161/223 node16_319_227
dum161/223 dum160/222 p_1257
dum73/752 dum72/771 p_1195
dum157/208 p_1200 dum156/207
dum164/234 p_987 dum165/31 node16_319_227
dum48/706 dum49/690 node16_7_699 p_1199
dum61/721 dum60/739 p_1182
dum168/242 c1_activate_ac+/1 node16_354_247
dum169/243 p_1268 dum168/242
dum56/727 node16_39_730 dum57/677 p_1242
dum181/287 dum180/286 p_888
dum180/286 node16_389_274 c1_activate_ac+/1
dum172/259 c1_activate_ac+/1 node16_354_247
dum173/260 p_1268 dum172/259
dum177/270 p_888 dum176/269
dum176/269 node16_389_274 c1_activate_ac+/1
dum188/306 node16_424_299 p_1028 dum189/56
dum192/319 c1_activate_ac+/1 node16_459_324
dum72/771 node16_74_774 dum73/752 p_1226
dum184/296 node16_424_299 p_1013 dum185/45
dum76/781 node16_74_774 p_1232 dum77/763
dum201/349 dum200/348 p_898
dum200/348 node16_494_353 c1_activate_ac+/1
dum193/320 dum192/319 p_894
dum197/332 dum196/331 p_894
dum196/331 node16_459_324 c1_activate_ac+/1
dum204/360 node16_494_353 c1_activate_ac+/1
dum205/361 dum204/360 p_898


.marking { <c1_activate_ac-/4,c1_activate_rq+/5> <c3_out_ac-/14,c3_out_rq+/15> node16_109_70 node16_144_97 node16_179_119 <dum72/771,dum73/752> <dum76/781,dum77/763> node16_214_146 <dum128/114,dum129/115> <dum132/131,dum133/132> node16_249_173 <dum156/207,dum157/208> <dum152/195,dum153/196> <dum160/222,dum161/223> node16_284_200 <dum44/696,dum45/666> <dum56/727,dum57/677> node16_319_227 <dum48/706,dum49/690> node16_354_247 <dum60/739,dum61/721> node16_389_274 node16_424_299 node16_459_324 node16_494_353 node16_7_699 node16_39_730 node16_74_774 <dum164/234,dum165/31> <dum184/296,dum185/45> <dum188/306,dum189/56> }
.end
