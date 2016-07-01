`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:28:28 07/01/2016 
// Design Name: 
// Module Name:    adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module add(result, a, b
    );
	 input[31:0] a;
	 input[31:0] b;
	 output [31:0] result;
	 
	 wire [32:0] sum = {1'b0,a} + {1'b0,b};
	 assign result = sum[31:0];


endmodule
