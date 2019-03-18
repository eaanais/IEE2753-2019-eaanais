// Retraso de 2 registros
module delay2 #(parameter N = 1)(input clk, clr,
                                   input [N-1:0] d,
                                   output reg [N-1:0] q
    );
	
  //creo la conexion entre los dos registros
  reg [N-1:0] mid;
  
// primero secuencio el primer registro
  always @(posedge clk)
begin
  if(clr)
  mid <= 0;
  
  else 
  mid <= d;
  
end 

  //luego el 2 registro
  always @(posedge clk)
begin
  if(clr)
  q <= 0;
  
  else 
  q <= mid;
  
end 
  
  
endmodule