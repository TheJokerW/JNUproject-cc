`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/11/08 19:48:12
// Design Name: 
// Module Name: romTest
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


module romTest(
    input [5:0] next_addr,
    input clk,
    input rst,
    output [31:0] rdata
    );
    wire [5:0]oaddr;
    PC pc(.next_addr(next_addr),.clk(clk),.rst(rst),.addr(oaddr));   
    dist_mem_gen_0 d(.a(oaddr),.spo(rdata));
endmodule
