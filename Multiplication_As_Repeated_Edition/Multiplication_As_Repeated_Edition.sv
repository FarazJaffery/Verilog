// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

/////////////////////////////////////////////
//  Design: Data path and Controller for  //
// Multiplication Using Repeated Edition //
///////////////////////////////////////////


`timescale 1ns / 1ps

module data_path(eqz, ldA, ldB, clrs, ldS, decB, clk, data_in);
    output eqz;
    input ldA, ldB, clrs, ldS, decB, clk;
    input [7:0] data_in;

    wire x, y, z;
    wire [7:0] b_out;

    p1 a (x, data_in, ldA, clk);
    p2 b (y, clrs, ldS, clk, z);
    p3 c (z, x, y);
    p4 d (b_out, data_in, ldB, decB, clk);
    p5 e (eqz, b_out);
endmodule

module p1 (x, data_in, ldA, clk);
    output reg [7:0] x;
    input [7:0] data_in;
    input ldA, clk;

    always@(posedge clk)
        if (ldA == 1)
            x <= data_in;
endmodule

module p2(y, clrs, ldS, clk, z);
    output reg [7:0] y;
    input clrs, ldS, clk;
    input [7:0] z;

    always@(posedge clk)
        if (clrs == 1)
            y <= 0;
        else if (ldS == 1)
            y <= z;
endmodule

module p3(z, x, y);
    output reg [7:0] z;
    input [7:0] x, y;

    always@(*)
        z = x + y;
endmodule

module p4(b_out, data_in, ldB, decB, clk);
    output reg [7:0] b_out;
    input [7:0] data_in;
    input ldB, decB, clk;

    always@(posedge clk)
        if (ldB == 1)
            b_out = data_in;
        else if (decB == 1)
            b_out <= b_out - 1;
endmodule

module p5(eqz, b_out);
    output reg eqz;
    input [7:0] b_out;

    always@(*)
        if (b_out == 0)
            eqz <= 1;
        else
            eqz <= 0;
endmodule
