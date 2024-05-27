// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for Asynchronous Reset 10 Minutes Stopwatch Without Seven Segment Display //
/////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps
module tb_Stopwatch;
    reg clk; // Clock input
    reg clr; // Clear button input
    wire [3:0] Decisecond;
    wire [3:0] Second_R; 
    wire [3:0] Second_L; 
    wire [3:0] Minutes;

    Stopwatch dut (
        .clk(clk),
        .clr(clr),
        .Decisecond(Decisecond),
        .Second_R(Second_R),
        .Second_L(Second_L),
        .Minutes(Minutes)
    );

    always #5 clk = ~clk; 

    initial begin
        clk = 0; 
        clr = 0; 

      $monitor("Time: %d:%d%d:%d", Minutes, Second_L,Second_R, Decisecond);

        #20 clr = 0; 
        #10 clr = 1; 

              
        #599900 $finish;
    end
  
   initial begin
 $dumpfile("tb_Stopwatch.vcd");
     $dumpvars(0, tb_Stopwatch);
 end
endmodule
