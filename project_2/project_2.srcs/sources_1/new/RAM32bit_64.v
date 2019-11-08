`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/08 20:29:24
// Design Name: 
// Module Name: RAM32bit_64
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


module RAM32bit_64(
    input [5:0] addr,
    input [31:0] wdata,
    input clk,
    input we,
    input rst,
    output [31:0] rdata
    );
    reg[31:0]ordata;
    assign rdata=ordata;
    reg[31:0] regs[0:63];
    always @(posedge clk)
    begin
        if(we==0)
            begin
                
            end
    end 
endmodule
