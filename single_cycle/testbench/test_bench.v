`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.06.2026 15:28:36
// Design Name: 
// Module Name: test_bench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_bench;
reg clk;
reg reset;

Top_module DUT(.clk(clk),.reset(reset));

initial begin
        clk = 0;
        reset = 1;
        #20 reset = 0;
        end
        
        always #5 clk = ~clk;
endmodule
