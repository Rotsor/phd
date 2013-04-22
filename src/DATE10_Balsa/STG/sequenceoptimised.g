
.outputs activate_ac out0_rq out1_rq
.inputs activate_rq out0_ac out1_ac

.graph
activate_ac+ activate_rq-
activate_ac- activate_rq+
activate_rq+ activate_ac+ out0_rq+
activate_rq- activate_ac-
out0_ac+ out0_rq- out1_rq+
out0_ac- out0_rq+
out0_rq+ out0_ac+
out0_rq- out0_ac-
out1_ac+ activate_ac+ out1_rq-
out1_ac- out1_rq+
out1_rq+ out1_ac+
out1_rq- out1_ac-

.marking { <activate_ac-,activate_rq+> <out0_ac-,out0_rq+> <out1_ac-,out1_rq+> }
.end
