// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: Asynchronous Reset 10 Minutes Stopwatch With Seven Segment Display //
/////////////////////////////////////////////////


`timescale 1ns/1ps

module Stopwatch(
input clk, clr,
output reg [6:0]Decisecond_7_Seg, 
output reg [6:0]Second_L_7_Seg , 
output reg [6:0]Second_R_7_Seg , 
output reg [6:0]Minutes_7_Seg 
);

reg [3:0] Decisecond = 4'b0000;
reg [3:0] Second_R = 4'b0000;
reg [3:0] Second_L = 4'b0000;
reg [3:0] Minutes = 4'b0000;

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


BCD_to_7_seg dec (.BCD(Decisecond), .a_to_g(Decisecond_7_Seg));
BCD_to_7_seg SR  (.BCD(Second_R), .a_to_g( Second_R_7_Seg));
BCD_to_7_seg SL  (.BCD(Second_L), .a_to_g(Second_L_7_Seg));
BCD_to_7_seg min (.BCD(Minutes), .a_to_g(Minutes_7_Seg));

endmodule


module BCD_to_7_seg(
  input [3:0]BCD,
  output reg [6:0] a_to_g = 0
);

always @*
  begin
case(BCD)
4'b0000 : a_to_g <= 7'b1111110;
4'b0001 : a_to_g <= 7'b0110000;
4'b0010 : a_to_g <= 7'b1101101;
4'b0011 : a_to_g <= 7'b1111001;
4'b0100 : a_to_g <= 7'b0110011;
4'b0101 : a_to_g <= 7'b1011011;
4'b0110 : a_to_g <= 7'b1011111;
4'b0111 : a_to_g <= 7'b1110000;
4'b1000 : a_to_g <= 7'b1111111;
4'b1001 : a_to_g <= 7'b1111011;
endcase
  end
endmodule
