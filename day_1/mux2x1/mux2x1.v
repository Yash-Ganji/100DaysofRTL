`timescale 1ns / 1ps
module mux2x1(A, B, sel, out);
    input A, B;
    input sel;
    output wire out;
    
    assign out = sel ? B : A;
endmodule
