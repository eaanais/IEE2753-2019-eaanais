`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2019 18:08:52
// Design Name: 
// Module Name: mips
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


module mips(input clk,  rst,
            input [32-1:0] MemData, //salida de la memoria
                           
            output MemWrite, //salidas para pasarsela a la memoria
            output MemRead,
            output [32-1:0] MemWriteData,
            output [32-1:0] MemAddr
            );
   
   
wire PCWriteCond, PCWrite, IorD, MemtoReg, IRWrite, RegWrite, RegDst, ALUSrcA;
wire [1:0]  PCSource, ALUSrcB;
wire [1:0]  ALUOp;

wire [3:0] aluControl;

wire [31:0] 	instruction;
wire [31:0]  mipsOut;

wire overflow;



   
datapath datapath_1  (.clk(clk),
                      .rst(rst), 
                      .PCSource(PCSource), 
                      .ALUSrcB(ALUSrcB), 
                      .ALUSrcA(ALUSrcA),
                      .RegWrite(RegWrite),
                      .RegDst(RegDst),
                      .PCWriteCond(PCWriteCond),
                      .PCWrite(PCWrite),
                      .IorD(IorD),
                      .MemToReg(MemtoReg),
                      .IRWrite(IRWrite),
                      .ALUControl(aluControl),
                      .RD(MemData),
                      .B(MemWriteData),
                      .Adr(MemAddr),
                      .instruction(instruction),//output
                      .overflow(overflow),
                      .ALUOut(mipsOut)
                );
                
aluControl aluControl_1 (.aluOp(ALUOp),
                   .inst(instruction[5:0]),
                   .aluControl(aluControl)//output
    );
    
control control_1(.op(instruction[31:26]),
               .rst(rst),
               .clk(clk),
               .PCWriteCond(PCWriteCond),//output
               .PCWrite(PCWrite),
               .IorD(IorD),
               .MemRead(MemRead), //<-----
               .MemWrite(MemWrite),//<-----
               .MemtoReg(MemtoReg),
               .IRWrite(IRWrite),
               .RegWrite(RegWrite),
               .RegDst(RegDst),
               .ALUSrcA(ALUSrcA),
               .PCSource(PCSource), 
               .ALUSrcB(ALUSrcB),
               .ALUOp(ALUOp)
    );
    
    
    
    
    
endmodule
