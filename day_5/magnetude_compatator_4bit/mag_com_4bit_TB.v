`timescale 1ns / 1ps
module mag_comp_4bit_TB();
    reg [3:0] a, b;
    wire agb, aeb, bga;
  
    mag_comp_4bit UUT (.a(a), .b(b), .agb(agb), .aeb(aeb), .bga(bga));
  
    initial
    begin
        a = 0;
        b = 0;
        #300 $finish;
    end
  always #10 {a,b} = $random;     //random(seed) function returns a 32 bit random number "seed" is optional.
endmodule
