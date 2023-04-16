`timescale 1ns / 1ps
module seq_det_1011_moore_no_TB();
    reg clk, reset_n;
    reg in;
    wire out;
    
    seq_det_1011_moore_no UUT (.in(in), .clk(clk), .reset_n(reset_n), .out(out));
    
    initial
    begin
        reset_n = 0;
        clk = 0;
        in = 0;
        #10 reset_n = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 1;
        #50 $finish;
    end
    
    always #5 clk = ~clk;
    
endmodule
