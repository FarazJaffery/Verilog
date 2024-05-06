// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: D Latch //
/////////////////////


`timescale 1ns / 1ps

module D_latch(
    input wire D, clk, reset,
    output reg Q
);

always @(clk or D or reset) begin
    if (reset)
        Q <= 0;
    else if (clk)
        Q <= D;
end

endmodule