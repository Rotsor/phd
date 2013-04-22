
.outputs inp_ac activateOut0_rq activateOut1_rq
.inputs dp inp_rq activateOut0_ac activateOut1_ac

.graph
p48 dp+ dp- inp_rq+
p51 dp- activateOut1_rq+
p52 dp+ activateOut0_rq+
p63 inp_ac+
p64 activateOut0_rq+ activateOut1_rq+
dp+ p48 p51
dp- p48 p52
inp_ac+ p48 inp_rq-
inp_ac- inp_rq+
inp_rq+ p64 inp_ac+
inp_rq- inp_ac-
activateOut0_ac+ p63 activateOut0_rq-
activateOut0_ac- activateOut0_rq+
activateOut0_rq+ p52 activateOut0_ac+
activateOut0_rq- activateOut0_ac-
activateOut1_ac+ p63 activateOut1_rq-
activateOut1_ac- activateOut1_rq+
activateOut1_rq+ p51 activateOut1_ac+
activateOut1_rq- activateOut1_ac-

.marking { p48 p52 <inp_ac-,inp_rq+> <activateOut0_ac-,activateOut0_rq+> <activateOut1_ac-,activateOut1_rq+> }
.end
