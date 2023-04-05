`timescale 1ns / 1ps
module univ_SR(clk, reset_n, s_in, p_in, op, out);
    input clk, reset_n;
    input s_in;         //1 bit serial input 
    input [3:0] p_in;         //4 bit parellel input
    input [1:0] op;     //operation code.
    output reg [3:0] out;
    
    parameter A = 2'b00;    //Hold operation
    parameter B = 2'b01;    //shift right operation
    parameter C = 2'b10;    //shift left operation
    parameter D = 2'b11;    //parellel load 4 bit input to register.
    
    always @ (posedge clk, negedge reset_n)
    begin
        if(reset_n==0)
            out<=0;
        else
        begin
            case(op)
                A : out<=out;
                B : out<={s_in, out[3:1]};
                C : out<={out[2:0], s_in};
                D : out<=p_in;
            endcase
        end
    end
endmodule
