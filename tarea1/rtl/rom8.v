// Modulo rom de 8 direcciones con memoria de N bits
module rom8 #(parameter N = 1)(input clk, clr,
                               input [3-1:0] add,
                               output reg [N-1:0] q
    );

  //creo el registro de N bits para almacenar 8 direcciones
  reg [N-1:0] rom [0:8-1];
  
  //logica secuancial
  always @(posedge clk) 
    begin
    q <= rom[add];
    end
  
  //logica combinacional
  always @(posedge clr)
    begin 
      rom[0] = 0; 
      rom[1] = 0;
      rom[2] = 0;
      rom[3] = 0;
      rom[4] = 0; 
      rom[5] = 0;
      rom[6] = 0;
      rom[7] = 0;
    end 
  
  


  //Inicializacion de la memoria con valores arbitrarios
  initial begin
    rom[0] = 8; 
    rom[1] = 7;
    rom[2] = 6;
    rom[3] = 5;
    rom[4] = 4; 
    rom[5] = 3;
    rom[6] = 2;
    rom[7] = 1;
  end
  
  
endmodule