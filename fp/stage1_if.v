module stage1_if(
//input
clk,
rstb,
pc_src,
pc_plus4_plusimm16,
hold_if,
hold_pc,
if_flush,
//output
pc_plus4,
instr
);

parameter DATA_WIDTH = 32;
parameter instr_file_name = 0;

input clk,rstb;
input pc_src;
input [DATA_WIDTH-1:0] pc_plus4_plusimm16;
input hold_if,hold_pc,if_flush;

output [DATA_WIDTH-1:0] pc_plus4;
output [DATA_WIDTH-1:0] instr;

wire [DATA_WIDTH-1:0] pc_plus4_if;
wire [DATA_WIDTH-1:0] instr_if_temp;
wire [DATA_WIDTH-1:0] instr_if;
wire [DATA_WIDTH-1:0] next_pc;
reg [DATA_WIDTH-1:0] current_pc;

mux_nbit #(.n(DATA_WIDTH)) mux_pc(
.sel(pc_src),
.src0(pc_plus4_if),
.src1(pc_plus4_plusimm16),
.z(next_pc)
);

adder_32bit adder_32bit(
.in_a(current_pc),
.in_b(32'h00000004),
.cin(1'b0),
.sum(pc_plus4_if),
.cout(),
.overflow()
);

sram_fix #(.mem_file(instr_file_name)) instr_cache(
.cs(1'b1),
.oe(1'b1),
.we(1'b0),
.addr(current_pc),
.din(32'h00000000),
.dout(instr_if_temp)
);

mux_nbit #(.n(DATA_WIDTH)) mux_flush(
.sel(if_flush),
.src0(instr_if_temp),
.src1(32'h00000000),
.z(instr_if)
);

register #(.n(DATA_WIDTH)) register_pc_plus4(
.D(pc_plus4_if),
.Q(pc_plus4),
.clk(clk),
.rstb(rstb),
.hold(hold_if)
);

register #(.n(DATA_WIDTH)) register_instr(
.D(instr_if),
.Q(instr),
.clk(clk),
.rstb(rstb),
.hold(hold_if)
);


always @(posedge clk or negedge rstb) begin
	if (~rstb) begin
		current_pc <= 32'h00400020;
	end
	else if(~hold_pc) begin
		current_pc <= next_pc;
	end
end

endmodule
