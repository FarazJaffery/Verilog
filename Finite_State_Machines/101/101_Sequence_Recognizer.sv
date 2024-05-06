// NAME: Syed Ali Faraz Jaffery // 
//////////////////////////////////

// Design: Sequence Recognizer (101)  //
////////////////////////////////////////


`timescale 1ns / 1ps

module sequence_det(x, clk, rst, y);
    input wire x, clk, rst;
    output reg y;

    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
    reg [1:0] ns, ps;

    always @(posedge clk) begin
        if (rst)
            ps <= s0;
        else
            ps <= ns;
    end

    always @(ps, x) begin
        case (ps)
            s0: begin
                ns = x ? s1 : s0;
                y = 0;
            end
            s1: begin
                ns = x ? s1 : s2;
                y = 0;
            end
            s2: begin
                ns = x ? s3 : s0;
                y = 0;
            end
            s3: begin
                ns = x ? s1 : s0;
                y = 1;
            end
        endcase
    end
endmodule