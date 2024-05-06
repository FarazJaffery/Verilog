// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for JK Latch //
////////////////////////////


`timescale 1ns / 1ps

module JK_Latch_Testbench;
    reg J, K, clk, reset;
    wire Q;

    JK_Latch dut (
        .J(J),
        .K(K),
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
        J = 1'bx;
        K = 1'bx;
        #10 reset = 0;

        J = 1'b0; K = 1'b0;
        #10 J = 1'b0; K = 1'b1;
        #10 J = 1'b1; K = 1'b0;
        #10 J = 1'b1; K = 1'b1;
        #10 reset = 1;
        #10 $finish;
    end

    initial begin
        $monitor("Time: %0t, J=%b, K=%b, clk=%b, reset=%b, Q=%b", $time, J, K, clk, reset, Q);
    end
endmodule
