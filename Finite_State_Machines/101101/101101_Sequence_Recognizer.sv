// NAME: Syed Ali Faraz Jaffery // 
//////////////////////////////////

// Design: Sequence Recognizer (101)  //
////////////////////////////////////////


`timescale 1ns / 1ps

module sequence_det(x, clk, rst, y);
    input wire x, clk, rst;
    output reg y;

    // State declaration
    parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011,
              s4 = 3'b100, s5 = 3'b101, s6 = 3'b110;
    reg [2:0] ns, ps;

    // State transition logic
    always @(posedge clk) begin
        if (rst)
            ps <= s0;
        else
            ps <= ns;
    end

    // Next state logic
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
                ns = x ? s4 : s2; 
                y = 0;
            end
            s4: begin
                ns = x ? s1 : s5;
                y = 0;
            end
            s5: begin
                ns = x ? s6 : s0;
                y = 0;
            end
            s6: begin
                ns = x ? s1 : s2; 
                y = 1; 
            end
            default: begin
                ns = s0;
                y = 0;
            end
        endcase
    end
endmodule
