`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/10/25 18:59:52
// Design Name: 
// Module Name: calComplement
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


module calWithRegs_FIB(
    input clk,
    input rst,
    input [3:0] n,
    output [31:0]result
    );
    reg [31:0] wdata;
    reg[4:0] ra1,ra2,wa;
    reg[0:0] we;
    wire [31:0]a,b,f;
    assign result=f;
   
    integer count=2;
    reg[1:0] status=2'b00; 
    parameter op=4'b0001;
    registerGroup regs(.oc(~rst),.raddr1(ra1),.raddr2(ra2),.waddr(wa),.wdata(wdata),.clk(clk),.WE(we),.rdata1(a),.rdata2(b));  
     ALU alu(a,b,op,f);    
    always @(posedge clk)
    begin      
        if(rst==1'b0)
            begin
            status<=2'b00;
            count<=2; 
            ra1<=5'b0;
            ra2<=5'b0;
            wa<=5'b0;
            wdata<=32'b0;
            we<=1'b0;
            end
        else
            begin
            case (status)
            2'b00:
                begin
                ra1<=5'b1;
                ra2<=5'b10;
                we<=1'b1;
                wa<=5'b1;
                wdata<=32'b1;
                status<=2'b01;              
                end
            2'b01:
                begin
                we<=1'b1;
                wa<=5'b10;
                wdata<=32'b1;
                status<=2'b10;
                end
            2'b10:
                begin
                we<=1'b1;
                wa<=ra2+1;
                wdata<=f;
                ra1<=ra2;
                ra2<=wa;
                status<=2'b11;
                count<=count+1;
                end
            2'b11:
                begin
                if(count<n)
                    begin
                    status<=2'b10;
                    end
                end
             default:
                begin
                end
            endcase
            end
    end
endmodule
