
.outputs c8_dpReq c12_dpReq c59_dpReq c71_dpReq c39_sel0Rq c39_sel1Rq c43_inp_rq c51_sel0Rq c51_sel1Rq c55_inp_rq c16_latchRq c23_latchRq c75_latchRq c82_latchRq c16_read0_ac c16_read1_ac c16_read2_ac c16_read3_ac c16_read4_ac c16_write_ac c23_read0_ac c23_read1_ac c23_read2_ac c23_read3_ac c23_read4_ac c23_read5_ac c23_write_ac c75_read4_ac c31_activate_ac
.internal cn_157_ac cn_157_rq cn_158_ac cn_158_rq cn_159_ac cn_159_rq cn_160_ac cn_160_rq cn_161_ac cn_161_rq cn_162_ac cn_162_rq cn_163_ac cn_163_rq cn_164_ac cn_164_rq cn_165_ac cn_165_rq cn_166_ac cn_166_rq cn_167_ac cn_167_rq cn_168_ac cn_168_rq cn_169_ac cn_169_rq cn_170_ac cn_170_rq cn_171_ac cn_171_rq cn_172_ac cn_172_rq cn_173_ac cn_173_rq cn_174_ac cn_174_rq cn_175_ac cn_175_rq cn_176_ac cn_176_rq cn_177_ac cn_177_rq cn_178_ac cn_178_rq cn_179_ac cn_179_rq cn_180_ac cn_180_rq cn_181_ac cn_181_rq cn_182_ac cn_182_rq
.inputs c47_dp c63_dp c8_dpAck c12_dpAck c39_selAq c51_selAq c59_dpAck c71_dpAck c43_inp_ac c55_inp_ac c16_latchAc c23_latchAc c75_latchAc c82_latchAc c16_read0_rq c16_read1_rq c16_read2_rq c16_read3_rq c16_read4_rq c16_write_rq c23_read0_rq c23_read1_rq c23_read2_rq c23_read3_rq c23_read4_rq c23_read5_rq c23_write_rq c75_read4_rq c31_activate_rq

