`timescale 1ns / 1ps
// reset_n is active low and asynchronous to clk.
module T_FF(t, reset_n, clk, q);
    input t, clk;
    input reset_n;  // _n signifies that the signal is active low.
    output reg q;
    
    always @(posedge clk, negedge reset_n)
    begin
      if(reset_n == 0)    //reset_n = 0 reset ff to 0.
            q <= 1'b0;
      else if(t == 1'b1)    //t = 1 toggle state.
            q <= ~q;
        else 
            q <= q;         //t = 0 hold state.
    end
endmodule
