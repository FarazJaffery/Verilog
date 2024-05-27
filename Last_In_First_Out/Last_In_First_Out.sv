
// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: Fully Parameterized Asynchronous Active Low Reset Last In First Out (LIFO) / Stack //
///////////////////////////////////////////////////////////////////////////////////////////////




`timescale 1ns/1ps
module LIFO #(
  
parameter Input_Data_Width = 8, // set any data width here
parameter LIFO_Depth = 8 // set any LIFO depth here e.g 9 10 12, 14, 32, 100, 200

)(
  
input wire Read, 
input wire Write,
input wire reset, 
input wire clk,
input wire [Input_Data_Width-1:0] Data_in,
output reg [Input_Data_Width-1:0] Data_out = 0,
output reg LIFO_Full = 1'b0, 
output reg LIFO_Empty = 1'b1

);
  


reg [Input_Data_Width-1:0] LIFO_Memory [LIFO_Depth-1:0];
localparam Counter_Width = $clog2(LIFO_Depth);
wire [Counter_Width-1:0] Count;
integer i;
  

always @(posedge clk, negedge reset)
begin

	if (!reset)
	begin
		LIFO_Full <= 1'b0;
		LIFO_Empty <= 1'b1;
		for (i = 0; i < LIFO_Depth; i = i + 1) 
		begin
		LIFO_Memory[i] <= 8'b0;
		end
	end 
 
	else
	begin

		if (Write && !LIFO_Full) // when write operation require		 
			LIFO_Memory [Count] <= Data_in; 
 
      else if (Read && !LIFO_Empty && Count>0) // when read operation require
		begin
          Data_out <= LIFO_Memory [Count-1];
			LIFO_Full <= 1'b0;
		end

		else if (Read && LIFO_Empty)
 		Data_out <= 0;

	end
end



Up_Down_Counter #(.Width(LIFO_Depth)) c1 (.Increment(Write), .Decrement(Read), .clk(clk), .reset(reset), .Count(Count));



always @(posedge clk, negedge reset)
begin
	if (Count == 0)
	begin
		LIFO_Empty <= 1'b1;
		LIFO_Full <= 1'b0;
	end
  	else if (Count > 0)
		LIFO_Empty <= 1'b0;
	if (Count == LIFO_Depth -1)
		LIFO_Full <= 1'b1;
end


endmodule




module Up_Down_Counter #(parameter Width)(
input wire Increment, 
input wire Decrement,
input wire clk, 
input wire reset,
output reg [($clog2(Width))-1:0] Count = 0
);
  

reg Count_Done = 0;


always @(posedge clk, negedge reset)
begin
	if (!reset)
		Count <= 0;
 	else if (!Count_Done && Increment || !Count_Done && Decrement)
	begin
  
		if (Increment && Count < Width - 1)
    		begin
  			Count <= Count + 1;
     			Count_Done <= 1;
    		end
		else if (Decrement && Count > 0)
   		begin
 			Count <= Count - 1;
			Count_Done <= 1;
		end
	end
end

always @ (negedge Increment, negedge Decrement) // if write/read operation remain high for multiple clock cycles then it will help to count for only 1 time.
begin	
	Count_Done <= 0; 
end

endmodule
