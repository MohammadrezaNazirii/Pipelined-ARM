`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:50:39 10/30/2023 
// Design Name: 
// Module Name:    PC 
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
module PC(Addrss, Hit, Clock, Address
    );
	 input [63:0] Addrss;
    input Clock;
    input Hit;
    output reg [63:0] Address;
	 
	 initial Address = 0;

    always @ (negedge Clock) begin
		  if(Hit)
				Address = Addrss;
    end
	 


endmodule
