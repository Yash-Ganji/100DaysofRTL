`timescale 1ns / 1ps
module halfadder(a, b, sum, cr);
    input a, b;     
    output sum, cr; 
    
    assign sum = a^b;
    assign cr = a&b;
        
endmodule
