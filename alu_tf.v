`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:32:46 07/01/2016
// Design Name:   arithmetic_logic_unit
// Module Name:   C:/users/ALU/alu_tf.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: arithmetic_logic_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_tf;

	// Inputs
	reg [3:0] control;
	reg [31:0] firstOp;
	reg [31:0] secondOp;

	// Outputs
	wire [31:0] result;
	wire overflow;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	arithmetic_logic_unit uut (
		.control(control), 
		.firstOp(firstOp), 
		.secondOp(secondOp), 
		.result(result), 
		.overflow(overflow), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		control = 0;
		firstOp = 0;
		secondOp = 0;

		// Wait 100 ns for global reset to finish
		#100;						// and
        control = 4'b0000;
		  firstOp = 32'b10101010101010101010101010101010;
		  secondOp = 32'b01010101010101010101010101010101;
		#100;						// or
		  control = 4'b0001;
		#100;						// add
		  control = 4'b0010;
		  firstOp = 32'd5;
		  secondOp = 32'd5;
		 
		#100;						// xor
		  control = 4'b0011;
		  firstOp = 32'b10101010101010101010101010101010;
		  secondOp = 32'b01010101010101010101010101010101;
		#100;						// nor
		  control = 4'b0100;
		  
		#100;
		  control = 4'b0101;	// sub
		
		#100;					
		  control = 4'b0110;	// slt
		  
		#100;
		  control = 4'b0111;	//shift left
		  secondOp = 32'd5;
		  
		#100;					
		  control = 4'b1000;	// shift right
		#100;					
		  control = 4'b1001;	// shift right arithmetic
		 #100;					
		  control = 4'b1010;	// signed add
		 #100;					
		  control = 4'b1011;	// signed sub
	

	end
      
endmodule

