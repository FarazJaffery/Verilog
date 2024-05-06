// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for 8 bit Register //
//////////////////////////////////

`timescale 1ns / 1ps

module reg_file_tb;

reg clk, wr_en;
reg [1:0] w_addr, r_addr;
reg [7-1:0] w_data;
wire [7-1:0] r_data;

reg_file uut (
    .clk(clk),
    .wr_en(wr_en),
    .w_addr(w_addr),
    .r_addr(r_addr),
    .w_data(w_data),
    .r_data(r_data)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    wr_en = 1;
    w_addr = 0;
    w_data = 100;
    #20
    w_addr = 1;
    w_data = 101;
    #20 w_addr = 2;
    w_data = 110;
    #20
    w_addr = 3;
    w_data = 120;
    wr_en = 0;
    #20
    r_addr = 2;
    #20
    r_addr = 1;
end

endmodule