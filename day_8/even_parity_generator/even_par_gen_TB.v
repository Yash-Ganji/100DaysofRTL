`timescale 1ns / 1ps
module even_par_gen_TB #(parameter n = 8)();
    reg [n-1:0] sample;
    wire p_bit;
    
    even_par_gen UUT (.sample(sample), .p_bit(p_bit));
    
    always #10 sample = $random;    //random function returns a random 32 bit value every time.
    initial #150 $finish;
endmodule
