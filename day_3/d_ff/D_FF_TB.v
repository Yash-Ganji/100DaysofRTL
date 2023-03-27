`timescale 1ns / 1ps
module D_FF_TB();
    reg d, clk, reset_n;
    wire q;
    
    D_FF UUT (.d(d), .clk(clk), .reset_n(reset_n), .q(q));
    
    initial
    begin
        reset_n = 1'b0;
        d = 1'b1;
        clk = 1'b0;
    end
    
    always #5 clk = ~clk;
    
    initial
    begin
        #10 reset_n = 1'b1;
        #10 d = 1'b1;
        #2 reset_n = 1'b0;
           d = 1'b0;
        #3 d = 1'b1;
           reset_n = 1'b1;
        #8 reset_n = 1'b0;
        #1 reset_n = 1'b1;
        
        #20 $finish;
    end
endmodule
