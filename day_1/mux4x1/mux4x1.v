`timescale 1ns / 1ps
module mux4x1(A, B, C, D, sel, out);
    input A, B, C, D;
    input [1:0] sel;
    output wire out;
    
    assign out = sel[1] ? sel[0]? D:C : sel[0]? B:A;
    
    // using case statement // declare out as "reg" for case statement implementation
    /*
    always@(*)
    begin
    case (sel)
        2'b00 : out <= A;
        2'b01 : out <= B;
        2'b10 : out <= C;
        default : out <= D;
    endcase
    end
    */
endmodule
