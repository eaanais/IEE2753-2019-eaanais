module signExtend (input [16-1:0] din,
                   output wire [32-1:0] dout
                   );
  
  assign dout = {{16{din[15]}},din};
  
endmodule