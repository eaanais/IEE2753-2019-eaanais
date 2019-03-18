// contador hacia abajo de N bits
module counter_down #(parameter N = 1)(input clk, clr, output[N-1:0] counter
    );
reg [N-1:0] contador;

// siempre que no este activado el reset cuando hacia arriba
  always @(posedge clk)
begin
  if(clr)
  contador <= 2**N-1;
  
  else
  contador <= contador - 1;
end 

assign counter = contador;

endmodule
