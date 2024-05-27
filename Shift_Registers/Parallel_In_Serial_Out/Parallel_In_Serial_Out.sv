// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: Parameterized Parallel In Serial Out Shift Register //
/////////////////////////////////////////////////////////////////

`timescale 1ps / 1ps
module piso #(parameter DATA_WIDTH = 8)
(
    input wire clk,
    input wire reset,
    input wire [DATA_WIDTH-1:0] parallel_in,
    input wire load,
    output reg serial_out
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
      if (!load) begin
        serial_out <= shift_reg[0];
       shift_reg <= {1'b0, shift_reg[DATA_WIDTH-1:1]};
    end
    end
endmodule