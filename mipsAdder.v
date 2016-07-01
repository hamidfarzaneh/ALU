`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:03:34 07/01/2016 
// Design Name: 
// Module Name:    mipsAdder 
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



module arithmetic_logic_unit

(
    control,	//specifies the alu operation
    firstOp, 	//first operand
    secondOp, 	//second operand
    result, 	//alu result
	 overflow,	//overflow flag (underflow as well)
    zero 		//zero flag
);

   
   input [3:0]	control;
	input [31:0] 	firstOp; 
	input	[31:0]	secondOp;
	
    //--------------------------
    // Output Ports
    //--------------------------
   output 	[31:0] 	result; 
	output			overflow;
	output			zero;
	

    //-------------------------------------------------
    // Signal Declarations: reg
    //------------------------------------------------- 
    reg [31:0]	result;
	 reg 		overflow;
	 reg 		zero;
	
	 always @(control)
	 begin
	
		case (control)
			4'b0000 : // AND
				begin
					result 		= firstOp & secondOp;
					overflow 	= 0;
					zero		= (result == 0) ? 1 : 0;
				end	
			4'b0001: // OR
				begin
					result 		= firstOp | secondOp;
					overflow 	= 0;
					zero		= (result == 0) ? 1 : 0;
				end	
			4'b0010: // add
				begin
					result 		= firstOp + secondOp;
					overflow 	= 0;
					zero		= (result == 0) ? 1 : 0;
				end
			4'b0011: // XOR
				begin
					result 		= firstOp ^ secondOp;;
					overflow 	= 0;
					zero		= (result == 0) ? 1 : 0;
				end
			4'b0100: // NOR
				begin
					result 		= ~(firstOp | secondOp);
					overflow 	= 0;
					zero		= (result == 0) ? 1 : 0;
				end
			4'b0110: // Subtract
				begin
					result 		= firstOp - secondOp;
					overflow 	= 0;
					zero		= (result == 0) ? 1 : 0;
				end
			4'b0111: // set on less than
				begin
					result 		= (firstOp < secondOp) ? -1 : 0;
					overflow 	= 0;
					zero		= (result == 0) ? 1 : 0;
				end
			4'b1000: // shift left
				begin
					result 		= firstOp << secondOp;
					overflow 	= 0;
					zero		= (result == 0) ? 1 : 0;
				end
			4'b1001: // shift right
				begin
					result 		= firstOp >> secondOp;
					overflow 	= 0;
					zero		= (result == 0) ? 1 : 0;
				end
			4'b1010: // shift right arithmetic
				begin
					result 		= firstOp <<< secondOp;
					overflow 	= 0;
					zero		= (result == 0) ? 1 : 0;
				end
			4'b1011: // Signed add
				begin
					result 		= firstOp + secondOp;
					
					if ((firstOp >= 0 && secondOp >= 0 && result < 0) ||
						(firstOp < 0 && secondOp < 0 && result >= 0)) begin
						overflow = 1;
					end else begin
						overflow = 0;
					end
					
					zero		= (result == 0) ? 1 : 0;
					
					end
			4'b1100: // Signed subtract
				begin
					result 		= firstOp - secondOp;
					
					if ((firstOp >= 0 && secondOp < 0 && result < 0) ||
						(firstOp < 0 && secondOp >= 0 && result >= 0)) begin
						overflow = 1;
					end else begin
						overflow = 0;
					end
					
					zero		= (result == 0) ? 1 : 0;
					
				end
			default:
				begin
					zero 		= 0;
					overflow 	= 0;
				end				
		endcase
		
	end

    
 endmodule
