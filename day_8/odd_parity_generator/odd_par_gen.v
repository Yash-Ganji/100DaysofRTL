`timescale 1ns / 1ps
// This odd parity generator is parameterised (n) and can have variable bit length as required by application.
// condition n>=2.
module odd_par_gen #(parameter n=8) (sample, p_bit);
    input [n-1:0] sample;
    output p_bit;
    wire [n-2:0] wr;
    
    assign wr[0] = sample[0] ^ sample[1];
    
    genvar i;
    for(i=2; i<n; i=i+1)
    begin
        assign wr[i-1] = wr[i-2] ^ sample[i];
    end
    
    assign p_bit = ~(wr[n-2]);
endmodule
