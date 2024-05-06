// NAME: Syed Ali Faraz Jaffery // 
//////////////////////////////////

// Design: 3 x 8 Demultiplexer //
/////////////////////////////////

`timescale 1ns / 1ps

module Three_to_Eight_Demux(
    input wire [2:0] inp,
    output wire [7:0] x
);

assign x = (inp == 3'b000) ? 8'b00000001 :
           (inp == 3'b001) ? 8'b00000010 :
           (inp == 3'b010) ? 8'b00000100 :
           (inp == 3'b011) ? 8'b00001000 :
           (inp == 3'b100) ? 8'b00010000 :
           (inp == 3'b101) ? 8'b00100000 :
           (inp == 3'b110) ? 8'b01000000 :
           (inp == 3'b111) ? 8'b10000000 : 8'b00000000;

endmodule