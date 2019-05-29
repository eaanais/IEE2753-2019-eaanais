`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2019 18:08:52
// Design Name: 
// Module Name: control
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


module control(input  [5:0] 	op,
               input  		rst,
               input			clk,
                
               output reg PCWriteCond,PCWrite,IorD,MemRead,MemWrite,MemtoReg,IRWrite,RegWrite,RegDst,ALUSrcA,
               output reg [1:0]  PCSource, ALUSrcB,
               output reg [1:0]  ALUOp
    );
    
    reg[4-1:0]state, nextState;
    
    parameter fetch = 4'd0;
    parameter decode = 4'd1;
    parameter memAdr = 4'd2;
    parameter memRead = 4'd3;
    parameter memWriteback = 4'd4;
    parameter memWrite = 4'd5;
    parameter execute = 4'd6;
    parameter aluWriteback = 4'd7;
    parameter branch = 4'd8;
    parameter addiExecute = 4'd9;
    parameter addiWriteback = 4'd10;
    parameter jump = 4'd11;
    parameter branch_2 = 4'd12;
    
    parameter sw = 6'b101011;
    parameter lw = 6'b100011;
    parameter beq = 6'b000100;
    parameter bne = 6'b000101;
    parameter addi = 6'b001000;
    parameter j = 6'b000010;
    parameter r = 6'b000000;
    
    
    //creo la maquina de estados
    always@(posedge clk)
    if (rst)
    state <= 4'd0;
    else
    state <= nextState;
    
    //defino los estados
    always@*
    case(state)
    fetch:
        begin
        IorD = 0;
        ALUSrcA = 0;
        ALUSrcB = 2'b01;
        ALUOp = 2'b00;
        PCSource = 2'b00;
        IRWrite = 1;
        PCWrite = 1;
        nextState = decode;
        end
        
    decode:
        begin
        ALUSrcA = 0;
        ALUSrcB = 2'b11;
        ALUOp = 2'b00;
        if((op == lw)|(op == sw))
            nextState = memAdr;
        else if (op == r)
            nextState = execute;
        else if (op == beq)
            nextState = branch;
        else if (op == bne)
            nextState = branch_2;
        else if (op == addi)
            nextState = addiExecute;
        else if (op == j)
            nextState = jump;
        end
        
    memAdr: 
        begin
        ALUSrcA = 1;
        ALUSrcB = 2'b10;
        ALUOp = 2'b00;
        if(op == lw)
            nextState = memRead;
        else if (op == sw)
            nextState = memWrite;
        end
   
   memRead:
        begin
        IorD = 1;
        nextState = memWriteback;
        end
        
    memWriteback:
        begin
        RegDst = 0;
        MemtoReg = 1;
        RegWrite = 1;
        nextState = fetch;
        end
        
    memWrite:
        begin
        IorD = 1;
        MemWrite = 1;
        nextState = fetch;
        end
 
    execute:
        begin
        ALUSrcA =1;
        ALUSrcB = 2'b00;
        ALUOp = 2'b10;
        nextState = aluWriteback;
        end
 
     aluWriteback:
        begin
        RegDst = 1;
        MemtoReg = 0;
        RegWrite = 1;
        nextState = fetch;
        end
        
    branch: 
        begin
        ALUSrcA = 1;
        ALUSrcB = 2'b00;
        ALUOp = 2'b00;
        PCSource = 2'b01;
        PCWriteCond = 1;
        nextState = fetch;
        end
        
    addiExecute: 
        begin
        ALUSrcA = 1;
        ALUSrcB = 2'b10;
        ALUOp = 2'b00;
        nextState = addiWriteback;
        end
        
     addiWriteback:
        begin
        RegDst = 0;
        MemtoReg = 0;
        RegWrite = 1;
        nextState = fetch;
        end
        
     jump: 
        begin
        PCSource = 2'b10;
        PCWrite = 1;
        nextState = fetch;
        end
 
     branch_2:
        begin
        ALUSrcA = 1;
        ALUSrcB = 2'b00;
        ALUOp = 2'b10;
        PCSource = 2'b01;
        PCWriteCond = 1;
        nextState = fetch;
        end
        
     default:
        begin
        nextState = fetch;
        end
        
        
    endcase
    
    
endmodule
