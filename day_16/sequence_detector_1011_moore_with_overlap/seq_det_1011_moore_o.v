`timescale 1ns / 1ps
module seq_det_1011_moore_o(in, clk, reset_n, out);
    input in;
    input clk, reset_n;
    output reg out;
    
    parameter a=3'b000,
              b=3'b001,
              c=3'b010,
              d=3'b011,
              e=3'b100;
              
    reg [2:0] cur_state;
    reg [2:0] nxt_state;
    
    always @(posedge clk, negedge reset_n)
    begin
        if(reset_n==0)
            cur_state <= a;
        else
            cur_state <= nxt_state;
    end
    
    always @(cur_state, in)
    begin
        case(cur_state)
            a : nxt_state = in?b:a;
            b : nxt_state = in?b:c;
            c : nxt_state = in?d:a;
            d : nxt_state = in?e:c;
            e : nxt_state = in?b:c;
            default : nxt_state = a;
        endcase
    end
    
    always @(cur_state, in)
    begin
        if(reset_n==0)
            out<=1'b0;
        else
            out<=(cur_state==e);
    end
endmodule
