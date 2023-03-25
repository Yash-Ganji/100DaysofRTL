`timescale 1ns / 1ps
module mux4x1_TB();
    reg A, B, C, D;
    reg [1:0] sel;
    wire out;
    
    mux4x1 UUT (.A(A), .B(B), .C(C), .D(D), .sel(sel), .out(out));
    initial
    begin
        A = 1;
        B = 0;
        C = 1;
        D = 1;
        sel = 0;
        #10 sel = 2'b00;
        #10 sel = 2'b01;
        #10 sel = 2'b10;        
        #10 sel = 2'b11;
        #10 $finish;
    end
endmodule
