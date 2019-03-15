//testbench con un N = 3
module counter_down_tb();
 
  reg clk, clr;
  wire [3-1:0] counter;
 
  counter_down #(.N(3)) DUT (
    .clk(clk),
    .clr(clr),
    .counter(counter)
  );
  
  //sirve para generar el grafico en el sitio online
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  #200 $finish;
  end
 
  //creo el clk
  initial begin 
  clk = 0;
  forever #5 clk = ~clk;
  end
  
  //establezco las condiciones para realizar la prueba
  initial begin
  clr = 1;
  #20;
  clr = 0;
  #10;
  clr = 1;
  #10;
  clr = 0;
  #50;
  clr = 1;
  #10;
  clr = 0;
  end
 
endmodule