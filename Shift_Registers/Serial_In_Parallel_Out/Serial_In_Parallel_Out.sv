// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: Parameterized Serial In Parallel Out Shift Register //
/////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module sipo #(parameter DATA_WIDTH = 8)
(
    input wire clk,
    input wire reset,
    input wire serial_in,
    output reg [DATA_WIDTH-1:0] parallel_out
);

reg [DATA_WIDTH-1:0] shift_reg;

always @(posedge clk or posedge reset) 
begin
        if (reset) begin
            shift_reg <= {DATA_WIDTH{1'b0}};
        end else begin
            shift_reg <= {shift_reg[DATA_WIDTH-2:0], serial_in};
        end
end

always @(posedge clk) 
begin
        parallel_out <= shift_reg;
end

endmodule