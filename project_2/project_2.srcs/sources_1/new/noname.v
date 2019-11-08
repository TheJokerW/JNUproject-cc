`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/18 18:44:33
// Design Name: 
// Module Name: noname
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


module ALU(
    input [31:0] a,
    input [31:0] b,
    input [3:0] op,
    output [31:0] f,
    output z
    );
    assign f=fr;
    assign z=zr;
   reg[31:0] fr;
   reg zr;
    always@(*)
    begin
        case(op)
            4'b0000:fr <= 32'b0;
            4'b0001:fr <= a + b;
            4'b0010:fr <= a - b;
            4'b0011:fr <= a & b;
            4'b0100:fr <= a | b;
            4'b0101:fr <= a ^ b;
            default:fr <= 32'b0;
        endcase
        if(fr==0)
            zr <= 1;
        else 
            zr <= 0;
     end
endmodule

