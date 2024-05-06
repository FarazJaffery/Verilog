// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for Three Stage Pipeline System  //
////////////////////////////////////////////////



`timescale 1ns / 1ps

module Three_Stage_Pipeline_System_Testbench;
    // Inputs
    reg [5:0] A, B, C, D;
    reg clk;

    // Output
    wire [5:0] out;

    // Instantiate the pipeline module
    Three_Stage_Pipeline_System uut (
        .A(A), .B(B), .C(C), .D(D),
        .clk(clk),
        .out(out)
    );

    // Initialize inputs
    initial begin
        A = 0;
        B = 0;
        C = 0;
        D = 0;
        clk = 0;
    end

    // Generate clock
    always #5 clk = ~clk;

    initial begin
        #10 A = 10; B = 2; C = 3; D = 4;
        #10 A = 10; B = 6; C = 7; D = 8;
        #10 A = 30; B = 10; C = 11; D = 12;
        #10 A = 13; B = 14; C = 15; D = 16;
        #10 A = 17; B = 18; C = 19; D = 20;
        #10 A = 50; B = 22; C = 23; D = 24;
    end
endmodule