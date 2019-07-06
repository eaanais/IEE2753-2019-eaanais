// Suma las entradas de N bits y salida con N+1 bits
module adder #(parameter N = 1)(input clk,
                                input [N-1:0] a,
                                input [N-1:0] b,
                                output reg [N:0] suma
    );

wire [N:0]suma_previa;
// Se suman las entradas y la salida ya contiene un bit extra para que no sature
  assign suma_previa = a + b;
  
  always@(posedge clk)
  begin
  suma <= suma_previa;
  end

endmodule

