#Generated by JavaDesi Sat Jul 24 06:04:17 BST 2010
#Number of places: 72  Number of Transitions: 45

.inputs c1_activate_rq c2_out_ac 
.outputs c1_activate_ac c2_out_rq 
.dummy dum28 dum27 dum89 dum91 dum90 dum86 dum85 dum88 dum87 dum82 dum81 dum84 dum83 dum79 dum78 dum80 dum26 dum25 dum37 dum38 dum92 dum39 dum40 dum59 dum58 dum57 dum56 dum60 dum55 dum54 dum53 dum77 dum7 

.graph
p_615 dum25/368 dum77/545
p_619 dum85/559 dum53/465
p_616 dum37/410 dum81/553
p_620 dum89/565 dum57/480
p_797 c2_out_rq+/23 c2_out_rq+/25
p_795 c2_out_rq+/25
p_794 c2_out_rq+/25
p_780 c2_out_rq+/23
p_779 c2_out_rq+/23
node4_35_375 dum79/435 dum27/376
node6_37_371 dum28/380 dum80/438
node7_38_382 dum26/372 dum78/547
node5_36_379 dum25/368 dum77/545
node2_33_413 dum84/463 dum40/424
node3_34_426 dum38/414 dum82/555
node0_31_417 dum83/460 dum39/418
node1_32_421 dum37/410 dum81/553
node7_268_479 dum86/561 dum54/469
node5_266_476 dum85/559 dum53/465
node4_265_472 dum87/515 dum55/473
node6_267_468 dum88/518 dum56/477
node3_264_496 dum58/484 dum90/568
node1_262_491 dum89/565 dum57/480
node0_261_487 dum59/488 dum91/540
node2_263_483 dum60/494 dum92/543
c1_activate_ac+/1 c1_activate_rq-/2
c1_activate_rq-/2 c1_activate_ac-/4
c1_activate_ac-/4 c1_activate_rq+/5
dum78/547 dum7/262 node4_35_375
c1_activate_rq+/5 dum27/376 dum39/418
dum77/545 dum80/438 node6_37_371
dum85/559 dum88/518 node6_267_468
c2_out_ac+/11 c2_out_rq-/27
dum82/555 node0_31_417 dum7/262
c2_out_ac+/14 c2_out_rq-/29
dum81/553 dum84/463 node2_33_413
c2_out_ac-/17 p_615 p_797 p_616 c2_out_rq+/23
dum89/565 dum92/543 node2_263_483
c2_out_ac-/20 p_619 p_797 c2_out_rq+/25 p_620
dum86/561 c1_activate_ac+/1 node4_265_472
c2_out_rq+/23 c2_out_ac+/11
c2_out_rq+/25 c2_out_ac+/14
c2_out_rq-/27 c2_out_ac-/17
c2_out_rq-/29 c2_out_ac-/20
dum90/568 node0_261_487 c1_activate_ac+/1
dum88/518 node7_268_479 dum86/561
dum87/515 node5_266_476 dum85/559 p_794
dum91/540 node1_262_491 p_795 dum89/565
dum92/543 node3_264_496 dum90/568
dum7/262 dum59/488 dum55/473
dum26/372 node4_35_375 dum79/435
dum25/368 dum28/380 node6_37_371
dum28/380 dum26/372 node7_38_382
dum27/376 p_780 dum25/368 node5_36_379
dum37/410 dum40/424 node2_33_413
dum38/414 dum83/460 node0_31_417
dum79/435 dum77/545 p_780 node5_36_379
dum80/438 node7_38_382 dum78/547
dum40/424 dum38/414 node3_34_426
dum39/418 dum37/410 node1_32_421 p_779
dum56/477 dum54/469 node7_268_479
dum55/473 node5_266_476 dum53/465 p_794
dum54/469 node4_265_472 dum87/515
dum53/465 dum56/477 node6_267_468
dum84/463 node3_34_426 dum82/555
dum83/460 dum81/553 node1_32_421 p_779
dum60/494 dum58/484 node3_264_496
dum59/488 dum57/480 node1_262_491 p_795
dum58/484 dum91/540 node0_261_487
dum57/480 dum60/494 node2_263_483


.marking { <c1_activate_ac-/4,c1_activate_rq+/5> p_797 <c2_out_ac-/20,c2_out_rq+/25> <c2_out_ac-/17,c2_out_rq+/23> node4_35_375 node0_31_417 node4_265_472 node0_261_487 }
.end
