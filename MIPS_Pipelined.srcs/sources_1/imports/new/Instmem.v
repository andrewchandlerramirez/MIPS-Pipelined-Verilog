`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2021 12:42:14 AM
// Design Name: 
// Module Name: Instmem
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


module Instmem(rst,address,inst);

input rst;
input[31:0] address;

output reg[31:0] inst;

reg[31:0] InstMem [0: 64];


reg[8:0] i;

always@(*) begin

    if(rst)begin
    //assembly code in mips1.asm
    InstMem[0] = 32'h8c090010;
    InstMem[1] = 32'h8c0a0014;
    InstMem[2] = 32'h8c0b0038;
    InstMem[3] = 32'h8c0c0034;
    InstMem[4] = 32'h8c0f0040;
    InstMem[5] = 32'h012a4020;
    InstMem[6] = 32'h014b4824;
    InstMem[7] = 32'h016c5027;
    InstMem[8] = 32'h016f6826;
    InstMem[9] = 32'h016c7025;
    InstMem[10] = 32'h016c782a;
    InstMem[11] = 32'h00094080;
    InstMem[12] = 32'h000c48c2;
    InstMem[13] = 32'h000b5183;
    InstMem[14] = 32'h012A6822;
    InstMem[15] = 32'h29ee000a;
    InstMem[16] = 32'h312f0001;
    InstMem[17] = 32'h35090001;
    InstMem[18] = 32'hac090028;
    InstMem[19] = 32'h8c0a000c;
    InstMem[20] = 32'hac0a0078;
    InstMem[21] = 32'h010a5820;
    InstMem[22] = 32'h016b5820;
    InstMem[23] = 32'h016b5820;
    InstMem[24] = 32'h016b5820;
    InstMem[25] = 32'h08000000;
    
    
   
        for( i = 26; i < 65; i = i + 1)begin //everything to address 64 set to 0
            InstMem[i] = 8'h00000000;
        end

       
      
    end
    
    
    inst = InstMem[address[7:0] >> 2];
end









endmodule
