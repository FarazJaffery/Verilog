
// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: Fully Parameterized Asynchronous Active Low Reset First In First Out (FIFO) / Queue //
/////////////////////////////////////////////////////////////////////////////////////////////////



`timescale 1ns/1ps
module FIFO #(
  
parameter Input_Data_Width = 8, // set any data width here
parameter FIFO_Depth = 8 // set any FIFO depth here e.g 9 10 12, 14, 32, 100, 200

)(
  
input wire Read, 
input wire Write,
input wire reset, 
input wire clk,
input wire [Input_Data_Width-1:0] Data_in,
output reg [Input_Data_Width-1:0] Data_out = 0,
output reg FIFO_Full = 1'b0, 
output reg FIFO_Empty = 1'b1

);
  


reg [Input_Data_Width-1:0] FIFO_Memory [FIFO_Depth-1:0];
localparam Counter_Width = $clog2(FIFO_Depth);
wire [Counter_Width-1:0] Count;
integer i;
reg Read_Flag = 1;
  

always @(posedge clk, negedge reset)
begin

	if (!reset)
	begin
		FIFO_Full <= 1'b0;
		FIFO_Empty <= 1'b1;
		for (i = 0; i < FIFO_Depth; i = i + 1) 
		begin
		FIFO_Memory[i] <= 8'b0;
		end
	end 
 
	else
	begin

		if (Write && !FIFO_Full) // when write operation require		 
			FIFO_Memory [Count] <= Data_in; 
 
      else if (Read && !FIFO_Empty && Read_Flag ) // when read operation require
		begin
          Data_out <= FIFO_Memory [0];
			FIFO_Full <= 1'b0;
          Read_Flag <=1'b0;
          for (i = 0; i <= FIFO_Depth; i = i + 1) 
			begin
 				FIFO_Memory[i] <=  FIFO_Memory[i+1];
			end
		end

		else if (Read && FIFO_Empty)
 		Data_out <= 0;

	end
end



Up_Down_Counter #(.Width(FIFO_Depth)) c1 (.Increment(Write), .Decrement(Read), .clk(clk), .reset(reset), .Count(Count));



always @(posedge clk)
begin
	if (Count == 0)
	begin
		FIFO_Empty <= 1'b1;
		FIFO_Full <= 1'b0;
	end
  	else if (Count > 0)
		FIFO_Empty <= 1'b0;
	if (Count == FIFO_Depth -1)
		FIFO_Full <= 1'b1;
end

  always @(Count) 
  begin
    Read_Flag = 1;
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