.graph
p53 c51_sel0Rq+ c51_sel1Rq+
p63 cn_169_ac+
p75 cn_170_rq-
p48_268 cn_170_rq+
p48_301 c47_dp+ c47_dp- cn_169_rq+
p49_269 cn_176_rq+ cn_177_ac+
p50_117 c51_selAq+
p50_220 c39_selAq+
p50_270 c63_dp+ c63_dp- cn_170_ac+
p51_118 c51_selAq-
p51_221 c39_selAq-
p51_302 c47_dp- cn_180_rq+
p52_119 c51_sel0Rq- c51_sel1Rq-
p52_222 c39_sel0Rq- c39_sel1Rq-
p52_303 c47_dp+ cn_179_rq+
p53_223 c39_sel0Rq+ c39_sel1Rq+
p53_271 c63_dp- cn_176_rq+
p54_272 c63_dp+ cn_177_ac+
p64_304 cn_179_rq+ cn_180_rq+
c47_dp+ p48_301 p51_302
c47_dp- p48_301 p52_303
c63_dp+ p50_270 p53_271
c63_dp- p50_270 p54_272
c8_dpAck+ c8_dpReq- cn_178_ac+
c8_dpAck- c8_dpReq+
c8_dpReq+ c8_dpAck+
c8_dpReq- c8_dpAck-
c12_dpAck+ c12_dpReq- cn_157_ac+
c12_dpAck- c12_dpReq+
c12_dpReq+ c12_dpAck+
c12_dpReq- c12_dpAck-
c39_selAq+ p52_222 cn_167_rq+
c39_selAq- p53_223
c51_selAq+ p52_119 cn_166_rq+
c51_selAq- p53
c59_dpAck+ c59_dpReq- cn_168_ac+
c59_dpAck- c59_dpReq+
c59_dpReq+ c59_dpAck+
c59_dpReq- c59_dpAck-
c71_dpAck+ c71_dpReq- cn_170_ac+
c71_dpAck- c71_dpReq+
c71_dpReq+ c71_dpAck+
c71_dpReq- c71_dpAck-
cn_157_ac+ cn_157_rq- cn_181_rq+
cn_157_ac- cn_157_rq+
cn_157_rq+ cn_157_ac+ cn_162_rq+ cn_163_rq+
cn_157_rq- cn_157_ac- cn_162_rq- cn_163_rq-
cn_158_ac+ c71_dpReq+ cn_158_rq-
cn_158_ac- cn_158_rq+
cn_158_rq+ cn_158_ac+
cn_158_rq- cn_158_ac-
cn_159_ac+ c71_dpReq+ cn_159_rq-
cn_159_ac- cn_159_rq+
cn_159_rq+ cn_159_ac+
cn_159_rq- cn_159_ac-
cn_160_ac+ c8_dpReq+ cn_160_rq-
cn_160_ac- cn_160_rq+
cn_160_rq+ cn_160_ac+
cn_160_rq- cn_160_ac-
cn_161_ac+ c8_dpReq+ cn_161_rq-
cn_161_ac- cn_161_rq+
cn_161_rq+ cn_161_ac+
cn_161_rq- cn_161_ac-
cn_162_ac+ c12_dpReq+ cn_162_rq-
cn_162_ac- cn_162_rq+
cn_162_rq+ cn_162_ac+
cn_162_rq- cn_162_ac-
cn_163_ac+ c12_dpReq+ cn_163_rq-
cn_163_ac- cn_163_rq+
cn_163_rq+ cn_163_ac+
cn_163_rq- cn_163_ac-
cn_164_ac+ c59_dpReq+ cn_164_rq-
cn_164_ac- cn_164_rq+
cn_164_rq+ cn_164_ac+
cn_164_rq- cn_164_ac-
cn_165_ac+ c59_dpReq+ cn_165_rq-
cn_165_ac- cn_165_rq+
cn_165_rq+ cn_165_ac+
cn_165_rq- cn_165_ac-
cn_166_ac+ cn_166_rq- cn_172_ac+ cn_181_ac+ c51_sel0Rq- c51_sel1Rq-
cn_166_ac- cn_166_rq+
cn_166_rq+ cn_166_ac+ c75_latchRq+
cn_166_rq- cn_166_ac-
cn_167_ac+ cn_167_rq- cn_171_ac+ cn_182_ac+ c39_sel0Rq- c39_sel1Rq-
cn_167_ac- cn_167_rq+
cn_167_rq+ cn_167_ac+ c82_latchRq+
cn_167_rq- cn_167_ac-
cn_168_ac+ cn_168_rq- cn_169_rq+
cn_168_ac- cn_168_rq+
cn_168_rq+ cn_164_rq+ cn_165_rq+ cn_168_ac+
cn_168_rq- cn_164_rq- cn_165_rq- cn_168_ac-
cn_169_ac+ p48_301 cn_168_rq- cn_169_rq- cn_176_ac+
cn_169_ac- cn_169_rq+
cn_169_rq+ p64_304 cn_169_ac+
cn_169_rq- cn_169_ac-
cn_170_ac+ p49_269 cn_170_rq-
cn_170_ac- cn_170_rq+
cn_170_rq+ cn_158_rq+ cn_159_rq+ cn_170_ac+
cn_170_rq- p50_270 cn_158_rq- cn_159_rq- cn_170_ac-
cn_171_ac+ cn_171_rq- cn_174_ac+ c55_inp_rq-
cn_171_ac- cn_171_rq+
cn_171_rq+ cn_171_ac+ c39_sel1Rq+
cn_171_rq- cn_171_ac-
cn_172_ac+ cn_172_rq- cn_173_ac+ c43_inp_rq-
cn_172_ac- cn_172_rq+
cn_172_rq+ cn_172_ac+ c51_sel1Rq+
cn_172_rq- cn_172_ac-
cn_173_ac+ cn_173_rq- cn_175_ac+
cn_173_ac- cn_173_rq+
cn_173_rq+ cn_173_ac+ c43_inp_rq+
cn_173_rq- cn_173_ac-
cn_174_ac+ cn_174_rq- cn_175_ac+
cn_174_ac- cn_174_rq+
cn_174_rq+ cn_174_ac+ c55_inp_rq+
cn_174_rq- cn_174_ac-
cn_175_ac+ cn_175_rq- c31_activate_ac+
cn_175_ac- cn_175_rq+
cn_175_rq+ cn_173_rq+ cn_174_rq+ cn_175_ac+
cn_175_rq- cn_175_ac-
cn_176_ac+ p48_268 cn_176_rq-
cn_176_ac- cn_176_rq+
cn_176_rq+ p75 p53_271 cn_168_rq+ cn_176_ac+
cn_176_rq- cn_176_ac-
cn_177_ac+ p75 p54_272 cn_175_rq+ cn_177_rq-
cn_177_ac- cn_177_rq+
cn_177_rq+ p48_268 cn_177_ac+
cn_177_rq- cn_177_ac-
cn_178_ac+ cn_178_rq- cn_182_rq+
cn_178_ac- cn_178_rq+
cn_178_rq+ cn_160_rq+ cn_161_rq+ cn_178_ac+
cn_178_rq- cn_160_rq- cn_161_rq- cn_178_ac-
cn_179_ac+ p63 cn_179_rq-
cn_179_ac- cn_179_rq+
cn_179_rq+ p52_303 cn_178_rq+ cn_179_ac+
cn_179_rq- cn_179_ac-
cn_180_ac+ p63 cn_180_rq-
cn_180_ac- cn_180_rq+
cn_180_rq+ p51_302 cn_157_rq+ cn_180_ac+
cn_180_rq- cn_180_ac-
cn_181_ac+ cn_157_rq- cn_180_ac+ cn_181_rq-
cn_181_ac- cn_181_rq+
cn_181_rq+ cn_181_ac+ c51_sel0Rq+
cn_181_rq- cn_181_ac-
cn_182_ac+ cn_178_rq- cn_179_ac+ cn_182_rq-
cn_182_ac- cn_182_rq+
cn_182_rq+ cn_182_ac+ c39_sel0Rq+
cn_182_rq- cn_182_ac-
c39_sel0Rq+ p50_220 c39_sel0Rq-
c39_sel0Rq- p51_221 c39_sel0Rq+
c39_sel1Rq+ p50_220 c39_sel1Rq-
c39_sel1Rq- p51_221 c39_sel1Rq+
c43_inp_ac+ cn_172_rq+ c43_inp_rq-
c43_inp_ac- c43_inp_rq+
c43_inp_rq+ c43_inp_ac+
c43_inp_rq- c43_inp_ac-
c51_sel0Rq+ p50_117 c51_sel0Rq-
c51_sel0Rq- p51_118 c51_sel0Rq+
c51_sel1Rq+ p50_117 c51_sel1Rq-
c51_sel1Rq- p51_118 c51_sel1Rq+
c55_inp_ac+ cn_171_rq+ c55_inp_rq-
c55_inp_ac- c55_inp_rq+
c55_inp_rq+ c55_inp_ac+
c55_inp_rq- c55_inp_ac-
c16_latchAc+ c16_latchRq- c16_write_ac+
c16_latchAc- c16_latchRq+
c16_latchRq+ c16_latchAc+
c16_latchRq- c16_latchAc-
c23_latchAc+ c23_latchRq- c23_write_ac+
c23_latchAc- c23_latchRq+
c23_latchRq+ c23_latchAc+
c23_latchRq- c23_latchAc-
c75_latchAc+ cn_166_ac+ c75_latchRq-
c75_latchAc- c75_latchRq+
c75_latchRq+ c75_latchAc+
c75_latchRq- c75_latchAc-
c82_latchAc+ cn_167_ac+ c82_latchRq-
c82_latchAc- c82_latchRq+
c82_latchRq+ c82_latchAc+
c82_latchRq- c82_latchAc-
c16_read0_ac+ c16_read0_rq-
c16_read0_ac- c16_read0_rq+
c16_read0_rq+ c16_read0_ac+
c16_read0_rq- c16_read0_ac-
c16_read1_ac+ c16_read1_rq-
c16_read1_ac- c16_read1_rq+
c16_read1_rq+ c16_read1_ac+
c16_read1_rq- c16_read1_ac-
c16_read2_ac+ c16_read2_rq-
c16_read2_ac- c16_read2_rq+
c16_read2_rq+ c16_read2_ac+
c16_read2_rq- c16_read2_ac-
c16_read3_ac+ c16_read3_rq-
c16_read3_ac- c16_read3_rq+
c16_read3_rq+ c16_read3_ac+
c16_read3_rq- c16_read3_ac-
c16_read4_ac+ c16_read4_rq-
c16_read4_ac- c16_read4_rq+
c16_read4_rq+ c16_read4_ac+
c16_read4_rq- c16_read4_ac-
c16_write_ac+ c16_write_rq-
c16_write_ac- c16_write_rq+
c16_write_rq+ c16_latchRq+ c16_write_ac+
c16_write_rq- c16_write_ac-
c23_read0_ac+ c23_read0_rq-
c23_read0_ac- c23_read0_rq+
c23_read0_rq+ c23_read0_ac+
c23_read0_rq- c23_read0_ac-
c23_read1_ac+ c23_read1_rq-
c23_read1_ac- c23_read1_rq+
c23_read1_rq+ c23_read1_ac+
c23_read1_rq- c23_read1_ac-
c23_read2_ac+ c23_read2_rq-
c23_read2_ac- c23_read2_rq+
c23_read2_rq+ c23_read2_ac+
c23_read2_rq- c23_read2_ac-
c23_read3_ac+ c23_read3_rq-
c23_read3_ac- c23_read3_rq+
c23_read3_rq+ c23_read3_ac+
c23_read3_rq- c23_read3_ac-
c23_read4_ac+ c23_read4_rq-
c23_read4_ac- c23_read4_rq+
c23_read4_rq+ c23_read4_ac+
c23_read4_rq- c23_read4_ac-
c23_read5_ac+ c23_read5_rq-
c23_read5_ac- c23_read5_rq+
c23_read5_rq+ c23_read5_ac+
c23_read5_rq- c23_read5_ac-
c23_write_ac+ c23_write_rq-
c23_write_ac- c23_write_rq+
c23_write_rq+ c23_latchRq+ c23_write_ac+
c23_write_rq- c23_write_ac-
c75_read4_ac+ c75_read4_rq-
c75_read4_ac- c75_read4_rq+
c75_read4_rq+ c75_read4_ac+
c75_read4_rq- c75_read4_ac-
c31_activate_ac+ c31_activate_rq-
c31_activate_ac- c31_activate_rq+
c31_activate_rq+ cn_177_rq+ c31_activate_ac+
c31_activate_rq- c31_activate_ac-

