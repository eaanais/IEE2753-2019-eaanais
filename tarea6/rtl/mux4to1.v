module mux4to1 (input [1:0] sel, 
                                  input [32-1:0] din0, din1, din2, din3,
                                  output reg [32-1:0] dout
    );
  
  //multiplexor
  always @*
    case (sel)
     2'd0 : dout = din0;
     2'd1 : dout = din1;
     2'd2 : dout = din2;
     2'd3 : dout = din3;
     default : dout = din0;
  endcase
  
  
  
endmodule