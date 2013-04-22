
.outputs inp_rq out_rq activate_ac
.inputs inp_ac out_ac activate_rq

.graph
inp_ac+ inp_rq- out_rq+
inp_ac- inp_rq+
inp_rq+ inp_ac+
inp_rq- inp_ac-
out_ac+ inp_rq- out_rq- activate_ac+
out_ac- out_rq+
out_rq+ out_ac+
out_rq- out_ac-
activate_ac+ activate_rq-
activate_ac- activate_rq+
activate_rq+ inp_rq+ activate_ac+
activate_rq- activate_ac-

.marking { <inp_ac-,inp_rq+> <out_ac-,out_rq+> <activate_ac-,activate_rq+> }
.end
