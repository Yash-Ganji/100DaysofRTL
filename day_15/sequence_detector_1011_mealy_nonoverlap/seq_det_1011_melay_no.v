`timescale 1ns / 1ps
module seq_det_1011_mealy(in, clk, reset_n, out);
  
    input in;       //1 bit input
    input clk, reset_n;
    output reg out; //1 bit output (set high when 1011 sequence is detected in the input signal "in").
    
    parameter a = 2'b00;
    parameter b = 2'b01;
    parameter c = 2'b10;
    parameter d = 2'b11;
    
    reg [1:0] cur_state;      //current state
    reg [1:0] nxt_state;      //next state
    
    //sequential state registring block.
    always @(posedge clk, negedge reset_n)
    begin
        if(reset_n==0)
            cur_state <= a;
        else
            cur_state <= nxt_state;
    end
    //Combinational next state determination block
    always @(in, cur_state)
    begin
        case(cur_state)
            a : nxt_state = in ? b:a;
            b : nxt_state = in ? b:c;
            c : nxt_state = in ? d:a;
            d : nxt_state = in ? a:c;
        endcase
    end
    //Sequential output block.
    always @(posedge clk, negedge reset_n)
    begin
        if(reset_n==0)
            out<=0;
        else
            out <= (cur_state==d)&&(in);
    end
    
endmodule
