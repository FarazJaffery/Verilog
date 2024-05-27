// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for Fully Parameterized Asynchronous Active Low Reset Last In First Out (LIFO) / Stack //
//////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

`timescale 1ns/1ps

module LIFO_Testbench;
  
 	parameter Input_Data_Width = 8; // set any data width here
	parameter LIFO_Depth = 13; // set any LIFO depth here e.g 9 10 12, 14, 32, 100, 200
  
    reg clk;
    reg reset;
    reg Write;
    reg Read;
    reg [7:0] Data_in;
    wire LIFO_Full;
    wire LIFO_Empty;
    wire [7:0] Data_out;


    LIFO  #(.Input_Data_Width(Input_Data_Width), .LIFO_Depth(LIFO_Depth)) 
            dut(
        .Read(Read),
        .Write(Write),
        .reset(reset),
        .clk(clk),
        .Data_in(Data_in),
        .LIFO_Full(LIFO_Full),
        .LIFO_Empty(LIFO_Empty),
        .Data_out(Data_out)
    );


    always begin
        #5 clk = ~clk;
    end

  
    initial begin
        
        clk = 0;
        reset = 0;
        Write = 0;
        Read = 0;
        Data_in = 0; #5

       reset = 1; #5
      
      Write = 1; Data_in = 10; #25 
      Write = 0; #5
      
      Write = 1; Data_in = 20; #5 
      Write = 0; #7; 

      reset = 0; #7 // Asynchronous active low reset 
      reset = 1; #5
      
      Write = 1; Data_in = 110; #5 
      Write = 0; #5
      
      Write = 1; Data_in = 22; #5 
      Write = 0; #5;
      
      Write = 1; Data_in = 80; #5 
      Write = 0; #5
      
      Write = 1; Data_in = 60; #5 
      Write = 0; #5;
      
      Write = 1; Data_in = 94; #5 
      Write = 0; #5
      
      Write = 1; Data_in = 123; #5 
      Write = 0; #5;
      
      // Intensely trying to write the extra data even if the LIFO is full
      Write = 1; Data_in = 45; #5 
      Write = 0; #5;
      
      Write = 1; Data_in = 12; #5 
      Write = 0; #5
      
      Write = 1; Data_in = 33; #25 // write remain high for multiple clock but count should not increase
      Write = 0; #5;
      
      Write = 1; Data_in = 210; #5 
      Write = 0; #5
      
      Write = 1; Data_in = 6; #5 
      Write = 0; #5;      
      
      Write = 1; Data_in = 35; #5 
      Write = 0; #5;
      
      Write = 1; Data_in = 20; #5 
      Write = 0; #5
      
      Write = 1; Data_in = 77; #5 
      Write = 0; #5;   

      Write = 1; Data_in = 78; #5 
      Write = 0; #5; 

      Write = 1; Data_in = 79; #5 
      Write = 0; #5; 

      Write = 1; Data_in = 80; #5 
      Write = 0; #5; 

      Write = 1; Data_in = 75; #5 
      Write = 0; #5; 
      
      Read = 1; #5 
      Read = 0; #5
      
      Read = 1; #5 
      Read = 0; #5

      
      Read = 1; #5 
      Read = 0; #5
      
      Read = 1; #5 
      Read = 0; #5
      
      Read = 1; #35 // read remain high for multiple clock but count should not decrease
      Read = 0; #5
      
      Read = 1; #5 
      Read = 0; #5
      
      Read = 1; #5 
      Read = 0; #5
      
      Read = 1; #5 
      Read = 0; #5
      
      // Intensely trying to read the data when the LIFO is empty
      
      Read = 1; #5 
      Read = 0; #5
      
      Read = 1; #5 
      Read = 0; #5
      
      Read = 1; #5 
      Read = 0; #5
      
      Read = 1; #5 
      Read = 0; #5

      Read = 1; #5 
      Read = 0; #5
      
      Read = 1; #5 
      Read = 0; #5
      
      Read = 1; #5 
      Read = 0; #5
      
      Read = 1; #5 
      Read = 0; #5

      Read = 1; #5 
      Read = 0; #5
      
      Read = 1; #5 
      Read = 0; #5
      
      Read = 1; #5 
      Read = 0; #5
      
      // Randomly Writing and Reading the data
      
     //  First 4 Writes
          
      Write = 1; Data_in = 6; #5 
      Write = 0; #5;      
      
      Write = 1; Data_in = 7; #5 
      Write = 0; #5;
      
      Write = 1; Data_in = 22; #5 
      Write = 0; #5
      
      Write = 1; Data_in = 2; #5 
      Write = 0; #5
   
      // Now 2 Reads
      
      Read = 1; #5 
      Read = 0; #5
      
      Read = 1; #5 
      Read = 0; #5
      
     //  Now again 2 Writes
          
      Write = 1; Data_in = 44; #5 
      Write = 0; #5;  
      
      Write = 1; Data_in = 60; #5 
      Write = 0; #5;  
 
     // Now 1 Reads
      
      Read = 1; #5 
      Read = 0; #5
 
      #50 $finish;
    end
     initial begin
       $dumpfile("LIFO_Testbench.vcd");
       $dumpvars(0, LIFO_Testbench);
 end

endmodule
