// NAME: Syed Ali Faraz Jaffery //
//////////////////////////////////

// Design: Divided By 3 System //
/////////////////////////////////


`timescale 1ns / 1ps

module Divide_By_Three_System(
    input [3:0] in,
    output out
);

wire in0x, in1x, in2x, in3x;
wire A0, A1, A2, A3, A4, A5;
wire y0, y1;

not no (in0x, in[0]);
not n1 (in1x, in[1]);
not n2 (in2x, in[2]);
not n3 (in3x, in[3]);

and a0 (A0, in0x, in1x, in2x, in3x);
and a1 (A1, in[0], in1x, in2x, in[3]);
and a2 (A2, in0x, in[1], in[2], in3x);
and a3 (A3, in[0], in[1], in2x, in3x);
and a4 (A4, in0x, in1x, in[2], in[3]);
and a5 (A5, in[0], in[1], in[2], in[3]);

or o1 (y0, A0, A1, A2);
or o2 (y1, A3, A4, A5);
or o3 (out, y0, y1);

endmodule


