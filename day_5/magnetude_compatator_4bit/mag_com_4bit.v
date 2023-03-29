`timescale 1ns / 1ps
//Compares 2 4 bit binary numbers.
module mag_comp_4bit(a, b, agb, bga, aeb);
    input [3:0] a, b;
    output wire agb;      //a greater than b
    output wire bga;      //b greater than a
    output wire aeb;      //a equal to b
    wire xr0, xr1, xr2, xr3;    //intermediate signals
    
    assign xr0 = ~(a[0]^b[0]);
    assign xr1 = ~(a[1]^b[1]);
    assign xr2 = ~(a[2]^b[2]);
    assign xr3 = ~(a[3]^b[3]);
    
    assign agb = a[3]&(~b[3]) | a[2]&(~b[2])&xr3 | a[1]&(~b[1])&xr3&xr2 | a[0]&(~b[0])&xr3&xr2&xr1;
    assign aeb = xr0 & xr1 & xr2 & xr3;
    assign bga = ~(agb|aeb);
endmodule
