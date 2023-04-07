`timescale 1ns / 1ps
module pll_to_srl_conv_TB();
    reg clk, reset_n;
    reg [3:0] prll_in;
    wire empty_o, valid_o;
    wire srl_o;
    
    pll_to_srl_conv UUT (.prll_in(prll_in), .clk(clk), .reset_n(reset_n), .srl_o(srl_o), .empty_o(empty_o), .valid_o(valid_o));
    initial
    begin
        reset_n = 0;
        clk = 0;
        prll_in = 15;
        #10 reset_n = 1;
        #70 reset_n = 0;
        #2 reset_n = 1;
        #250 $finish;
    end
    
    always #5 clk = ~clk;
    always #(20+$random%(35-20)) prll_in = $random;
endmodule
