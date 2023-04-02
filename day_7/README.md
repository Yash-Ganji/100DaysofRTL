This module takes an input signal and has two outputs which are excited based on the rising or falling edge of the input signal

sig_in is the input signal,   
r_edge is excited when sig_in has a rising edge,    
f_edge is excited when sig_in has a falling edge.

A clk signal is used to implement this functionality (to store the previous state(value) of sig_in).
