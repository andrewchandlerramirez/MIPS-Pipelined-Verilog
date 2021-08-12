`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/09/2021 01:08:54 AM
// Design Name: 
// Module Name: Hazard_Detection_Unit
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


module Hazard_Detection_Unit(ID_EX_MemRead,EX_MEM_MemRead,EX_MEM_rt, ID_EX_rt,ID_EX_rd, IF_ID_rs, IF_ID_rt,beq,bne,blez,bgtz,continue);
input ID_EX_MemRead,EX_MEM_MemRead,beq,bne,blez,bgtz;
input [4:0] ID_EX_rt, IF_ID_rs, IF_ID_rt,EX_MEM_rt,ID_EX_rd;
output reg continue;

always@(*)begin
    if((ID_EX_MemRead == 1'b1) && ((ID_EX_rt == IF_ID_rs) || (ID_EX_rt == IF_ID_rt))) //stall for all load dependencies including first cycle of branch load dependencies
        continue = 1'b0;//pc and IF/ID do not write, control signal deasserted
    else if(((beq == 1'b1) || (bne == 1'b1) || (blez == 1'b1) || (bgtz == 1'b1)) && 
             (EX_MEM_MemRead == 1'b1) && ((EX_MEM_rt == IF_ID_rs) || (EX_MEM_rt == IF_ID_rt))  ) //second cycle stall on branch load dependencies
        continue = 1'b0;
   else if( ( (beq == 1'b1) || (bne == 1'b1) || (blez == 1'b1) || (bgtz == 1'b1) ) &&
             ((ID_EX_rd == IF_ID_rs) || (ID_EX_rd == IF_ID_rt)) && (ID_EX_rd != 5'b0)    ) // 1 cycle stall for branch r-type dependencies
        continue = 1'b0;
    else
        continue = 1'b1;//pc and IF/ID updated on clock, control signals remain the smame


end
endmodule
