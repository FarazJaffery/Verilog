// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: 32 bit ALU //
////////////////////////


`timescale 1ns / 1ps

module ThirtyTwo_Bit_ALU(
    input [31:0] a, b,
    input cin,
    input [1:0] ctrl,
    output reg cout,
    output reg [31:0] alu_out
);

parameter ADD = 2'b00;
parameter SUB = 2'b01;
parameter OR = 2'b10;
parameter AND = 2'b11;

always @(*) begin
    if (ctrl == ADD) begin
        alu_out = a + b + cin;
        if (a >= (2147483647 * 2) || b >= (2147483647 * 2) || a + b >= (2147483647 * 2))
            cout = 1;
        else
            cout = 0;
    end
    else if (ctrl == SUB) begin
        alu_out = a - b - cin;
        if (a < b)
            cout = 1;
        else
            cout = 0;
    end
    else if (ctrl == OR)
        alu_out = a | b;
    else if (ctrl == AND)
        alu_out = a & b;
end

endmodule
