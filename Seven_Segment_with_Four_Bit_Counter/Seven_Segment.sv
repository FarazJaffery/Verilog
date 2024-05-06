// NAME: Syed Ali Faraz Jaffery // 
/////////////////////////////////

// Design: 8 Bit Counter //
///////////////////////////


`timescale 1ns / 1ps

module Seven_Segment_with_Four_Bit_Counter(
    output reg [6:0] a_to_g,
    output reg [7:0] Anode_Activate,
    output wire dp,
    input clck,
    input reset
);

assign dp = 1;

reg [19:0] refresh_counter;
wire [1:0] LED_activating_counter;
reg [3:0] LED_BCD;
reg [5:0] count = 0;
wire slw_clk;

// counter
Slow_clock U(.clk(clck), .slow_clk(slw_clk));

always @(posedge reset or posedge slw_clk) begin
    if (reset == 1)
        count <= 0;
    else begin
        count <= count + 1;
        // if(count==6'b110010)// counting till 50
        if (count == 50) // Changed '50' to a decimal value for better readability
            count <= 0;
    end
end

always @(posedge clck or posedge reset) begin
    if (reset == 1)
        refresh_counter <= 0;
    else
        refresh_counter <= refresh_counter + 1;
end

assign LED_activating_counter = refresh_counter[19:18];

always @(*) begin
    if (reset == 1) begin
        Anode_Activate = 8'b11111110;
        LED_BCD = 0;
    end
    else begin
        case (LED_activating_counter)
            2'b00: begin
                if (count > 999)
                    // Anode_Activate = 8'b11110111;
                    Anode_Activate = 8'b11111111;
                LED_BCD = count / 1000;
            end
            2'b01: begin
                if (count > 99)
                    // Anode_Activate = 8'b11111011;
                    Anode_Activate = 8'b11111111;
                LED_BCD = (count % 1000) / 100;
            end
            2'b10: begin
                if (count > 9)
                    Anode_Activate = 8'b11111101;
                LED_BCD = ((count % 1000) % 100) / 10;
            end
            2'b11: begin
                Anode_Activate = 8'b11111110;
                LED_BCD = ((count % 1000) % 100) % 10;
            end
        endcase
    end
end

always @(*) begin
    case (LED_BCD)
        0: a_to_g = 7'b0000001;
        1: a_to_g = 7'b1001111;
        2: a_to_g = 7'b0010010;
        3: a_to_g = 7'b0000110;
        4: a_to_g = 7'b1001100;
        5: a_to_g = 7'b0100100;
        6: a_to_g = 7'b0100000;
        7: a_to_g = 7'b0001111;
        8: a_to_g = 7'b0000000;
        9: a_to_g = 7'b0000100;
        default: a_to_g = 7'b0000000;
    endcase
end

endmodule

module Slow_clock(clk, slow_clk);
    input clk;
    output reg slow_clk;
    integer i = 0;

    always @(posedge clk) begin
        if (i == 45000000) begin
            slow_clk = ~slow_clk;
            i = 0;
        end
        else
            i = i + 1;
    end
endmodule