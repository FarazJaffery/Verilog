// NAME: Syed Ali Faraz Jaffery // 
//////////////////////////////////

// Testbench for Traffic Light Controller //
////////////////////////////////////////////



`timescale 1ns / 1ps

module Traffic_Light_Controller_Testbench;
    reg clk11;
    wire [1:0] out01, out11, out21, out31;

 
    Traffic_Light_Controller dut(
        .clk11(clk11),
        .out01(out01),
        .out11(out11),
        .out21(out21),
        .out31(out31)
    );


    initial begin
        clk11 = 0;
        forever #5 clk11 = ~clk11; 
    end

 
    initial begin
        $monitor("Time: %0t, out01=%b, out11=%b, out21=%b, out31=%b", $time, out01, out11, out21, out31);
    end
endmodule

