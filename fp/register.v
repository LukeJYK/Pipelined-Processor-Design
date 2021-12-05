
module register(
D, 
Q,
clk,
rstb,
hold
); 

parameter n = 0;

input [n-1:0] D;
input clk, rstb;
input hold;
output [n-1:0] Q;

reg [n-1:0] reg_ff; 

always @ (posedge clk or negedge rstb) begin
    if (~rstb) begin
	reg_ff <= 0;
    end
    else if(~hold) begin
	reg_ff <= D;
    end
end

assign Q = reg_ff;

endmodule 
