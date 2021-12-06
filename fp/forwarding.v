module forwarding
(
//input
regS_addr, 
regT_addr,
reg_wr_addr_mem,
reg_wr_addr_wb,
reg_wr_en_mem, 
reg_wr_en_wb,
//output
forwardA, 
forwardB
);
parameter forward_en = 1;
input [4:0] regS_addr;
input [4:0] regT_addr;
input [4:0] reg_wr_addr_mem;
input [4:0] reg_wr_addr_wb;
input reg_wr_en_mem; 
input reg_wr_en_wb;
output [1:0] forwardA;
output [1:0] forwardB;

wire [4:0] t1;
wire [4:0] t2;
wire [4:0] t3;
wire [4:0] t4;
wire [4:0] t5;
wire [4:0] t6;
wire not_zero_reg_wr_addr_mem;
wire not_zero_reg_wr_addr_wb; 
wire exmem_rd_eq_idex_rs;
wire exmem_rd_eq_idex_rt;
wire memwb_rd_eq_idex_rt;
wire memwb_rd_eq_idex_rs;
wire neq1; 
wire neq2;
wire neq3;
wire neq4;
wire and_result_1;
wire and_result_2;
wire ex_mem_to_regS_addr10;
wire ex_mem_to_regT_addr10;


wire temp2;
wire temp3;
wire temp4;

wire temp6;
wire temp7;
wire temp8;
wire temp11;
wire temp12;
wire temp22;
wire temp21;
wire ex_mem_to_regS_addr01;
wire ex_mem_to_regT_addr01;
wire [1:0] forwardA_temp;
wire [1:0] forwardB_temp;
wire [1:0] r1;
wire [1:0] r2;

