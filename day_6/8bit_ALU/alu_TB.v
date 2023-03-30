`timescale 1ns / 1ps
module alu_TB();
    reg [7:0] in1, in2;
    reg [2:0] op=0;
    wire cr;
    wire [7:0] out;
    integer i;
    alu UUT (.in1(in1), .in2(in2), .op(op), .cr(cr), .out(out));
    
    initial
    begin
        in1 = 8'h5A;
        in2 = 8'h4E;
            for(i=1; i<=7; i = i+1)
            begin
                #10 op = i;
            end
        #10 in1 = 8'd200;
            in2 = 8'd200;
        #10 $finish;
    end
endmodule
