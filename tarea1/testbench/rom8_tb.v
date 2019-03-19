//testbench con un N = 4
module rom8_tb();
 
  reg clk, clr;
  reg [3-1:0] add; 
  wire [4-1:0] q;
 
  rom8 #(.N(4)) DUT (
    .clk(clk),
    .clr(clr),
    .add(add),
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
  add = 0;
  #10;
  add = 1;
  #10;
  add = 2;
  #10;
  add = 3;
  #10;
  add = 4;
  #10; 
  add = 5;
  #10;
  add = 6;
  #10;
  add = 7;
  #10;
  clr = 1;  
  end
 
endmodule