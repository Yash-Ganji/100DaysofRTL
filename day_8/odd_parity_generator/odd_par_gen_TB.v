`timescale 1ns / 1ps
module odd_par_gen_TB #(parameter n=8)();
    reg [n-1:0] sample;
    wire p_bit;
    
    odd_par_gen UUT (.sample(sample), .p_bit(p_bit));
    
    always #10 sample = $random;
    initial #150 $finish;
    
endmodule
