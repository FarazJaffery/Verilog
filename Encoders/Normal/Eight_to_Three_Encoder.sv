// NAME: Syed Ali Faraz Jaffery // 
//////////////////////////////////

// Design: 8 x 3 Encoder //
///////////////////////////


`timescale 1ns / 1ps

module Eight_to_Three_Encoder(
    input wire [7:0] inpt,
    output reg [2:0] outpt
);

always @* begin
    if (inpt == 8'b00000001)
        outpt <= 3'b000;
    else if (inpt == 8'b00000010)
        outpt <= 3'b001;
    else if (inpt == 8'b00000100)
        outpt <= 3'b010;
    else if (inpt == 8'b00001000)
        outpt <= 3'b011;
    else if (inpt == 8'b00010000)
        outpt <= 3'b100;
    else if (inpt == 8'b00100000)
        outpt <= 3'b101;
    else if (inpt == 8'b01000000)
        outpt <= 3'b110;
    else if (inpt == 8'b10000000)
        outpt <= 3'b111;
end

endmodule