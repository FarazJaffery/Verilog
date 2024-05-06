// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////


/////////////////////////////////////////////////
//   Testbench for Data path and Controller   //
// for Multiplication Using Repeated Edition //
///////////////////////////////////////////////


`timescale 1ns / 1ps

module data_path_tb();
    // Inputs
    reg ldA, ldB, clrs, ldS, decB, clk;
    reg [7:0] data_in;

    // Outputs
    wire eqz;

    // Instantiate the module under test
    data_path dut(
        .eqz(eqz),
        .ldA(ldA),
        .ldB(ldB),
        .clrs(clrs),
        .ldS(ldS),
        .decB(decB),
        .clk(clk),
        .data_in(data_in)
    );

    // Testbench logic
    initial begin
        clk = 0;
    end

    always #5 clk = ~clk;

    initial begin
        // Test 1: Clear y and load x with data_in
        ldA = 1;
        ldB = 0;
        clrs = 1;
        ldS = 0;
        decB = 0;
        data_in = 8'h81;
        #10;

        // Test 2: Load y with z
        ldA = 0;
        ldB = 0;
        clrs = 0;
        ldS = 1;
        decB = 0;
        data_in = 8'h00;
        #10;

        // Test 3: Decrement b_out
        ldA = 0;
        ldB = 0;
        clrs = 0;
        ldS = 0;
        decB = 1;
        data_in = 8'h90;
        #10;

        // Test 4: Load b_out with data_in
        ldA = 0;
        ldB = 1;
        clrs = 0;
        ldS = 0;
        decB = 0;
        data_in = 8'h65;
        #10;

        // Test 5: Decrement b_out until it becomes zero
        ldA = 0;
        ldB = 0;
        clrs = 0;
        ldS = 0;
        decB = 1;
        data_in = 8'h40;
        repeat (5) #10;

        // Test 6: Load x with data_in and clear y
        ldA = 1;
        ldB = 0;
        clrs = 1;
        ldS = 0;
        decB = 0;
        data_in = 8'h23;
        #10;
    end
endmodule