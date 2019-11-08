`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/08 19:29:28
// Design Name: 
// Module Name: PC
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


module PC(
    input clk,
    input rst,
    input [5:0] next_addr,
    output [5:0] addr
    );
    reg [31:0] oaddr;
    assign addr=oaddr;
    always @(posedge clk)
    begin
        if(rst==1)
            oaddr<=5'b0;
        else
        begin
            oaddr<=next_addr;
        end       
    end
endmodule
