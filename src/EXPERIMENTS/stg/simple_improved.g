# STG file generated by Workcraft -- http://workcraft.org
.inputs i
.outputs o a b
.graph
i+ b+
i+/1 a+
i- b-
i-/1 a-
o+ aux_8
o- aux_9
a+ i-/1 p1
a- i+ p3
b+ i- p1
b- i+/1 p3
aux_8 i- i-/1
aux_9 i+ i+/1
p1 o+
p3 o-
.marking {<a-,i+> aux_9}
.end
