
.outputs t
.inputs i
.dummy dum1 dum2 dum3 dum4 dum5 dum6

.graph
aux_8 i- i-/1
aux_9 i+ i+/1
p1 dum5
p3 dum6
dum1 i- p1
dum2 i+/1 p3
dum3 i-/1 p1
dum4 i+ p3
i+ dum1
i+/1 dum3
i- dum2
i-/1 dum4
t+ aux_8
t- aux_9
dum5 t+
dum6 t-

.marking { <dum4,i+> aux_9 }
.end
