// NAME: Syed Ali Faraz Jaffery //
//////////////////////////////////

// 4 bit Comparator //
//////////////////////


`timescale 1ns / 1ps

module Four_Bit_Comparator(
    input [3:0] a, b,
    output g, e, s
);

wire NOR0, NOR1, NOR2, NOR3;
wire NOT0, NOT1, NOT2, NOT3, NOT4, NOT5, NOT6, NOT7;
wire AND0, AND1, AND2, AND3, AND4, AND5, AND6, AND7, AND8, AND9, AND10, AND11, AND12, AND13, AND14, AND15;

not n0 (NOT0, a[0]);
not n1 (NOT1, a[1]);
not n2 (NOT2, a[2]);
not n3 (NOT3, a[3]);
not n4 (NOT4, b[0]);
not n5 (NOT5, b[1]);
not n6 (NOT6, b[2]);
not n7 (NOT7, b[3]);

and a0 (AND0, a[0], NOT4); // a0&b0bar
and a1 (AND1, b[0], NOT0); // b0&a0bar
and a2 (AND2, a[1], NOT5); // a1&b1bar
and a3 (AND3, b[1], NOT1); // b1&a1bar
and a4 (AND4, a[2], NOT6); // a2&b2bar
and a5 (AND5, b[2], NOT2); // b2&a2bar
and a6 (AND6, a[3], NOT7); // a3&b3bar
and a7 (AND7, b[3], NOT3); // b3&a3bar

nor nor0 (NOR0, AND0, AND1); // nor4
nor nor1 (NOR1, AND2, AND3); // nor3
nor nor2 (NOR2, AND4, AND5); // nor2
nor nor3 (NOR3, AND6, AND7); // nor1

and a8 (AND8, NOR2, NOR3);
and a9 (AND9, NOR3, AND5);
and a10 (AND10, AND4, NOR3);
and a11 (AND11, NOR1, AND8);
and a12 (AND12, AND8, AND3);
and a13 (AND13, AND8, AND2);
and a14 (AND14, AND1, AND11);
and a15 (AND15, AND11, AND0);

and (e, NOR0, AND11); // A=B
or o1 (s, AND7, AND9, AND12, AND14); // A<B
or o2 (g, AND6, AND10, AND13, AND15); // A>B

endmodule

