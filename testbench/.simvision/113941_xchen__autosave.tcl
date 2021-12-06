
# XM-Sim Command File
# TOOL:	xmsim	18.09-s016
#

set tcl_prompt1 {puts -nonewline "xcelium> "}
set tcl_prompt2 {puts -nonewline "> "}
set vlog_format %h
set vhdl_format %v
set real_precision 6
set display_unit auto
set time_unit module
set heap_garbage_size -200
set heap_garbage_time 0
set assert_report_level note
set assert_stop_level error
set autoscope yes
set assert_1164_warnings yes
set pack_assert_off {}
set severity_pack_assert_off {note warning}
set assert_output_stop_level failed
set tcl_debug_level 0
set relax_path_name 1
set vhdl_vcdmap XX01ZX01X
set intovf_severity_level ERROR
set probe_screen_format 0
set rangecnst_severity_level ERROR
set textio_severity_level ERROR
set vital_timing_checks_on 1
set vlog_code_show_force 0
set assert_count_attempts 1
set tcl_all64 false
set tcl_runerror_exit false
set assert_report_incompletes 0
set show_force 1
set force_reset_by_reinvoke 0
set tcl_relaxed_literal 0
set probe_exclude_patterns {}
set probe_packed_limit 4k
set probe_unpacked_limit 16k
set assert_internal_msg no
set svseed 1
set assert_reporting_mode 0
alias . run
alias quit exit
database -open -shm -into waves.shm waves -default
probe -create -database waves pp_top_tb.pp_top.stage1_if.clk pp_top_tb.pp_top.stage1_if.current_pc pp_top_tb.pp_top.stage1_if.hold_if pp_top_tb.pp_top.stage1_if.hold_pc pp_top_tb.pp_top.stage1_if.if_flush pp_top_tb.pp_top.stage1_if.instr pp_top_tb.pp_top.stage1_if.instr_if pp_top_tb.pp_top.stage1_if.instr_if_temp pp_top_tb.pp_top.stage1_if.next_pc pp_top_tb.pp_top.stage1_if.pc_plus4 pp_top_tb.pp_top.stage1_if.pc_plus4_if pp_top_tb.pp_top.stage1_if.pc_plus4_plusimm16 pp_top_tb.pp_top.stage1_if.pc_src pp_top_tb.pp_top.stage1_if.rstb
probe -create -database waves pp_top_tb.pp_top.stage2_id.regA_rd_data_id pp_top_tb.pp_top.stage2_id.regB_rd_data_id
probe -create -database waves pp_top_tb.pp_top.pp_ctrl.reg_dst_ex pp_top_tb.pp_top.pp_ctrl.reg_dst_id
probe -create -database waves pp_top_tb.pp_top.pp_ctrl.reg_wr_en_ex pp_top_tb.pp_top.pp_ctrl.reg_wr_en_id pp_top_tb.pp_top.pp_ctrl.reg_wr_en_mem pp_top_tb.pp_top.pp_ctrl.reg_wr_en_wb
probe -create -database waves pp_top_tb.pp_top.stage2_id.reg_wr_en
probe -create -database waves pp_top_tb.pp_top.stage3_ex.regD_addr pp_top_tb.pp_top.stage3_ex.regT_addr pp_top_tb.pp_top.stage3_ex.reg_dst
probe -create -database waves pp_top_tb.pp_top.stage2_id.regD_addr_id pp_top_tb.pp_top.stage2_id.regT_addr_id
probe -create -database waves pp_top_tb.pp_top.stage2_id.regT_addr pp_top_tb.pp_top.stage2_id.regD_addr
probe -create -database waves pp_top_tb.pp_top.stage2_id.RF.clk pp_top_tb.pp_top.stage2_id.RF.mem pp_top_tb.pp_top.stage2_id.RF.rdA_addr pp_top_tb.pp_top.stage2_id.RF.rdA_data pp_top_tb.pp_top.stage2_id.RF.rdB_addr pp_top_tb.pp_top.stage2_id.RF.rdB_data pp_top_tb.pp_top.stage2_id.RF.rstb pp_top_tb.pp_top.stage2_id.RF.wr_addr pp_top_tb.pp_top.stage2_id.RF.wr_data pp_top_tb.pp_top.stage2_id.RF.wr_en
probe -create -database waves pp_top_tb.pp_top.stage3_ex.alu_result_ex
probe -create -database waves pp_top_tb.pp_top.stage3_ex.alu_input_A pp_top_tb.pp_top.stage3_ex.alu_input_B
probe -create -database waves pp_top_tb.pp_top.stage3_ex.regA_rd_data pp_top_tb.pp_top.stage3_ex.regB_rd_data_in
probe -create -database waves pp_top_tb.pp_top.stage2_id.regA_rd_data pp_top_tb.pp_top.stage2_id.regB_rd_data
probe -create -database waves pp_top_tb.pp_top.stage3_ex.pc_plus4_plusimm16_ex
probe -create -database waves pp_top_tb.pp_top.stage3_ex.pc_plus4
probe -create -database waves pp_top_tb.pp_top.stage2_id.pc_plus4_in pp_top_tb.pp_top.stage2_id.pc_plus4_out
probe -create -database waves pp_top_tb.pp_top.alu_ctrl_ctrl_ex pp_top_tb.pp_top.alu_greater_ex_ctrl pp_top_tb.pp_top.alu_not_zero_ex_ctrl pp_top_tb.pp_top.alu_result_ex_mem pp_top_tb.pp_top.alu_result_mem_wb pp_top_tb.pp_top.alu_src_ctrl_ex pp_top_tb.pp_top.alu_zero_ex_ctrl pp_top_tb.pp_top.clear_ctrl pp_top_tb.pp_top.ext_ctrl pp_top_tb.pp_top.forwardA pp_top_tb.pp_top.forwardB pp_top_tb.pp_top.hold_if pp_top_tb.pp_top.hold_pc pp_top_tb.pp_top.imm_exted_id_ex pp_top_tb.pp_top.instr_if_id pp_top_tb.pp_top.mem_rd_data_mem_wb pp_top_tb.pp_top.mem_rd_en_ctrl_mem pp_top_tb.pp_top.mem_rd_en_ex pp_top_tb.pp_top.mem_to_reg_ctrl_wb pp_top_tb.pp_top.mem_wr_en_ctrl_mem pp_top_tb.pp_top.pc_plus4_id_ex pp_top_tb.pp_top.pc_plus4_if_id pp_top_tb.pp_top.pc_plus4_plusimm16_ex_if pp_top_tb.pp_top.pc_src pp_top_tb.pp_top.regA_rd_data_id_ex pp_top_tb.pp_top.regB_rd_data_ex_mem pp_top_tb.pp_top.regB_rd_data_id_ex pp_top_tb.pp_top.regD_addr_id_ex pp_top_tb.pp_top.regS_addr_id pp_top_tb.pp_top.regS_addr_id_ex pp_top_tb.pp_top.regT_addr_id pp_top_tb.pp_top.regT_addr_id_ex pp_top_tb.pp_top.reg_dst_ctrl_ex pp_top_tb.pp_top.reg_wr_addr_ex_mem pp_top_tb.pp_top.reg_wr_addr_mem_id pp_top_tb.pp_top.reg_wr_data_wb_id pp_top_tb.pp_top.reg_wr_en_ctrl_id pp_top_tb.pp_top.reg_wr_en_ctrl_mem pp_top_tb.pp_top.clk pp_top_tb.pp_top.if_flush pp_top_tb.pp_top.rstb
probe -create -database waves pp_top_tb.pp_top.forwarding.regS_addr pp_top_tb.pp_top.forwarding.regT_addr
probe -create -database waves pp_top_tb.pp_top.stage4_mem.mem_rd_data_mem pp_top_tb.pp_top.stage4_mem.mem_rd_en pp_top_tb.pp_top.stage4_mem.mem_wr_en pp_top_tb.pp_top.stage4_mem.reg_wr_addr_in
probe -create -database waves pp_top_tb.pp_top.stage4_mem.alu_result_in
probe -create -database waves pp_top_tb.pp_top.hazard_dect.stall_lw_rd pp_top_tb.pp_top.hazard_dect.stall_branch pp_top_tb.pp_top.hazard_dect.hold_if pp_top_tb.pp_top.hazard_dect.hold_pc
probe -create -database waves pp_top_tb.pp_top.pp_ctrl.alu_src pp_top_tb.pp_top.pp_ctrl.ext_op pp_top_tb.pp_top.pp_ctrl.mem_rd_en pp_top_tb.pp_top.pp_ctrl.mem_to_reg pp_top_tb.pp_top.pp_ctrl.mem_wr_en pp_top_tb.pp_top.pp_ctrl.reg_dst
probe -create -database waves pp_top_tb.pp_top.stage3_ex.shift_result
probe -create -database waves pp_top_tb.pp_top.stage3_ex.shifter pp_top_tb.pp_top.stage3_ex.imm_exted
probe -create -database waves pp_top_tb.pp_top.hazard_dect.regS_addr_id pp_top_tb.pp_top.hazard_dect.regT_addr_id pp_top_tb.pp_top.hazard_dect.regT_addr_ex pp_top_tb.pp_top.hazard_dect.mem_rd_en_ex
probe -create -database waves pp_top_tb.pp_top.pp_ctrl.mem_rd_en_ex pp_top_tb.pp_top.pp_ctrl.mem_rd_en_id pp_top_tb.pp_top.pp_ctrl.beq_id pp_top_tb.pp_top.pp_ctrl.beq_ex pp_top_tb.pp_top.pp_ctrl.bgtz_ex pp_top_tb.pp_top.pp_ctrl.bgtz_id pp_top_tb.pp_top.pp_ctrl.bne_ex pp_top_tb.pp_top.pp_ctrl.bne_id pp_top_tb.pp_top.pp_ctrl.alu_src_id pp_top_tb.pp_top.pp_ctrl.alu_src_ex pp_top_tb.pp_top.pp_ctrl.alu_op_id pp_top_tb.pp_top.pp_ctrl.alu_op_ex pp_top_tb.pp_top.pp_ctrl.ext_op_id pp_top_tb.pp_top.pp_ctrl.instr_ex pp_top_tb.pp_top.pp_ctrl.mem_to_reg_id pp_top_tb.pp_top.pp_ctrl.mem_to_reg_ex pp_top_tb.pp_top.pp_ctrl.mem_wr_en_ex pp_top_tb.pp_top.pp_ctrl.mem_wr_en_id
probe -create -database waves pp_top_tb.pp_top.forwarding.reg_wr_en_wb pp_top_tb.pp_top.forwarding.reg_wr_en_mem pp_top_tb.pp_top.forwarding.reg_wr_addr_wb pp_top_tb.pp_top.forwarding.reg_wr_addr_mem
probe -create -database waves pp_top_tb.pp_top.hazard_dect.clear_ctrl pp_top_tb.pp_top.hazard_dect.branch
probe -create -database waves pp_top_tb.pp_top.stage4_mem.mem_rd_data

simvision -input /home/xchen/projects/cpu/361/submission/testbench/.simvision/113941_xchen__autosave.tcl.svcf
