`timescale 1ns / 1ps
module grey_to_binary_conv 
       #(parameter n=3)       //n is bit length of grey or binary number.
       (grey, bin);
       
    input [n-1:0] grey;
    output wire [n-1:0] bin;
    
    assign bin[n-1] = grey[n-1];
    genvar i;                //genvar variables hold 32 bit positive integer value. can be used in synthesizable for loops.
    for(i=n-2; i>=0; i=i-1)
    begin
        assign bin[i] = bin[i+1]^grey[i];
    end
endmodule
