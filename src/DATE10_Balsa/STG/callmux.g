
.outputs out_rq sel0Rq sel1Rq inp0_ac inp1_ac
.inputs selAq out_ac inp0_rq inp1_rq

.graph
p50 selAq+
p51 selAq-
p52 sel0Rq- sel1Rq-
p53 sel0Rq+ sel1Rq+
p58 inp0_ac+ inp1_ac+
p59 sel0Rq- sel1Rq-
p62 inp0_rq+ inp1_rq+
selAq+ p52 out_rq+
selAq- p53
out_ac+ p58 p59 out_rq-
out_ac- out_rq+
out_rq+ out_ac+
out_rq- out_ac-
sel0Rq+ p50 sel0Rq-
sel0Rq- p51 sel0Rq+
sel1Rq+ p50 sel1Rq-
sel1Rq- p51 sel1Rq+
inp0_ac+ p62 inp0_rq-
inp0_ac- inp0_rq+
inp0_rq+ sel0Rq+ inp0_ac+
inp0_rq- inp0_ac-
inp1_ac+ p62 inp1_rq-
inp1_ac- inp1_rq+
inp1_rq+ sel1Rq+ inp1_ac+
inp1_rq- inp1_ac-

.marking { p53 p62 <out_ac-,out_rq+> <sel0Rq-,sel0Rq+> <sel1Rq-,sel1Rq+> <inp0_ac-,inp0_rq+> <inp1_ac-,inp1_rq+> }
.end
