`timescale 1ns/1ps
module and_6unit(
//input
and0,
and1,
and2,
and3,
and4,
and5,
//output
and_result
);
input and0;
input and1;
input and2;
input and3;
input and4;
input and5;
output and_result;
wire t0;
wire t1;
wire t2;
wire t3;
and_gate and_gate0(
.x(and0),
.y(and1),
.z(t0)
);

and_gate and_gate1(
.x(t0),
.y(and2),
.z(t1)
);

and_gate and_gate2(
.x(t1),
.y(and3),
.z(t2)
);
and_gate and_gate3(
.x(t2),
.y(and4),
.z(t3)
);
and_gate and_gate4(
.x(t3),
.y(and5),
.z(and_result)
);
endmodule