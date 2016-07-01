`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:48:45 07/01/2016 
// Design Name: 
// Module Name:    counter 
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
module counter(
    input CLOCK,
    input DIRECTION,
    output [3:0] COUNT_OUT
    );
	 
	reg [3:0] count_int = 0;
	always @(posedge CLOCK)
		if (DIRECTION)
			count_int <= count_int + 1;		else
			count_int <= count_int - 1;

	assign COUNT_OUT = count_int;
endmodule
