#Generated by JavaDesi Sat Jul 24 06:06:19 BST 2010
#Number of places: 46  Number of Transitions: 28

.inputs c1_activate_rq c2_out_ac 
.outputs c1_activate_ac c2_out_rq 
.dummy dum42 dum71 dum70 dum43 dum46 dum75 dum74 dum47 dum66 dum35 dum34 dum63 dum67 dum23 dum22 dum62 dum50 dum31 dum30 dum51 

.graph
p_677 dum23/307
p_702 dum42/372 dum30/333
p_696 dum23/307
p_689 dum22/306 dum34/347
p_743 dum70/453 dum74/464
p_714 dum50/402 dum46/384
p_734 dum66/442 dum62/431
p_722 dum35/348
p_726 dum35/348
node16_313 dum23/307 dum35/348
node12_13_315 c2_out_rq+/15
node16_80_340 dum43/373 dum31/334
node16_180_391 dum51/40 dum47/385
node16_314_435 dum67/86 dum63/64
node16_414_457 dum75/136 dum71/111
c1_activate_ac+/1 c1_activate_rq-/2
c1_activate_rq-/2 c1_activate_ac-/4
c1_activate_ac-/4 c1_activate_rq+/5
c1_activate_rq+/5 dum31/334 dum47/385
c2_out_ac+/11 c2_out_rq-/12
c2_out_rq-/12 c2_out_ac-/14
c2_out_ac-/14 c2_out_rq+/15 p_689
c2_out_rq+/15 c2_out_ac+/11
dum51/40 dum50/402 p_696
dum63/64 dum62/431 p_722
dum67/86 dum66/442 p_722
dum71/111 dum70/453 p_726
dum75/136 dum74/464 p_726
dum23/307 dum22/306 node12_13_315
dum22/306 p_702 p_714 dum23/307 node16_313
dum35/348 node12_13_315 dum34/347
dum34/347 p_734 node16_313 p_743 dum35/348
dum31/334 dum30/333 p_677
dum30/333 node16_80_340 dum43/373
dum43/373 dum42/372 p_677
dum42/372 node16_80_340 dum71/111 dum63/64
dum50/402 dum71/111 dum63/64 node16_180_391
dum47/385 p_696 dum46/384
dum46/384 node16_180_391 dum51/40
dum66/442 c1_activate_ac+/1 node16_314_435
dum62/431 node16_314_435 dum67/86
dum74/464 node16_414_457 c1_activate_ac+/1
dum70/453 dum75/136 node16_414_457


.marking { <c1_activate_ac-/4,c1_activate_rq+/5> <c2_out_ac-/14,c2_out_rq+/15> <dum22/306,dum23/307> <dum34/347,dum35/348> node16_313 node16_80_340 node16_180_391 node16_314_435 node16_414_457 }
.end
