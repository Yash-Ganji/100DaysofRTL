`timescale 1ns / 1ps
module lfsr(clk, reset_n, out);
    input clk, reset_n;
    output reg [3:0] out;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(reset_n==0)
            out <= 1;
        else
            out <= {out[2:0], out[1]^out[3]};
    end
    
endmodule
