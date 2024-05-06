// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Testbench for UART //
////////////////////////


module UART_TX_Testbench();
    reg RST, Clk, Data_Send, Data_Ready;
    reg [7:0] Data_In;
    wire Serial_Out, UBusy;
    wire SReg, DReg, State_Reg, Count_Reg, CFlag;

    assign SReg = uut.D1.T1.SReg;
    assign State_Reg = uut.C1.State_Reg;
    assign DReg = uut.D1.D1.DReg;
    assign Count_Reg = uut.D1.C1.Count_Reg;
    assign CFlag = uut.D1.C1.CFlag;

    UART_TX uut(
        .Data_In(Data_In), .RST(RST), .Clk(Clk), .Data_Send(Data_Send), .Data_Ready(Data_Ready),
        .Serial_Out(Serial_Out), .UBusy(UBusy)
    );

    always begin
        Clk = 0;
        #10;
        Clk = 1;
        #10;
    end

    initial begin
        Data_In = 8'b1101_1011;
        RST = 0;
        #10;
        RST = 1;

        Data_Send = 0;
        Data_Ready = 1;
        #20;
        Data_Send = 1;
        Data_Ready = 0;
    end
endmodule