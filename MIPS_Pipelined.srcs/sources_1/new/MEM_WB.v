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


module MEM_WB(clk,rst,RegDst_in,data_mem_in, mem_to_reg_in,reg_write_in, RegDst_out,data_mem_out, mem_to_reg_out, reg_write_out,
             rd_in,rd_out,
             alu_result_in,alu_result_out
             );
input clk,rst,RegDst_in,mem_to_reg_in,reg_write_in;
input[31:0] alu_result_in,data_mem_in;
input[4:0] rd_in;

output reg RegDst_out,mem_to_reg_out,reg_write_out;
output reg[31:0] alu_result_out,data_mem_out;
output reg[4:0] rd_out;


always@(posedge clk, posedge rst)begin

    if(rst) begin
    RegDst_out <= 1'b0; 
    mem_to_reg_out <=1'b0;
    reg_write_out <= 1'b0;
    rd_out<= 5'b0;
    alu_result_out <=32'b0;
    data_mem_out <=32'b0;
    end
    else begin
    RegDst_out <= RegDst_in; 
    mem_to_reg_out <= mem_to_reg_in;
    reg_write_out <= reg_write_in;
    rd_out<= rd_in;
    alu_result_out <= alu_result_in;
    data_mem_out <= data_mem_in;
    end
end



endmodule