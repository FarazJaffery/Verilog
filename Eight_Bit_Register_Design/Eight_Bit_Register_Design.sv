// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

//Design: 8 bit Register //
///////////////////////////


`timescale 1ns / 1ps

module reg_file
#(
    parameter B = 8, W = 2
)
(
    input wire clk,
    input wire wr_en,
    input wire [W-1:0] w_addr,
    input wire [W-1:0] r_addr,
    input wire [B-1:0] w_data,
    output wire [B-1:0] r_data
);

// signal declaration
reg [B-1:0] array_reg [2**W-1:0];

// write operation
always @(posedge clk) begin
    if (wr_en) begin
        array_reg[w_addr] <= w_data;
    end
end

// read operation
assign r_data = array_reg[r_addr];

endmodule


