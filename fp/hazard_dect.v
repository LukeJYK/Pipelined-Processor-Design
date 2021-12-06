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

wire [ADDR_WIDTH-1:0] xor1;
wire [ADDR_WIDTH-1:0] xor2;
wire neq1;
wire neq2;
wire rs_id_eq_rt_ex;
wire rt_id_eq_rt_ex;
wire select_stall_lw_rd;
wire select_clear_ctrl;
wire temp1;
assign stall_branch = branch;
assign if_flush = stall_branch;
//assign stall_lw_rd = (mem_rd_en_ex&&((regS_addr_id==regT_addr_ex)||(regT_addr_id==regT_addr_ex)))?1'b1:1'b0;
//regS_addr_id==regT_addr_ex
xor_gate_nbit #(.n(5)) xor_1
(
.x(regS_addr_id),
.y(regT_addr_ex),
.z(xor1)
);
or_6unit or_1(
.or0(xor1[0]),
.or1(xor1[1]),
.or2(xor1[2]),
.or3(xor1[3]),
.or4(xor1[4]),
.or5(1'b0),
.or_result(neq1)
);
not_gate not1(
.x(neq1),
.z(rs_id_eq_rt_ex)
);
//regT_addr_id==regT_addr_ex
xor_gate_nbit #(.n(5)) xor_2
(
.x(regT_addr_id),
.y(regT_addr_ex),
.z(xor2)
);
or_6unit or_2(
.or0(xor2[0]),
.or1(xor2[1]),
.or2(xor2[2]),
.or3(xor2[3]),
.or4(xor2[4]),
.or5(1'b0),
.or_result(neq2)
);
not_gate not2(
.x(neq2),
.z(rt_id_eq_rt_ex)
);
//(regS_addr_id==regT_addr_ex)||(regT_addr_id==regT_addr_ex)
or_gate or_eq(
.x(rs_id_eq_rt_ex),
.y(rt_id_eq_rt_ex),
.z(temp1)
);
//(mem_rd_en_ex&&((regS_addr_id==regT_addr_ex)||(regT_addr_id==regT_addr_ex)))
and_gate judge(
.x(temp1),
.y(mem_rd_en_ex),
.z(select_stall_lw_rd)
);
mux_nbit #(.n(1)) mux_stall_lw_rd(
.sel(select_stall_lw_rd),
.src0(1'b0),
.src1(1'b1),
.z(stall_lw_rd)
);


//assign clear_ctrl = (stall_lw_rd||stall_branch)?1'b1:1'b0;
or_gate judge_clear(
.x(stall_lw_rd),
.y(stall_branch),
.z(select_clear_ctrl)
);
mux_nbit #(.n(1)) mux_clear_ctrl(
.sel(select_clear_ctrl),
.src0(1'b0),
.src1(1'b1),
.z(clear_ctrl)
);

//assign hold_if = (stall_lw_rd)?1'b1:1'b0;
mux_nbit #(.n(1)) mux_hold_if(
.sel(stall_lw_rd),
.src0(1'b0),
.src1(1'b1),
.z(hold_if)
);
//assign hold_pc = (stall_lw_rd)?1'b1:1'b0;
mux_nbit #(.n(1)) mux_hold_pc(
.sel(stall_lw_rd),
.src0(1'b0),
.src1(1'b1),
.z(hold_pc)
);


endmodule

