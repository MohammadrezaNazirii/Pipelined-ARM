`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:22:34 12/11/2023 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(clk, address, writeData, MemRead, MemWrite, readData
    );
	 input clk;
	 input [63:0] address;
	 input [63:0] writeData;
	 input MemRead;
	 input MemWrite;
	 
	 output reg [63:0] readData;
	 
	 reg [7:0] mem [1023:0];
	 integer i;
	 
	 initial begin
		for(i=0;i<1024;i = i + 1)begin
            mem[i] = 0;
        end
	 end
	 
	 always @(posedge clk) begin
		if(MemWrite) begin
			mem[address] = writeData[7:0];
			mem[address+1] = writeData[15:8];
			mem[address+2] = writeData[23:16];
			mem[address+3] = writeData[31:24];
			mem[address+4] = writeData[39:32];
			mem[address+5] = writeData[47:40];
			mem[address+6] = writeData[55:48];
			mem[address+7] = writeData[63:56];
		end
	 end
	 
	 always @(*) begin
		if(MemRead) begin
			readData[7:0] = mem[address];
			readData[15:8] = mem[address+1];
			readData[23:16] = mem[address+2];
			readData[31:24] = mem[address+3];
			readData[39:32] = mem[address+4];
			readData[47:40] = mem[address+5];
			readData[55:48] = mem[address+6];
			readData[63:56] = mem[address+7];
		end
		else
			readData = 64'bX;
	 end
	 

endmodule
