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
               // memoria[0] <= 32'b00100010000010000000000000000011;
               // memoria[1] <= 32'b00100010000010010000000000000111;
               // memoria[2] <= 32'b00000001000010010101000000100000;
				 $readmemb("emoji.mem", memoria);
			end
endmodule