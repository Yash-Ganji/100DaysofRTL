`timescale 1ns / 1ps
module fulladder(a, b, cin, sum, cout);
    input a, b, cin;
    output wire sum, cout;
    wire wr1, wr2, wr3;
    
    //Realising fulladder using 2 half adders.
    halfadder inst1 (.a(a), .b(b), .sum(wr1), .cout(wr2));
    halfadder inst2 (.a(wr1), .b(cin), .sum(sum), .cout(wr3));
    assign cout = wr3|wr2;
    
endmodule

// Module to define half adder
module halfadder(a, b, sum, cout);
    input a, b;
    output wire sum, cout;
    
    assign sum = a^b;
    assign cout = a&b;
endmodule
