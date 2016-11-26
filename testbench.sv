module testbench();
	logic clk;
	logic reset;
	
	logic signed [31:0] writedata, dataadr;
	logic	memwrite;
	
	top dut (clk, reset, writedata, dataadr, memwrite);
	initial
	begin
		reset <= 1; # 22; reset <= 0;
	end
		always
		begin
			clk <= 1; # 5; clk <= 0; # 5;
		end
		always @(negedge clk)
		begin
			if (memwrite) 
			begin
				if (dataadr === -32685) 
					
				begin
					$display("Simulation succeeded");
					$stop;
				end 
				else 
					if (dataadr !== -32685) 
					begin
						$display("Simulation failed %d <= %d", dataadr, writedata);
						$stop;
					end
				end
			end
endmodule
