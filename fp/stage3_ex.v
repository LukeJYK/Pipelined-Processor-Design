module stage3_ex(
//input
clk,
rstb,
pc_plus4,
regA_rd_data,
regB_rd_data_in,
imm_exted,
regT_addr,
regD_addr,
alu_ctrl,
reg_dst,
alu_src,
forwardA,
forwardB,
reg_wr_data_wb,
if_flush,
//output
alu_zero,
alu_not_zero,
alu_greater,
alu_result,
regB_rd_data_out,
pc_plus4_plusimm16,
reg_wr_addr
);
input clk;
input rstb;
input [31:0] pc_plus4;
input [31:0] regA_rd_data;
input [31:0] regB_rd_data_in;
input [31:0] imm_exted;
input [4:0] regT_addr;
input [4:0] regD_addr;
input [2:0] alu_ctrl;
input reg_dst;
input alu_src;
input [1:0] forwardA;
input [1:0] forwardB;
input [31:0] reg_wr_data_wb;
input if_flush;

output alu_zero;
output alu_not_zero;
output alu_greater;
output wire [31:0] alu_result;
output [31:0] regB_rd_data_out;
output [31:0] pc_plus4_plusimm16;
output [4:0] reg_wr_addr;


wire [31:0] shifter;
wire [31:0] shift_result;
wire [31:0] pc_plus4_plusimm16_ex;
wire [31:0] alu_forwardA;
wire [31:0] alu_forwardB;
wire [4:0] reg_wr_addr_ex;
wire [31:0] alu_result_ex;
wire [31:0] alu_input_A;
wire [31:0] alu_input_B;

wire alu_zero_ex;
wire alu_not_zero_ex;
wire alu_greater_ex;

wire [4:0] regT_addr_temp;
wire [4:0] regD_addr_temp;


assign shifter[31:0] = 32'h00000002;
assign alu_input_A = alu_forwardA;

assign regT_addr_temp = if_flush?32'h00000000:regT_addr;
assign regD_addr_temp = if_flush?32'h00000000:regD_addr;

//shift left 2
sll_32bit sll_map(.x(imm_exted), .shift(shifter), .z(shift_result));
//add new pc
adder_32bit adder_new_pc(.in_a(shift_result), .in_b(pc_plus4), .cin(1'b0), .sum(pc_plus4_plusimm16_ex),.cout(),.overflow());
register #(.n(32)) register_pc(
.D(pc_plus4_plusimm16_ex),
.Q(pc_plus4_plusimm16),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
//rt-rd
mux_nbit #(.n(5)) mux_rt_rd(
.sel(reg_dst),
.src0(regT_addr_temp),
.src1(regD_addr_temp),
.z(reg_wr_addr_ex)
);
register #(.n(5)) register_reg_wr_addr(
.D(reg_wr_addr_ex),
.Q(reg_wr_addr),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);

//forwardA
mux_3_to_1 mux_forwardA(
.sel(forwardA), 
.src00(regA_rd_data), 
.src01(reg_wr_data_wb), 
.src10(alu_result), 
.z(alu_forwardA)
);
//forwardB
mux_3_to_1 mux_forwardB(
.sel(forwardB), 
.src00(regB_rd_data_in), 
.src01(reg_wr_data_wb), 
.src10(alu_result), 
.z(alu_forwardB)
);
//alu src
mux_nbit #(.n(32)) mux_alu_src(
.sel(alu_src),
.src0(alu_forwardB),//
.src1(imm_exted),
.z(alu_input_B)
);


ALU ALU(
.ctrl(alu_ctrl),		//TBD from control logic
.A(alu_input_A),
.B(alu_input_B),
.shamt(imm_exted[10:6]), 		//TBD from control logic&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
.cout(),		//not sure if use,probably output of top
.ovf(),			//not sure if use,probably output of top
.ze(alu_zero_ex),			//not sure if use,probably equal signal
.R(alu_result_ex)
);
register #(.n(32)) register_alu_output(
.D(alu_result_ex),
.Q(alu_result),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
not_gate not_gate2(
.x(alu_zero_ex),
.z(alu_not_zero_ex)
);
nor_gate nor_gate(
.x(alu_result_ex[31]),
.y(alu_zero_ex),
.z(alu_greater_ex)
);
register #(.n(32)) register_alu_zero(
.D(alu_zero_ex),
.Q(alu_zero),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(32)) register_alu_not_zero(
.D(alu_not_zero_ex),
.Q(alu_not_zero),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(32)) register_alu_greater(
.D(alu_greater_ex),
.Q(alu_greater),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(32)) register_regB_out(
.D(alu_forwardB),
.Q(regB_rd_data_out),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);

endmodule
