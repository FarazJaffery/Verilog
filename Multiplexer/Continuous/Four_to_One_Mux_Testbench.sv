// NAME: Syed Ali Faraz Jaffery// 
/////////////////////////////////


// Testbench for 4 x 1 Multiplexer //
/////////////////////////////////////


`timescale 1ns / 1ps

module Four_to_One_Mux_Testbench;

reg a, b, c, d;
reg [1:0] s;
wire y;

Four_to_One_Mux dut (
   .a(a),
   .b(b),
   .c(c),
   .d(d),
   .s(s),
   .y(y)
);

initial begin
   a = 0; b = 0; c = 0; d = 0; s = 0; #10;
   $display("a = %b, b = %b, c = %b, d = %b, s = %b, y = %b", a, b, c, d, s, y);

   a = 1; b = 0; c = 0; d = 0; s = 1; #10;
   $display("a = %b, b = %b, c = %b, d = %b, s = %b, y = %b", a, b, c, d, s, y);

   a = 0; b = 1; c = 0; d = 0; s = 2; #10;
   $display("a = %b, b = %b, c = %b, d = %b, s = %b, y = %b", a, b, c, d, s, y);

   a = 0; b = 0; c = 1; d = 0; s = 3; #10;
   $display("a = %b, b = %b, c = %b, d = %b, s = %b, y = %b", a, b, c, d, s, y);

   a = 0; b = 0; c = 0; d = 1; s = 0; #10;
   $display("a = %b, b = %b, c = %b, d = %b, s = %b, y = %b", a, b, c, d, s, y);

   $finish;
end

endmodule