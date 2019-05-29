`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2019 22:58:58
// Design Name: 
// Module Name: mips_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mips_tb();


reg clk,  rst;
wire overflow;
wire [31:0] mipsOut;

  mips DUT (
    .clk(clk),
    .rst(rst),
    .overflow(overflow),
    .mipsOut(aluResult)
  );
  
  initial begin  
    $readmemb("emoji.mem",memory);
  end
  
  //sirve para generar el grafico en el sitio online
//  initial begin
//  $dumpfile("dump.vcd");
//  $dumpvars;
//  #100 $finish;
//  end

    initial begin 
    clk = 0;
    forever #5 clk = ~clk;
    end
 
  
  //establezco las condiciones para realizar la prueba
  initial begin
  rst = 0;
   #100 $finish;
  end


endmodule
