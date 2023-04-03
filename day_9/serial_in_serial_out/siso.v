`timescale 1ns / 1ps
//The register will left shift and the new input bit is added to LSB.
module siso(s_in, clk, reset_n, s_out);
    input s_in;          //serial in
    input clk, reset_n;      
    output wire s_out;   //serial out
    
    reg [3:0] mem;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(reset_n == 0)
            mem <= 4'd0;
        else
            mem <= {mem[2:0], s_in};
    end
    assign s_out = mem[3];
endmodule
