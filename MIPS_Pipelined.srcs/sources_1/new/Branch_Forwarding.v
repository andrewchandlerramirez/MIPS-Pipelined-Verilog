`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/09/2021 01:13:32 PM
// Design Name: 
// Module Name: Branch_Forwarding
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


module Branch_Forwarding(
EX_MEM_reg_write,EX_MEM_rd,
MEM_WB_reg_write,MEM_WB_rd,
IF_ID_rs, IF_ID_rt,
forward_A, forward_B
);

input EX_MEM_reg_write;
input[4:0] EX_MEM_rd;

input MEM_WB_reg_write;
input[4:0] MEM_WB_rd;

input[4:0] IF_ID_rs,IF_ID_rt;

output reg[1:0] forward_A,forward_B;

always@(*)begin
    if((EX_MEM_reg_write == 1'b1) && 
       (EX_MEM_rd == IF_ID_rs) && 
       (EX_MEM_rd != 5'b0))
            forward_A = 2'b10;/////////////////////
    else if((EX_MEM_reg_write == 1'b1) && 
            (EX_MEM_rd == IF_ID_rt) && 
            (EX_MEM_rd != 5'b0))
            forward_B = 2'b10;/////////////////////
    else if((MEM_WB_reg_write == 1'b1) && 
            (MEM_WB_rd == IF_ID_rs) && 
            (MEM_WB_rd != 5'b0) &&
            ~((EX_MEM_reg_write == 1'b1) && (EX_MEM_rd == IF_ID_rs) && (EX_MEM_rd != 5'b0)))
            forward_A = 2'b01;/////////////////////
    else if((MEM_WB_reg_write == 1'b1) && 
            (MEM_WB_rd == IF_ID_rt) && 
            (MEM_WB_rd != 5'b0) &&
             ~((EX_MEM_reg_write == 1'b1) && (EX_MEM_rd == IF_ID_rt) && (EX_MEM_rd != 5'b0)))
            forward_B = 2'b01;/////////////////////
    else begin
        forward_A = 2'b0;
        forward_B = 2'b0;
        
        end
end



endmodule 

