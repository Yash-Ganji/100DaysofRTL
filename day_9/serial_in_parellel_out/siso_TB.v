`timescale 1ns / 1ps
module sipo_TB();
    reg s_in;
    reg clk, reset_n;
    wire [3:0] p_out;
    
    sipo UUT (.s_in(s_in),  .clk(clk), .reset_n(reset_n), .p_out(p_out));
    initial
    begin
        clk = 0;
        s_in = 0;
        reset_n =0;
        #10 reset_n = 1;
        #150 $finish;
    end
    
    always #5 clk = ~clk;
    always #10 s_in = $random%2;
endmodule.

+



+
