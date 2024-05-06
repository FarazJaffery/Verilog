// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: JK FlipFlop //
/////////////////////////


`timescale 1ns / 1ps

module JK_FlipFlop(
    input wire J, K, clk, en, reset,
    output reg Q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        Q <= 0;
    else if (en) begin
        if (J == 0 && K == 0)
            Q <= Q;
        else if (J == 0 && K == 1)
            Q <= 0;
        else if (J == 1 && K == 0)
            Q <= 1;
        else if (J == 1 && K == 1)
            Q <= ~Q;
    end
end

endmodule