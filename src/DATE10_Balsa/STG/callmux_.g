
.outputs c0_out_rq c0_sel0Rq c0_sel1Rq c0_inp0_ac c0_inp1_ac
.inputs c0_selAq c0_out_ac c0_inp0_rq c0_inp1_rq

.graph
p50 c0_selAq+
p51 c0_selAq-
p52 c0_sel0Rq- c0_sel1Rq-
p53 c0_sel0Rq+ c0_sel1Rq+
p58 c0_sel0Rq- c0_sel1Rq- c0_inp0_ac+ c0_inp1_ac+
c0_selAq+ p52 c0_out_rq+
c0_selAq- p53
c0_out_ac+ p58 c0_out_rq-
c0_out_ac- c0_out_rq+
c0_out_rq+ c0_out_ac+
c0_out_rq- c0_out_ac-
c0_sel0Rq+ p50 c0_sel0Rq-
c0_sel0Rq- p51 c0_sel0Rq+
c0_sel1Rq+ p50 c0_sel1Rq-
c0_sel1Rq- p51 c0_sel1Rq+
c0_inp0_ac+ c0_inp0_rq-
c0_inp0_ac- c0_inp0_rq+
c0_inp0_rq+ c0_sel0Rq+ c0_inp0_ac+
c0_inp0_rq- c0_inp0_ac-
c0_inp1_ac+ c0_inp1_rq-
c0_inp1_ac- c0_inp1_rq+
c0_inp1_rq+ c0_sel1Rq+ c0_inp1_ac+
c0_inp1_rq- c0_inp1_ac-

.marking { p53 <c0_out_ac-,c0_out_rq+> <c0_sel0Rq-,c0_sel0Rq+> <c0_sel1Rq-,c0_sel1Rq+> <c0_inp0_ac-,c0_inp0_rq+> <c0_inp1_ac-,c0_inp1_rq+> }
.end
