// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for JK FlipFlop  //
////////////////////////////////


`timescale 1ns / 1ps

module JK_FlipFlop_Testbench;
    reg J, K, clk, en, reset;
    wire Q;

    JK_FlipFlop dut (
        .J(J),
        .K(K),
        .clk(clk),
        .en(en),
        .reset(reset),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        en = 0;
        J = 1'bx;
        K = 1'bx;
        #10 reset = 0;

        en = 1;
        J = 1'b0; K = 1'b0;
        #10 J = 1'b0; K = 1'b1;
        #10 J = 1'b1; K = 1'b0;
        #10 J = 1'b1; K = 1'b1;
        #10 en = 0;
        #10 en = 1;
        #10 reset = 1;
        #10 $finish;
    end

    initial begin
        $monitor("Time: %0t, J=%b, K=%b, en=%b, reset=%b, Q=%b", $time, J, K, en, reset, Q);
    end
endmodule