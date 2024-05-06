// NAME: Syed Ali Faraz Jaffery // 
//////////////////////////////////

// Design: 4 x 1 Multiplexer //
///////////////////////////////


`timescale 1ns / 1ps

module Four_to_One_Mux(
    input wire a, b, c, d,
    input wire [1:0] s,
    output wire y
);

    assign y = ~s[0] & ~s[1] & a | s[0] & ~s[1] & b | ~s[0] & s[1] & c | s[0] & s[1] & d;

endmodule