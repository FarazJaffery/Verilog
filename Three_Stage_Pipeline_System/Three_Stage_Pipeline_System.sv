// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: Three Stage Pipeline System //
/////////////////////////////////////////


`timescale 1ns / 1ps

module Three_Stage_Pipeline_System(
    input [5:0] A, B, C, D,
    input clk,
    output reg [5:0] out
);
    reg x1, x2, x3, out1; // Changed 'out1' to 'x3' as per the code logic

    // Stage 1
    always @(*) begin
        x1 <= A - B;
        x2 <= C + D;
    end

    // Stage 2
    always @(*) begin
        x3 <= x1 + x2;
    end

    // Stage 3
    always @(*) begin
        out <= x3 * D;
    end
endmodule