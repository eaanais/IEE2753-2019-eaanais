`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2019 16:50:11
// Design Name: 
// Module Name: FIR
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


module FIR #(parameter WIDTH_DATA=8, parameter WIDTH_COEF=8, parameter N_TAPS=16,
parameter LOG2_N_TAPS=4, parameter WIDTH_MAC_OUT=8)(input clk, rst,
input [WIDTH_DATA-1:0] din,
output [WIDTH_DATA-1:0] dout

);


wire clock_chico; //permite dividir el clock
//wire enable_clk_delay;
wire [WIDTH_DATA-1:0] entrada_asr_uno;
wire [WIDTH_DATA-1:0] salida_asr_uno;
wire [WIDTH_DATA-1:0] salida_asr_dos;
wire [WIDTH_DATA-1:0] salida_delay_asr_uno;
wire [WIDTH_DATA-1:0] salida_delay_asr_dos;
wire [WIDTH_DATA-1:0] salida_rom;
wire [WIDTH_DATA-1:0] salida_rom_delay;
wire [WIDTH_DATA:0] salida_sumador;
wire [WIDTH_MAC_OUT-1:0] salida_mac;
wire [WIDTH_MAC_OUT-1:0] salida_mac_delay;
reg enable_asr = 0;
wire enable_asr_delay;
wire enable_mac_delay;
wire negado;

assign negado = ~clock_chico;

//registro de entrada
register #(.N(WIDTH_DATA))registro_entrada (.clk(clock_chico),.clr(rst),.en(1'b1),.d(din),.q(entrada_asr_uno));

wire [$clog2(WIDTH_DATA)-1:0] contador_up;
wire [$clog2(WIDTH_DATA)-1:0] contador_down;

asr8 #(.WIDTH_DATA(WIDTH_DATA), .N_TAPS(N_TAPS/2)) asr1 (.clk(clock_chico), .clr(rst), .en(1'b1), .add(contador_up), .d(entrada_asr_uno), .q(salida_asr_uno));
asr8 #(.WIDTH_DATA(WIDTH_DATA), .N_TAPS(N_TAPS/2)) asr2 (.clk(enable_asr_delay), .clr(rst), .en(negado), .add(contador_down), .d(salida_asr_uno), .q(salida_asr_dos));

counter_up #(.N($clog2(N_TAPS/2))) up_counter (.clk(clk),.clr(rst),.counter(contador_up));
counter_down #(.N($clog2(N_TAPS/2))) down_counter (.clk(clk), .clr(rst), .counter(contador_down)
);
divisor_clock #(.N_TAPS(N_TAPS)) generador_clock(.rst(rst), .clock_in(clk), .clock_out(clock_chico));

    
//comparador
always @(posedge clk)
begin
    if (rst)
    enable_asr <= 0;
    else if(contador_up == 0)
    enable_asr <= 1;
    else
    enable_asr <= 0;
end


retardo_N #(.WIDTH_DELAY((N_TAPS/2)-3), .WIDTH_DATA(1)) retardo_clock_chico(.clk(clk),
                .reset(rst),
                .enable(1'b1),
                .data_in(enable_asr),
                .data_out(enable_asr_delay));
                
retardo_N #(.WIDTH_DELAY((N_TAPS/2)+2), .WIDTH_DATA(1)) retardo_clock_mac(.clk(clk),
                .reset(rst),
                .enable(1'b1),
                .data_in(enable_asr),
                .data_out(enable_mac_delay));
                
retardo_N #(.WIDTH_DELAY(1), .WIDTH_DATA(WIDTH_DATA)) retardo_asr_1(.clk(clk),
                .reset(rst),
                .enable(1'b1),
                .data_in(salida_asr_uno),
                .data_out(salida_delay_asr_uno));
                
retardo_N #(.WIDTH_DELAY(1), .WIDTH_DATA(WIDTH_DATA)) retardo_asr_2(.clk(clk),
                .reset(rst),
                .enable(1'b1),
                .data_in(salida_asr_dos),
                .data_out(salida_delay_asr_dos));
                
 adder #(.N(WIDTH_DATA)) sumador (.clk(clk),.a(salida_delay_asr_uno),
                                .b(salida_delay_asr_dos),
                                .suma(salida_sumador)
    );
                
rom8 #(.WIDTH_COEF0(WIDTH_COEF), .N_TAPS(N_TAPS)) memoria (.clk(clk), .clr(rst),
                               .add(contador_up),
                               .q(salida_rom)
    );               

retardo_N #(.WIDTH_DELAY(1), .WIDTH_DATA(WIDTH_DATA)) retardo_rom(.clk(clk),
                .reset(rst),
                .enable(1'b1),
                .data_in(salida_rom),
                .data_out(salida_rom_delay));
                
MAC #(.WIDTH_DATA(WIDTH_DATA), .WIDTH_COEF0(WIDTH_COEF), .WIDTH_MAC_OUT(WIDTH_MAC_OUT)) MAC
  									  (.clk(clk), .clr(enable_mac_delay),
                                       .Adder(salida_sumador),
                                       .ROM(salida_rom_delay),
                                       .MAC_out(salida_mac)

    );
    
retardo_N #(.WIDTH_DELAY(1), .WIDTH_DATA(WIDTH_MAC_OUT)) retardo_mac_salida(.clk(clk),
                .reset(rst),
                .enable(enable_mac_delay),
                .data_in(salida_mac),
                .data_out(salida_mac_delay));
                
register #(.N(WIDTH_MAC_OUT))registro_salida (.clk(clock_chico),.clr(rst),.en(1'b1),.d(salida_mac_delay),.q(dout));
                
                
endmodule
