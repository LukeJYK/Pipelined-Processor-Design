module pp_top(
rstb,
clk
);


//parameter
parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 5;
parameter instr_file_name = 0;
parameter data_file_name = 0;
//input
input clk,rstb;
//output

//wire, reg
wire [DATA_WIDTH-1:0] pc_plus4_plusimm16_ex_if;
wire [DATA_WIDTH-1:0] pc_plus4_if_id;
wire [DATA_WIDTH-1:0] instr_if_id;


wire [DATA_WIDTH-1:0] imm_exted_id_ex;
wire [ADDR_WIDTH-1:0] regS_addr_id_ex;
wire [ADDR_WIDTH-1:0] regT_addr_id_ex;
wire [ADDR_WIDTH-1:0] regD_addr_id_ex;
wire [DATA_WIDTH-1:0] regA_rd_data_id_ex;
wire [DATA_WIDTH-1:0] regB_rd_data_id_ex;
wire [DATA_WIDTH-1:0] pc_plus4_id_ex;

wire [DATA_WIDTH-1:0] alu_result_ex_mem;
wire [DATA_WIDTH-1:0] regB_rd_data_ex_mem;
wire [ADDR_WIDTH-1:0] reg_wr_addr_ex_mem;
wire [2:0] alu_ctrl_ctrl_ex;
wire reg_dst_ctrl_ex;
wire alu_src_ctrl_ex;
wire alu_zero_ex_ctrl;
wire alu_not_zero_ex_ctrl;
wire alu_greater_ex_ctrl;




wire [DATA_WIDTH-1:0] mem_rd_data_mem_wb;
wire [DATA_WIDTH-1:0] alu_result_mem_wb;
wire [ADDR_WIDTH-1:0] reg_wr_addr_mem_id;

wire [DATA_WIDTH-1:0] reg_wr_data_wb_id;

wire pc_src;
wire mem_wr_en_ctrl_mem;
wire mem_rd_en_ctrl_mem;
wire mem_to_reg_ctrl_wb;
wire reg_wr_en_ctrl_id;
wire ext_ctrl;

wire [1:0] forwardA;
wire [1:0] forwardB;
wire reg_wr_en_ctrl_mem;

wire clear_ctrl;
wire hold_if;
wire hold_pc;
wire if_flush;
wire [ADDR_WIDTH-1:0] regS_addr_id;
wire [ADDR_WIDTH-1:0] regT_addr_id;
wire mem_rd_en_ex;
//submodule
stage1_if #(.instr_file_name(instr_file_name))stage1_if(
//input
.clk(clk),
.rstb(rstb),
.pc_src(pc_src),
.pc_plus4_plusimm16(pc_plus4_plusimm16_ex_if),
.hold_if(hold_if),
.hold_pc(hold_pc),
.if_flush(if_flush),
//output
.pc_plus4(pc_plus4_if_id),
.instr(instr_if_id)
);

stage2_id stage2_id(
//input
.clk(clk),
.rstb(rstb),
.reg_wr_en(reg_wr_en_ctrl_id),
.pc_plus4_in(pc_plus4_if_id),
.instr_in(instr_if_id),
.reg_wr_addr(reg_wr_addr_mem_id),
.reg_wr_data(reg_wr_data_wb_id),
.ext_ctrl(ext_ctrl),
.if_flush(if_flush),
//output
.pc_plus4_out(pc_plus4_id_ex),
.regA_rd_data(regA_rd_data_id_ex),
.regB_rd_data(regB_rd_data_id_ex),
.imm_exted(imm_exted_id_ex), //32bit
.regS_addr_id(regS_addr_id),//for hazard
.regT_addr_id(regT_addr_id),//for hazard
.regS_addr(regS_addr_id_ex),
.regT_addr(regT_addr_id_ex),
.regD_addr(regD_addr_id_ex)
);

