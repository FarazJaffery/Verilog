// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: T Latch//
////////////////////


`timescale 1ns / 1ps

module T_latch(
    input wire T, clk, rst,
    output reg Q
);

always @(T , clk , rst) begin
    if (rst)
        Q <= 0;
    else if (clk) begin // Changed 'else (clk)' to 'else if (clk)'
        if (T)
            Q <= ~Q;
        else
            Q <= Q;
    end
end

endmodule