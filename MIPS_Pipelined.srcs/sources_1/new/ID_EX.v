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


module ID_EX(clk,rst,continue, mem_read_in,mem_to_reg_in,mem_write_in,alu_src_in,reg_write_in, mem_read_out, mem_to_reg_out, mem_write_out,alu_src_out, reg_write_out,
             rs_data_in,rt_data_in,rs_in,rt_in,rd_in,shamt_in,immediate_in,rs_data_out,rt_data_out,rs_out,rt_out,rd_out,shamt_out,immediate_out,
             alu_cntl_in,alu_cntl_out);
input clk,rst,mem_read_in,mem_to_reg_in,mem_write_in,alu_src_in,reg_write_in,continue;
input[31:0] rs_data_in,rt_data_in;
input[5:0] alu_cntl_in;
input[4:0] rs_in,rt_in,rd_in,shamt_in;
input[15:0] immediate_in;

output reg mem_read_out,mem_to_reg_out,mem_write_out,alu_src_out,reg_write_out;
output reg[31:0] rs_data_out,rt_data_out;
output reg[5:0] alu_cntl_out;
output reg[4:0] rs_out,rt_out,rd_out,shamt_out;
output reg[15:0] immediate_out;


always@(posedge clk, posedge rst)begin

    if(rst) begin
        mem_read_out <=1'b0;
        mem_to_reg_out <=1'b0;
        mem_write_out <= 1'b0;
        alu_src_out <=1'b0;
        reg_write_out <= 1'b0;
        rs_data_out <= 32'b0;
        rt_data_out <= 32'b0;
        rs_out<= 5'b0;
        rt_out<= 5'b0;
        rd_out<= 5'b0;
        shamt_out<= 5'b0;
        immediate_out<= 16'b0;
        alu_cntl_out <=6'b0;
    end
    else if(continue == 1'b0) begin
        mem_read_out <=1'b0;
        mem_to_reg_out <=1'b0;
        mem_write_out <= 1'b0;
        alu_src_out <=1'b0;
        reg_write_out <= 1'b0;
        rs_data_out <= 32'b0;
        rt_data_out <= 32'b0;
        rs_out<= 5'b0;
        rt_out<= 5'b0;
        rd_out<= 5'b0;
        shamt_out<= 5'b0;
        immediate_out<= 16'b0;
        alu_cntl_out <=6'b0;
    end
    else begin
        mem_read_out <= mem_read_in;
        mem_to_reg_out <= mem_to_reg_in;
        mem_write_out <= mem_write_out;
        alu_src_out <= alu_src_in;
        reg_write_out <= reg_write_in;
        rs_data_out <= rs_data_in;
        rt_data_out <= rt_data_in;
        rs_out<= rs_in;
        rt_out<= rt_in;
        rd_out<= rd_in;
        shamt_out<= shamt_in;
        immediate_out<= immediate_in;
        alu_cntl_out <= alu_cntl_in;
    end
end



endmodule