stage3_ex stage3_ex(
//input
.clk(clk),
.rstb(rstb),
.pc_plus4(pc_plus4_id_ex),
.regA_rd_data(regA_rd_data_id_ex),
.regB_rd_data_in(regB_rd_data_id_ex),
.imm_exted(imm_exted_id_ex),
.regT_addr(regT_addr_id_ex),
.regD_addr(regD_addr_id_ex),
.alu_ctrl(alu_ctrl_ctrl_ex),
.reg_dst(reg_dst_ctrl_ex),
.alu_src(alu_src_ctrl_ex),
.forwardA(forwardA),
.forwardB(forwardB),
.reg_wr_data_wb(reg_wr_data_wb_id),//for forwarding
.if_flush(if_flush),

//output
.alu_zero(alu_zero_ex_ctrl),
.alu_not_zero(alu_not_zero_ex_ctrl),
.alu_greater(alu_greater_ex_ctrl),
.alu_result(alu_result_ex_mem),
.regB_rd_data_out(regB_rd_data_ex_mem),
.pc_plus4_plusimm16(pc_plus4_plusimm16_ex_if),
.reg_wr_addr(reg_wr_addr_ex_mem)
);

stage4_mem #(.data_file_name(data_file_name)) stage4_mem(
//input
.clk(clk),
.rstb(rstb),
.alu_result_in(alu_result_ex_mem),
.regB_rd_data_in(regB_rd_data_ex_mem),
.reg_wr_addr_in(reg_wr_addr_ex_mem),
.mem_wr_en(mem_wr_en_ctrl_mem),
.mem_rd_en(mem_rd_en_ctrl_mem),
//output
.mem_rd_data(mem_rd_data_mem_wb),
.alu_result_out(alu_result_mem_wb),
.reg_wr_addr_out(reg_wr_addr_mem_id)
);

stage5_wb stage5_wb(
//input
.mem_rd_data(mem_rd_data_mem_wb),
.alu_result(alu_result_mem_wb),
.mem_to_reg(mem_to_reg_ctrl_wb),
//output
.reg_wr_data(reg_wr_data_wb_id)
);

pp_ctrl pp_ctrl(
//input
.clk(clk),
.rstb(rstb),
.instr(instr_if_id),
.zero(alu_zero_ex_ctrl),
.not_zero(alu_not_zero_ex_ctrl),
.greater(alu_greater_ex_ctrl),
.clear_ctrl(clear_ctrl),
//output
.ext_op(ext_ctrl),
.alu_src(alu_src_ctrl_ex),
.reg_dst(reg_dst_ctrl_ex),
.alu_ctrl(alu_ctrl_ctrl_ex),
.branch(pc_src),
.mem_wr_en(mem_wr_en_ctrl_mem),
.mem_rd_en(mem_rd_en_ctrl_mem),
.mem_to_reg(mem_to_reg_ctrl_wb),
.reg_wr_en_mem(reg_wr_en_ctrl_mem), //for forwarding
.reg_wr_en_wb(reg_wr_en_ctrl_id), 	//for forwarding
.mem_rd_en_ex(mem_rd_en_ex)				//for hazard
);

forwarding forwarding(
//input 
.regS_addr(regS_addr_id_ex),
.regT_addr(regT_addr_id_ex),
.reg_wr_addr_mem(reg_wr_addr_ex_mem),
.reg_wr_addr_wb(reg_wr_addr_mem_id),
.reg_wr_en_mem(reg_wr_en_ctrl_mem),
.reg_wr_en_wb(reg_wr_en_ctrl_id),
//output
.forwardA(forwardA),
.forwardB(forwardB)
);

hazard_dect hazard_dect(
//input
.mem_rd_en_ex(mem_rd_en_ex),
.regS_addr_id(regS_addr_id),
.regT_addr_id(regT_addr_id),
.regT_addr_ex(regT_addr_id_ex),
.branch(pc_src),
//output
.clear_ctrl(clear_ctrl),
.hold_if(hold_if),
.hold_pc(hold_pc),
.if_flush(if_flush)
);

endmodule






