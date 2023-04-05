`timescale 1ns / 1ps
module pipo_TB();
    reg [3:0] p_in;
    reg clk, reset_n;
    wire [3:0] p_out;
    
    pipo UUT (.p_in(p_in), .clk(clk), .reset_n(reset_n), .p_out(p_out));
    
    initial
    begin
        reset_n = 0;
        clk = 0;
        p_in = 0;
        #10 reset_n = 1;     
        p_in = 4'd6;
        #25 p_in = 4'd9;
        #35 p_in = 4'd8;
        #50 $finish;
    end
    
    always #5 clk = ~clk;
endmodule
