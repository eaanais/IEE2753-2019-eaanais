// asr implementado con 8 registros y un multiplexor
module asr8 #(parameter N = 1)(input clk, clr,
                                 input [3-1:0] add,
                                 input [N-1:0] d,
                                 output reg [N-1:0] q
    );

  //salida de cada registro 		
  reg [N-1:0] d1;
  reg [N-1:0] d2;
  reg [N-1:0] d3;
  reg [N-1:0] d4;
  reg [N-1:0] d5;
  reg [N-1:0] d6;
  reg [N-1:0] d7;
  reg [N-1:0] d8;
  
// implemento los registros de forma sincrona
  always @(posedge clk)
    begin
      if(clr)
      d1 <= 0;

      else 
      d1 <= d;
    end 
  
    always @(posedge clk)
      begin
        if(clr)
        d2 <= 0;

        else 
        d2 <= d1;
      end 

    always @(posedge clk)
      begin
        if(clr)
        d3 <= 0;

        else 
        d3 <= d2;
      end 
  
    always @(posedge clk)
      begin
        if(clr)
        d4 <= 0;

        else 
        d4 <= d3;
      end 
  
    always @(posedge clk)
      begin
        if(clr)
        d5 <= 0;

        else 
        d5 <= d4;
      end 
  
    always @(posedge clk)
      begin
        if(clr)
        d6 <= 0;

        else 
        d6 <= d5;
      end 
  
    always @(posedge clk)
      begin
        if(clr)
        d7 <= 0;

        else 
        d7 <= d6;
      end 
  
  
  always @(posedge clk)
    begin
      if(clr)
      d8 <= 0;

      else 
      d8 <= d7;
    end 
  
  
  //multiplexor
  always @*
    case (add)
     0 : q <= d1;
     1 : q <= d2;
     2 : q <= d3;
     3 : q <= d4;
     4 : q <= d5;
     5 : q <= d6;
     6 : q <= d7; 
     7 : q <= d8;
     default : q <= 0;
  endcase
  
endmodule
