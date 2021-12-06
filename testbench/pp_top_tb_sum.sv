`timescale 1ns/1ps
module pp_top_tb;
reg clk;
reg rstb;

parameter clk_period = 10;
parameter instr_file_name = "../testbench/data/unsigned_sum.dat";
parameter data_file_name = "../testbench/data/unsigned_sum.dat";

pp_top #(
	.instr_file_name(instr_file_name), 
	.data_file_name(instr_file_name)
	)
	pp_top(
	.clk(clk),
	.rstb(rstb)
	);

initial begin
clk = 1'b1;
forever begin
#(clk_period/2)
clk = ~clk;
end
end

initial begin
rstb = 1'b1;
#(clk_period/2)
rstb = 1'b0;
#(clk_period*2)
rstb = 1'b1;
#10000
$finish;
end

integer status_log = 0;
integer i = 0;
integer j = 0;
integer k = 0;
integer c = 0;
initial begin:write_log_file
	status_log = $fopen("unsigned_sum_status_log.txt","w");
	forever begin
		fork
			begin
				@(negedge clk);
				$fwrite(status_log,"PC=%h, Instr=%h \n",pp_top.stage1_if.current_pc,pp_top.stage1_if.instr_if);
				for(k = 32'h10000000; k<32'h10000032;k=k+4)begin
					for(c=0; c<50; c++)begin
						if(pp_top.stage4_mem.data_cache.mem[c][0] == k)begin
							$fwrite(status_log,"MEM[%h] = %h \n",k,pp_top.stage4_mem.data_cache.mem[c][1]);
						end
					end
				end
				for (i = 0; i < 4; i++)begin
					for (j = 0 ; j < 8 ; j ++)begin
						$fwrite(status_log,"REG[%2d] = %h  ",8*i+j,pp_top.stage2_id.RF.mem[8*i+j]);
					end
					$fwrite(status_log,"\n");
				end
				$fwrite(status_log,"\n");
			end
		join
	end
end

			

endmodule
