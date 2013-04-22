
.outputs t
.inputs i
.dummy dum1 dum2 dum3 dum4 dum5 dum6

.graph
aux_10 dum5
aux_11 dum6
aux_12 i- i-/1
aux_13 i+ i+/1
p0 dum1 dum3
p1 dum5
p2 dum2 dum4
p3 dum6
dum1 dum2 i- p1
dum2 i+/1 p3
dum3 dum4 i-/1 p1
dum4 i+ p3
i+ dum1 aux_10
i+/1 dum3 aux_10
i- dum2 aux_11
i-/1 dum4 aux_11
t+ aux_12
t- aux_13
dum5 t+ p2
dum6 t- p0

.marking { <dum4,i+> aux_13 p0 }
.end
