// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: 8 x 3 Priority Encoder //
////////////////////////////////////


`timescale 1ns / 1ps

module Eight_to_Three_Priority_Encoder(
    input wire [7:0] inpt,
    output reg [2:0] outpt
);

always @* begin
    if (inpt[7] == 1'b1)
        outpt <= 3'b111;
    else if (inpt[6] == 1'b1)
        outpt <= 3'b110;
    else if (inpt[5] == 1'b1)
        outpt <= 3'b101;
    else if (inpt[4] == 1'b1)
        outpt <= 3'b100;
    else if (inpt[3] == 1'b1)
        outpt <= 3'b011;
    else if (inpt[2] == 1'b1)
        outpt <= 3'b010;
    else if (inpt[1] == 1'b1)
        outpt <= 3'b001;
    else if (inpt[0] == 1'b1)
        outpt <= 3'b000;
end

endmodule