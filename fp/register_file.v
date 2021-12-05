
module register_file (clk, rstb, rdA_addr, rdB_addr, rdA_data, rdB_data, wr_addr, wr_data, wr_en );
input clk, rstb;
input [4:0] rdA_addr, rdB_addr;
output [31:0] rdA_data, rdB_data;
input [31:0] wr_data;
input [4:0] wr_addr;
input wr_en;

reg [31:0] mem [0:31];

assign rdA_data = mem[rdA_addr];
assign rdB_data = mem[rdB_addr];

always @ (posedge clk or negedge rstb) begin
  if (~rstb) begin
    mem[0] <= 32'h00000000;
    mem[1] <= 32'h00000000;
    mem[2] <= 32'h00000000;
    mem[3] <= 32'h00000000;
    mem[4] <= 32'h00000000;
    mem[5] <= 32'h00000000;
    mem[6] <= 32'h00000000;
    mem[7] <= 32'h00000000;
    mem[8] <= 32'h00000000;
    mem[9] <= 32'h00000000;
    mem[10] <= 32'h00000000;
    mem[11] <= 32'h00000000;
    mem[12] <= 32'h00000000;
    mem[13] <= 32'h00000000;
    mem[14] <= 32'h00000000;
    mem[15] <= 32'h00000000;
    mem[16] <= 32'h00000000;
    mem[17] <= 32'h00000000;
    mem[18] <= 32'h00000000;
    mem[19] <= 32'h00000000;
    mem[20] <= 32'h00000000;
    mem[21] <= 32'h00000000;
    mem[22] <= 32'h00000000;
    mem[23] <= 32'h00000000;
    mem[24] <= 32'h00000000;
    mem[25] <= 32'h00000000;
    mem[26] <= 32'h00000000;
    mem[27] <= 32'h00000000;
    mem[28] <= 32'h00000000;
    mem[29] <= 32'h00000000;
    mem[30] <= 32'h00000000;
    mem[31] <= 32'h00000000;
  end
  else if (wr_en) begin
      mem[wr_addr] <= wr_data;
  end 
end 


endmodule
