// NAME: Syed Ali Faraz Jaffery //
//////////////////////////////////

// Design: 1 x 8 Demultiplexer //
/////////////////////////////////


`timescale 1ns / 1ps

module One_to_Eight_Demux(
    input wire x,
    input wire [2:0] s,
    output reg a, b, c, d, e, f, g, h
);

parameter A = 3'b000;
parameter B = 3'b001;
parameter C = 3'b010;
parameter D = 3'b011;
parameter E = 3'b100;
parameter F = 3'b101;
parameter G = 3'b110;
parameter H = 3'b111;

always @* begin
    case (s)
        A: begin
            a = x;
            b = 1'b0;
            c = 1'b0;
            d = 1'b0;
            e = 1'b0;
            f = 1'b0;
            g = 1'b0;
            h = 1'b0;
        end
        B: begin
            a = 1'b0;
            b = x;
            c = 1'b0;
            d = 1'b0;
            e = 1'b0;
            f = 1'b0;
            g = 1'b0;
            h = 1'b0;
        end
        C: begin
            a = 1'b0;
            b = 1'b0;
            c = x;
            d = 1'b0;
            e = 1'b0;
            f = 1'b0;
            g = 1'b0;
            h = 1'b0;
        end
        D: begin
            a = 1'b0;
            b = 1'b0;
            c = 1'b0;
            d = x;
            e = 1'b0;
            f = 1'b0;
            g = 1'b0;
            h = 1'b0;
        end
        E: begin
            a = 1'b0;
            b = 1'b0;
            c = 1'b0;
            d = 1'b0;
            e = x;
            f = 1'b0;
            g = 1'b0;
            h = 1'b0;
        end
        F: begin
            a = 1'b0;
            b = 1'b0;
            c = 1'b0;
            d = 1'b0;
            e = 1'b0;
            f = x;
            g = 1'b0;
            h = 1'b0;
        end
        G: begin
            a = 1'b0;
            b = 1'b0;
            c = 1'b0;
            d = 1'b0;
            e = 1'b0;
            f = 1'b0;
            g = x;
            h = 1'b0;
        end
        H: begin
            a = 1'b0;
            b = 1'b0;
            c = 1'b0;
            d = 1'b0;
            e = 1'b0;
            f = 1'b0;
            g = 1'b0;
            h = x;
        end
    endcase
end

endmodule