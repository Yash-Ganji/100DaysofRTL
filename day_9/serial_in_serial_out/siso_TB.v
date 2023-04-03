`timescale 1ns / 1ps
module siso_TB();
    reg s_in, clk, reset_n;
    wire s_out;
    
    siso UUT (.s_in(s_in), .clk(clk), .reset_n(reset_n), .s_out(s_out));
    initial
    begin
        clk = 0;
        s_in = 0;
        reset_n = 0;
        #5 reset_n = 1;
        #150 $finish;
    end
    always #5 clk = ~clk;
    always #10 s_in = $random % 2;
    
endmodule
