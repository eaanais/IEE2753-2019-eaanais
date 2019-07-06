`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2019 16:54:35
// Design Name: 
// Module Name: test
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


// Testbench
module fir2n_tb;

  reg clk = 0;
  reg reset = 1;
  reg [8-1:0] din = 8'd1;
  wire [8-1:0] dout;
  
  FIR UUT (.clk(clk), .rst(reset),.din(din),.dout(dout));

  always #10 clk = ~clk;
  
   initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    //clk = 0;
    //din = 1;
    //reset = 1;
    #40 reset = 0;
    #340 din = 8'd0;
    /*
    #10 reset =0;
    Add = 5;
    repeat (5)
      #20 $display("data_in:%b, data_out:%b",
        Add, q);
    Add = 1;
    repeat (10)
      #20 $display("data_in:%b, data_out:%b",
        Add, q);
    Add = 0;
    repeat (10)
      #20 $display("data_in:%b, data_out:%b",
        Add, q);*/
    #6200 $finish();
  end

initial
begin
     $display("clk, clk chico, entrada, rom, asr 1, asr 2, suma, mac, salida");
    $monitor("%d, ",UUT.clk, "%d, ",UUT.clock_chico, "%d, ",UUT.din, "%d, ",UUT.salida_rom, "%d, ",UUT.salida_asr_uno, "%d, ",UUT.salida_asr_dos, "%d, ",UUT.salida_sumador, "%d, ",UUT.salida_mac, "%d, ",UUT.dout);
end

endmodule
