`timescale 1ns / 1ps
module srl_2_prll_conv(srl_in, clk, reset_n, prll_o, valid_o);
    input srl_in;               //1 bit serial input 
    input clk, reset_n;
    output wire [3:0] prll_o;   //4 bit parellel output
    output wire valid_o;        //is set to 1 when the prll_o value is valid(i.e. when displaying latest 4 bits)
    
    reg [3:0] mem;              //4 bits register bank 
    reg [2:0] count;            //to count 4 clock cycles.
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
            mem <= {mem[2:0], srl_in};
            count <= nxt_count;
        end
    end
    
    assign prll_o = mem;
    assign valid_o = (count==3'd4);
    assign nxt_count = (count==3'd4)? 3'd0 : count+1;
endmodule
