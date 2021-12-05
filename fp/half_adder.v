`timescale 1ns/1ps
module half_adder(
//input
in_a,
in_b,
//output
sum,
cout
);
input in_a;
input in_b;
output sum;
output cout;

xor_gate xor_gate(
.x(in_a),
.y(in_b),
.z(sum)
);

and_gate and_gate(
.x(in_a),
.y(in_b),
.z(cout)
);

endmodule




