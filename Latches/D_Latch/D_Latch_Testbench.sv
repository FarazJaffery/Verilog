// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// TestBench for D Latch  //
////////////////////////////


`timescale 1ns / 1ps

module D_latch_TestBench;
    reg D, clk, reset;
    wire Q;

    D_latch dut (
        .D(D),
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        D = 1'bx;
        #10 reset = 0;

        D = 1'b0;
        #10 D = 1'b1;
        #10 D = 1'b0;
        #10 reset = 1;
        #10 $finish;
    end

    initial begin
        $monitor("Time: %0t, D=%b, clk=%b, reset=%b, Q=%b", $time, D, clk, reset, Q);
    end
endmodule
   