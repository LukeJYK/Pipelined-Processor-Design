
# XM-Sim Command File
# TOOL:	xmsim(64)	18.09-s011
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
probe -create -database waves pp_top_tb.pp_top.alu_ctrl_ctrl_ex pp_top_tb.pp_top.reg_wr_en_ctrl_mem pp_top_tb.pp_top.reg_wr_en_ctrl_id pp_top_tb.pp_top.reg_wr_data_wb_id pp_top_tb.pp_top.reg_wr_addr_mem_id pp_top_tb.pp_top.reg_wr_addr_ex_mem pp_top_tb.pp_top.reg_dst_ctrl_ex pp_top_tb.pp_top.regT_addr_id_ex pp_top_tb.pp_top.regT_addr_id pp_top_tb.pp_top.regS_addr_id_ex pp_top_tb.pp_top.regS_addr_id pp_top_tb.pp_top.regD_addr_id_ex pp_top_tb.pp_top.regB_rd_data_id_ex pp_top_tb.pp_top.regB_rd_data_ex_mem pp_top_tb.pp_top.regA_rd_data_id_ex pp_top_tb.pp_top.pc_src pp_top_tb.pp_top.pc_plus4_plusimm16_ex_if pp_top_tb.pp_top.pc_plus4_if_id pp_top_tb.pp_top.pc_plus4_id_ex pp_top_tb.pp_top.mem_wr_en_ctrl_mem pp_top_tb.pp_top.mem_to_reg_ctrl_wb pp_top_tb.pp_top.mem_rd_en_ex pp_top_tb.pp_top.mem_rd_en_ctrl_mem pp_top_tb.pp_top.mem_rd_data_mem_wb pp_top_tb.pp_top.instr_if_id pp_top_tb.pp_top.imm_exted_id_ex pp_top_tb.pp_top.if_flush pp_top_tb.pp_top.hold_pc pp_top_tb.pp_top.hold_if pp_top_tb.pp_top.forwardB pp_top_tb.pp_top.forwardA pp_top_tb.pp_top.ext_ctrl pp_top_tb.pp_top.clk

simvision -input /home/xcf5132/projects/361/gp/final_project/submission/testbench/.simvision/3296805_xcf5132_bane.ece.northwestern.edu_autosave.tcl.svcf
