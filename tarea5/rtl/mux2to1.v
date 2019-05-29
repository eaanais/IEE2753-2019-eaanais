module mux2to1 #(parameter N = 1)(input sel, 
                                  input [N-1:0] din0, din1,
                                  output reg [N-1:0] dout
    );
  
  //multiplexor
  always @*
    case (sel)
     0 : dout <= din0;
     1 : dout <= din1;
     default : dout <= din0;
  endcase
  
  
  
endmodule