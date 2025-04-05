`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:14:13 01/28/2024
// Design Name:   ARM
// Module Name:   C:/Users/ASUS/Desktop/University/Semester 5/Az Memari/CALab/ARM_TEST.v
// Project Name:  CALab
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ARM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ARM_TEST;

	// Inputs
	reg clk;
	
	always #20 clk = ~clk;

	// Instantiate the Unit Under Test (UUT)
	ARM uut (
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;


	end
      
endmodule

