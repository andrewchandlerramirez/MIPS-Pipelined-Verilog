`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2021 05:18:28 PM
// Design Name: 
// Module Name: Branch_ALU
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


module Branch_ALU(
    rs,
    rt,
    alu_cntl,
    alu_lsb,
    zero
    );
    
 
input[31:0] rs,rt;
input[5:0] alu_cntl;

output reg zero,alu_lsb;
reg[31:0] result;


always@(*) begin
    
    case(alu_cntl) 
        6'h1F: result = rs - rt;//need to add harware for both beq and bne
        6'h20: result = rs - rt;//
        6'h21: result = (rs <= 32'h00000000)? 32'h00000001: 32'h00000000;//assuming we are comparing rt, we can set first bit of result and use it for conformation and add hardware
        6'h22: result = (rs > 32'h00000000)?  32'h00000001: 32'h00000000;
        default: result = 32'h00000000;
    endcase
    alu_lsb = result[0];
    zero = (result == 32'h00000000)? 1'b1: 1'b0;
    
end 




endmodule
