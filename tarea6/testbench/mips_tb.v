
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2019 22:58:58
// Design Name: 
// Module Name: mips_tb
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


module mips_tb();

reg clk = 0,  rst = 1;
wire memoryWrite;
wire memoryRead;
wire  [32-1:0] MemData;
wire  [32-1:0] MemWriteData;
wire  [32-1:0] MemAddr;


memory memoria_externa(.clk(clk),
               .memoryWrite(memoryWrite),
               .memoryRead(memoryRead),
               .memoryWriteData(MemWriteData),
               .memoryAddress(MemAddr),
               .rst(rst),
               .memoryOutData(MemData)
                   );
  


  mips UUT (
    .clk(clk),
    .rst(rst),
    .MemData(MemData),
    .MemWrite(memoryWrite),
    .MemRead(memoryRead),
    .MemWriteData(MemWriteData),
    .MemAddr(MemAddr)
  );

    initial begin 
    forever #5 clk = ~clk;
    end

  
  //establezco las condiciones para realizar la prueba
  initial begin
  $dumpfile("mips_sintesis_tb.vcd");
  $dumpvars(0,mips_tb);
  #100;
  rst = 0;
  #700 $finish;
  end


  initial
     $monitor("At time %t, value = %h (%0d)",
              $time, MemAddr, MemAddr);

endmodule
