module stage5_wb(
//input
mem_rd_data,
alu_result,
mem_to_reg,
//output
reg_wr_data
);
input [31:0] mem_rd_data;
input [31:0] alu_result;
input mem_to_reg;
output [31:0] reg_wr_data;

mux_nbit #(.n(32)) mux_wb(
.sel(mem_to_reg),
.src0(alu_result),
.src1(mem_rd_data),
.z(reg_wr_data)
);
endmodule
