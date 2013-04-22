
.outputs c0_dpAck c0_dpReq c0_out_ac c0_inpA_rq c0_inpB_rq
.inputs c0_out_rq c0_inpA_ac c0_inpB_ac

.graph
c0_dpAck+ c0_dpReq- c0_out_ac+
c0_dpAck- c0_dpReq+
c0_dpReq+ c0_dpAck+
c0_dpReq- c0_dpAck-
c0_out_ac+ c0_out_rq-
c0_out_ac- c0_out_rq+
c0_out_rq+ c0_inpA_rq+ c0_inpB_rq+
c0_out_rq- c0_out_ac- c0_inpA_rq- c0_inpB_rq-
c0_inpA_ac+ c0_dpReq+ c0_inpA_rq-
c0_inpA_ac- c0_inpA_rq+
c0_inpA_rq+ c0_inpA_ac+
c0_inpA_rq- c0_inpA_ac-
c0_inpB_ac+ c0_dpReq+ c0_inpB_rq-
c0_inpB_ac- c0_inpB_rq+
c0_inpB_rq+ c0_inpB_ac+
c0_inpB_rq- c0_inpB_ac-

.marking { <c0_dpAck-,c0_dpReq+> <c0_out_ac-,c0_out_rq+> <c0_inpA_ac-,c0_inpA_rq+> <c0_inpB_ac-,c0_inpB_rq+> }
.end
