//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Tue Aug 10 21:16:20 2021
//Host        : DESKTOP-KVMQM0C running 64-bit major release  (build 9200)
//Command     : generate_target MIPS_PipelineBD.bd
//Design      : MIPS_PipelineBD
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
module MIPS_Pipelined
   (clk,
    rst);
    input clk,rst;
  wire [31:0]ALU_0_result;
  wire [5:0]Alu_cntl_0_alu_cntl;
  wire Branch_ALU_0_alu_lsb;
  wire Branch_ALU_0_zero;
  wire [1:0]Branch_Forwarding_0_forward_A;
  wire [1:0]Branch_Forwarding_0_forward_B;
  wire [5:0]Control_Unit_0_alu_op;
  wire Control_Unit_0_alu_src;
  wire Control_Unit_0_beq;
  wire Control_Unit_0_bgtz;
  wire Control_Unit_0_blez;
  wire Control_Unit_0_bne;
  wire Control_Unit_0_jump;
  wire Control_Unit_0_mem_read;
  wire Control_Unit_0_mem_to_reg;
  wire Control_Unit_0_mem_write;
  wire Control_Unit_0_reg_dst;
  wire Control_Unit_0_reg_write;
  wire [31:0]Datamem_0_read_data;
  wire [31:0]EX_MEM_0_alu_result_out;
  wire EX_MEM_0_mem_read_out;
  wire EX_MEM_0_mem_to_reg_out;
  wire EX_MEM_0_mem_write_out;
  wire [4:0]EX_MEM_0_rd_out;
  wire EX_MEM_0_reg_write_out;
  wire [31:0]EX_MEM_0_rt_data_out;
  wire [1:0]Forwarding_Unit_0_forward_A;
  wire [1:0]Forwarding_Unit_0_forward_B;
  wire Hazard_Detection_Unit_0_continue;
  wire [5:0]ID_EX_0_alu_cntl_out;
  wire ID_EX_0_alu_src_out;
  wire [15:0]ID_EX_0_immediate_out;
  wire ID_EX_0_mem_read_out;
  wire ID_EX_0_mem_to_reg_out;
  wire ID_EX_0_mem_write_out;
  wire [4:0]ID_EX_0_rd_out;
  wire ID_EX_0_reg_write_out;
  wire [31:0]ID_EX_0_rs_data_out;
  wire [4:0]ID_EX_0_rs_out;
  wire [31:0]ID_EX_0_rt_data_out;
  wire [4:0]ID_EX_0_rt_out;
  wire [4:0]ID_EX_0_shamt_out;
  wire [5:0]IF_ID_0_func;
  wire [15:0]IF_ID_0_immediate;
  wire [25:0]IF_ID_0_jump_address;
  wire [5:0]IF_ID_0_op_code;
  wire [31:0]IF_ID_0_pc_out;
  wire [4:0]IF_ID_0_rd;
  wire [4:0]IF_ID_0_rs;
  wire [4:0]IF_ID_0_rt;
  wire [4:0]IF_ID_0_shamt;
  wire [31:0]Instmem_0_inst;
  wire [31:0]MEM_WB_0_Dout;
  wire [31:0]MEM_WB_0_alu_result_out;
  wire MEM_WB_0_mem_to_reg_out;
  wire [4:0]MEM_WB_0_rd_out;
  wire MEM_WB_0_reg_write_out;
  wire [31:0]Net;
  wire Net1;
  wire [31:0]PC_Next_0_Dout;
  wire PC_Next_0_flush;
  wire [31:0]RegFile_0_rs;
  wire [31:0]RegFile_0_rt;
  wire [31:0]Sign_Extend_0_Dout;
  wire [31:0]alu_rs_data;
  wire [31:0]alu_rt_data;
  wire clk_1;
  wire [31:0]mux_32_0_c;
  wire [31:0]mux_32_1_c;
  wire [4:0]mux_5_1_destination;
  wire [31:0]rs_data;
  wire [31:0]rt_data;

  assign Net1 = rst;
  assign clk_1 = clk;
  ALU ALU_0
       (.alu_cntl(ID_EX_0_alu_cntl_out),
        .result(ALU_0_result),
        .rs(alu_rs_data),
        .rt(mux_32_1_c),
        .shamt(ID_EX_0_shamt_out));
  Alu_cntl Alu_cntl_0
       (.alu_cntl(Alu_cntl_0_alu_cntl),
        .func(IF_ID_0_func),
        .op(Control_Unit_0_alu_op));
  Branch_ALU Branch_ALU_0
       (.alu_cntl(Alu_cntl_0_alu_cntl),
        .alu_lsb(Branch_ALU_0_alu_lsb),
        .rs(rs_data),
        .rt(rt_data),
        .zero(Branch_ALU_0_zero));
  Branch_Forwarding Branch_Forwarding_0
       (.EX_MEM_rd(EX_MEM_0_rd_out),
        .EX_MEM_reg_write(EX_MEM_0_reg_write_out),
        .IF_ID_rs(IF_ID_0_rs),
        .IF_ID_rt(IF_ID_0_rt),
        .MEM_WB_rd(MEM_WB_0_rd_out),
        .MEM_WB_reg_write(MEM_WB_0_reg_write_out),
        .forward_A(Branch_Forwarding_0_forward_A),
        .forward_B(Branch_Forwarding_0_forward_B));
  Control_Unit Control_Unit_0
       (.alu_op(Control_Unit_0_alu_op),
        .alu_src(Control_Unit_0_alu_src),
        .beq(Control_Unit_0_beq),
        .bgtz(Control_Unit_0_bgtz),
        .blez(Control_Unit_0_blez),
        .bne(Control_Unit_0_bne),
        .continue(Hazard_Detection_Unit_0_continue),
        .jump(Control_Unit_0_jump),
        .mem_read(Control_Unit_0_mem_read),
        .mem_to_reg(Control_Unit_0_mem_to_reg),
        .mem_write(Control_Unit_0_mem_write),
        .op_code(IF_ID_0_op_code),
        .reg_dst(Control_Unit_0_reg_dst),
        .reg_write(Control_Unit_0_reg_write));
  Datamem Datamem_0
       (.address(EX_MEM_0_alu_result_out),
        .clk(clk_1),
        .read(EX_MEM_0_mem_read_out),
        .read_data(Datamem_0_read_data),
        .rst(Net1),
        .write(EX_MEM_0_mem_write_out),
        .write_data(EX_MEM_0_rt_data_out));
  EX_MEM EX_MEM_0
       (.alu_result_in(ALU_0_result),
        .alu_result_out(EX_MEM_0_alu_result_out),
        .clk(clk_1),
        .mem_read_in(ID_EX_0_mem_read_out),
        .mem_read_out(EX_MEM_0_mem_read_out),
        .mem_to_reg_in(ID_EX_0_mem_to_reg_out),
        .mem_to_reg_out(EX_MEM_0_mem_to_reg_out),
        .mem_write_in(ID_EX_0_mem_write_out),
        .mem_write_out(EX_MEM_0_mem_write_out),
        .rd_in(ID_EX_0_rd_out),
        .rd_out(EX_MEM_0_rd_out),
        .reg_write_in(ID_EX_0_reg_write_out),
        .reg_write_out(EX_MEM_0_reg_write_out),
        .rst(Net1),
        .rt_data_in(ID_EX_0_rt_data_out),
        .rt_data_out(EX_MEM_0_rt_data_out));
  Forwarding_Unit Forwarding_Unit_0
       (.EX_MEM_rd(EX_MEM_0_rd_out),
        .EX_MEM_reg_write(EX_MEM_0_reg_write_out),
        .ID_EX_rs(ID_EX_0_rs_out),
        .ID_EX_rt(ID_EX_0_rt_out),
        .MEM_WB_rd(MEM_WB_0_rd_out),
        .MEM_WB_reg_write(MEM_WB_0_reg_write_out),
        .forward_A(Forwarding_Unit_0_forward_A),
        .forward_B(Forwarding_Unit_0_forward_B));
  Hazard_Detection_Unit Hazard_Detection_Unit_0
       (.EX_MEM_MemRead(EX_MEM_0_mem_read_out),
        .EX_MEM_rt(EX_MEM_0_rt_data_out[4:0]),
        .ID_EX_MemRead(ID_EX_0_mem_read_out),
        .ID_EX_rd(ID_EX_0_rd_out),
        .ID_EX_rt(ID_EX_0_rt_out),
        .IF_ID_rs(IF_ID_0_rs),
        .IF_ID_rt(IF_ID_0_rt),
        .beq(Control_Unit_0_beq),
        .bgtz(Control_Unit_0_bgtz),
        .blez(Control_Unit_0_blez),
        .bne(Control_Unit_0_bne),
        .continue(Hazard_Detection_Unit_0_continue));
  ID_EX ID_EX_0
       (.alu_cntl_in(Alu_cntl_0_alu_cntl),
        .alu_cntl_out(ID_EX_0_alu_cntl_out),
        .alu_src_in(Control_Unit_0_alu_src),
        .alu_src_out(ID_EX_0_alu_src_out),
        .clk(clk_1),
        .continue(Hazard_Detection_Unit_0_continue),
        .immediate_in(IF_ID_0_immediate),
        .immediate_out(ID_EX_0_immediate_out),
        .mem_read_in(Control_Unit_0_mem_read),
        .mem_read_out(ID_EX_0_mem_read_out),
        .mem_to_reg_in(Control_Unit_0_mem_to_reg),
        .mem_to_reg_out(ID_EX_0_mem_to_reg_out),
        .mem_write_in(Control_Unit_0_mem_write),
        .mem_write_out(ID_EX_0_mem_write_out),
        .rd_in(mux_5_1_destination),
        .rd_out(ID_EX_0_rd_out),
        .reg_write_in(Control_Unit_0_reg_write),
        .reg_write_out(ID_EX_0_reg_write_out),
        .rs_data_in(RegFile_0_rs),
        .rs_data_out(ID_EX_0_rs_data_out),
        .rs_in(IF_ID_0_rs),
        .rs_out(ID_EX_0_rs_out),
        .rst(Net1),
        .rt_data_in(RegFile_0_rt),
        .rt_data_out(ID_EX_0_rt_data_out),
        .rt_in(IF_ID_0_rt),
        .rt_out(ID_EX_0_rt_out),
        .shamt_in(IF_ID_0_shamt),
        .shamt_out(ID_EX_0_shamt_out));
  IF_ID IF_ID_0
       (.IF_ID_Write(Hazard_Detection_Unit_0_continue),
        .clk(clk_1),
        .flush(PC_Next_0_flush),
        .func(IF_ID_0_func),
        .immediate(IF_ID_0_immediate),
        .inst(Instmem_0_inst),
        .jump_address(IF_ID_0_jump_address),
        .op_code(IF_ID_0_op_code),
        .pc_in(Net),
        .pc_out(IF_ID_0_pc_out),
        .rd(IF_ID_0_rd),
        .rs(IF_ID_0_rs),
        .rst(Net1),
        .rt(IF_ID_0_rt),
        .shamt(IF_ID_0_shamt));
  mux_32 Immediate_rt
       (.a({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ID_EX_0_immediate_out}),
        .b(alu_rt_data),
        .c(mux_32_1_c),
        .sel(ID_EX_0_alu_src_out));
  Instmem Instmem_0
       (.address(Net),
        .inst(Instmem_0_inst),
        .rst(Net1));
  MEM_WB MEM_WB_0
       (.alu_result_in(EX_MEM_0_alu_result_out),
        .alu_result_out(MEM_WB_0_alu_result_out),
        .clk(clk_1),
        .data_mem_in(Datamem_0_read_data),
        .data_mem_out(MEM_WB_0_Dout),
        .mem_to_reg_in(EX_MEM_0_mem_to_reg_out),
        .mem_to_reg_out(MEM_WB_0_mem_to_reg_out),
        .rd_in(EX_MEM_0_rd_out),
        .rd_out(MEM_WB_0_rd_out),
        .reg_write_in(EX_MEM_0_reg_write_out),
        .reg_write_out(MEM_WB_0_reg_write_out),
        .rst(Net1));
  PC PC_0
       (.Din(PC_Next_0_Dout),
        .Dout(Net),
        .PC_Write(Hazard_Detection_Unit_0_continue),
        .clk(clk_1),
        .rst(Net1));
  PC_Next PC_Next_0
       (.Dout(PC_Next_0_Dout),
        .alu_lsb(Branch_ALU_0_alu_lsb),
        .beq(Control_Unit_0_beq),
        .bgtz(Control_Unit_0_bgtz),
        .blez(Control_Unit_0_blez),
        .bne(Control_Unit_0_bne),
        .branch_address(Sign_Extend_0_Dout),
        .flush(PC_Next_0_flush),
        .jump(Control_Unit_0_jump),
        .jump_address(IF_ID_0_jump_address),
        .pc_ID(IF_ID_0_pc_out),
        .pc_IF(Net),
        .zero(Branch_ALU_0_zero));
  RegFile RegFile_0
       (.clk(clk_1),
        .read1(IF_ID_0_rs),
        .read2(IF_ID_0_rt),
        .rs(RegFile_0_rs),
        .rst(Net1),
        .rt(RegFile_0_rt),
        .w_data(mux_32_0_c),
        .w_en(MEM_WB_0_reg_write_out),
        .w_reg(MEM_WB_0_rd_out));
  Sign_Extend Sign_Extend_0
       (.Din(IF_ID_0_immediate),
        .Dout(Sign_Extend_0_Dout));
  Forwarding_mux_32 alu_rs
       (.EX_MEM_RD(EX_MEM_0_alu_result_out),
        .ID_EX_INPUT(ID_EX_0_rs_data_out),
        .MEM_WB_RD(mux_32_0_c),
        .data(alu_rs_data),
        .sel(Forwarding_Unit_0_forward_A));
  Forwarding_mux_32 alu_rt
       (.EX_MEM_RD(EX_MEM_0_alu_result_out),
        .ID_EX_INPUT(ID_EX_0_rt_data_out),
        .MEM_WB_RD(mux_32_0_c),
        .data(alu_rt_data),
        .sel(Forwarding_Unit_0_forward_B));
  mux_32 mux_32_0
       (.a(MEM_WB_0_Dout),
        .b(MEM_WB_0_alu_result_out),
        .c(mux_32_0_c),
        .sel(MEM_WB_0_mem_to_reg_out));
  mux_5 mux_5_1
       (.RegDst(Control_Unit_0_reg_dst),
        .destination(mux_5_1_destination),
        .rd(IF_ID_0_rd),
        .rt(IF_ID_0_rt));
  Branch_Forwarding_mux_32 rs
       (.EX_MEM_RD(EX_MEM_0_alu_result_out),
        .IF_ID_INPUT(RegFile_0_rs),
        .MEM_WB_RD(mux_32_0_c),
        .data(rs_data),
        .sel(Branch_Forwarding_0_forward_A));
  Branch_Forwarding_mux_32 rt
       (.EX_MEM_RD(EX_MEM_0_alu_result_out),
        .IF_ID_INPUT(RegFile_0_rt),
        .MEM_WB_RD(mux_32_0_c),
        .data(rt_data),
        .sel(Branch_Forwarding_0_forward_B));
endmodule
