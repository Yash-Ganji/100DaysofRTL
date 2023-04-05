`timescale 1ns / 1ps
module univ_SR_TB();
    reg clk, reset_n;
    reg [1:0] op;
    reg s_in;
    reg [3:0] p_in;
    wire [3:0] out;
    
    univ_SR UUT (.clk(clk), .reset_n(reset_n), .s_in(s_in), .p_in(p_in), .op(op), .out(out));
    
    initial
    begin
        clk = 0;
        reset_n = 0;
        op = 0;
        p_in = 0;
        s_in = 0;
        #10 reset_n = 1;
        #250 $finish;
    end
    
    always #5 clk =~clk;
  always #(5'd10 + $random%(21-10)) {op, s_in, p_in} = $random;   //using $random increases the speed of verifying and incresaes the error catching probability.
endmodule
