// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for Asynchronous Reset 10 Minutes Stopwatch With Seven Segment Display //
/////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module Stopwatch_tb;

    // Declare wires and regs
    reg clk;
    reg clr;
    wire [6:0] Decisecond_7_Seg;
    wire [6:0] Second_L_7_Seg;
    wire [6:0] Second_R_7_Seg;
    wire [6:0] Minutes_7_Seg;

    // Instantiate the module
    Stopwatch  dut (
        .clk(clk), 
        .clr(clr), 
        .Decisecond_7_Seg(Decisecond_7_Seg),
        .Second_L_7_Seg(Second_L_7_Seg),
        .Second_R_7_Seg(Second_R_7_Seg),
        .Minutes_7_Seg(Minutes_7_Seg)
    );


    always begin
        #5 clk = ~clk;
    end

    initial begin
     
 $monitor("Time: %b:   %b   %b:  %b", Minutes_7_Seg, Second_L_7_Seg,Second_R_7_Seg, Decisecond_7_Seg);

        clk = 0;
        clr = 1;
               


        #12200 

        clk = 0;   //randomly reset at any time stamp
        clr = 1;


   #599900
        $finish;
    end
   initial begin
 $dumpfile("Stopwatch_tb.vcd");
     $dumpvars(0, Stopwatch_tb);
 end

endmodule
