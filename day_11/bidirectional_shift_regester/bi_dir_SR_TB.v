`timescale 1ns / 1ps
module bi_dir_SR_TB();
    reg clk, reset_n, dir, in;
    wire [3:0] out;
    
    bi_dir_SR UUT (.clk(clk), .dir(dir), .reset_n(reset_n), .in(in), .out(out));
    
    initial
    begin
        clk = 0;
        reset_n = 0;
        in = 0;
        dir = 0;
        #10 reset_n=1;
        #200 $finish;
    end
    
    always #5 clk = ~clk;
    always #10 {dir,in} = $random%4;
endmodule
