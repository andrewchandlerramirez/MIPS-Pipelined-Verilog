`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2021 06:34:32 PM
// Design Name: 
// Module Name: Forwarding_mux_32
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


module Forwarding_mux_32(sel,EX_MEM_RD, MEM_WB_RD,ID_EX_INPUT,data);
input [1:0] sel;
input [31:0] ID_EX_INPUT, EX_MEM_RD, MEM_WB_RD;

output reg[31:0] data;

always@(*)begin

    case(sel)
        2'b00: data = ID_EX_INPUT;
        2'b10: data =  EX_MEM_RD;
        2'b01: data = MEM_WB_RD;
        default:  data = ID_EX_INPUT;
    endcase


end


    
    
endmodule
