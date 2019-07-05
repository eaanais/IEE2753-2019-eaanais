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
module test;

  reg clk;
  reg reset;
  reg [8-1:0] din;
  wire [8-1:0] dout;
  
  FIR #(.WIDTH_DATA(8),.WIDTH_COEF(8),.N_TAPS(16), .LOG2_N_TAPS(4), .WIDTH_MAC_OUT(8)) UUT (.clk(clk), .rst(reset),.din(din),.dout(dout));

  always #10 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    clk = 0;
    din = 5;
    reset = 1;
    #40 reset = 0;
 
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
    #5000 $finish();
  end
  
endmodule
