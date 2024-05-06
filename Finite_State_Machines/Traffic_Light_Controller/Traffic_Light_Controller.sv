// NAME: Syed Ali Faraz Jaffery // 
//////////////////////////////////

// Design: Traffic Light Controller //
//////////////////////////////////////

`timescale 1ns / 1ps

module Traffic_Light_Controller(clk11, out01, out11, out21, out31);
    input clk11;
    output [1:0] out01, out11, out21, out31;

    wire Rwe11, Rww11, Rws11, Rwn11, flag2, slow_clk;

    slow_clk c1(clk11, slow_clk);
    Cu d2(Rwe11, Rww11, Rws11, Rwn11, flag2, slow_clk);
    Dp d3(out01, out11, out21, out31, flag2, Rwe11, Rww11, Rws11, Rwn11, slow_clk);
endmodule

module Dp(out0, out1, out2, out3, flag1, Rwe1, Rww1, Rws1, Rwn1, clk);
    output [1:0] out0, out1, out2, out3;
    output flag1;
    input Rwe1, Rww1, Rws1, Rwn1;
    input clk;

    wire out;
    wire [1:0] in3, in4;

    assign in3 = 2'b01;
    assign in4 = 2'b10;

    counter a(clk, out, flag1);
    mux m1(in3, in4, Rwe1, out0);
    mux m2(in3, in4, Rww1, out1);
    mux m3(in3, in4, Rwn1, out2);
    mux m4(in3, in4, Rws1, out3);
endmodule

module Cu(Rwe, Rww, Rws, Rwn, flag, clk);
    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
    input clk, flag;
    output reg Rwe, Rww, Rws, Rwn;
    reg [1:0] state = 0;

    always @(posedge clk) begin
        if (flag == 1)
            state = state + 1;
        if (state == 0)
            state = s0;
        else if (state == 1)
            state = s1;
        else if (state == 2)
            state = s2;
        else if (state == 3)
            state = s3;
    end

    always @(state, Rwe, Rww, Rws, Rwn) begin
        if (state == s0) begin
            Rwe = 1;
            Rww = 0;
            Rws = 0;
            Rwn = 0;
        end
        else if (state == s1) begin
            Rwe = 0;
            Rww = 1;
            Rws = 0;
            Rwn = 0;
        end
        else if (state == s2) begin
            Rwe = 0;
            Rww = 0;
            Rws = 1;
            Rwn = 0;
        end
        else if (state == s3) begin
            Rwe = 0;
            Rww = 0;
            Rws = 0;
            Rwn = 1;
        end
    end
endmodule

module mux(in1, in2, sel, out);
    input [1:0] in1, in2;
    input sel;
    output reg [1:0] out;

    always @(sel, in1, in2) begin
        if (sel)
            out = in1;
        else
            out = in2;
    end
endmodule

module counter(clk, out, flag);
    input clk;
    output out, flag;
    reg flag;
    reg [2:0] out = 0;

    always @(posedge clk) begin
        if (out == 3'b101) begin
            flag = 1;
            out = 0;
        end
        else begin
            out = out + 1;
            flag = 0;
        end
    end
endmodule

module slow_clk(clk, slow_clk);
    input clk;
    output reg slow_clk;
    integer i;

    always @(posedge clk) begin
        if (i == 50000000) begin
            slow_clk = ~slow_clk;
            i = 0;
        end
        else
            i = i + 1;
    end
endmodule