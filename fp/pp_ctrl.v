module pp_ctrl(
//input
clk,
rstb,
instr,
zero,
not_zero,
greater,
clear_ctrl,	//TBD by yankai
//output
ext_op,
alu_src,
reg_dst,
alu_ctrl,
branch,
mem_rd_en,
mem_wr_en,
mem_to_reg,
reg_wr_en_mem,
reg_wr_en_wb,
mem_rd_en_ex //TBD by yankai
);
input clk;
input rstb;
input [31:0] instr;
input zero;
input not_zero;
input greater;
input clear_ctrl;

output ext_op;
output [2:0] alu_ctrl;
output alu_src;
output reg_dst;
output mem_wr_en;
output wire mem_rd_en;
output wire branch;
output mem_to_reg;
output wire reg_wr_en_mem;
output wire reg_wr_en_wb;
output wire mem_rd_en_ex;


wire and1;
wire and2;
wire and3;
wire or4;

//temp
wire [2:0] alu_op_temp;
wire reg_dst_temp;
wire reg_wr_en_temp;
wire bgtz_temp;
wire bne_temp;
wire beq_temp;
wire alu_src_temp;
wire mem_wr_en_temp;
wire mem_rd_en_temp;
wire mem_to_reg_temp;
wire ext_op_temp;
//temp2
wire [2:0] alu_op_temp2;
wire reg_dst_temp2;
wire reg_wr_en_temp2;
wire bgtz_temp2;
wire bne_temp2;
wire beq_temp2;
wire alu_src_temp2;
wire mem_wr_en_temp2;
wire mem_rd_en_temp2;
wire mem_to_reg_temp2;

//id
wire [2:0] alu_op_id;
wire reg_dst_id;
wire reg_wr_en_id;
wire bgtz_id;
wire bne_id;
wire beq_id;
wire jump;
wire alu_src_id;
wire mem_wr_en_id;
wire mem_rd_en_id;
wire mem_to_reg_id;
wire ext_op_id;

//ex
wire [31:0] instr_ex;
wire [2:0] alu_op_ex;
wire reg_dst_ex;
wire reg_wr_en_ex;
wire bgtz_ex;
wire bne_ex;
wire beq_ex;
wire alu_src_ex;
wire mem_wr_en_ex;
wire mem_to_reg_ex;

//mem
wire bgtz_mem;
wire bne_mem;
wire beq_mem;
wire mem_wr_en_mem;
wire mem_rd_en_mem;
wire mem_to_reg_mem;

//wb
wire mem_to_reg_wb;

wire clear_ctrl_id;
wire instr_all_zero;
wire temp_clear;

assign ext_op = ext_op_id;
assign alu_src = alu_src_ex;
assign reg_dst = reg_dst_ex;
assign mem_wr_en = mem_wr_en_mem;
assign mem_rd_en = mem_rd_en_mem;
assign mem_to_reg = mem_to_reg_wb;

main_control main_control(
.opCode(instr[31:26]),
.aluop(alu_op_temp),
.RegDst(reg_dst_temp),
.RegWr(reg_wr_en_temp),
.bgtz(bgtz_temp),
.bne(bne_temp),
.beq(beq_temp),
.Jump(jump),
.ALUSrc(alu_src_temp),
.MemWr(mem_wr_en_temp),
.MemRd(mem_rd_en_temp),
.MemtoReg(mem_to_reg_temp),
.ExtOp(ext_op_temp)
);
//all zero
or32_to_1 judge_all_zero(
.x(instr),
.z(instr_all_zero)
);
or_gate judge_clear_1(
.x(instr_all_zero),
.y(clear_ctrl),
.z(temp_clear)
);
or_gate judge_clear_2(
.x(temp_clear),
.y(branch),
.z(clear_ctrl_id)
);


