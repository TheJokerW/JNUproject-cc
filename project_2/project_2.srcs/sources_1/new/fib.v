`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/18 19:27:04
// Design Name: 
// Module Name: fib
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


module fib(
    input clk,
    input rst,
    input [3:0] n,
    output [31:0] result
    );
    
    wire[31:0] w1,w2,w3;
    reg[31:0] r1,r2;
    
    parameter op = 4'b0001;
    parameter ini_v = 32'b1;
    integer count = 2;
    
    ALU alu1(w1,w2,op,w3);
    assign w1 = r1;
    assign w2 = r2;
    assign result = w3;
    
    always@(posedge clk or negedge rst)
        begin
            if(~rst)
                begin 
                    count <= 3;
                    r1 <= ini_v;
                    r2 <= ini_v;
                end
            else
                if (count < n)
                    begin 
                        r1 = r2;
                        r2 = w3;
                        count = count + 1;
                    end
        end
endmodule
