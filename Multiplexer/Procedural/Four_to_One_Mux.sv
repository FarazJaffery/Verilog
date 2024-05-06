// NAME: Syed Ali Faraz Jaffery // 
//////////////////////////////////

// Design: 4 x 1 Multiplexer //
///////////////////////////////

`timescale 1ns / 1ps

module Four_to_One_Mux(
    input wire [7:0] a, b, c, d,
    input wire [1:0] s,
    output reg [7:0] y
);

    always @* begin
        case(s)
            2'b00: y <= a;
            2'b01: y <= b;
            2'b10: y <= c;
            2'b11: y <= d;
        endcase
    end

endmodule