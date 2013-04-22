
.outputs c0_guard_rq c0_activate_ac c7_activate_ac c14_activate_ac c0_activateOut_rq c7_activateOut0_rq c7_activateOut1_rq c14_activateOut0_rq c14_activateOut1_rq
.internal i48 i49
.inputs c0_guard_ac c0_activate_rq c7_activate_rq c14_activate_rq c0_activateOut_ac c7_activateOut0_ac c7_activateOut1_ac c14_activateOut0_ac c14_activateOut1_ac

.graph
p15 c0_guard_rq-
p44 c0_guard_rq+
p45 c0_activate_ac+ c0_activateOut_rq+
p46 i49 c0_activateOut_rq+
p47 i48 c0_activate_ac+
i48 p46
i49 p47
c0_guard_ac+ p45
c0_guard_ac- c0_guard_rq+
c0_guard_rq+ c0_guard_ac+
c0_guard_rq- c0_guard_ac-
c0_activate_ac+ p15 p47 c0_activate_rq-
c0_activate_ac- c0_activate_rq+
c0_activate_rq+ p44
c0_activate_rq- c0_activate_ac-
c7_activate_ac+ c7_activate_rq-
c7_activate_ac- c7_activate_rq+
c7_activate_rq+ c7_activateOut0_rq+ c7_activateOut1_rq+
c7_activate_rq- c7_activate_ac-
c14_activate_ac+ c14_activate_rq-
c14_activate_ac- c14_activate_rq+
c14_activate_rq+ c14_activateOut0_rq+
c14_activate_rq- c14_activate_ac-
c0_activateOut_ac+ p44 c0_activateOut_rq-
c0_activateOut_ac- c0_activateOut_rq+
c0_activateOut_rq+ p15 p46 c0_activateOut_ac+
c0_activateOut_rq- c0_activateOut_ac-
c7_activateOut0_ac+ c7_activate_ac+ c7_activateOut0_rq-
c7_activateOut0_ac- c7_activateOut0_rq+
c7_activateOut0_rq+ c7_activateOut0_ac+
c7_activateOut0_rq- c7_activateOut0_ac-
c7_activateOut1_ac+ c7_activate_ac+ c7_activateOut1_rq-
c7_activateOut1_ac- c7_activateOut1_rq+
c7_activateOut1_rq+ c7_activateOut1_ac+
c7_activateOut1_rq- c7_activateOut1_ac-
c14_activateOut0_ac+ c14_activateOut0_rq- c14_activateOut1_rq+
c14_activateOut0_ac- c14_activateOut0_rq+
c14_activateOut0_rq+ c14_activateOut0_ac+
c14_activateOut0_rq- c14_activateOut0_ac-
c14_activateOut1_ac+ c14_activate_ac+ c14_activateOut1_rq-
c14_activateOut1_ac- c14_activateOut1_rq+
c14_activateOut1_rq+ c14_activateOut1_ac+
c14_activateOut1_rq- c14_activateOut1_ac-

.marking { <c0_guard_ac-,c0_guard_rq+> <c0_activate_ac-,c0_activate_rq+> <c7_activate_ac-,c7_activate_rq+> <c14_activate_ac-,c14_activate_rq+> <c0_activateOut_ac-,c0_activateOut_rq+> <c7_activateOut0_ac-,c7_activateOut0_rq+> <c7_activateOut1_ac-,c7_activateOut1_rq+> <c14_activateOut0_ac-,c14_activateOut0_rq+> <c14_activateOut1_ac-,c14_activateOut1_rq+> }
.end
