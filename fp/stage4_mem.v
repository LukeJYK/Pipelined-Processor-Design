module stage4_mem(
//input
clk,
rstb,
alu_result_in,
regB_rd_data_in,
reg_wr_addr_in,
mem_wr_en,
mem_rd_en,
//output
mem_rd_data,
alu_result_out,
reg_wr_addr_out
);
parameter data_file_name = 0;

input clk;
input rstb;
input [31:0] alu_result_in;
input [31:0] regB_rd_data_in;
input [4:0] reg_wr_addr_in;
input mem_wr_en;
input mem_rd_en;
output [31:0] mem_rd_data;
output [31:0] alu_result_out;
output [4:0] reg_wr_addr_out;

wire [31:0] mem_rd_data_mem;
sram_fix #(.mem_file(data_file_name)) data_cache(
.cs(1'b1),
.oe(mem_rd_en),  	//data cache read should be always on
.we(mem_wr_en),
.addr(alu_result_in),
.din(regB_rd_data_in),
.dout(mem_rd_data_mem)
);
register #(.n(5)) register_rt_rd(
.D(reg_wr_addr_in),
.Q(reg_wr_addr_out),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(32)) register_alu_output(
.D(alu_result_in),
.Q(alu_result_out),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);
register #(.n(32)) register_data_output(
.D(mem_rd_data_mem),
.Q(mem_rd_data),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);

endmodule
