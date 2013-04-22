
.outputs c8_dpReq c0_out_rq c12_dpReq c16_dpReq c20_dpReq c8_out_ac c20_out_ac c24_latchRq c31_latchRq c24_read4_ac c24_write_ac c31_write_ac c4_activate_ac
.inputs c4_dp c8_dpAck c0_out_ac c12_dpAck c16_dpAck c20_dpAck c8_out_rq c20_out_rq c24_latchAc c31_latchAc c24_read4_rq c24_write_rq c31_write_rq c4_activate_rq
.dummy cn_66_ac cn_66_rq cn_67_ac cn_67_rq cn_68_ac cn_68_rq cn_69_ac cn_69_rq cn_70_ac cn_70_rq cn_71_ac cn_71_rq cn_72_ac cn_72_rq cn_73_ac cn_73_rq cn_74_ac cn_74_rq cn_75_ac cn_75_rq cn_76_ac cn_76_rq

.graph
p48 cn_76_rq+
p49 cn_75_rq+ c4_activate_ac+
p50 c4_dp+ c4_dp- cn_76_ac+
p53 c4_dp- cn_75_rq+
p54 c4_dp+ c4_activate_ac+
p75 cn_76_rq-
c4_dp+ p50 p53
c4_dp- p50 p54
c8_dpAck+ c8_dpReq- c8_out_ac+
c8_dpAck- c8_dpReq+
c8_dpReq+ c8_dpAck+
c8_dpReq- c8_dpAck-
cn_66_ac+ cn_66_rq- c0_out_rq+
cn_66_ac- cn_66_rq+
cn_66_rq+ cn_66_ac+ cn_69_rq+ cn_73_rq+
cn_66_rq- cn_66_ac- cn_69_rq- cn_73_rq-
cn_67_ac+ c8_dpReq+ cn_67_rq-
cn_67_ac- cn_67_rq+
cn_67_rq+ cn_67_ac+
cn_67_rq- cn_67_ac-
cn_68_ac+ cn_68_rq- c12_dpReq+
cn_68_ac- cn_68_rq+
cn_68_rq+ cn_68_ac+
cn_68_rq- cn_68_ac-
cn_69_ac+ cn_69_rq- c16_dpReq+
cn_69_ac- cn_69_rq+
cn_69_rq+ cn_69_ac+
cn_69_rq- cn_69_ac-
cn_70_ac+ cn_70_rq- c20_dpReq+
cn_70_ac- cn_70_rq+
cn_70_rq+ cn_70_ac+
cn_70_rq- cn_70_ac-
cn_71_ac+ c8_dpReq+ cn_71_rq-
cn_71_ac- cn_71_rq+
cn_71_rq+ cn_71_ac+
cn_71_rq- cn_71_ac-
cn_72_ac+ cn_72_rq- c12_dpReq+
cn_72_ac- cn_72_rq+
cn_72_rq+ cn_72_ac+
cn_72_rq- cn_72_ac-
cn_73_ac+ cn_73_rq- c16_dpReq+
cn_73_ac- cn_73_rq+
cn_73_rq+ cn_73_ac+
cn_73_rq- cn_73_ac-
cn_74_ac+ cn_74_rq- c20_dpReq+
cn_74_ac- cn_74_rq+
cn_74_rq+ cn_74_ac+
cn_74_rq- cn_74_ac-
cn_75_ac+ p48 cn_75_rq-
cn_75_ac- cn_75_rq+
cn_75_rq+ p53 p75 cn_66_rq+ cn_75_ac+
cn_75_rq- cn_75_ac-
cn_76_ac+ p49 cn_76_rq-
cn_76_ac- cn_76_rq+
cn_76_rq+ cn_68_rq+ cn_72_rq+ cn_76_ac+
cn_76_rq- p50 cn_68_rq- cn_72_rq- cn_76_ac-
c0_out_ac+ cn_66_rq- cn_75_ac+ c0_out_rq-
c0_out_ac- c0_out_rq+
c0_out_rq+ c0_out_ac+
c0_out_rq- c0_out_ac-
c12_dpAck+ cn_76_ac+ c12_dpReq-
c12_dpAck- c12_dpReq+
c12_dpReq+ c12_dpAck+
c12_dpReq- c12_dpAck-
c16_dpAck+ cn_66_ac+ c16_dpReq-
c16_dpAck- c16_dpReq+
c16_dpReq+ c16_dpAck+
c16_dpReq- c16_dpAck-
c20_dpAck+ c20_dpReq- c20_out_ac+
c20_dpAck- c20_dpReq+
c20_dpReq+ c20_dpAck+
c20_dpReq- c20_dpAck-
c8_out_ac+ c8_out_rq-
c8_out_ac- c8_out_rq+
c8_out_rq+ cn_67_rq+ cn_71_rq+ c8_out_ac+
c8_out_rq- cn_67_rq- cn_71_rq- c8_out_ac-
c20_out_ac+ c20_out_rq-
c20_out_ac- c20_out_rq+
c20_out_rq+ cn_70_rq+ cn_74_rq+ c20_out_ac+
c20_out_rq- cn_70_rq- cn_74_rq- c20_out_ac-
c24_latchAc+ c24_latchRq- c24_write_ac+
c24_latchAc- c24_latchRq+
c24_latchRq+ c24_latchAc+
c24_latchRq- c24_latchAc-
c31_latchAc+ c31_latchRq- c31_write_ac+
c31_latchAc- c31_latchRq+
c31_latchRq+ c31_latchAc+
c31_latchRq- c31_latchAc-
c24_read4_ac+ c24_read4_rq-
c24_read4_ac- c24_read4_rq+
c24_read4_rq+ c24_read4_ac+
c24_read4_rq- c24_read4_ac-
c24_write_ac+ c24_write_rq-
c24_write_ac- c24_write_rq+
c24_write_rq+ c24_latchRq+ c24_write_ac+
c24_write_rq- c24_write_ac-
c31_write_ac+ c31_write_rq-
c31_write_ac- c31_write_rq+
c31_write_rq+ c31_latchRq+ c31_write_ac+
c31_write_rq- c31_write_ac-
c4_activate_ac+ p54 p75 c4_activate_rq-
c4_activate_ac- c4_activate_rq+
c4_activate_rq+ p48 c4_activate_ac+
c4_activate_rq- c4_activate_ac-

.marking { p50 p54 <c8_dpAck-,c8_dpReq+> <cn_66_ac-,cn_66_rq+> <cn_67_ac-,cn_67_rq+> <cn_68_ac-,cn_68_rq+> <cn_69_ac-,cn_69_rq+> <cn_70_ac-,cn_70_rq+> <cn_71_ac-,cn_71_rq+> <cn_72_ac-,cn_72_rq+> <cn_73_ac-,cn_73_rq+> <cn_74_ac-,cn_74_rq+> <cn_75_ac-,cn_75_rq+> <cn_76_ac-,cn_76_rq+> <c0_out_ac-,c0_out_rq+> <c12_dpAck-,c12_dpReq+> <c16_dpAck-,c16_dpReq+> <c20_dpAck-,c20_dpReq+> <c8_out_ac-,c8_out_rq+> <c20_out_ac-,c20_out_rq+> <c24_latchAc-,c24_latchRq+> <c31_latchAc-,c31_latchRq+> <c24_read4_ac-,c24_read4_rq+> <c24_write_ac-,c24_write_rq+> <c31_write_ac-,c31_write_rq+> <c4_activate_ac-,c4_activate_rq+> }
.end
