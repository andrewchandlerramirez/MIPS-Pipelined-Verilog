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


module EX_MEM(clk,rst, mem_read_in,mem_to_reg_in,mem_write_in,reg_write_in, mem_read_out, mem_to_reg_out, mem_write_out, reg_write_out,
             rt_data_in,rd_in,rt_data_out,rd_out,
             alu_result_in,alu_result_out
             );
input clk,rst,mem_read_in,mem_to_reg_in,mem_write_in,reg_write_in;
input[31:0] rt_data_in;
input[31:0] alu_result_in;
input[4:0] rd_in;

output reg mem_read_out,mem_to_reg_out,mem_write_out,reg_write_out;
output reg[31:0] rt_data_out;
output reg[31:0] alu_result_out;
output reg[4:0] rd_out;


always@(posedge clk, posedge rst)begin

    if(rst) begin
    mem_read_out <=1'b0;
    mem_to_reg_out <=1'b0;
    mem_write_out <= 1'b0;
    reg_write_out <= 1'b0;
    rt_data_out <= 32'b0;
    rd_out<= 5'b0;
    alu_result_out <=32'b0;
    end
    else begin
    mem_read_out <= mem_read_in;
    mem_to_reg_out <= mem_to_reg_in;
    mem_write_out <= mem_write_out;
    reg_write_out <= reg_write_in;
    rt_data_out <= rt_data_in;
    rd_out<= rd_in;
    alu_result_out <= alu_result_in;
    end
end



endmodule

