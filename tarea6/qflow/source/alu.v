`timescale 1ns / 1ps
module alu (input [32-1:0] aluInA,
              input [32-1:0] aluInB,
              input [4-1:0] aluControl,
              output reg [32-1:0] aluResult,
              output reg aluZero, 
              output  reg aluOverflow
    );
  
  //me permite fijar el overflow
  wire [33-1:0] aux_over;
  assign aux_over = {1'b0,aluInA}+{1'b0,aluInB};
  
  always@*
      if (aux_over[32]==1)
      aluOverflow =  1;
      else
      aluOverflow =  0;
  
  
  //detecto si la salida efectivamente es un cero
//  always @*
//    case(aluResult)
//    32'b0: aluZero = 1'b1;
//    default: aluZero = 1'b0;
////    if (aluResult == 32'd0)
////      aluZero = 1'b1;
////  	else
////      aluZero = 1'b0;
//  endcase
  //logica combinacional caso por caso para la operacion
  always @*
    case (aluControl)
     4'b0000 : begin aluResult = aluInA & aluInB; aluZero = 0; end//AND
     4'b0001 : begin aluResult = aluInA | aluInB; aluZero = 0; end//OR
     4'b0010 : begin aluResult = aluInA + aluInB;	aluZero = 0; end//Suma
     
     4'b1000 : begin 
                   if(aluInA == aluInB) 
                       begin
                       aluResult = 32'd0; 
                       aluZero = 1;
                       end
                   else
                       begin
                       aluResult = 32'd0; 
                       aluZero = 0;
                       end
               end//beq
     
     
     
     4'b1001 : begin 
               if(aluInA != aluInB) 
                    begin 
                    aluResult = 32'd0; 
                    aluZero = 1;
                    end 
                else 
                    begin
                    aluResult = 32'd0; 
                    aluZero = 0;
                    end
                
                end//bne
                    
     
     4'b0110 : begin aluResult = aluInA - aluInB; aluZero = 0; end//Resta
     4'b1100 : begin aluResult = ~(aluInA | aluInB); aluZero = 0; end//NOR
     4'b1101 : begin aluResult = aluInA ^ aluInB;  aluZero = 0; end//XOR
     default : begin aluResult = 0; aluZero = 0; end//Por defecto realizo la suma
  endcase
endmodule

