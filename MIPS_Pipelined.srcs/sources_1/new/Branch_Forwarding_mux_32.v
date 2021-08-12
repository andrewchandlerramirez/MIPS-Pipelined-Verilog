`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/09/2021 02:04:24 PM
// Design Name: 
// Module Name: Branch_Forwarding_mux_32
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


module Branch_Forwarding_mux_32(sel,EX_MEM_RD, MEM_WB_RD,IF_ID_INPUT,data);
input [1:0] sel;
input [31:0] IF_ID_INPUT, EX_MEM_RD, MEM_WB_RD;

output reg[31:0] data;

always@(*)begin

    case(sel)
        2'b00: data = IF_ID_INPUT;
        2'b10: data =  EX_MEM_RD;
        2'b01: data = MEM_WB_RD;
        default:  data = IF_ID_INPUT;
    endcase


end


    
    
endmodule