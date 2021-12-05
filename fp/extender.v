module extender(
in,
ext_ctrl,
out
);
input [15:0] in;
input ext_ctrl;
output [31:0] out;

assign out = (ext_ctrl == 1'b0)?{16'h0000,in}:{{16{in[15]}},in};

endmodule

