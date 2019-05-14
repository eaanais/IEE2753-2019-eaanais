module mux4to1 #(parameter N = 1)(input [1:0] sel, 
                                  input [N-1:0] din0, din1, din2, din3,
                                  output reg [N-1:0] dout
    );
  
  //multiplexor
  always @*
    case (sel)
     0 : dout <= din0;
     1 : dout <= din1;
     2 : dout <= din2;
     3 : dout <= din3;
     default : dout <= din0;
  endcase
  
  
  
endmodule
