// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for 8 x 3 Priority Encoder //
//////////////////////////////////////////

`timescale 1ns / 1ps

module Eight_to_Three_Priority_Encoder_Testbench;

reg [7:0] inpt;
wire [2:0] outpt;

Eight_to_Three_Priority_Encoder dut (
    .inpt(inpt),
    .outpt(outpt)
);

initial begin
    inpt = 8'b00000001; #10;
    $display("inpt = %b, outpt = %b", inpt, outpt);

    inpt = 8'b00000010; #10;
    $display("inpt = %b, outpt = %b", inpt, outpt);

    inpt = 8'b00000100; #10;
    $display("inpt = %b, outpt = %b", inpt, outpt);

    inpt = 8'b00001000; #10;
    $display("inpt = %b, outpt = %b", inpt, outpt);

    inpt = 8'b00010000; #10;
    $display("inpt = %b, outpt = %b", inpt, outpt);

    inpt = 8'b00100000; #10;
    $display("inpt = %b, outpt = %b", inpt, outpt);

    inpt = 8'b01000000; #10;
    $display("inpt = %b, outpt = %b", inpt, outpt);

    inpt = 8'b10000000; #10;
    $display("inpt = %b, outpt = %b", inpt, outpt);

    $finish;
end

endmodule