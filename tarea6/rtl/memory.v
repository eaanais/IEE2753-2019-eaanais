`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2019 15:46:27
// Design Name: 
// Module Name: memory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module memory (input clk,
               input memoryWrite,
               input memoryRead,
               input [32-1:0] memoryWriteData,
               input [32-1:0] memoryAddress,
               input rst,
               output [32-1:0] memoryOutData
                   );
  
  reg [32-1:0] memoria[256-1:0];
  integer i;
  
   always @(posedge clk)
    begin
    //si presiono el reset los registros los tiro a 0
 //  if (rst)
  // memoryOutData = memoria[0];
     // for (i = 0; i < 256; i = i + 1) memoria[i] <= 0;
    // si no, de acuerdo al enable copio la info en la memoria
  //	else
      if (memoryWrite) memoria[memoryAddress] <= memoryWriteData;
    end
  
    //la salida es la info de la direccion que quiero leer
  assign memoryOutData = (memoryRead != 0) ? memoria[memoryAddress[9:2]] : 32'b0;

            initial begin
                memoria[0] <= 32'b00100010000010000000000000000011;
                memoria[1] <= 32'b00100010000010010000000000000111;
                memoria[2] <= 32'b00000001000010010101000000100000;

		memoria[3] <= 32'b00000001001010000101000000100010;
		memoria[4] <= 32'b00000001001010000101000000100100;
		memoria[5] <= 32'b00000001001010000101000000100101;

		memoria[6] <= 32'b00000001001010000101000000100110;
		memoria[7] <= 32'b00000001001010000101000000100111;
		memoria[8] <= 32'b10101101000010010000000000011011;
		memoria[9] <= 32'b10001100000010110000000001111000;
		memoria[10] <= 32'b00010101000010010000000000000101;
		memoria[11] <= 32'b00000000000000000000000000000000;
		memoria[12] <= 32'b00000000000000000000000000000000;
		memoria[13] <= 32'b00000000000000000000000000000000;
		memoria[14] <= 32'b00000000000000000000000000000000;
		memoria[15] <= 32'b00000000000000000000000000000000;
		memoria[16] <= 32'b00001000000000000000000000000000;



				// $readmemb("emoji.mem", memoria, 0, 255);
			end
endmodule
