// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: Parameterized Parallel In Parallel Out Shift Register //
/////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps
module pipo #(parameter DATA_WIDTH = 8)
(
    input wire clk,
    input wire reset,
    input wire [DATA_WIDTH-1:0] parallel_in,
    input wire load,
    output reg [DATA_WIDTH-1:0] parallel_out
);

    reg [DATA_WIDTH-1:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= {DATA_WIDTH{1'b0}};
        end else if (load) begin
            shift_reg <= parallel_in;
        end
    end

    always @(posedge clk) begin
      if (!load)
        parallel_out <= shift_reg;
    end

endmodule