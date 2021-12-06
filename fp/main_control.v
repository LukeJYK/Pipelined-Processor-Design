module main_control(
//input
opCode,
//output
aluop,
RegDst,
RegWr,
bgtz,
bne,
beq,
Jump,
ALUSrc,
MemWr,
MemRd,
MemtoReg,
ExtOp
);
input [5:0] opCode;
output [2:0] aluop;
output RegDst;
output RegWr;
output wire bgtz;
output wire bne;
output wire beq;
output Jump;
output ALUSrc;
output MemWr;
output MemRd;
output MemtoReg;
output ExtOp;

wire not_op0;
wire not_op1;
wire not_op2;
wire not_op3;
wire not_op4;
wire not_op5;



wire Rtype;
wire lw;
wire sw;
wire addi;


wire or1;
wire or2;
wire or3;


assign RegDst = Rtype;
assign MemWr = sw;
assign MemRd = lw;
assign MemtoReg = lw;
assign Jump = 0;


assign aluop[2] = Rtype;
assign aluop[1] = 0;

//not opCode
not_gate note_gate0(
.x(opCode[0]),
.z(not_op0)
);

not_gate note_gate1(
.x(opCode[1]),
.z(not_op1)
);

not_gate note_gate2(
.x(opCode[2]),
.z(not_op2)
);

not_gate note_gate3(
.x(opCode[3]),
.z(not_op3)
);

not_gate note_gate4(
.x(opCode[4]),
.z(not_op4)
);

not_gate note_gate5(
.x(opCode[5]),
.z(not_op5)
);

//R-type
and_6unit R_and(
.and0(not_op0),
.and1(not_op1),
.and2(not_op2),
.and3(not_op3),
.and4(not_op4),
.and5(not_op5),
.and_result(Rtype)
);


//lw
and_6unit lw_and(
.and0(opCode[0]),
.and1(opCode[1]),
.and2(not_op2),
.and3(not_op3),
.and4(not_op4),
.and5(opCode[5]),
.and_result(lw)
);
//sw
and_6unit sw_and(
.and0(opCode[0]),
.and1(opCode[1]),
.and2(not_op2),
.and3(opCode[3]),
.and4(not_op4),
.and5(opCode[5]),
.and_result(sw)
);
//beq
and_6unit beq_and(
.and0(not_op0),
.and1(not_op1),
.and2(opCode[2]),
.and3(not_op3),
.and4(not_op4),
.and5(not_op5),
.and_result(beq)
);
//bne
and_6unit bne_and(
.and0(opCode[0]),
.and1(not_op1),
.and2(opCode[2]),
.and3(not_op3),
.and4(not_op4),
.and5(not_op5),
.and_result(bne)
);
//bgtz
and_6unit bgtz_and(
.and0(opCode[0]),
.and1(opCode[1]),
.and2(opCode[2]),
.and3(not_op3),
.and4(not_op4),
.and5(not_op5),
.and_result(bgtz)
);
//addi
and_6unit addi_and(
.and0(not_op0),
.and1(not_op1),
.and2(not_op2),
.and3(opCode[3]),
.and4(not_op4),
.and5(not_op5),
.and_result(addi)
);




//ExtOp
or_6unit or_gate1(
.or0(lw),
.or1(sw),
.or2(bgtz),
.or3(bne),
.or4(beq),
.or5(1'b0),
.or_result(ExtOp)
);  

//RegWrite
or_gate or_gate2(
.x(Rtype),
.y(addi),
.z(or1)
);
or_gate or_gate3(
.x(or1),
.y(lw),
.z(RegWr)
);

//ALUSrc
or_gate or_gate4(
.x(addi),
.y(lw),
.z(or2)
);
or_gate or_gate5(
.x(or2),
.y(sw),
.z(ALUSrc)
);

//alu op 0
or_gate or_gate6(
.x(beq),
.y(bne),
.z(or3)
);
or_gate or_gate7(
.x(or3),
.y(bgtz),
.z(aluop[0])
);
endmodule