// clear mux
mux_nbit #(.n(3)) clear_alu_op
(
.sel(clear_ctrl_id),
.src0(alu_op_temp),
.src1(3'b000),
.z(alu_op_id)
);
mux_nbit #(.n(1)) clear_reg_dst
(
.sel(clear_ctrl_id),
.src0(reg_dst_temp),
.src1(1'b0),
.z(reg_dst_id)
);
mux_nbit #(.n(1)) clear_reg_wr_en
(
.sel(clear_ctrl_id),
.src0(reg_wr_en_temp),
.src1(1'b0),
.z(reg_wr_en_id)
);
mux_nbit #(.n(1)) clear_bgtz
(
.sel(clear_ctrl_id),
.src0(bgtz_temp),
.src1(1'b0),
.z(bgtz_id)
);
mux_nbit #(.n(1)) clear_bne
(
.sel(clear_ctrl_id),
.src0(bne_temp),
.src1(1'b0),
.z(bne_id)
);
mux_nbit #(.n(1)) clear_beq
(
.sel(clear_ctrl_id),
.src0(beq_temp),
.src1(1'b0),
.z(beq_id)
);
mux_nbit #(.n(1)) clear_alu_src
(
.sel(clear_ctrl_id),
.src0(alu_src_temp),
.src1(1'b0),
.z(alu_src_id)
);
mux_nbit #(.n(1)) clear_mem_wr_en
(
.sel(clear_ctrl_id),
.src0(mem_wr_en_temp),
.src1(1'b0),
.z(mem_wr_en_id)
);
mux_nbit #(.n(1)) clear_mem_rd_en
(
.sel(clear_ctrl_id),
.src0(mem_rd_en_temp),
.src1(1'b0),
.z(mem_rd_en_id)
);
mux_nbit #(.n(1)) clear_mem_to_reg
(
.sel(clear_ctrl_id),
.src0(mem_to_reg_temp),
.src1(1'b0),
.z(mem_to_reg_id)
);
mux_nbit #(.n(1)) clear_ext_op
(
.sel(clear_ctrl_id),
.src0(ext_op_temp),
.src1(1'b0),
.z(ext_op_id)
);

//for id to ex
register #(.n(32)) register1_0(
.D(instr),
.Q(instr_ex),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(3)) register1_1(
.D(alu_op_id),
.Q(alu_op_temp2),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(1)) register1_3(
.D(alu_src_id),
.Q(alu_src_temp2),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(1)) register1_4(
.D(reg_dst_id),
.Q(reg_dst_temp2),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(1)) register1_5(
.D(mem_wr_en_id),
.Q(mem_wr_en_temp2),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(1)) register1_6(
.D(mem_rd_en_id),
.Q(mem_rd_en_temp2),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(1)) register1_7(
.D(mem_to_reg_id),
.Q(mem_to_reg_temp2),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(1)) register1_8(
.D(bgtz_id),
.Q(bgtz_temp2),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(1)) register1_9(
.D(bne_id),
.Q(bne_temp2),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(1)) register1_10(
.D(beq_id),
.Q(beq_temp2),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(1)) register1_11(
.D(reg_wr_en_id),
.Q(reg_wr_en_temp2),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);

//clear
mux_nbit #(.n(3)) clear_alu_op_ex
(
.sel(branch),
.src0(alu_op_temp2),
.src1(3'b000),
.z(alu_op_ex)
);
mux_nbit #(.n(1)) clear_reg_dst_ex
(
.sel(branch),
.src0(reg_dst_temp2),
.src1(1'b0),
.z(reg_dst_ex)
);
mux_nbit #(.n(1)) clear_reg_wr_en_ex
(
.sel(branch),
.src0(reg_wr_en_temp2),
.src1(1'b0),
.z(reg_wr_en_ex)
);
mux_nbit #(.n(1)) clear_bgtz_ex
(
.sel(branch),
.src0(bgtz_temp2),
.src1(1'b0),
.z(bgtz_ex)
);
mux_nbit #(.n(1)) clear_bne_ex
(
.sel(branch),
.src0(bne_temp2),
.src1(1'b0),
.z(bne_ex)
);
mux_nbit #(.n(1)) clear_beq_ex
(
.sel(branch),
.src0(beq_temp2),
.src1(1'b0),
.z(beq_ex)
);
mux_nbit #(.n(1)) clear_alu_src_ex
(
.sel(branch),
.src0(alu_src_temp2),
.src1(1'b0),
.z(alu_src_ex)
);
mux_nbit #(.n(1)) clear_mem_wr_en_ex
(
.sel(branch),
.src0(mem_wr_en_temp2),
.src1(1'b0),
.z(mem_wr_en_ex)
);
mux_nbit #(.n(1)) clear_mem_rd_en_ex
(
.sel(branch),
.src0(mem_rd_en_temp2),
.src1(1'b0),
.z(mem_rd_en_ex)
);
mux_nbit #(.n(1)) clear_mem_to_reg_ex
(
.sel(branch),
.src0(mem_to_reg_temp2),
.src1(1'b0),
.z(mem_to_reg_ex)
);

alu_control alu_control(
.func(instr_ex[5:0]),
.ALUop(alu_op_ex),
.ALUctrl(alu_ctrl)
);


//for ex to mem
register #(.n(1)) register2_0(
.D(reg_wr_en_ex),
.Q(reg_wr_en_mem),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(1)) register2_1(
.D(bgtz_ex),
.Q(bgtz_mem),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(1)) register2_2(
.D(bne_ex),
.Q(bne_mem),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(1)) register2_3(
.D(beq_ex),
.Q(beq_mem),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(1)) register2_4(
.D(mem_rd_en_ex),
.Q(mem_rd_en_mem),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(1)) register2_5(
.D(mem_wr_en_ex),
.Q(mem_wr_en_mem),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(1)) register2_6(
.D(mem_to_reg_ex),
.Q(mem_to_reg_mem),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);

//branch
and_gate branch1(
.x(beq_mem),
.y(zero),
.z(and1)
);
and_gate branch2(
.x(bne_mem),
.y(not_zero),
.z(and2)
);
and_gate branch3(
.x(bgtz_mem),
.y(greater),
.z(and3)
);
or_gate branch4(
.x(and1),
.y(and2),
.z(or4)
);
or_gate branch5(
.x(or4),
.y(and3),
.z(branch)
);


//for mem to wb
register #(.n(1)) register3_0(
.D(mem_to_reg_mem),
.Q(mem_to_reg_wb),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(1)) register3_1(
.D(reg_wr_en_mem),
.Q(reg_wr_en_wb),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);

endmodule
