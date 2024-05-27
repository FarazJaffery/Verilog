// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: Parameterized Serial In Serial Out Shift Register //
//////////////////////////////////////////////////////////////


`timescale 1ns / 1ps
module siso #(parameter DATA_WIDTH = 8)
(
    input wire clk,
    input wire reset,
    input wire serial_in,
    output reg serial_out
);

    reg [DATA_WIDTH-1:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= {DATA_WIDTH{1'b0}};
        end else begin
            shift_reg <= {shift_reg[DATA_WIDTH-2:0], serial_in};
        end
    end

    always @(posedge clk) begin
        serial_out <= shift_reg[DATA_WIDTH-1];
    end

endmodule