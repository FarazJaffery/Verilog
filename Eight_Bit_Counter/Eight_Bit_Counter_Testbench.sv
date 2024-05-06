// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for 8 Bit Counter //
//////////////////////////////////

`timescale 1ns / 1ps

module Eight_bit_counter_Testbench;

reg clk, rst;
wire [7:0] count;

Eight_bit_counter dut (
    .clk(clk),
    .rst(rst),
    .count(count)
);

initial begin
    clk = 0;
    rst = 0;
    #10 rst = 1;
end

always #5 clk = ~clk;

initial begin
    #200 $finish;
end

initial begin
    $monitor("Time: %0t, clk = %b, rst = %b, count = %d", $time, clk, rst, count);
end

endmodule 