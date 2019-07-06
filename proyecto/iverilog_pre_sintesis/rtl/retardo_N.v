`timescale 1ns / 1ps

//WIDTH_DATA tamaño de la info
//WIDTH_DATA=8, WIDTH_COEF0=8, N_TAPS=16,LOG2 N_TAPS=4, WIDTH_MAC_OUT=8.
module retardo_N(input clk,
                input reset,
                input enable,
                 input [WIDTH_DATA-1:0] data_in,
                 output [WIDTH_DATA-1:0] data_out);

parameter WIDTH_DELAY = 4;
parameter WIDTH_DATA = 8;


  //creo todos los cables para unir
wire [WIDTH_DATA-1:0]connect_wire[WIDTH_DELAY:0];

//asigno con multiplexor la salida y la entrada
assign data_out = connect_wire[WIDTH_DELAY];
assign connect_wire[0] = data_in;

//genero los registros
genvar i;
generate //creo los registros necesarios
  for (i=0; i < WIDTH_DELAY; i=i+1) 
       begin
       register #(.N(WIDTH_DATA)) retardos (
       .clk(clk),
       .clr(reset),
       .en(enable),
       .d(connect_wire[i]),
       .q(connect_wire[i+1])
       );
       end
endgenerate


/*

wire [(WIDTH_DATA*(WIDTH_DELAY+1))-1:0] connect_wire;

assign data_out = connect_wire[(WIDTH_DATA*WIDTH_DELAY)+WIDTH_DATA-1:(WIDTH_DATA*WIDTH_DELAY)];
assign connect_wire[WIDTH_DATA-1:0] = data_in;

genvar i;
generate //creo los registros necesarios
  for (i=0; i < WIDTH_DELAY; i=i+1) 
       begin
       register #(.N(WIDTH_DATA)) retardos (
       .clk(clk),
       .clr(reset),
       .en(enable),
         .d(connect_wire[i+WIDTH_DATA-1: i]),
         .q(connect_wire[i+WIDTH_DATA+WIDTH_DATA-1:i+WIDTH_DATA])
       );
       end
       
endgenerate */









endmodule


