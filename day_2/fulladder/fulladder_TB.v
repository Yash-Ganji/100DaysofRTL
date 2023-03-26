`timescale 1ns / 1ps
module fulladder_TB();
    reg a, b, cin;
    wire sum, cout;
    integer i;
  
    fulladder UUT (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
    
    initial 
    begin
      for(i=0; i<7; i= i+1)         //for loop is used to traverse all 8 possible cases for 3 inputs.
        begin
                {a,b,cin} = 3'd0;   // {a,b,cin} concatination of all three input variables. a takes MSB and cin takes LSB place.
            #10 {a,b,cin} = 3'd1;
            #10 {a,b,cin} = 3'd2;
            #10 {a,b,cin} = 3'd3;
            #10 {a,b,cin} = 3'd4;
            #10 {a,b,cin} = 3'd5;
            #10 {a,b,cin} = 3'd6;
            #10 {a,b,cin} = 3'd7;
            #10 $finish;
        end
    end
endmodule
