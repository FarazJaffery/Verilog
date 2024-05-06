// NAME: Syed Ali Faraz Jaffery// 
/////////////////////////////////

// Testbench for 3 x 8 Demultiplexer //
///////////////////////////////////////

`timescale 1ns / 1ps

module Three_to_Eight_Demux_Testbench;

reg [2:0] inp;
wire [7:0] x;

Three_to_Eight_Demux dut (
    .inp(inp),
    .x(x)
);

initial begin
    inp = 3'b000; #10;
    $display("inp = %b, x = %b", inp, x);

    inp = 3'b001; #10;
    $display("inp = %b, x = %b", inp, x);

    inp = 3'b010; #10;
    $display("inp = %b, x = %b", inp, x);

    inp = 3'b011; #10;
    $display("inp = %b, x = %b", inp, x);

    inp = 3'b100; #10;
    $display("inp = %b, x = %b", inp, x);

    inp = 3'b101; #10;
    $display("inp = %b, x = %b", inp, x);

    inp = 3'b110; #10;
    $display("inp = %b, x = %b", inp, x);

    inp = 3'b111; #10;
    $display("inp = %b, x = %b", inp, x);

    $finish;
end

endmodule