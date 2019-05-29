module alu (input [32-1:0] aluInA,
              input [32-1:0] aluInB,
              input [4-1:0] aluControl,
              output reg [32-1:0] aluResult,
              output reg aluZero, 
              output wire aluOverflow
    );
  
  //me permite fijar el overflow
  wire [32-1:0] aux_over;
  assign {aluOverflow, aux_over} = {1'b0,aluInA}+{1'b0,aluInB};
  
  //detecto si la salida efectivamente es un cero
  always @*
    if (aluResult == 32'd0)
      aluZero = 1'b1;
  	else
      aluZero = 1'b0;
  
  //logica combinacional caso por caso para la operacion
  always @*
    case (aluControl)
     4'b0000 : aluResult = aluInA & aluInB; //AND
     4'b0001 : aluResult = aluInA | aluInB; //OR
     4'b0010 : aluResult = aluInA + aluInB;	//Suma
     4'b0101 : begin if(aluInA != aluInB) aluResult = 32'd0; end//beq
     4'b0110 : aluResult = aluInA - aluInB; //Resta
     4'b1100 : aluResult = ~(aluInA | aluInB); //NOR
     4'b1101 : aluResult = aluInA ^ aluInB;  //XOR
     default : aluResult = aluInA + aluInB; //Por defecto realizo la suma
  endcase

endmodule
