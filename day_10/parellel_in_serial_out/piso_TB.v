`timescale 1ns / 1ps
module piso_TB();
    reg clk, reset_n;
    reg [3:0] p_in;
    reg load;
    wire s_out;
    
    piso UUT (.p_in(p_in), .load(load), .clk(clk), .reset_n(reset_n), .s_out(s_out));
    initial
    begin
        clk = 0;
        reset_n = 0;
        load = 0;
        p_in = 0;
        #10 reset_n = 1;
        load = 1;        
        #250 $finish;
    end
    
    always #5 clk = ~clk;
    always #20 {load, p_in} = $random%31;
    
endmodule
