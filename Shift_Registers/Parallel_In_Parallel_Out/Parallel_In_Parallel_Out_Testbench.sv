// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for Parallel In Parallel Out Shift Register //
/////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module pipo_testbench;

    parameter DATA_WIDTH = 16;

    reg clk;
    reg reset;
    reg [DATA_WIDTH-1:0] parallel_in;
    reg load;
    wire [DATA_WIDTH-1:0] parallel_out;

    pipo #(.DATA_WIDTH(DATA_WIDTH)) dut (
        .clk(clk),
        .reset(reset),
        .parallel_in(parallel_in),
        .load(load),
        .parallel_out(parallel_out)
    );

    initial begin
        clk = 0;
        reset = 1;
        parallel_in = 0;
        load = 0;
        #10 reset = 0;
     
        repeat (DATA_WIDTH) begin
          #10 load = $random;
            parallel_in = $random;
            #200 ;           
        end
        #10 $finish;
    end

    always #5 clk = ~clk;

    initial begin
      $monitor("At time %0t:	parallel_in = %b, load = %b,  parallel_out = %b", $time, parallel_in, load, parallel_out);    
end

endmodule