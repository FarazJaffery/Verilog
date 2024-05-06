// NAME: Syed Ali Faraz Jaffery //
//////////////////////////////////

// Testbench for 1 x 8_demultiplexer //
///////////////////////////////////////

`timescale 1ns / 1ps

module One_to_Eight_Demux_Testbench;

reg x;
reg [2:0] s;
wire a, b, c, d, e, f, g, h;

One_to_Eight_Demux dut (
    .x(x),
    .s(s),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f),
    .g(g),
    .h(h)
);

initial begin
    x = 1'b1;
    s = 3'b000; #10;
    $display("x = %b, s = %b, a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b, h = %b", x, s, a, b, c, d, e, f, g, h);

    s = 3'b001; #10;
    $display("x = %b, s = %b, a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b, h = %b", x, s, a, b, c, d, e, f, g, h);

    s = 3'b010; #10;
    $display("x = %b, s = %b, a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b, h = %b", x, s, a, b, c, d, e, f, g, h);

    s = 3'b011; #10;
    $display("x = %b, s = %b, a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b, h = %b", x, s, a, b, c, d, e, f, g, h);

    s = 3'b100; #10;
    $display("x = %b, s = %b, a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b, h = %b", x, s, a, b, c, d, e, f, g, h);

    s = 3'b101; #10;
    $display("x = %b, s = %b, a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b, h = %b", x, s, a, b, c, d, e, f, g, h);

    s = 3'b110; #10;
    $display("x = %b, s = %b, a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b, h = %b", x, s, a, b, c, d, e, f, g, h);

    s = 3'b111; #10;
    $display("x = %b, s = %b, a = %b, b = %b, c = %b, d = %b, e = %b, f = %b, g = %b, h = %b", x, s, a, b, c, d, e, f, g, h);

    $finish;
end

endmodule
            