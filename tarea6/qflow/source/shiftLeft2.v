module shiftLeft2 (input [32-1:0] din,
                   output [32-1:0] dout
                   );
  
  assign dout = {din[32-3:0],2'b00};
  
endmodule
