`timescale 1ns / 1ps
module mux2x1_TB();
    reg A, B;
    reg sel;
    wire out;
    
    mux2x1 UUT (.A(A), .B(B), .sel(sel), .out(out));
    initial
    begin
        A = 0;
        B = 1;
        sel = 0;
        #10
        sel = 1;
        #10
        A = 1;
        B = 1;
        sel = 0;
        #10
        sel = 1;
        #10 
        $finish;
    end
endmodule
