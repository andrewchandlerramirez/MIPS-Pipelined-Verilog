`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2021 05:23:59 PM
// Design Name: 
// Module Name: PC_Next
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


module PC_Next(pc_IF, pc_ID,jump_address, branch_address, jump, beq,bne,blez,bgtz,zero,alu_lsb, Dout);
input[31:0] pc_IF,pc_ID,branch_address;
input[25:0] jump_address;
input jump, beq,bne,blez,bgtz,zero,alu_lsb;
output reg[31:0] Dout;
reg[31:0] pc_4_IF,pc_4_ID;
 

always@(*) begin
    pc_4_IF = pc_IF + 32'h0004;//memory word is 4 bytes. 
    pc_4_ID = pc_ID + 32'h0004;//memory word is 4 bytes. 
    case({jump,beq,bne,blez,bgtz})
    5'b00000 : Dout = pc_4_IF;
    5'b10000 : Dout = {pc_4_ID[31:28], {2'b0,jump_address} << 2};
    5'b01000 : Dout = (zero == 1'b1)?    pc_4_ID + (branch_address << 2): pc_4_IF;//if zero flag is set then branch
    5'b00100 : Dout = (zero == 1'b0)?    pc_4_ID + (branch_address << 2): pc_4_IF;//if zero flag is not set then branch
    5'b00010 : Dout = (alu_lsb == 1'b1)? pc_4_ID + (branch_address << 2): pc_4_IF;//alu_lsb will be set if alu opperation came out true
    5'b00001 : Dout = (alu_lsb == 1'b1)? pc_4_ID + (branch_address << 2): pc_4_IF;//alu_lsb will be set if alu opperation came out true 
    endcase

    

end

endmodule
