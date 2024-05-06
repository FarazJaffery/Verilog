// NAME: Syed Ali Faraz Jaffery //
//////////////////////////////////

// Testbench for 4 bit Comparator //
////////////////////////////////////


`timescale 1ns / 1ps

module Four_Bit_Comparator_TB();

reg [3:0] a, b;
wire g, e, s;

Four_Bit_Comparator DUT (a, b, g, e, s);

initial begin
    a = 10; b = 12;
    #100;
    a = 5; b = 5;
    #100;
    a = 14; b = 8;
    #100;
    a = 4'b1010; b = 4'b1010;
    #100;
    a = 4'b1011; b = 4'b0010;
    #100;
    a = 4'b0010; b = 4'b1010;
    #100;
end

endmodule   