// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for T Latch //
///////////////////////////


`timescale 1ns / 1ps

module T_latch_Testbench;
    reg T, clk, rst;
    wire Q;

    T_latch dut (
        .T(T),
        .clk(clk),
        .rst(rst),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        T = 1'bx;
        #10 rst = 0;

        T = 1'b0;
        #10 T = 1'b1;
        #10 T = 1'b0;
        #10 rst = 1;
        #10 $finish;
    end

    initial begin
        $monitor("Time: %0t, T=%b, clk=%b, rst=%b, Q=%b", $time, T, clk, rst, Q);
    end
endmodule