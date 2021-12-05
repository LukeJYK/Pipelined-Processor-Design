`timescale 1ns/1ps
module adder_32bit(
//input
in_a,
in_b,
cin,
//output
sum,
cout,
overflow
);

input [31:0] in_a;
input [31:0] in_b;
input cin;

output [31:0] sum;
output cout;
output overflow;


wire cout_30;
wire cout_29;
wire cout_28;
wire cout_27;
wire cout_26;
wire cout_25;
wire cout_24;
wire cout_23;
wire cout_22;
wire cout_21;
wire cout_20;
wire cout_19;
wire cout_18;
wire cout_17;
wire cout_16;
wire cout_15;
wire cout_14;
wire cout_13;
wire cout_12;
wire cout_11;
wire cout_10;
wire cout_9;
wire cout_8;
wire cout_7;
wire cout_6;
wire cout_5;
wire cout_4;
wire cout_3;
wire cout_2;
wire cout_1;
wire cout_0;

xor_gate xor_gate(
.x(cout_30),
.y(cout),
.z(overflow)
);

adder_1bit adder_1bit31(
.in_a(in_a[31]),
.in_b(in_b[31]),
.cin(cout_30),
.sum(sum[31]),
.cout(cout)
);

adder_1bit adder_1bit30(
.in_a(in_a[30]),
.in_b(in_b[30]),
.cin(cout_29),
.sum(sum[30]),
.cout(cout_30)
);

adder_1bit adder_1bit29(
.in_a(in_a[29]),
.in_b(in_b[29]),
.cin(cout_28),
.sum(sum[29]),
.cout(cout_29)
);

adder_1bit adder_1bit28(
.in_a(in_a[28]),
.in_b(in_b[28]),
.cin(cout_27),
.sum(sum[28]),
.cout(cout_28)
);

adder_1bit adder_1bit27(
.in_a(in_a[27]),
.in_b(in_b[27]),
.cin(cout_26),
.sum(sum[27]),
.cout(cout_27)
);

adder_1bit adder_1bit26(
.in_a(in_a[26]),
.in_b(in_b[26]),
.cin(cout_25),
.sum(sum[26]),
.cout(cout_26)
);

adder_1bit adder_1bit25(
.in_a(in_a[25]),
.in_b(in_b[25]),
.cin(cout_24),
.sum(sum[25]),
.cout(cout_25)
);

adder_1bit adder_1bit24(
.in_a(in_a[24]),
.in_b(in_b[24]),
.cin(cout_23),
.sum(sum[24]),
.cout(cout_24)
);

adder_1bit adder_1bit23(
.in_a(in_a[23]),
.in_b(in_b[23]),
.cin(cout_22),
.sum(sum[23]),
.cout(cout_23)
);

adder_1bit adder_1bit22(
.in_a(in_a[22]),
.in_b(in_b[22]),
.cin(cout_21),
.sum(sum[22]),
.cout(cout_22)
);

adder_1bit adder_1bit21(
.in_a(in_a[21]),
.in_b(in_b[21]),
.cin(cout_20),
.sum(sum[21]),
.cout(cout_21)
);

adder_1bit adder_1bit20(
.in_a(in_a[20]),
.in_b(in_b[20]),
.cin(cout_19),
.sum(sum[20]),
.cout(cout_20)
);

adder_1bit adder_1bit19(
.in_a(in_a[19]),
.in_b(in_b[19]),
.cin(cout_18),
.sum(sum[19]),
.cout(cout_19)
);

adder_1bit adder_1bit18(
.in_a(in_a[18]),
.in_b(in_b[18]),
.cin(cout_17),
.sum(sum[18]),
.cout(cout_18)
);

adder_1bit adder_1bit17(
.in_a(in_a[17]),
.in_b(in_b[17]),
.cin(cout_16),
.sum(sum[17]),
.cout(cout_17)
);

adder_1bit adder_1bit16(
.in_a(in_a[16]),
.in_b(in_b[16]),
.cin(cout_15),
.sum(sum[16]),
.cout(cout_16)
);

adder_1bit adder_1bit15(
.in_a(in_a[15]),
.in_b(in_b[15]),
.cin(cout_14),
.sum(sum[15]),
.cout(cout_15)
);

adder_1bit adder_1bit14(
.in_a(in_a[14]),
.in_b(in_b[14]),
.cin(cout_13),
.sum(sum[14]),
.cout(cout_14)
);

adder_1bit adder_1bit13(
.in_a(in_a[13]),
.in_b(in_b[13]),
.cin(cout_12),
.sum(sum[13]),
.cout(cout_13)
);

adder_1bit adder_1bit12(
.in_a(in_a[12]),
.in_b(in_b[12]),
.cin(cout_11),
.sum(sum[12]),
.cout(cout_12)
);

adder_1bit adder_1bit11(
.in_a(in_a[11]),
.in_b(in_b[11]),
.cin(cout_10),
.sum(sum[11]),
.cout(cout_11)
);

adder_1bit adder_1bit10(
.in_a(in_a[10]),
.in_b(in_b[10]),
.cin(cout_9),
.sum(sum[10]),
.cout(cout_10)
);

adder_1bit adder_1bit9(
.in_a(in_a[9]),
.in_b(in_b[9]),
.cin(cout_8),
.sum(sum[9]),
.cout(cout_9)
);

adder_1bit adder_1bit8(
.in_a(in_a[8]),
.in_b(in_b[8]),
.cin(cout_7),
.sum(sum[8]),
.cout(cout_8)
);

adder_1bit adder_1bit7(
.in_a(in_a[7]),
.in_b(in_b[7]),
.cin(cout_6),
.sum(sum[7]),
.cout(cout_7)
);

adder_1bit adder_1bit6(
.in_a(in_a[6]),
.in_b(in_b[6]),
.cin(cout_5),
.sum(sum[6]),
.cout(cout_6)
);

adder_1bit adder_1bit5(
.in_a(in_a[5]),
.in_b(in_b[5]),
.cin(cout_4),
.sum(sum[5]),
.cout(cout_5)
);

adder_1bit adder_1bit4(
.in_a(in_a[4]),
.in_b(in_b[4]),
.cin(cout_3),
.sum(sum[4]),
.cout(cout_4)
);

adder_1bit adder_1bit3(
.in_a(in_a[3]),
.in_b(in_b[3]),
.cin(cout_2),
.sum(sum[3]),
.cout(cout_3)
);

adder_1bit adder_1bit2(
.in_a(in_a[2]),
.in_b(in_b[2]),
.cin(cout_1),
.sum(sum[2]),
.cout(cout_2)
);

adder_1bit adder_1bit1(
.in_a(in_a[1]),
.in_b(in_b[1]),
.cin(cout_0),
.sum(sum[1]),
.cout(cout_1)
);

adder_1bit adder_1bit0(
.in_a(in_a[0]),
.in_b(in_b[0]),
.cin(cin),
.sum(sum[0]),
.cout(cout_0)
);

endmodule
