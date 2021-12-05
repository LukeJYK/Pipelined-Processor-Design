module mux_3_to_1(
//input
sel,
src00, 
src01, 
src10,
//output
z
);
input [1:0] sel;
input [31:0] src00;
input [31:0] src01;
input [31:0] src10;
output [31:0] z;
wire [31:0] temp;
mux_nbit #(.n(32)) mux_rt_rd_1(
.sel(sel[0]),
.src0(src00),
.src1(src01),
.z(temp)
);
mux_nbit #(.n(32)) mux_rt_rd_2(
.sel(sel[1]),
.src0(temp),
.src1(src10),
.z(z)
);	
endmodule
