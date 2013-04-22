
.outputs guard_rq activate_ac activateOut_rq
.inputs dp guard_ac activate_rq activateOut_ac

.graph
p48 guard_rq+
p49 activate_ac+ activateOut_rq+
p50 dp+ dp- guard_ac+
p53 dp- activateOut_rq+
p54 dp+ activate_ac+
p75 guard_rq-
dp+ p50 p53
dp- p50 p54
guard_ac+ p49 guard_rq-
guard_ac- guard_rq+
guard_rq+ guard_ac+
guard_rq- p50 guard_ac-
activate_ac+ p54 p75 activate_rq-
activate_ac- activate_rq+
activate_rq+ p48 activate_ac+
activate_rq- activate_ac-
activateOut_ac+ p48 activateOut_rq-
activateOut_ac- activateOut_rq+
activateOut_rq+ p53 p75 activateOut_ac+
activateOut_rq- activateOut_ac-

.marking { p50 p54 <guard_ac-,guard_rq+> <activate_ac-,activate_rq+> <activateOut_ac-,activateOut_rq+> }
.end
