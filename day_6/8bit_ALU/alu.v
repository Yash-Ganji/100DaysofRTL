`timescale 1ns / 1ps
module alu(in1, in2, op, cr, out);
    input [7:0] in1, in2;       //2 8 bit input numbers.
    input [2:0] op;             //3 bit operation code.
    output reg [7:0] out;       //8 bit output signal for result
    output reg cr = 1'b0;       //carry bit for addition operation
    
    //declaration of operation and corresponding code. 
    //Not mandetory, we can directly use 3 bit input code op,
    parameter ADD = 3'b000;
    parameter SUB = 3'b001;
    parameter LFS = 3'b010;   //shift a to left by 3 bits and replace the shifted bits with b[2:0].
    parameter RTS = 3'b011;   //shift a to right by 3 bits and replace the shifted bits with b[2:0].
    parameter AND = 3'b100;
    parameter OR =  3'b101;
    parameter XOR = 3'b110;
    parameter EQL = 3'b111;   //if both numbers are equal then 1 else 0.
    
    always@ (*)
    begin
        casex(op)
            ADD : assign {cr,out} = in1 + in2;
            SUB : assign out = in1 - in2;
            LFS : assign out = in1<<3 | in2[2:0];
            RTS : assign out = in1>>3 | {in2[2:0], 5'd0};
            AND : assign out = in1 & in2;
            OR  : assign out = in1 | in2;
            XOR : assign out = in1 ^ in2;
            EQL : assign out = in1==in2 ? 1:0;
        endcase
    end
endmodule
