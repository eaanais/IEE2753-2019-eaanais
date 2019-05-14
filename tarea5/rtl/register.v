module register #(parameter N = 1)(input [N-1:0] din, 
                                   input clk, en, rst,
                                   output reg [N-1:0] dout
    );

  
  
// siempre que no este activado el reset cuando hacia arriba
  //debo cambiar la jerarquia del enable
  always @(posedge clk)
begin
  if(rst)
  dout <= 0;
  
  else if (en)
  dout <= din;
  
  else
  dout <= dout;
  
end 


endmodule