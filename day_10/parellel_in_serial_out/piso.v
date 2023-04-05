`timescale 1ns / 1ps
module piso(p_in, load, clk, reset_n, s_out);
    input [3:0] p_in;       //4 bit parellel input
    input load;           //load=1 parellel input is loaded in the register.
    input clk, reset_n;   
    output s_out;         //1 bit serial output
    
    reg [3:0] mem;
    
    always @ (posedge clk, negedge reset_n)
    begin
        if(reset_n == 0)
            mem <= 4'd0;
        else if(load)
            mem <= p_in;
        else
            mem <= {mem[2:0], 1'bx};
    end
    
    assign s_out = mem[3];
endmodule
