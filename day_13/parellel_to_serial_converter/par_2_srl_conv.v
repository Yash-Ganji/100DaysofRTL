`timescale 1ns / 1ps
module pll_to_srl_conv(prll_in, clk, reset_n, srl_o, empty_o, valid_o);
    input clk, reset_n;
    input [3:0] prll_in;         //parellel input
    output wire empty_o;         //set when all 4 bits are output
    output wire valid_o;         //set when the sereal out is valid.
    output wire srl_o;           //serial out
    
    reg [3:0] mem;               //register bank
    reg [2:0] count;
    wire [2:0] nxt_count;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(reset_n==0)
        begin
            mem<=0;
            count<=0;
        end
        else
        begin
              mem <= empty_o ? prll_in : {mem[2:0], 1'b0};
              count<=nxt_count;
        end
    end
    
    assign nxt_count = (count==3'd4)? 1'b0: count+1'b1;
    assign empty_o = (count==3'd0);
    assign valid_o = |count;
    assign srl_o = mem[3];
    
endmodule
