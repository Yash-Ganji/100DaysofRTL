`timescale 1ns / 1ps
//this is a parameterised even parity generator where n is the number of bits sample data will have.
//Value of n can be changed according to application for which the module is being used.
//CONDITION N >= 2
module even_par_gen #(parameter n = 8)
                     (sample, p_bit);

    input [n-1:0] sample;
    output p_bit;
    wire [n-2:0] wr;      //intermediate wires.
    
    assign wr[0] = sample[0] ^ sample[1];
    
    genvar i;
    for(i=2; i<n; i=i+1)
    begin
       assign wr[i-1] = wr[i-2] ^ sample[i]; 
    end
    
    assign p_bit = wr[n-2];
endmodule
