module stage2_id(
//input
clk,
rstb,
reg_wr_en,
pc_plus4_in,
instr_in,
reg_wr_addr,
reg_wr_data,
ext_ctrl,
if_flush,
//output
pc_plus4_out,
regA_rd_data,
regB_rd_data,
imm_exted,
regS_addr_id,//for hazard
regT_addr_id,//for hazard
regS_addr,
regT_addr,
regD_addr
);

parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 5;
input clk,rstb,reg_wr_en;
input [DATA_WIDTH-1:0] pc_plus4_in;
input [DATA_WIDTH-1:0] instr_in;
input [ADDR_WIDTH-1:0] reg_wr_addr;
input [DATA_WIDTH-1:0] reg_wr_data;
input ext_ctrl;
input if_flush;

output [DATA_WIDTH-1:0] pc_plus4_out;
output [DATA_WIDTH-1:0] regA_rd_data;
output [DATA_WIDTH-1:0] regB_rd_data;
output [DATA_WIDTH-1:0] imm_exted;
output [ADDR_WIDTH-1:0] regS_addr;
output [ADDR_WIDTH-1:0] regT_addr;
output [ADDR_WIDTH-1:0] regD_addr;

wire [DATA_WIDTH-1:0] regA_rd_data_id;
wire [DATA_WIDTH-1:0] regB_rd_data_id;
wire [DATA_WIDTH-1:0] imm_exted_id;
output wire [ADDR_WIDTH-1:0] regS_addr_id;
output wire [ADDR_WIDTH-1:0] regT_addr_id;
wire [ADDR_WIDTH-1:0] regD_addr_id;
wire [DATA_WIDTH-1:0] instr_in_temp;

assign instr_in_temp = if_flush?32'h00000000:instr_in;
assign regS_addr_id = instr_in_temp[25:21];
assign regT_addr_id = instr_in_temp[20:16];
assign regD_addr_id = instr_in_temp[15:11];



register_file RF(
.clk(clk),
.rstb(rstb),
.rdA_addr(regS_addr_id),
.rdB_addr(regT_addr_id),
.rdA_data(regA_rd_data_id),
.rdB_data(regB_rd_data_id),
.wr_addr(reg_wr_addr),
.wr_data(reg_wr_data),
.wr_en(reg_wr_en)
);

extender extender(
.in(instr_in_temp[15:0]),
.ext_ctrl(ext_ctrl),
.out(imm_exted_id)
);
 
register #(.n(DATA_WIDTH)) register_nxtpc(
.D(pc_plus4_in),
.Q(pc_plus4_out),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);

register #(.n(DATA_WIDTH)) register_rddataA(
.D(regA_rd_data_id),
.Q(regA_rd_data),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);

register #(.n(DATA_WIDTH)) register_rddataB(
.D(regB_rd_data_id),
.Q(regB_rd_data),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);

register #(.n(DATA_WIDTH)) register_immexted(
.D(imm_exted_id),
.Q(imm_exted),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);

register #(.n(ADDR_WIDTH)) register_regS(
.D(regS_addr_id),
.Q(regS_addr),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);

register #(.n(ADDR_WIDTH)) register_regT(
.D(regT_addr_id),
.Q(regT_addr),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);

register #(.n(ADDR_WIDTH)) register_regD(
.D(regD_addr_id),
.Q(regD_addr),
.clk(clk),
.rstb(rstb),
.hold(1'b0)
);

endmodule







