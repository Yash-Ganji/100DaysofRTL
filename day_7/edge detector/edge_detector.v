`timescale 1ns / 1ps
module edge_detector(sig_in, clk, reset_n, r_edge, f_edge);
    input sig_in;      //input signal
    output r_edge,     //rising edge detection 
           f_edge;     //faling edge detection
    input clk, reset_n;
    
    reg sig_ff;        //regestering the input signal in a flipflop
    
    always @(posedge clk or negedge reset_n)
    begin
        if(reset_n == 0)
            sig_ff <= 1'b0;
        else
            sig_ff <= sig_in;
    end
    
    assign f_edge = ~sig_in & sig_ff;
    assign r_edge = sig_in & ~sig_ff;
    
endmodule
