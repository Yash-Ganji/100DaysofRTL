`timescale 1ns / 1ps
//This serial in parellel out module takes a single bit input and gives 4 bit parellel output.
module sipo(s_in, clk, reset_n, p_out);
    input s_in;                 //serial input
    input clk, reset_n;
    output wire [3:0] p_out;    //parellel output
    
    reg [3:0] mem;              //register (4 bit).
    
    always @(posedge clk, negedge reset_n)
    begin
        if(reset_n == 0)
            mem<=0;
        else
            mem <= {mem[2:0], s_in};
    end
    assign p_out = mem;
    
endmodule
