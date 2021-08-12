`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2021 05:09:28 PM
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


module PC(rst,clk,PC_Write,Din,Dout);
input rst,clk,PC_Write;
input [31:0] Din;
output reg[31:0] Dout;

always@(posedge clk,posedge rst) begin
    if(rst) 
        Dout <= 32'h00000000;//change starting address depending on what instructions are in instmem
    else
        if(PC_Write == 1'b1)//pc will not update if continue == 0
            Dout <= Din;
    end

endmodule
