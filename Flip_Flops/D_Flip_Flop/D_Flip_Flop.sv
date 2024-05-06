// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: D FlipFlop //
////////////////////////


`timescale 1ns / 1ps
module D_FlipFlop(
    input wire D, clk, en, reset,
    output reg Q
);

always @(posedge clk, posedge reset)
begin
    if (reset)
        Q <= 0;
    else if (en)
        Q <= D;
ends

endmodule