#Generated by JavaDesi Sat Jul 24 06:06:20 BST 2010
#Number of places: 85  Number of Transitions: 48

.inputs c1_activate_rq c2_out_ac 
.outputs c1_activate_ac c2_out_rq 
.dummy dum157 dum96 dum97 dum153 dum156 dum101 dum102 dum104 dum105 dum160 dum92 dum93 dum161 dum108 dum109 dum81 dum80 dum112 dum113 dum73 dum72 dum77 dum76 dum61 dum124 dum125 dum60 dum128 dum129 dum133 dum69 dum132 dum137 dum68 dum136 dum48 dum49 dum149 dum148 dum152 

.graph
p_1151 dum109/59
p_1149 dum124/110 dum128/124
node16_548_65 dum113/76 dum109/59
node16_348_1051 dum93/358 dum97/385
node16_614_117 dum125/111 dum129/125
p_1079 dum105/47 dum101/31
node16_714_148 dum137/156 dum133/142
p_1158 dum109/59
node16_848_197 dum149/191 dum153/210
p_1163 dum136/155 dum132/141
p_1175 dum113/76
p_1180 dum113/76
p_1194 dum148/190 dum152/209
node16_948_228 dum157/222 dum161/241
p_1205 dum156/221 dum160/240
p_1499 c2_out_rq+/15
p_1527 dum49/929
p_1520 dum48/928 dum60/964
p_1535 dum68/985 dum72/998
p_1511 dum49/929
p_1515 c2_out_rq+/15
p_1514 dum108/58 dum112/75
p_1551 dum102/41 dum104/46
p_1547 dum61/965
p_1543 dum80/1019 dum76/1007
p_1561 dum96/1058 dum92/1047
p_1553 dum61/965
node16_48_935 dum49/929 dum61/965
node16_214_1011 dum77/310 dum81/332
node16_114_989 dum69/258 dum73/284
c1_activate_ac+/1 c1_activate_rq-/2
c1_activate_rq-/2 c1_activate_ac-/4
c1_activate_ac-/4 c1_activate_rq+/5
c1_activate_rq+/5 dum125/111 dum133/142 dum77/310 dum69/258
c2_out_ac+/11 c2_out_rq-/12
c2_out_rq-/12 c2_out_ac-/14
c2_out_ac-/14 p_1520 c2_out_rq+/15 p_1514
c2_out_rq+/15 c2_out_ac+/11
dum101/31 dum102/41 p_1553
dum102/41 dum105/47 p_1079
dum104/46 c1_activate_ac+/1 p_1079
dum105/47 p_1553 dum104/46
dum109/59 dum108/58 p_1515
dum108/58 p_1149 dum109/59 node16_548_65 p_1163
dum113/76 dum112/75 p_1515
dum112/75 node16_548_65 p_1205 p_1194 dum113/76
dum92/1047 node16_348_1051 dum97/385
dum96/1058 node16_348_1051 c1_activate_ac+/1
dum124/110 node16_614_117 dum129/125
dum125/111 p_1151 dum124/110
dum129/125 p_1151 dum128/124
dum128/124 node16_614_117 dum149/191 dum157/222
dum132/141 node16_714_148 dum137/156
dum133/142 p_1158 dum132/141
dum136/155 dum157/222 dum149/191 node16_714_148
dum137/156 p_1158 dum136/155
dum148/190 node16_848_197 dum153/210
dum149/191 dum148/190 p_1175
dum156/221 dum161/241 node16_948_228
dum157/222 dum156/221 p_1180
dum152/209 c1_activate_ac+/1 node16_848_197
dum153/210 p_1175 dum152/209
dum160/240 c1_activate_ac+/1 node16_948_228
dum161/241 dum160/240 p_1180
dum73/284 p_1511 dum72/998
dum69/258 p_1511 dum68/985
dum77/310 p_1527 dum76/1007
dum81/332 p_1527 dum80/1019
dum93/358 p_1547 dum92/1047
dum97/385 dum96/1058 p_1547
dum49/929 dum48/928 p_1499
dum48/928 dum49/929 node16_48_935 p_1543 p_1535
dum80/1019 dum101/31 dum93/358 node16_214_1011
dum76/1007 node16_214_1011 dum81/332
dum72/998 dum101/31 dum93/358 node16_114_989
dum68/985 dum73/284 node16_114_989
dum61/965 dum60/964 p_1499
dum60/964 p_1551 p_1561 node16_48_935 dum61/965


.marking { <c1_activate_ac-/4,c1_activate_rq+/5> node16_548_65 node16_348_1051 node16_614_117 p_1079 node16_714_148 <dum108/58,dum109/59> node16_848_197 <dum112/75,dum113/76> node16_948_228 <dum48/928,dum49/929> <c2_out_ac-/14,c2_out_rq+/15> <dum60/964,dum61/965> node16_48_935 node16_214_1011 node16_114_989 }
.end
