// NAME: Syed Ali Faraz Jaffery // 
//////////////////////////////////

// Testbench for 4 x 1 Multiplexer //
/////////////////////////////////////


`timescale 1ns / 1ps

module Four_to_One_Mux_Testbench;

reg [7:0] a, b, c, d;
reg [1:0] s;
wire [7:0] y;

Four_to_One_Mux dut (
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .s(s),
    .y(y)
);

initial begin
    a = 8'b00000000; b = 8'b00000001; c = 8'b00000010; d = 8'b00000011; s = 2'b00; #10;
    $display("a = %b, b = %b, c = %b, d = %b, s = %b, y = %b", a, b, c, d, s, y);

    a = 8'b00000000; b = 8'b00000001; c = 8'b00000010; d = 8'b00000011; s = 2'b01; #10;
    $display("a = %b, b = %b, c = %b, d = %b, s = %b, y = %b", a, b, c, d, s, y);

    a = 8'b00000000; b = 8'b00000001; c = 8'b00000010; d = 8'b00000011; s = 2'b10; #10;
    $display("a = %b, b = %b, c = %b, d = %b, s = %b, y = %b", a, b, c, d, s, y);

    a = 8'b00000000; b = 8'b00000001; c = 8'b00000010; d = 8'b00000011; s = 2'b11; #10;
    $display("a = %b, b = %b, c = %b, d = %b, s = %b, y = %b", a, b, c, d, s, y);

    $finish;
end

endmodule