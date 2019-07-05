// contador hacia arriba de N bits
module counter_up #(parameter N = 1)(input clk, clr, output[N-1:0] counter
    );
reg [N-1:0] contador = 0;

// siempre que no este activado el reset cuando hacia arriba
  always @(posedge clk)
begin
  if(clr)
  contador <= 0;
  
  else
  contador <= contador + 1;
end 

assign counter = contador;

endmodule
