// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for Serial In Serial Out Shift Register //
//////////////////////////////////////////////////////

`timescale 1ns / 1ps

module siso_testbench;

    parameter DATA_WIDTH = 32;

    reg clk;
    reg reset;
    reg serial_in;
    wire serial_out;

    siso #(.DATA_WIDTH(DATA_WIDTH)) dut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    initial begin
        clk = 0;
        reset = 1;
        serial_in = 0;
        #10 reset = 0;
       repeat (DATA_WIDTH) begin
            #10 serial_in = $random;
       end
        #1000 $finish;
    end

    always #5 clk = ~clk;

    initial begin
      $monitor("At time %0t: serial_in = %b serial_out = %b", $time, serial_in, serial_out);
    end
initial begin
 $dumpfile("dump.vcd");
  $dumpvars(0, siso_testbench);
end
endmodule