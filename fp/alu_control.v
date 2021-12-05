module alu_control(
//input
func,
ALUop,
//output
ALUctrl
);
input [5:0] func;
input [2:0] ALUop;
output [2:0] ALUctrl;

wire notop0;
wire notop1;
wire notop2;
wire notfun0;
wire notfun1;
wire notfun2;
wire notfun3;
wire notfun5;

wire temp0_unit0;
wire temp1_unit0;
wire temp2_unit0;
wire temp3_unit0;
wire or2_unit0;
wire or1_unit0;

wire temp0_unit1;
wire temp1_unit1;
wire temp2_unit1;
wire temp3_unit1;
wire temp4_unit1;
wire temp5_unit1;

wire and_1;
wire and_3;
wire temp0_unit2;
wire temp1_unit2;
wire temp2_unit2;
wire temp3_unit2;
wire temp4_unit2;
wire temp5_unit2;
not_gate note_gate1(
.x(ALUop[0]),
.z(notop0)
);
not_gate note_gate2(
.x(ALUop[1]),
.z(notop1)
);
not_gate note_gate3(
.x(ALUop[2]),
.z(notop2)
);
not_gate note_gate4(
.x(func[0]),
.z(notfun0)
);
not_gate note_gate5(
.x(func[1]),
.z(notfun1)
);
not_gate note_gate6(
.x(func[2]),
.z(notfun2)
);
not_gate note_gate7(
.x(func[3]),
.z(notfun3)
);
not_gate note_gate8(
.x(func[5]),
.z(notfun5)
);



//alu ctrl 0
and_6unit unit0_0(
.and0(ALUop[2]),
.and1(func[0]),
.and2(func[2]),
.and3(func[5]),
.and4(notfun1),
.and5(notfun3),
.and_result(temp0_unit0)
);
and_gate unit0_1(
.x(ALUop[2]),
.y(notfun5),
.z(temp1_unit0)
);
and_6unit unit0_2(
.and0(ALUop[2]),
.and1(func[1]),
.and2(func[3]),
.and3(func[5]),
.and4(notfun0),
.and5(notfun2),
.and_result(temp2_unit0)
);
and_6unit unit0_3(
.and0(ALUop[2]),
.and1(func[0]),
.and2(func[1]),
.and3(func[5]),
.and4(func[3]),
.and5(notfun2),
.and_result(temp3_unit0)
);
or_gate unit0_4(
.x(temp0_unit0),
.y(temp1_unit0),
.z(or1_unit0)
);
or_gate unit0_5(
.x(or1_unit0),
.y(temp2_unit0),
.z(or2_unit0)
);
or_gate unit0_6(
.x(or2_unit0),
.y(temp3_unit0),
.z(ALUctrl[0])
);


//alu ctrl 1
and_gate unit1_0_1(
.x(notop2),
.y(notop1),
.z(temp0_unit1)
);
and_6unit unit1_1(
.and0(ALUop[2]),
.and1(notfun0),
.and2(func[1]),
.and3(func[5]),
.and4(notfun3),
.and5(notfun2),
.and_result(temp1_unit1)
);
and_6unit unit1_2(
.and0(ALUop[2]),
.and1(func[0]),
.and2(func[1]),
.and3(func[5]),
.and4(notfun3),
.and5(notfun2),
.and_result(temp2_unit1)
);
and_6unit unit1_3(
.and0(ALUop[2]),
.and1(func[5]),
.and2(notfun3),
.and3(notfun2),
.and4(notfun1),
.and5(notfun0),
.and_result(temp3_unit1)
);
and_6unit unit1_4(
.and0(ALUop[2]),
.and1(func[5]),
.and2(func[3]),
.and3(notfun2),
.and4(func[1]),
.and5(notfun0),
.and_result(temp4_unit1)
);
and_6unit unit1_5(
.and0(ALUop[2]),
.and1(func[5]),
.and2(func[3]),
.and3(notfun2),
.and4(func[1]),
.and5(func[0]),
.and_result(temp5_unit1)
);
or_6unit combine1(
.or0(temp0_unit1),
.or1(temp1_unit1),
.or2(temp2_unit1),
.or3(temp3_unit1),
.or4(temp4_unit1),
.or5(temp5_unit1),
.or_result(ALUctrl[1])
);

//alu ctrl 2
and_gate unit2_0(
.x(ALUop[2]),
.y(notfun5),
.z(temp0_unit2)
);

and_gate unit2_1_0(
.x(notop2),
.y(notop1),
.z(and_1)
);
and_gate unit2_1_1(
.x(and_1),
.y(ALUop[0]),
.z(temp1_unit2)
);
and_6unit unit2_2(
.and0(ALUop[2]),
.and1(func[5]),
.and2(notfun3),
.and3(notfun2),
.and4(notfun1),
.and5(func[0]),
.and_result(temp2_unit2)
);
and_6unit unit2_3(
.and0(ALUop[2]),
.and1(func[5]),
.and2(notfun3),
.and3(notfun2),
.and4(func[1]),
.and5(notfun0),
.and_result(temp3_unit2)
);
and_6unit unit2_4(
.and0(ALUop[2]),
.and1(func[5]),
.and2(notfun3),
.and3(notfun2),
.and4(func[1]),
.and5(func[0]),
.and_result(temp4_unit2)
);
and_6unit unit2_5(
.and0(ALUop[2]),
.and1(func[5]),
.and2(func[3]),
.and3(notfun2),
.and4(func[1]),
.and5(func[0]),
.and_result(temp5_unit2)
);
or_6unit combine2(
.or0(temp0_unit2),
.or1(temp1_unit2),
.or2(temp2_unit2),
.or3(temp3_unit2),
.or4(temp4_unit2),
.or5(temp5_unit2),
.or_result(ALUctrl[2])
);
endmodule
