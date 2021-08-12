`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2021 11:49:38 PM
// Design Name: 
// Module Name: MEM_WB
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


module IF_ID(clk,rst,flush,IF_ID_Write,inst,pc_in,pc_out,op_code,rs,rt,rd,shamt,jump_address,immediate,func);
input clk,rst,flush,IF_ID_Write;
input[31:0] pc_in,inst;
output reg[31:0] pc_out;
output reg[5:0] op_code,func;
output reg[4:0] rs,rt,rd,shamt;
output reg[25:0] jump_address;
output reg[15:0] immediate;


always@(posedge clk, posedge rst)begin
    if(rst) begin
        pc_out <= 32'h00000000;
        op_code <= 6'b0;
        rs<= 5'b0;
        rt<= 5'b0;
        rd<= 5'b0;
        shamt<= 5'b0;
        jump_address<= 26'b0;
        immediate<= 16'b0;
        func<= 6'b0;
    end
    else if(IF_ID_Write == 1'b1)begin
    
            if(flush == 1'b1) begin
                pc_out <= 32'h00000000;
                op_code <= 6'b0;
                rs<= 5'b0;
                rt<= 5'b0;
                rd<= 5'b0;
                shamt<= 5'b0;
                jump_address<= 26'b0;
                immediate<= 16'b0;
                func<= 6'b0;
            end
            else begin
                pc_out <= pc_in;
                op_code <= inst[31:26];
                rs<= inst[25:21];
                rt<= inst[20:16];
                rd<= inst[15:11];
                shamt<= inst[10:6];
                jump_address<= inst[25:0];
                immediate<= inst[15:0];
                func<= inst[5:0];
           end
    end
    
end



endmodule

