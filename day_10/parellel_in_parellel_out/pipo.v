`timescale 1ns / 1ps
module pipo(p_in, clk, reset_n, p_out);
    input [3:0] p_in;
    input clk, reset_n;
    output wire [3:0] p_out;
    
    reg [3:0] mem;
    always @(posedge clk, negedge reset_n)
    begin
        if(reset_n == 0)
            mem <= 0;
        else
            mem <= p_in;
    end
    
    assign p_out = mem;
endmodule
