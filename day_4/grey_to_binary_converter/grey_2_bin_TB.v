`timescale 1ns / 1ps
module grey_to_binary_conv_TB #(parameter n=3) ();
    reg [n-1:0] grey;
    wire [n-1:0] bin;
    integer i;
    grey_to_binary_conv UUT (.grey(grey), .bin(bin));
    
    initial
    begin
        grey = 0;
        for(i=0; i<8; i=i+1)
        begin
            #10 grey = grey+1;
        end
        #20 $finish;
    end
endmodule
