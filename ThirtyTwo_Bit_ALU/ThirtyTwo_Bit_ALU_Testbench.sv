// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for 32 bit ALU //
//////////////////////////////


`timescale 1ns / 1ps

module ThirtyTwo_Bit_ALU_Testbench();

reg [31:0] a, b;
reg cin;
reg [1:0] ctrl;
wire cout;
wire [31:0] alu_out;

ThirtyTwo_Bit_ALU dut (a, b, cin, ctrl, alu_out, cout);

initial begin
    ctrl = 2'b00; a = 2147483647; b = 2147483647; cin = 1'b1;
    #50;
    ctrl = 2'b00; a = 2147483647; b = 2147483630; cin = 1'b1;
    #50;
    ctrl = 2'b01; a = 3; b = 9; cin = 1'b1;
    #50;
    ctrl = 2'b10; a = 2147483647; b = 2147483646;
    #50;
    ctrl = 2'b11; a = 2147483647; b = 2147483646;
    #50;
end

endmodule