//reg_wr_addr_mem != 0
xor_gate_nbit #(.n(5)) xor0
(
.x(reg_wr_addr_mem),
.y(5'b00000),
.z(t1)
);
or_6unit or_0(
.or0(t1[0]),
.or1(t1[1]),
.or2(t1[2]),
.or3(t1[3]),
.or4(t1[4]),
.or5(1'b0),
.or_result(not_zero_reg_wr_addr_mem)
);  
  
//reg_wr_addr_wb != 0
xor_gate_nbit #(.n(5)) xor1
(
.x(reg_wr_addr_wb),
.y(5'b00000),
.z(t2)
);
or_6unit or_1(
.or0(t2[0]),
.or1(t2[1]),
.or2(t2[2]),
.or3(t2[3]),
.or4(t2[4]),
.or5(1'b0),
.or_result(not_zero_reg_wr_addr_wb)
); 

//reg_wr_addr_mem == regS_addr
xor_gate_nbit #(.n(5)) xor2
(
.x(reg_wr_addr_mem),
.y(regS_addr),
.z(t3)
);
or_6unit or_5(
.or0(t3[0]),
.or1(t3[1]),
.or2(t3[2]),
.or3(t3[3]),
.or4(t3[4]),
.or5(1'b0),
.or_result(neq1)
);
not_gate not1(
.x(neq1),
.z(exmem_rd_eq_idex_rs)
);


//reg_wr_addr_mem == regT_addr
xor_gate_nbit #(.n(5)) xor3
(
.x(reg_wr_addr_mem),
.y(regT_addr),
.z(t4)
);
or_6unit or_2(
.or0(t4[0]),
.or1(t4[1]),
.or2(t4[2]),
.or3(t4[3]),
.or4(t4[4]),
.or5(1'b0),
.or_result(neq2)
);
not_gate not2(
.x(neq2),
.z(exmem_rd_eq_idex_rt)
);

//reg_wr_addr_wb == regS_addr
xor_gate_nbit #(.n(5)) xor4
(
.x(reg_wr_addr_wb),
.y(regS_addr),
.z(t5)
);
or_6unit or_3(
.or0(t5[0]),
.or1(t5[1]),
.or2(t5[2]),
.or3(t5[3]),
.or4(t5[4]),
.or5(1'b0),
.or_result(neq3)
);
not_gate not3(
.x(neq3),
.z(memwb_rd_eq_idex_rs)
);

//reg_wr_addr_wb == regT_addr
xor_gate_nbit #(.n(5)) xor5
(
.x(reg_wr_addr_wb),
.y(regT_addr),
.z(t6)
);
or_6unit or_4(
.or0(t6[0]),
.or1(t6[1]),
.or2(t6[2]),
.or3(t6[3]),
.or4(t6[4]),
.or5(1'b0),
.or_result(neq4)
);
not_gate not4(
.x(neq4),
.z(memwb_rd_eq_idex_rt)
);


//forward
//Ex hazard
and_gate and1
(
.x(reg_wr_en_mem),
.y(not_zero_reg_wr_addr_mem),
.z(and_result_1)
);
and_gate and2
(
.x(and_result_1),
.y(exmem_rd_eq_idex_rs),
.z(ex_mem_to_regS_addr10)
);
and_gate and3
(
.x(reg_wr_en_mem),
.y(not_zero_reg_wr_addr_mem),
.z(and_result_2)
);
and_gate and4
(
.x(and_result_2),
.y(exmem_rd_eq_idex_rt),
.z(ex_mem_to_regT_addr10)
);

//memhazard
//blue part 1
and_gate and_01_1(
.x(exmem_rd_eq_idex_rs),
.y(not_zero_reg_wr_addr_mem),
.z(temp2)
);
and_gate and_01_2(
.x(temp2),
.y(reg_wr_en_mem),
.z(temp3)
);
not_gate not_01_2(
.x(temp3),
.z(temp4)//temp4 is blue part
);
and_gate and_r1(
.x(reg_wr_en_wb),
.y(not_zero_reg_wr_addr_wb),
.z(temp11)
);
and_gate and_r2(
.x(temp11),
.y(memwb_rd_eq_idex_rs),
.z(temp12)
);
and_gate and_r3(
.x(temp12),
.y(temp4),
.z(ex_mem_to_regS_addr01)
);
//blue part 2
and_gate and_01_3(
.x(exmem_rd_eq_idex_rt),
.y(not_zero_reg_wr_addr_mem),
.z(temp6)
);
and_gate and_01_4(
.x(temp6),
.y(reg_wr_en_mem),
.z(temp7)
);
not_gate not_01_4(
.x(temp7),
.z(temp8)//temp8 is blue part
);
and_gate and_r4(
.x(reg_wr_en_wb),
.y(not_zero_reg_wr_addr_wb),
.z(temp21)
);
and_gate and_r5(
.x(temp21),
.y(memwb_rd_eq_idex_rt),
.z(temp22)
);
and_gate and_r6(
.x(temp22),
.y(temp8),
.z(ex_mem_to_regT_addr01)
);


mux_nbit #(.n(2)) mux1
(
.sel(ex_mem_to_regS_addr01),
.src0(2'b00),
.src1(2'b01),
.z(r1)
);
mux_nbit #(.n(2)) mux2
(
.sel(ex_mem_to_regS_addr10),
.src0(r1),
.src1(2'b10),
.z(forwardA_temp)
);
mux_nbit #(.n(2)) mux3
(
.sel(ex_mem_to_regT_addr01),
.src0(2'b00),
.src1(2'b01),
.z(r2)
);
mux_nbit #(.n(2)) mux4
(
.sel(ex_mem_to_regT_addr10),
.src0(r2),
.src1(2'b10),
.z(forwardB_temp)
);

mux_nbit #(.n(2)) mux_selectA
(
.sel(forward_en),
.src0(2'b00),
.src1(forwardA_temp),
.z(forwardA)
);
mux_nbit #(.n(2)) mux_selectB
(
.sel(forward_en),
.src0(2'b00),
.src1(forwardB_temp),
.z(forwardB)
);
endmodule

