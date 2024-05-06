// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for D Flip Flop //
///////////////////////////////


`timescale 1ns / 1ps

module D_FlipFlop_Testbench;
    reg D, clk, en, reset;
    wire Q;

  
    D_FlipFlop dut (
        .D(D),
        .clk(clk),
        .en(en),
        .reset(reset),
        .Q(Q)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

 
    initial begin
        
        reset = 1;
        en = 0;
        D = 1'bx; 
        #10 reset = 0;

       
        en = 1;
        D = 1'b0;
        #10 D = 1'b1;
        #10 D = 1'b0;
        #10 en = 0; 
        #10 D = 1'b1;
        #10 en = 1;
        #10 reset = 1;
        #10 $finish;
    end

    
    initial begin
        $monitor("Time: %0t, D=%b, en=%b, reset=%b, Q=%b", $time, D, en, reset, Q);
    end
endmodule