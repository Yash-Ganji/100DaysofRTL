`timescale 1ns / 1ps
//D flipflop has asyncronous active low reset.
module D_FF(d, reset_n, clk, q);
    input d, clk;
    input reset_n;  // reset_n is a active low input signal _n signifies active low signal.
    output reg q;
    
    always @(posedge clk, negedge reset_n)    // if reset_n is not mentioned in the events list in always the resulting ff will be Synchronous to clk.
    begin
        if(reset_n == 1'b0)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule
