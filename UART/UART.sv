// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: UART //
//////////////////


`timescale 1ns / 1ps

module UART_TX(
    input wire [7:0] din,
    input RST, Clk, Data_Send, Data_Ready,
    output Serial_Out, UBusy
);
    wire WCFlag, WLd_DReg, WLd_TxReg, WShift_TxReg, WBussy;
    wire WRST_Counter, WRST_TxReg, WRST_DReg, WBClk;
    wire Data_In;

    assign Data_In = din;

    BaudClockController B1(.Clk(Clk), .BaudClk(WBClk));
    CU_UART C1(
        .Data_Ready(Data_Ready), .Data_Send(Data_Send), .Clk(WBClk), .CFlag(WCFlag), .Rst(RST),
        .Shift_TxReg(WShift_TxReg), .LD_TxReg(WLd_TxReg), .LD_DReg(WLd_DReg), .UBusy(WBussy),
        .Rst_Counter(WRST_Counter), .Rst_TxReg(WRST_TxReg), .Rst_DReg(WRST_DReg)
    );
    DP_UART D1(
        .RST_Counter(WRST_Counter), .RST_TxReg(WRST_TxReg), .RST_DReg(WRST_DReg),
        .UBusy_In(WBussy), .UBusy_Out(UBusy), .CFlag(WCFlag), .Data_In(Data_In), .LD_TxReg(WLd_TxReg),
        .Shift_TxReg(WShift_TxReg), .LD_DReg(WLd_DReg), .Shift_Out(Serial_Out), .Clk(WBClk)
    );
endmodule

module DP_UART(
    input RST_Counter, RST_TxReg, RST_DReg, UBusy_In,
    output UBusy_Out, CFlag,
    input [7:0] Data_In,
    input LD_TxReg, Shift_TxReg, LD_DReg,
    output Shift_Out,
    input Clk
);
    assign UBusy_Out = UBusy_In;
    wire WParity;
    wire [7:0] WData;

    ParityGenerator P1(.POut(WParity), .PEnable(LD_TxReg), .Pin(WData));
    Counter C1(.CFlag(CFlag), .Enable(Shift_TxReg), .Clk(Clk), .Rst(RST_Counter));
    Data_Reg D1(.Data_In(Data_In), .Ld_DReg(LD_DReg), .Data_Out(WData), .Rst(RST_DReg));
    TX_Reg T1(
        .Serial_Out(Shift_Out), .LD_TXReg(LD_TxReg), .Shift_TXReg(Shift_TxReg), .Data_In(WData),
        .Clk(Clk), .RST(RST_TxReg), .Pin(WParity)
    );
endmodule

module TX_Reg(
    output Serial_Out,
    input LD_TXReg, Shift_TXReg, Clk, RST,
    input [7:0] Data_In,
    input Pin
);
    reg [9:0] SReg;

    assign Serial_Out = SReg[0];

    always @(posedge Clk or posedge RST) begin
        if (RST == 1) begin // Changed 'if(RST==1)//////Make all Bits 1 at Reset' to 'if (RST == 1) begin'
            SReg <= 10'd1023;
        end
        else if (LD_TXReg == 1) begin // Added 'begin' and 'end' for better readability
            SReg <= {Pin, Data_In, 1'b0};
        end
        else if (Shift_TXReg == 1) begin // Added 'begin' and 'end' for better readability
            SReg <= SReg >> 1;
            SReg[9] <= 1'b1;
        end
        else begin // Added 'else' block for better readability
            SReg <= SReg;
        end
    end
endmodule

module ParityGenerator(output POut, input PEnable, input [7:0] Pin);
    assign POut = PEnable ? (Pin[0] ^ Pin[1] ^ Pin[2] ^ Pin[3] ^ Pin[4] ^ Pin[5] ^ Pin[6] ^ Pin[7]) : 1'b0;
endmodule

module Data_Reg(input [7:0] Data_In, input Ld_DReg, output [7:0] Data_Out, input Rst);
    reg [7:0] DReg;

    assign Data_Out = DReg;

    always @(Data_In or Ld_DReg or Rst) begin
        if (Rst == 1)
            DReg <= 8'b0000_0000;
        else if (Ld_DReg == 1)
            DReg <= Data_In;
        else
            DReg <= DReg;
    end
endmodule

module Counter(output reg CFlag, input Enable, input Clk, input Rst);
    reg [3:0] Count_Reg;

    always @(posedge Clk or posedge Rst) begin
        if (Rst == 1) begin
            Count_Reg <= 0;
            CFlag <= 1'b0;
        end
        else if (Enable == 1) begin // Changed 'if(Enable==1) //if Enable is one' to 'else if (Enable == 1) begin'
            if (Count_Reg == 4'd9) begin // Changed 'if(Count_Reg==4'd9) //if Counter Completes Cycle of 10 Counts' to 'if (Count_Reg == 4'd9) begin'
                Count_Reg <= 4'd0;
                CFlag <= 1'b1;
            end
            else begin // Added 'else' block for better readability
                CFlag <= 1'b0;
                Count_Reg <= Count_Reg + 1;
            end
        end
        else begin // Added 'else' block for better readability
            Count_Reg <= 0;
            CFlag <= 1'b0;
        end
    end
endmodule

module CU_UART(
    input Data_Ready, Data_Send, Clk, CFlag, Rst,
    output reg Shift_TxReg, LD_TxReg, LD_DReg, UBusy,
    output reg Rst_Counter, Rst_TxReg, Rst_DReg
);
    reg [2:0] State_Reg;
    parameter S_Rst = 3'b000, S_Waiting = 3'b001, S_DataLd = 3'b010, S_PreTx = 3'b011, S_Tx = 3'b100, S_PostTx = 3'b101;

    always @(posedge Clk or negedge Rst) begin
        if (Rst == 0)
            State_Reg <= S_Rst;
        else
            case (State_Reg)
                S_Rst:
                    State_Reg <= S_Waiting; // Reset State
                S_Waiting: // Wait State
                    if (Data_Ready == 1)
                        State_Reg <= S_DataLd;
                    else if (Data_Send == 1)
                        State_Reg <= S_PreTx;
                    else
                        State_Reg <= S_Waiting;
                S_DataLd: // Data Loading State
                    State_Reg <= S_Waiting;
                S_PreTx: // Pre Transmit State
                    State_Reg <= S_Tx;
                S_Tx: // Transmit State
                    if (CFlag == 1)
                        State_Reg <= S_PostTx;
                    else
                        State_Reg <= S_Tx;
                S_PostTx: // Post Transmit State
                    State_Reg <= S_Waiting;
                default:
                    State_Reg <= S_Rst;
            endcase
    end

    always @(State_Reg) begin
        case (State_Reg)
            S_Rst: begin
                Rst_Counter <= 1'b1;
                Rst_TxReg <= 1'b1;
                Rst_DReg <= 1'b1;
            end
            S_Waiting: begin
                Rst_Counter <= 1'b0;
                Rst_TxReg <= 1'b0;
                Rst_DReg <= 1'b0;
                LD_DReg <= 1'b0;
            end
            S_DataLd: begin
                LD_DReg <= 1'b1;
            end
            S_PreTx: begin
                UBusy <= 1'b1;
                LD_TxReg <= 1'b1;
            end
            S_Tx: begin
                LD_TxReg <= 1'b0;
                Shift_TxReg <= 1'b1;
            end
            S_PostTx: begin
                Shift_TxReg <= 1'b0;
                UBusy <= 1'b0;
                Rst_Counter <= 1'b1;
                Rst_TxReg <= 1'b1;
            end
        endcase
    end
endmodule