`timescale 1ns / 1ps
module edge_detector_TB();
    reg sig_in, clk, reset_n;
    wire r_edge, f_edge;
    
    edge_detector UUT (.sig_in(sig_in), .clk(clk), .reset_n(reset_n), .r_edge(r_edge), .f_edge(f_edge));
    
    initial
    begin
        clk = 0;
        sig_in = 0;
        reset_n = 0;
        #1 reset_n = 1;
        #50 $finish;
    end
    always #4 sig_in = ($random()%2);
    always #2 clk = ~clk;
endmodule
