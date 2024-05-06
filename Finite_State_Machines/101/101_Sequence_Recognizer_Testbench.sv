// NAME: Syed Ali Faraz Jaffery // 
//////////////////////////////////

// Testbench for Sequence Recognizer (101) //
/////////////////////////////////////////////


`timescale 1ns / 1ps

module sequence_det_tb();
    reg x, clk, rst;
    wire y;

    sequence_det dut (
        .x(x),
        .clk(clk),
        .rst(rst),
        .y(y)
    );

    initial begin
        clk = 1'b0;
        rst = 1'b1;
    end

    always #5 clk = ~clk;

    initial begin
        #15 rst = 1'b0; x = 0; 
	#15 x = 1; 
	#15 x = 1; 
	#15 x = 1;
        #15 x = 1; 
	#15 x = 0; 
	#15 x = 1; // y become 1
	#15 x = 1;
        #15 x = 0; 
	#15 x = 0;
	#15 x = 1; 
	#15 x = 1; 
    end
endmodule