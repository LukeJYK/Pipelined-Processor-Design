module hazard_dect(
//input
mem_rd_en_ex,
regS_addr_id,
regT_addr_id,
regT_addr_ex,
branch,
//output
clear_ctrl,     //used to select the mux of ctrl output
hold_if,  	//used to hold if/id register 
hold_pc,         //used to hold pc
if_flush
);
// clear_ctrl
//
//
parameter ADDR_WIDTH = 5;
input mem_rd_en_ex,branch;
input [ADDR_WIDTH-1:0] regS_addr_id;
input [ADDR_WIDTH-1:0] regT_addr_id;
input [ADDR_WIDTH-1:0] regT_addr_ex;

output clear_ctrl;
output hold_if;
output hold_pc;
output if_flush;

wire stall_lw_rd;
wire stall_branch;

assign stall_lw_rd = (mem_rd_en_ex&&((regS_addr_id==regT_addr_ex)||(regS_addr_id==regT_addr_ex)));
assign stall_branch = branch;

assign clear_ctrl = (stall_lw_rd||stall_branch)?1'b1:1'b0;
assign hold_if = (stall_lw_rd)?1'b1:1'b0;
assign hold_pc = (stall_lw_rd)?1'b1:1'b0;
assign if_flush = stall_branch;

endmodule

