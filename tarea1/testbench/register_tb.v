//testbench con un N = 3
module register_tb();
 
  reg clk, clr, en;
  reg [3-1:0] d; 
  wire [3-1:0] q;
 
  register #(.N(3)) DUT (
    .clk(clk),
    .clr(clr),
    .en(en),
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
  // compruebo la prioridad del enable sobre el reset y que funcione bien
  initial begin
  clr = 0;
  en = 1;
  d = 2;
  #20;
  clr = 0;
  en = 1;
  d = 3;
  #5;
  clr = 1;
  en = 1;
  d = 3;
  #10;
  clr = 0;
  en = 0;
  d = 1;
  #50;
  clr = 0;
  en = 1;
  d = 1;
  #10;
  end
 
endmodule