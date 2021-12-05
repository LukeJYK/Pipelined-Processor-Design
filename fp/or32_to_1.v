module or32_to_1(
x,
z
);
input [31:0] x;
output z;
wire temp1;
wire temp2;
wire temp3;
wire temp4;
wire temp5;
wire temp6;
wire temp7;
or_6unit or_r1(
.or0(x[0]),
.or1(x[1]),
.or2(x[2]),
.or3(x[3]),
.or4(x[4]),
.or5(x[5]),
.or_result(temp1)
);
or_6unit or_r2(
.or0(x[6]),
.or1(x[7]),
.or2(x[8]),
.or3(x[9]),
.or4(x[10]),
.or5(x[11]),
.or_result(temp2)
);
or_6unit or_r3(
.or0(x[12]),
.or1(x[13]),
.or2(x[14]),
.or3(x[15]),
.or4(x[16]),
.or5(x[17]),
.or_result(temp3)
);
or_6unit or_r4(
.or0(x[18]),
.or1(x[19]),
.or2(x[20]),
.or3(x[21]),
.or4(x[22]),
.or5(x[23]),
.or_result(temp4)
);
or_6unit or_r5(
.or0(x[24]),
.or1(x[25]),
.or2(x[26]),
.or3(x[27]),
.or4(x[28]),
.or5(x[29]),
.or_result(temp5)
);
or_6unit or_r6(
.or0(x[30]),
.or1(x[31]),
.or2(1'b0),
.or3(1'b0),
.or4(1'b0),
.or5(1'b0),
.or_result(temp6)
);
or_6unit or_r7(
.or0(temp1),
.or1(temp2),
.or2(temp3),
.or3(temp4),
.or4(temp5),
.or5(temp6),
.or_result(temp7)
);
not_gate reverse(
.x(temp7),
.z(z)
);
endmodule