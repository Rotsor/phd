
.outputs activate_ac activateOut0_rq activateOut1_rq
.inputs activate_rq activateOut0_ac activateOut1_ac

.graph
activate_ac+ activate_rq-
activate_ac- activate_rq+
activate_rq+ activate_ac+ activateOut0_rq+ activateOut1_rq+
activate_rq- activate_ac-
activateOut0_ac+ activate_ac+ activateOut0_rq-
activateOut0_ac- activateOut0_rq+
activateOut0_rq+ activateOut0_ac+
activateOut0_rq- activateOut0_ac-
activateOut1_ac+ activate_ac+ activateOut1_rq-
activateOut1_ac- activateOut1_rq+
activateOut1_rq+ activateOut1_ac+
activateOut1_rq- activateOut1_ac-

.marking { <activate_ac-,activate_rq+> <activateOut0_ac-,activateOut0_rq+> <activateOut1_ac-,activateOut1_rq+> }
.end
