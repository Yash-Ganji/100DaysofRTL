`timescale 1ns / 1ps
module halfadder_TB();
    reg a, b;
    wire sum, cr;
    
    halfadder UUT (.a(a), .b(b), .sum(sum), .cr(cr));
    
    initial
    begin
            a = 1'b0;
            b = 1'b0;
        #10 a = 1'b0;
            b = 1'b1;
        #10 a = 1'b0;
            b = 1'b1;
        #10 a = 1'b1;
            b = 1'b1;
        #10 $finish;
    end
endmodule
