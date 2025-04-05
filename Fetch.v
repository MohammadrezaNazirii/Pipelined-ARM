`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:22:06 11/12/2023 
// Design Name: 
// Module Name:    Fetch 
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
module Fetch(Clock, BranchTarget, PCSource, PC, Instruction, Hit
    );
	 
	 input Clock;
	 input [63:0] BranchTarget;
	 input PCSource;
	 output [63:0] PC;
	 output [31:0] Instruction;
	 output Hit;
	 
	 wire [63:0] pc;
	 wire [127:0] DataLine;
	 wire [31:0] instruction;
	 wire hitt;
	 wire [63:0] muxOut;
	 wire [63:0] pcOut;
	 wire [63:0] NextPC;
	 
	 MUX mux (
		 .PC(NextPC), 
		 .Branch_Target(BranchTarget), 
		 .PC_Source(PCSource), 
		 .Address(muxOut)
		 );
	 
	 PC Pc (
		 .Addrss(muxOut), 
		 .Hit(Hit), 
		 .Clock(Clock), 
		 .Address(pcOut)
		 );
		 
	 assign NextPC = pcOut + 4;
	 assign PC = pcOut;
		 
	 Memory memory (
		 .Address(pcOut), 
		 .Clock(Clock), 
		 .Data_Line(DataLine)
		 );
	 
	 Cache cache (
		 .address(pcOut), 
		 .data_line(DataLine), 
		 .clock(Clock), 
		 .instruction(instruction), 
		 .hit(hitt)
		 );
	 
	 assign Hit = hitt;
	 assign Instruction = instruction;



endmodule
