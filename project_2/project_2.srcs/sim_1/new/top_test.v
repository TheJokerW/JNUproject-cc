`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/18 19:39:50
// Design Name: 
// Module Name: top_test
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


module top_test(
    output [31:0] result
    );
    parameter clk_period = 10;
    reg clk;
    initial
    begin 
        clk = 1'b0;
        forever 
            #(clk_period/2) clk = ~clk;                      
    end
    
    reg rst = 1'b1;
    reg[5:0] n = 4'b0001;
    top top1(clk,~rst,n,result);  
    
    initial
    begin 
        #2 rst = 0;
        #4 rst = 1;
        #2000 $finish;
    end
endmodule
