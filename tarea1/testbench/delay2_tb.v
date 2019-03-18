//testbench con un N = 3
module delay2_tb();
 
  reg clk, clr;
  reg [3-1:0] d; 
  wire [3-1:0] q;
 
  delay2 #(.N(3)) DUT (
    .clk(clk),
    .clr(clr),
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
  d = 2;
  #20;
  clr = 1;
  d = 2;
  #5;
  clr = 0;
  d = 5;
  #20;
  clr = 1;
  d = 5;
  #10;
  end
 
endmodule