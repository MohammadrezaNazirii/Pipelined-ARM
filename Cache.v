`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:28 11/06/2023 
// Design Name: 
// Module Name:    Cache 
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
module Cache(address, data_line, clock, instruction, hit
    );
	 
	input[63:0] address;
	input[127:0] data_line;
	input clock;
	output reg[31:0] instruction;
	output reg hit;
		
	reg[185:0]cache[7:0];
	
	integer cache_index, valid_bit, offset;
	integer i;
	integer count;
	reg [56:0] tag;
	
	initial begin
		hit = 0;
		count = 0;
		
		for(i = 0; i < 8; i = i+1)
			cache[i][185] = 0;
	end
	
	always@(posedge clock)
		begin
			case(count)
				0:begin
					count = count + 1;
					cache_index = address[6:4];
					tag = cache[cache_index][184:128];
					valid_bit = cache[cache_index][185];
					if(address[63:7]==tag && valid_bit) // Hit
						begin
							hit = 1;
							count = 0;
							case(address[3:2])
								2'b11: instruction = cache[cache_index][127:96];
								2'b10: instruction = cache[cache_index][95:64];
								2'b01: instruction = cache[cache_index][63:32];
								2'b00: instruction = cache[cache_index][31:0];
							endcase
						end
					else // Miss
						begin
							hit = 0;
							instruction = 32'bX;
						end
					end
				1:begin
					count = count + 1;
				end
				2:begin
					count = count + 1;
				end
				3:begin
					count = count + 1;
				end
				4:begin
					count = count + 1;
				end
				5:begin
					cache[cache_index][127:0] = data_line;
					cache[cache_index][185] = 1;
					cache[cache_index][184:128] = address[63:7];
					hit = 1;
					count = 0;
					case(address[3:2])
						2'b11: instruction = cache[cache_index][127:96];
						2'b10: instruction = cache[cache_index][95:64];
						2'b01: instruction = cache[cache_index][63:32];
						2'b00: instruction = cache[cache_index][31:0];
					endcase
				end
				
				
				
			endcase
		end


endmodule
