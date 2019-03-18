// Modulo registro, copia la entrada a la salida de acuerdo al reset y enable
module register #(parameter N = 1)(input clk, clr, en,
                                   input [N-1:0] d,
                                   output reg [N-1:0] q
    );

// solo si esta habilitado (en) puede cambiar el registro, con reset (clr) se resetea
  always @(posedge clk)
begin
  if(clr & en)
  q <= 0;
  
  else if (en)
  q <= d;
  
  else
  q <= q;
  
end 


endmodule