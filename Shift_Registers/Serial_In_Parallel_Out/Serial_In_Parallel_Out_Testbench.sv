// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for Serial In Parallel Out Shift Register //
/////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module sipo_testbench;

    parameter DATA_WIDTH = 16;

    reg clk;
    reg reset;
    reg serial_in;
    wire [DATA_WIDTH-1:0] parallel_out;

    sipo #(.DATA_WIDTH(DATA_WIDTH)) dut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    initial begin
        clk = 0;
        reset = 1;
        serial_in = 0;
        #10 reset = 0;
        repeat (DATA_WIDTH) begin
            #10 serial_in = $random;
        end
        #10 $finish;
    end

    always #5 clk = ~clk;

    initial begin
        $monitor("At time %0t: parallel_out = %b", $time, parallel_out);
    end

endmodule