#Generated by JavaDesi Sat Jul 24 05:56:33 BST 2010
#Number of places: 86  Number of Transitions: 48

.inputs c1_activate_rq c3_out_ac 
.outputs c1_activate_ac c3_out_rq 
.dummy dum61 dum64 dum63 dum65 dum68 dum67 dum57 dum76 dum77 dum78 dum80 dum81 dum116 dum82 dum69 dum117 dum21 dum72 dum74 dum93 dum92 dum90 dum96 dum94 dum86 dum85 dum84 dum37 dum88 dum42 dum41 dum40 dum98 dum99 dum50 dum48 

.graph
p_544 dum37/318 dum77/151
p_558 dum57/368 dum93/176
p_572 dum61/380 dum117/44
p_516 dum81/414
p_622 dum42/322 dum63/384
p_637 dum50/343 dum67/390
p_636 dum50/343 dum67/390
p_579 dum42/322 dum63/384
node18_153_97 dum85/422
p_687 dum69/358 dum21/278
p_682 dum64/386 dum40/226
p_681 dum65/339
p_679 dum41/326 dum65/339
p_677 dum74/398 dum78/405
p_672 dum76/66 dum72/316
p_703 dum98/441 dum99/92
p_698 dum92/82 dum88/366
p_694 dum90/427 dum94/435
p_693 dum90/427 dum94/435
p_689 dum68/392 dum48/276
p_653 dum82/411 dum86/420
p_655 dum80/289 dum84/53
p_648 dum82/411 dum86/420
p_669 dum74/398 dum78/405
p_661 c3_out_rq+/25
p_663 c3_out_rq+/23 c3_out_rq+/25
p_659 c3_out_rq+/23
p_704 dum98/441 dum99/92
p_709 dum116/94 dum96/378
node17_41_280 dum41/326
node16_151_416 dum81/414 dum85/422
c1_activate_ac+/1 c1_activate_rq-/2
c1_activate_rq-/2 c1_activate_ac-/4
c1_activate_ac-/4 c1_activate_rq+/5
dum21/278 node17_41_280 dum50/343 p_637
c1_activate_rq+/5 dum77/151 dum61/380 dum117/44 dum69/358 dum37/318 dum21/278 dum93/176 dum57/368
dum48/276 p_687 c1_activate_ac+/1
c3_out_ac+/11 c3_out_rq-/27
c3_out_ac+/14 c3_out_rq-/29
c3_out_ac-/17 p_579 p_663 c3_out_rq+/23
c3_out_ac-/20 p_648 c3_out_rq+/25 p_663
c3_out_rq+/23 c3_out_ac+/11
c3_out_rq+/25 c3_out_ac+/14
c3_out_rq-/27 c3_out_ac-/17
c3_out_rq-/29 c3_out_ac-/20
dum72/316 c1_activate_ac+/1 p_544
dum117/44 p_703 node18_153_97 dum99/92
dum37/318 dum74/398 p_669 p_681
dum80/289 dum81/414 p_694 node16_151_416
dum84/53 p_704 node16_151_416 dum85/422
dum50/343 dum48/276 p_689
dum65/339 p_622 p_659 dum63/384
dum76/66 c1_activate_ac+/1 p_544
dum41/326 dum42/322 p_622 p_659
dum42/322 dum40/226 p_682
dum92/82 p_558 c1_activate_ac+/1
dum99/92 dum116/94 p_709
dum116/94 c1_activate_ac+/1 p_572
dum57/368 p_516 dum90/427 p_693
dum61/380 p_703 node18_153_97 dum98/441
dum96/378 c1_activate_ac+/1 p_572
dum69/358 dum67/390 node17_41_280 p_637
dum88/366 c1_activate_ac+/1 p_558
dum82/411 p_655 dum80/289
dum81/414 p_653 dum82/411 p_661
dum78/405 dum76/66 p_672
dum68/392 p_687 c1_activate_ac+/1
dum74/398 dum72/316 p_672
dum64/386 dum65/339 p_679 p_677
dum63/384 dum64/386 p_682
dum67/390 dum68/392 p_689
dum77/151 p_669 p_681 dum78/405
dum98/441 p_709 dum96/378
dum94/435 dum92/82 p_698
dum90/427 p_698 dum88/366
dum93/176 p_516 dum94/435 p_693
dum86/420 p_655 dum84/53
dum85/422 p_653 p_661 dum86/420
dum40/226 dum41/326 p_679 p_636


.marking { p_544 <c1_activate_ac-/4,c1_activate_rq+/5> p_558 p_572 p_687 <dum64/386,dum65/339> p_679 <c3_out_ac-/20,c3_out_rq+/25> p_663 <c3_out_ac-/17,c3_out_rq+/23> <dum40/226,dum41/326> <dum80/289,dum81/414> node16_151_416 <dum84/53,dum85/422> }
.end
