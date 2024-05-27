
// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: Asynchronous Reset 10 Minutes Stopwatch Without Seven Segment Display //
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps

module Stopwatch(
input clk, clr,
output reg [3:0] Decisecond = 4'b0000,
output reg [3:0] Second_R = 4'b0000,
output reg [3:0] Second_L = 4'b0000,
output reg [3:0] Minutes = 4'b0000
);
always @(posedge clk, negedge clr)
begin

	if (!clr) 
	begin
		Decisecond <= 0;
		Second_R <= 0;
		Second_L <= 0;
		Minutes <= 0;
	end
	else
	begin
		if (Decisecond == 4'b1001)
		begin
			Decisecond <= 4'b0000;
			if (Second_R == 4'b1001)
			begin
				Second_R <= 4'b0000;
				if (Second_L == 4'b0101)
				begin
					Second_L <= 4'b0000;
					if (Minutes == 4'b1001)
					Minutes <= 4'b0000;
					else
					Minutes <= Minutes + 1;
				end
				else
				Second_L <= Second_L + 1;					
			end
			else
				Second_R <= Second_R + 1;
		end
		else
			Decisecond <= Decisecond + 1;
	end
end  
endmodule
