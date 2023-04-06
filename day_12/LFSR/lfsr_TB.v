`timescale 1ns / 1ps
module lfsr_TB();
    reg clk, reset_n;
    wire [3:0] out;
    
    lfsr UUT (.clk(clk), .reset_n(reset_n), .out(out));
    
    initial
    begin
        clk=0;
        reset_n=0;
        #10 reset_n=1;
        #250 $finish;
    end
    
    always #5 clk=~clk;
endmodule
