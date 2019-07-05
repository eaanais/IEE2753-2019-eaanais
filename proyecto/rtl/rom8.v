`timescale 1ns / 1ps
// Modulo rom de 8 direcciones con memoria de N bits
//WIDTH_DATA=8, WIDTH_COEF0=8, N_TAPS=16,LOG2 N_TAPS=4, WIDTH_MAC_OUT=8.
module rom8 #(parameter WIDTH_COEF0=8, parameter N_TAPS = 16)(input clk, clr,
                               input [$clog2(N_TAPS/2)-1:0] add,
                               output reg [WIDTH_COEF0-1:0] q
    );

  //creo el registro de N bits para almacenar 8 direcciones
  reg [WIDTH_COEF0-1:0] rom [(N_TAPS/2)-1:0];
  
  //logica secuancial
  always @(posedge clk) 
    begin
    q <= rom[add];
    end
  
  //logica combinacional
 /* always @(posedge clr)
    begin 
      rom[0] = 0; 
      rom[1] = 0;
      rom[2] = 0;
      rom[3] = 0;
      rom[4] = 0; 
      rom[5] = 0;
      rom[6] = 0;
      rom[7] = 0;
    end */
  
  


  //Inicializacion de la memoria con valores arbitrarios
  initial begin
  //$memreadb
  $readmemb("rom.mem", rom);
 /*   rom[0] = 8; 
    rom[1] = 7;
    rom[2] = 6;
    rom[3] = 5;
    rom[4] = 4; 
    rom[5] = 3;
    rom[6] = 2;
    rom[7] = 1;*/
  end
  
  
  
endmodule