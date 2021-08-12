`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/09/2021 07:05:20 PM
// Design Name: 
// Module Name: MIPS_PipelineBD_wrapper_tf
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


module MIPS_PipelineBD_wrapper_tf(

    );
reg clk,rst;

MIPS_Pipelined UUT(.clk(clk), .rst(rst));


always #20 clk <= ~clk;

initial begin
    rst = 1'b1;
    clk = 1'b0;
    
    #10;
    rst = 1'b0;
    clk = 1'b0;
end
    
endmodule
