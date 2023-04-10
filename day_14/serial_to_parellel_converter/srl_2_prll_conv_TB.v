`timescale 1ns / 1ps
module srl_2_prll_conv_TB();
    reg srl_in;
    reg clk, reset_n;
    wire [3:0] prll_o;
    wire valid_o;
    
    srl_2_prll_conv UUT (.srl_in(srl_in), .clk(clk), .reset_n(reset_n), .prll_o(prll_o), .valid_o(valid_o));
    
    initial
    begin
        reset_n = 0;
        clk = 0;
        srl_in = 0;
        #10 reset_n = 1;
        #250 $finish;
    end
    always #5 clk = ~clk;
    always #10 srl_in = $random%2;
endmodule
