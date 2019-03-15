// Code your design here
module up_counter #(parameter N = 1)(input clk, clr, output[N-1:0] counter
    );
reg [N-1:0] counter_up;

// up counter
  always @(posedge clk or posedge clr)
begin
  if(clr)
 counter_up <= 0;
else
 counter_up <= counter_up + 1;
end 

assign counter = counter_up;

endmodule

//testbench
module basic_and_tb();
 
  reg clk, clr;
  wire [3-1:0] counter;
 
  up_counter #(.N(3)) DUT (
    .clk(clk),
    .clr(clr),
    .counter(counter)
  );
  
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  #200 $finish;
  end
 
  
  initial begin 
  clk=0;
  forever #5 clk=~clk;
  end
  
  initial begin
  clr=1;
  #20;
  clr=0;
  #10;
  clr=1;
  #10;
  clr=0;
  end
 
endmodule