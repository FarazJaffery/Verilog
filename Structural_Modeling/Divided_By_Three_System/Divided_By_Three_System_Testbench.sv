// NAME: Syed Ali Faraz Jaffery //
//////////////////////////////////

// Testbench for Divided By 3 System //
///////////////////////////////////////





`timescale 1ns / 1ps

module Divide_By_Three_System_Testbench();

reg [3:0] in;
wire out;

Divide_By_Three DUT (in, out);

initial begin
    in = 3;
    #50;
    in = 7;
    #50;
    in[0] = 1'b0; in[1] = 1'b0; in[2] = 1'b1; in[3] = 1'b1; // 12
    #50;
    in[0] = 1'b0; in[1] = 1'b0; in[2] = 1'b0; in[3] = 1'b1; // 1
    #50;
    in[0] = 1'b1; in[1] = 1'b1; in[2] = 1'b1; in[3] = 1'b1; // 15
    #50;
    in[0] = 1'b0; in[1] = 1'b1; in[2] = 1'b1; in[3] = 1'b1; // 14
    #50;
    in[0] = 1'b0; in[1] = 1'b0; in[2] = 1'b0; in[3] = 1'b0;
    #50;
end

endmodule