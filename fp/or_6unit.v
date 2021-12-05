`timescale 1ns/1ps
module or_6unit(
//input
or0,
or1,
or2,
or3,
or4,
or5,
//output
or_result
);
input or0;
input or1;
input or2;
input or3;
input or4;
input or5;
output or_result;
wire t0;
wire t1;
wire t2;
wire t3;
or_gate or_gate0(
.x(or0),
.y(or1),
.z(t0)
);

or_gate or_gate1(
.x(t0),
.y(or2),
.z(t1)
);

or_gate or_gate2(
.x(t1),
.y(or3),
.z(t2)
);
or_gate or_gate3(
.x(t2),
.y(or4),
.z(t3)
);
or_gate or_gate4(
.x(t3),
.y(or5),
.z(or_result)
);
endmodule