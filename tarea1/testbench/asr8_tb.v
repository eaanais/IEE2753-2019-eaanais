//testbench con un N = 3
module asr8_tb();
 
  reg clk, clr;
  reg [3-1:0] add;
  reg [4-1:0] d; 
  wire [4-1:0] q;
 
  asr8 #(.N(4)) DUT (
    .clk(clk),
    .clr(clr),
    .add(add),
    .d(d),
    .q(q)
  );
  
  //sirve para generar el grafico en el sitio online
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  #200 $finish;
  end
 
  //creo el clk
  initial begin 
  clk = 1;
  forever #5 clk = ~clk;
  end
  
  //establezco las condiciones para realizar la prueba
  initial begin
  clr = 0;
  add = 4;
  d = 3;
  #10;
  d = 2;
  #10;
  d = 4;
  #10;
  d = 5;
  #10;
  d = 0;
  #10;  
  d = 0;
  #4;
  add = 5;
  #6 
  add = 4;  
  d = 0;
  #10;
  d = 0;
  #10; 
  clr = 1;
  #10;
  end
 
endmodule