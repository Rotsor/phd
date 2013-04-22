
.outputs c2_out_rq c1_activate_ac
.inputs c2_out_ac c1_activate_rq
.dummy dum1 dum2 dum3 dum4 dum5 dum6 dum7 dum8 dum9 dum10 dum11 dum12 dum13 dum14 dum15 dum16 dum17 dum18 dum19 dum20 dum21 dum22 dum23 dum24 dum25 dum26 dum27 dum28 dum29 dum30 dum31 dum32 dum33 dum34 dum35 dum36

.graph
dum1 dum15 dum19
dum2 dum29
dum3 dum23 dum27
dum4 dum33
c2_out_ac+ dum5
c2_out_ac- dum6
c2_out_rq+ c2_out_ac+
c2_out_rq- c2_out_ac-
c2_out_ac+/1 dum9
c2_out_ac-/1 dum10
c2_out_rq+/1 c2_out_ac+/1
c2_out_rq-/1 c2_out_ac-/1
c1_activate_ac+ c1_activate_rq-
c1_activate_ac- c1_activate_rq+
c1_activate_rq+ c1_activate_ac+ dum31
c1_activate_rq- c1_activate_ac-
dum5 dum8
dum6 dum7 dum13 dum17
dum7 c2_out_rq+
dum8 c2_out_rq-
dum9 dum12
dum10 dum11 dum21 dum25
dum11 c2_out_rq+/1
dum12 c2_out_rq-/1
dum13 dum16
dum14 dum2 dum15
dum15 dum7 dum13
dum16 dum14
dum17 dum20
dum18 dum2 dum19
dum19 dum7 dum17
dum20 dum18
dum21 dum24
dum22 dum4 dum23
dum23 dum11 dum21
dum24 dum22
dum25 dum28
dum26 dum4 dum27
dum27 dum11 dum25
dum28 dum26
dum29 dum32
dum30 dum31 dum35
dum31 dum1 dum29
dum32 dum30
dum33 dum36
dum34 c1_activate_ac+ dum35
dum35 dum3 dum33
dum36 dum34

.marking { <c1_activate_ac-,c1_activate_rq+> <dum6,dum7> <dum10,dum11> <dum14,dum15> <dum18,dum19> <dum22,dum23> <dum26,dum27> <dum30,dum31> <dum34,dum35> }
.end
