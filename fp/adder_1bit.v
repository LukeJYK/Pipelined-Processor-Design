`timescale 1ns/1ps
module adder_1bit(
//input
in_a,
in_b,
cin,
//output
sum,
cout
);
input in_a;
input in_b;
input cin;

output sum;
output cout;

wire sum_1;
wire cout_1;
wire cout_2;

 
half_adder half_adder1(
.in_a(in_a),
.in_b(in_b),
.sum(sum_1),
.cout(cout_1)
);

half_adder half_adder2(
.in_a(cin),
.in_b(sum_1),
.sum(sum),
.cout(cout_2)
);

or_gate or_gate(
.x(cout_1),
.y(cout_2),
.z(cout)
);
endmodule
