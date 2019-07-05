`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2019 15:48:31
// Design Name: 
// Module Name: MAC
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


module MAC #(parameter WIDTH_DATA = 8, parameter  WIDTH_COEF0 = 8, parameter WIDTH_MAC_OUT = 8)
  									  (input clk, clr,
                                       input [WIDTH_DATA:0]Adder,
                                       input [WIDTH_COEF0-1:0]ROM,
                                       output [WIDTH_MAC_OUT-1:0] MAC_out

    );
  
  wire [WIDTH_DATA+WIDTH_COEF0:0]producto;
  assign producto = Adder * ROM;
  
  wire [WIDTH_DATA+WIDTH_COEF0+1:0]suma;
  reg [WIDTH_DATA+WIDTH_COEF0+1:0]salida_correcta = 0;
  
  assign suma = producto + salida_correcta; 
  
  always @(posedge clk)
     begin
       if(clr)
         salida_correcta <= producto;
       else
         salida_correcta <= suma;
	  end 
  
  assign MAC_out = salida_correcta[WIDTH_MAC_OUT-1:0];
  
  
endmodule
