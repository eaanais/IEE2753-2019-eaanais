//testbench con un N = 3
module adder_tb();
 
  reg [3-1:0] a; 
  reg [3-1:0] b;
  wire [3:0] suma;
 
  adder #(.N(3)) DUT (
    .a(a),
    .b(b),
    .suma(suma)
  );
  
  //sirve para generar el grafico en el sitio online
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  #100 $finish;
  end
 
  
  //establezco las condiciones para realizar la prueba
  initial begin
  a = 1;
  b= 1;
  #10;
  a = 3;
  b= 2;
  #10;
  a = 2;
  b= 5;
  #10;
  a = 0;
  b= 1;
  #10;
  a = 4;
  b= 4;
  #10;
  a = 7;
  b= 7;
  #10;
  end
 
endmodule