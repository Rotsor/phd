# STG file generated by Workcraft -- http://workcraft.org
.inputs i
.outputs x
.dummy dum1 dum2 dum3 dum4
.graph
i+ dum1 aux_10
i+/1 dum3 aux_10
i- dum2 aux_11
i-/1 dum4 aux_11
x+ aux_12 p2
x- aux_13 p0
dum1 dum2 i- p1
dum2 i+/1 p3
dum3 dum4 i-/1 p1
dum4 i+ p3
aux_10 x+
aux_11 x-
aux_12 i- i-/1
aux_13 i+ i+/1
p0 dum1 dum3
p1 x+
p2 dum2 dum4
p3 x-
.marking {<dum4,i+> aux_13 p0}
.end