.marking { p53 p48_301 p50_270 p52_303 p53_223 p54_272 <c8_dpAck-,c8_dpReq+> <c12_dpAck-,c12_dpReq+> <c59_dpAck-,c59_dpReq+> <c71_dpAck-,c71_dpReq+> <cn_157_ac-,cn_157_rq+> <cn_158_ac-,cn_158_rq+> <cn_159_ac-,cn_159_rq+> <cn_160_ac-,cn_160_rq+> <cn_161_ac-,cn_161_rq+> <cn_162_ac-,cn_162_rq+> <cn_163_ac-,cn_163_rq+> <cn_164_ac-,cn_164_rq+> <cn_165_ac-,cn_165_rq+> <cn_166_ac-,cn_166_rq+> <cn_167_ac-,cn_167_rq+> <cn_168_ac-,cn_168_rq+> <cn_169_ac-,cn_169_rq+> <cn_170_ac-,cn_170_rq+> <cn_171_ac-,cn_171_rq+> <cn_172_ac-,cn_172_rq+> <cn_173_ac-,cn_173_rq+> <cn_174_ac-,cn_174_rq+> <cn_175_ac-,cn_175_rq+> <cn_176_ac-,cn_176_rq+> <cn_177_ac-,cn_177_rq+> <cn_178_ac-,cn_178_rq+> <cn_179_ac-,cn_179_rq+> <cn_180_ac-,cn_180_rq+> <cn_181_ac-,cn_181_rq+> <cn_182_ac-,cn_182_rq+> <c39_sel0Rq-,c39_sel0Rq+> <c39_sel1Rq-,c39_sel1Rq+> <c43_inp_ac-,c43_inp_rq+> <c51_sel0Rq-,c51_sel0Rq+> <c51_sel1Rq-,c51_sel1Rq+> <c55_inp_ac-,c55_inp_rq+> <c16_latchAc-,c16_latchRq+> <c23_latchAc-,c23_latchRq+> <c75_latchAc-,c75_latchRq+> <c82_latchAc-,c82_latchRq+> <c16_read0_ac-,c16_read0_rq+> <c16_read1_ac-,c16_read1_rq+> <c16_read2_ac-,c16_read2_rq+> <c16_read3_ac-,c16_read3_rq+> <c16_read4_ac-,c16_read4_rq+> <c16_write_ac-,c16_write_rq+> <c23_read0_ac-,c23_read0_rq+> <c23_read1_ac-,c23_read1_rq+> <c23_read2_ac-,c23_read2_rq+> <c23_read3_ac-,c23_read3_rq+> <c23_read4_ac-,c23_read4_rq+> <c23_read5_ac-,c23_read5_rq+> <c23_write_ac-,c23_write_rq+> <c75_read4_ac-,c75_read4_rq+> <c31_activate_ac-,c31_activate_rq+> }
.end
