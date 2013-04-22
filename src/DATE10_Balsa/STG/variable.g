
.outputs latchRq read0_ac write_ac
.inputs latchAc read0_rq write_rq

.graph
latchAc+ latchRq- write_ac+
latchAc- latchRq+
latchRq+ latchAc+
latchRq- latchAc-
read0_ac+ read0_rq-
read0_ac- read0_rq+
read0_rq+ read0_ac+
read0_rq- read0_ac-
write_ac+ write_rq-
write_ac- write_rq+
write_rq+ latchRq+ write_ac+
write_rq- write_ac-

.marking { <latchAc-,latchRq+> <read0_ac-,read0_rq+> <write_ac-,write_rq+> }
.end
