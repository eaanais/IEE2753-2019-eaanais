// asr implementado con 8 registros y un multiplexo
//WIDTH_DATA=8, WIDTH_COEF0=8, N_TAPS=16,LOG2 N_TAPS=4, WIDTH_MAC_OUT=8.
module asr8 #(parameter WIDTH_DATA = 8, parameter N_TAPS = 16)(input clk, clr, en,
                                 input [$clog2(N_TAPS)-1:0] add,
                                 input [WIDTH_DATA-1:0] d,
                                 output [WIDTH_DATA-1:0] q
    );

  //creo todos los cables para unir
wire [WIDTH_DATA-1:0]cables[N_TAPS:0];

//asigno con multiplexor la salida y la entrada
assign q = cables[add+1];
assign cables[0] = d;

//genero los registros
genvar i;
generate //creo los registros necesarios
  for (i=0; i < N_TAPS; i=i+1) 
       begin
       register #(.N(WIDTH_DATA)) retardos (
       .clk(clk),
       .clr(clr),
       .en(en),
       .d(cables[i]),
       .q(cables[i+1])
       );
       end
endgenerate

endmodule
