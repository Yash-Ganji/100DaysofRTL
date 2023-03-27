`timescale 1ns / 1ps
module T_FF_TB();
    reg t, clk, reset_n;
    wire q;
    
    T_FF UUT (.t(t), .clk(clk), .reset_n(reset_n), .q(q));
    initial
    begin
        reset_n = 1'b0;
        clk = 1'b0;
        t = 1'b1;
    end
    
    always #5 clk = ~clk;
    
    initial
    begin
        #10   reset_n = 1'b1;
        #50 t = 1'b0;
        #38 reset_n = 1'b0;
        #2 reset_n  = 1'b1;
        #5 t = 1'b1;
        #30 $finish; 
    end
endmodule
