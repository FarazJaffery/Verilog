// NAME: Syed Ali Faraz Jaffery //
//////////////////////////////////

// Design: 1 x 8 Demultiplexer //
/////////////////////////////////

`timescale 1ns / 1ps

module One_to_Eight_Demux(
    input wire x,
    input wire [2:0] s,
    output wire a, b, c, d, e, f, g, h
);

assign a = ~s[2] & ~s[1] & ~s[0] & x;
assign b = ~s[2] & ~s[1] &  s[0] & x;
assign c = ~s[2] &  s[1] & ~s[0] & x;
assign d = ~s[2] &  s[1] &  s[0] & x;
assign e =  s[2] & ~s[1] & ~s[0] & x;
assign f =  s[2] & ~s[1] &  s[0] & x;
assign g =  s[2] &  s[1] & ~s[0] & x;
assign h =  s[2] &  s[1] &  s[0] & x;

endmodules