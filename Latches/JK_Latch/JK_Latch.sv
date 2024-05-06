// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: JK Latch //
//////////////////////


`timescale 1ns / 1ps

module JK_Latch(
    input wire J, K, clk, reset,
    output reg Q
);

always @(J or K or clk or reset) begin
    if (reset)
        Q <= 0;
    else if (clk) begin
        case ({J, K})
            2'b00: Q <= Q;
            2'b01: Q <= 0;
            2'b10: Q <= 1;
            2'b11: Q <= ~Q;
        endcase
    end
end

endmodule