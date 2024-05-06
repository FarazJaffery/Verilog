// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for 8 Bit Counter //
//////////////////////////////////

`timescale 1ns / 1ps

module Seven_Segment_with_Four_Bit_Counter_Testbench;
    reg clck, reset;
    wire [6:0] a_to_g;
    wire [7:0] Anode_Activate;
    wire dp;

    Seven_Segment_with_Four_Bit_Counter dut (
        .a_to_g(a_to_g),
        .Anode_Activate(Anode_Activate),
        .dp(dp),
        .clck(clck),
        .reset(reset)
    );

    initial begin
        clck = 0;
        reset = 1;
        #10 reset = 0;
    end

    always #5 clck = ~clck; // Generate clock signal

    initial begin
        $monitor("Time: %0t, a_to_g=%b, Anode_Activate=%b, dp=%b", $time, a_to_g, Anode_Activate, dp);
        #1000000 $finish; // Simulate for 1 million time units
    end
endmodule