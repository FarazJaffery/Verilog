// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: 8 Bit Counter //
///////////////////////////


`timescale 1ns / 1ps

module Eight_bit_counter(
    input wire clk, rst,
    output reg [7:0] count
);

initial begin
    count = 0;
end

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        count <= 0;
    end else if (count == 8'b11111111) begin
        count <= 0;
    end else begin
        count <= count + 1;
    end
end

endmodule