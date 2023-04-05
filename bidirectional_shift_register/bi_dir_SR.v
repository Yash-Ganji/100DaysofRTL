`timescale 1ns / 1ps
module bi_dir_SR(clk, dir, reset_n, in, out);
    input clk, reset_n;
    input dir;      //dir=1 right shift | dir=0 left shift.
    input in;       //input bit.
    output reg [3:0] out;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(reset_n==0)
            out <= 0;
        else if(dir==0)
            out <= {out[2:0], in};
        else 
            out <= {in, out[3:1]};            
    end    
endmodule
