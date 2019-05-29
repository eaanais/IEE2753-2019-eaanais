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
            output overflow,
            output [31:0] mipsOut
            );
   
    
wire PCWriteCond, PCWrite, IorD, MemRead, MemWrite, MemtoReg, IRWrite, RegWrite, RegDst, ALUSrcA;
wire [1:0]  PCSource, ALUSrcB;
wire [1:0]  ALUOp;

wire [3:0] aluControl;

wire [31:0] 	instruction;
wire [31:0] 	ALUOut;
   
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
                      .MemRead(MemRead),
                      .MemWrite(MemWrite),
                      .MemToReg(MemtoReg),
                      .IRWrite(IRWrite),
                      .ALUControl(aluControl),
                      .instruction(instruction),//output
                      .overflow(overflow),
                      .ALUOut(ALUOut)
                );
                
aluControl aluControl_1 (.aluOp(ALUOp),
                   .inst(instruction),
                   .aluControl(aluControl)//output
    );
    
control control_1(.op(instruction[31:26]),
               .rst(rst),
               .clk(clk),
               .PCWriteCond(PCWriteCond),//output
               .PCWrite(PCWrite),
               .IorD(IorD),
               .MemRead(MemRead),
               .MemWrite(MemWrite),
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
