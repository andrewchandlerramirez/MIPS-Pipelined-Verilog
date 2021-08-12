`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2021 07:39:47 PM
// Design Name: 
// Module Name: Forwarding_Unit
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


module Forwarding_Unit(
EX_MEM_reg_write,EX_MEM_rd,
MEM_WB_reg_write,MEM_WB_rd,
ID_EX_rs, ID_EX_rt,
forward_A, forward_B
);

input EX_MEM_reg_write;
input[4:0] EX_MEM_rd;

input MEM_WB_reg_write;
input[4:0] MEM_WB_rd;

input[4:0] ID_EX_rs,ID_EX_rt;

output reg[1:0] forward_A,forward_B;

always@(*)begin
    //deciding if the alu input for rs will come from the EX,MEM, or WB stage.
    if((EX_MEM_reg_write == 1'b1) && 
       (EX_MEM_rd == ID_EX_rs) && 
       (EX_MEM_rd != 5'b0))
            forward_A = 2'b10;/////////////////////
    else if((MEM_WB_reg_write == 1'b1) && 
            (MEM_WB_rd == ID_EX_rs) && 
            (MEM_WB_rd != 5'b0) &&
            ~((EX_MEM_reg_write == 1'b1) && (EX_MEM_rd == ID_EX_rs) && (EX_MEM_rd != 5'b0)))
            forward_A = 2'b01;/////////////////////        
    else begin
        forward_A = 2'b0;        
        end        
           
    //deciding if the alu input for rt will come from the EX,MEM, or WB stage.        
    if((EX_MEM_reg_write == 1'b1) && 
            (EX_MEM_rd == ID_EX_rt) && 
            (EX_MEM_rd != 5'b0))
            forward_B = 2'b10;/////////////////////
    
    else if((MEM_WB_reg_write == 1'b1) && 
            (MEM_WB_rd == ID_EX_rt) && 
            (MEM_WB_rd != 5'b0) &&
             ~((EX_MEM_reg_write == 1'b1) && (EX_MEM_rd == ID_EX_rt) && (EX_MEM_rd != 5'b0)))
            forward_B = 2'b01;/////////////////////
    else begin
        forward_B = 2'b0;
        end
end




endmodule
