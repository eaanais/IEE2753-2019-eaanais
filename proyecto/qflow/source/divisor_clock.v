`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2019 20:26:02
// Design Name: 
// Module Name: divisor_clock
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


module divisor_clock #(parameter N_TAPS = 16)(input rst, input clock_in, output clock_out

    );

reg [$clog2(N_TAPS)-1:0] counter = 0;

always @(posedge clock_in)
begin
 counter <= counter + 1;
 if (rst)
 counter <= 0;
 else if(counter>=(N_TAPS-1))
  counter <= 28'd0;
end
assign clock_out = (counter<N_TAPS/2)?1'b1:1'b0;
endmodule

