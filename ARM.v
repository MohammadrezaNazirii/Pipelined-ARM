`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:33:55 11/27/2023 
// Design Name: 
// Module Name:    ARM 
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
module ARM(clk
    );
	 
	 input clk;
	 
	 wire [63:0] BranchTarget_Fetch;
	 wire zeroFlagOut_And;
	 wire BranchOut_And;
	 wire PCSource = zeroFlagOut_And & BranchOut_And;
	 /////////////////////
	 wire [63:0] PC_iFiD;
	 wire [31:0] Instruction_iFiD;
	 wire Hit_iFiD;
	 ////////////////////
	 wire [31:0] Instruction_Decode;
	 wire [63:0] PC_iDeX;
	 wire Hit_iDeX;
	 wire RegWrite_Decode;
	 wire [4:0] write_reg_Decode;
	 wire [63:0] write_data_Decode;
	 ///////////////////
	 wire [10:0] opcode_ControlUnit;
	 ///////////////////
	 wire [63:0] ReadData1_iDeX;
	 wire [63:0] ReadData2_iDeX;
	 wire [63:0] SignExtendImmediate_iDeX;
	 wire [4:0] WriteReg_iDeX;
	 ///////////////////
	 wire ALUSrc_iDeX;
	 wire MemtoReg_iDeX;
	 wire RegWrite_iDeX;
	 wire MemRead_iDeX;
	 wire MemWrite_iDeX;
	 wire Branch_iDeX;
	 wire [1:0] ALUOp_iDeX;
	 ///////////////////
	 wire [63:0] ALUReadData1_Execute;
	 wire [63:0] ALUReadData2_Execute;
	 wire [63:0] Immediate_Execute;
	 wire [10:0] Opcode_Execute;
	 wire [1:0] ALUOp_Execute;
	 wire ALUSrc_Execute;
	 wire [63:0] PC_Execute;
	 ///////////////////
	 wire Hit_ExMem;
	 wire zeroFlag_ExMem;
	 wire [63:0] ALUResult_ExMem;
	 wire [4:0] writeReg_ExMem;
	 wire MemRead_ExMem;
	 wire MemWrite_ExMem;
	 wire Branch_ExMem;
	 wire RegWrite_ExMem;
	 wire MemtoReg_ExMem;
	 wire [63:0] branchTarget_ExMem;
	 ///////////////////
	 wire [63:0] address_DataMemory;
	 wire [63:0] writeData_DataMemory;
	 wire MemRead_DataMemory;
	 wire MemWrite_DataMemory;
	 ///////////////////
	 wire Hit_MemWb;
	 wire [63:0] readData_MemWb;
	 wire [4:0] writeReg_MemWb;
	 wire RegWrite_MemWb;
	 wire MemtoReg_MemWb;
	 ///////////////////
	 wire MemtoReg_WriteBack;
	 wire [63:0] readData_WriteBack;
	 wire [63:0] ALUResult_WriteBack;
	 
	 Fetch fetch (
		 .Clock(clk), 
		 .BranchTarget(BranchTarget_Fetch), 
		 .PCSource(PCSource), 
		 .PC(PC_iFiD), 
		 .Instruction(Instruction_iFiD), 
		 .Hit(Hit_iFiD)
		 );
		 
	 IFIDRegister iFiDRegister (
		 .clk(clk), 
		 .pc(PC_iFiD), 
		 .instruction(Instruction_iFiD), 
		 .hit(Hit_iFiD), 
		 .instruction_out(Instruction_Decode), 
		 .pc_out(PC_iDeX), 
		 .hit_out(Hit_iDeX)
		 );
		 
	 Decode decode (
		 .clk(clk), 
		 .instruction(Instruction_Decode), 
		 .write_reg(write_reg_Decode), 
		 .write_data(write_data_Decode), 
		 .RegWrite(RegWrite_Decode), 
		 .opcode(opcode_ControlUnit), 
		 .read_data1(ReadData1_iDeX), 
		 .read_data2(ReadData2_iDeX), 
		 .sign_extended_immediate(SignExtendImmediate_iDeX), 
		 .dest_reg(WriteReg_iDeX)
		 );
		 
	 ControlUnit controlUnit (
		 .opcode(opcode_ControlUnit), 
		 .ALUSrc(ALUSrc_iDeX), 
		 .MemtoReg(MemtoReg_iDeX), 
		 .RegWrite(RegWrite_iDeX), 
		 .MemRead(MemRead_iDeX), 
		 .MemWrite(MemWrite_iDeX), 
		 .Branch(Branch_iDeX), 
		 .ALUOp(ALUOp_iDeX)
		 );
	 
	 IDEXRegister iDEXRegister (
		 .clk(clk), 
		 .hit(Hit_iDeX), 
		 .ReadData1(ReadData1_iDeX), 
		 .ReadData2(ReadData2_iDeX), 
		 .SignExtendImmediate(SignExtendImmediate_iDeX), 
		 .ALUSrc(ALUSrc_iDeX), 
		 .MemtoReg(MemtoReg_iDeX), 
		 .RegWrite(RegWrite_iDeX), 
		 .MemRead(MemRead_iDeX), 
		 .MemWrite(MemWrite_iDeX), 
		 .Branch(Branch_iDeX), 
		 .ALUOp(ALUOp_iDeX), 
		 .WriteReg(WriteReg_iDeX), 
		 .Opcode(opcode_ControlUnit), 
		 .pc(PC_iDeX), 
		 .hitOut(Hit_ExMem), 
		 .ReadData1Out(ALUReadData1_Execute), 
		 .ReadData2Out(ALUReadData2_Execute), 
		 .SignExtendImmediateOut(Immediate_Execute), 
		 .ALUSrcOut(ALUSrc_Execute), 
		 .MemtoRegOut(MemtoReg_ExMem), 
		 .RegWriteOut(RegWrite_ExMem), 
		 .MemReadOut(MemRead_ExMem), 
		 .MemWriteOut(MemWrite_ExMem), 
		 .BranchOut(Branch_ExMem), 
		 .ALUOpOut(ALUOp_Execute), 
		 .WriteRegOut(writeReg_ExMem), 
		 .OpcodeOut(Opcode_Execute), 
		 .PCOut(PC_Execute)
		 );
	 
	 Execute execute (
		 .clk(clk), 
		 .ALUReadData1(ALUReadData1_Execute), 
		 .ALUReadData2(ALUReadData2_Execute), 
		 .Immediate(Immediate_Execute), 
		 .Opcode(Opcode_Execute), 
		 .ALUOp(ALUOp_Execute), 
		 .ALUSrc(ALUSrc_Execute), 
		 .PC(PC_Execute), 
		 .ALUResult(ALUResult_ExMem), 
		 .Zero(zeroFlag_ExMem), 
		 .AddResult(branchTarget_ExMem)
		 );
		 
	 ExMemRegister exMemRegister (
		 .clk(clk), 
		 .hit(Hit_ExMem), 
		 .branchTarget(branchTarget_ExMem), 
		 .zeroFlag(zeroFlag_ExMem), 
		 .ALUResult(ALUResult_ExMem), 
		 .readData2(ALUReadData2_Execute), ///////
		 .writeReg(writeReg_ExMem), 
		 .MemRead(MemRead_ExMem), 
		 .MemWrite(MemWrite_ExMem), 
		 .Branch(Branch_ExMem), 
		 .RegWrite(RegWrite_ExMem), 
		 .MemtoReg(MemtoReg_ExMem), 
		 .hitOut(Hit_MemWb), 
		 .branchTargetOut(BranchTarget_Fetch), 
		 .zeroFlagOut(zeroFlagOut_And), 
		 .ALUResultOut(address_DataMemory), 
		 .readData2Out(writeData_DataMemory), 
		 .writeRegOut(writeReg_MemWb), 
		 .MemReadOut(MemRead_DataMemory), 
		 .MemWriteOut(MemWrite_DataMemory), 
		 .BranchOut(BranchOut_And), 
		 .RegWriteOut(RegWrite_MemWb), 
		 .MemtoRegOut(MemtoReg_MemWb)
		 );
		 
	 DataMemory dataMemory (
		 .clk(clk), 
		 .address(address_DataMemory), 
		 .writeData(writeData_DataMemory), 
		 .MemRead(MemRead_DataMemory), 
		 .MemWrite(MemWrite_DataMemory), 
		 .readData(readData_MemWb)
		 );
		 
	 MemWbRegister memWbRegister (
		 .clk(clk), 
		 .hit(Hit_MemWb), 
		 .readData(readData_MemWb), 
		 .ALUResult(address_DataMemory), ///////////
		 .writeReg(writeReg_MemWb), 
		 .RegWrite(RegWrite_MemWb), 
		 .MemtoReg(MemtoReg_MemWb), 
		 .hitOut(hitOut), ///////////////
		 .readDataOut(readData_WriteBack), 
		 .ALUResultOut(ALUResult_WriteBack), 
		 .writeRegOut(write_reg_Decode), 
		 .RegWriteOut(RegWrite_Decode), 
		 .MemtoRegOut(MemtoReg_WriteBack)
		 );
		 
	 WriteBack writeBack (
		 .MemtoReg(MemtoReg_WriteBack), 
		 .readData(readData_WriteBack), 
		 .ALUResult(ALUResult_WriteBack), 
		 .writeData(write_data_Decode)
		 );

		 
endmodule
