`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/25 18:42:40
// Design Name: 
// Module Name: regGroup
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


module registerGroup(
    input oc,
    input [4:0] raddr1,
    input [4:0] raddr2,
    input [4:0] waddr,
    input [31:0] wdata,
    input clk,
    input WE,
    output [31:0] rdata1,
    output [31:0] rdata2
    );
    reg [31:0] regGroup [0:31] ;
    reg[31:0] rdata1;
    reg[31:0] rdata2;
    
    always@(*)
        begin
         regGroup[0]<=32'b0; 
        if(oc==1'b1)
            begin
            rdata1<=32'bz;
            end
        else 
            begin
            if((raddr1==waddr)&&(WE==1'b1))
                begin  
                    rdata1<=wdata;
                end
            else if(raddr1!=waddr)
                begin
                rdata1<=regGroup [raddr1];
                end
            else
                begin
                rdata1<=32'b0;
                end
            end
            
        if(oc===1'b1)
            begin
            rdata2<=32'b0;
            end
        else 
            begin
            if((raddr2==waddr)&&(WE==1'b1))
                begin  
                    rdata1<=wdata;
                end
            else if(raddr2!=waddr)
                begin
                rdata2<=regGroup [raddr2];
                end
            else
                rdata2<=32'b0; 
            end
    end
    
    
    always @(posedge clk)
        begin
            if(oc==1'b0)
                begin 
                    if((WE==1'b1)&&(waddr>5'b0))
                        begin
                        regGroup[waddr]<=wdata;
                        end                        
                end
             end
endmodule
