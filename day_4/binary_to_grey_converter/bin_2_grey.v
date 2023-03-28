`timescale 1ns / 1ps
module bin_2_grey
        #(parameter n=3)      //n is number of bits in binary number.
        (bin, grey);
    input [n-1:0] bin;
    output [n-1:0] grey;
    
    assign grey[n-1] = bin[n-1];
    
    genvar i;
    for(i=0; i<n-1; i=i+1)
    begin
        assign grey[i] = bin[i+1]^bin[i];
    end
endmodule
