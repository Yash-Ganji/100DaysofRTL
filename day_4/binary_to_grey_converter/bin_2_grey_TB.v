`timescale 1ns / 1ps
module bin_2_grey_TB #(parameter n=3)();
         
    reg [n-1:0] bin;
    wire [n-1:0] grey;
    integer i;
    
    bin_2_grey UUT (.bin(bin), .grey(grey));
    
    initial
    begin
        bin = 0;
        for(i=0; i<8; i=i+1)
        begin
            #10 bin = bin+1;
        end
        #20 $finish;
    end
endmodule
