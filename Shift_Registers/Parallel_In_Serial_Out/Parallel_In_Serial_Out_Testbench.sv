// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for Parallel In Serial Out Shift Register //
/////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module piso_testbench;

    parameter DATA_WIDTH = 16;

    reg clk;
    reg reset;
    reg [DATA_WIDTH-1:0] parallel_in;
    reg load;
    wire serial_out;

    piso #(.DATA_WIDTH(DATA_WIDTH)) dut (
        .clk(clk),
        .reset(reset),
        .parallel_in(parallel_in),
        .load(load),
        .serial_out(serial_out)
    );

    initial begin
        clk = 0;
        reset = 1;
        parallel_in = 0;
        load = 0;
        #10 reset = 0;
        #10 load = 1;
        parallel_in = $random;
//        parallel_in = 0110011000110101;
        #10 load = 0;
      #1000 $finish;
    end

    always #5 clk = ~clk;

    initial begin
      $monitor("At time %0t:	parallel_in = %b, load = %b,  serial_out = %b", $time, 				parallel_in, load, serial_out);
    end
 initial begin
 $dumpfile("dump.vcd");
 $dumpvars(0, piso_testbench);
 end
endmodule