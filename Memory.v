`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:57 10/30/2023 
// Design Name: 
// Module Name:    Memory 
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
module Memory(Address, Clock, Data_Line
    );
    input [63:0] Address;
    input Clock;
    output reg [127:0] Data_Line;

    reg [7:0] Memory [1023:0];
    integer counter;
    integer i;
    reg [63:0] temp;
    initial begin
        counter = 0;
        //for(i=0;i<1024;i = i + 1)begin
        //    Memory[i] = i%64;
        //end
		  $readmemb("instructions.txt", Memory);
    end

    always @(posedge Clock) begin
        case (counter)
        0:begin
            temp[63:4] = Address[63:4];
            temp[3:0] = 0;
            counter = counter + 1;
        end
        1:begin
            counter = counter + 1;
            if(temp[63:4] != Address[63:4]) begin
                temp[63:4] = Address[63:4];
                counter = 1;
            end
        end
        2:begin
            counter = counter + 1;
            if(temp[63:4] != Address[63:4]) begin
                temp[63:4] = Address[63:4];
                counter = 1;
            end
        end
        3:begin
            counter = counter + 1;
            if(temp[63:4] != Address[63:4]) begin
                temp[63:4] = Address[63:4];
                counter = 1;
            end
        end
        4:begin
            if(temp[63:4] != Address[63:4]) begin
                temp[63:4] = Address[63:4];
                counter = 1;
            end
            else begin
                counter = 0;
                Data_Line[7:0] = Memory[temp];
                Data_Line[15:8] = Memory[temp+1];
                Data_Line[23:16] = Memory[temp+2];
                Data_Line[31:24] = Memory[temp+3];
                Data_Line[39:32] = Memory[temp+4];
                Data_Line[47:40] = Memory[temp+5];
                Data_Line[55:48] = Memory[temp+6];
                Data_Line[63:56] = Memory[temp+7];
                Data_Line[71:64] = Memory[temp+8];
                Data_Line[79:72] = Memory[temp+9];
                Data_Line[87:80] = Memory[temp+10];
                Data_Line[95:88] = Memory[temp+11];
                Data_Line[103:96] = Memory[temp+12];
                Data_Line[111:104] = Memory[temp+13];
                Data_Line[119:112] = Memory[temp+14];
                Data_Line[127:120] = Memory[temp+15];
            end
        end
        endcase
    end

endmodule
