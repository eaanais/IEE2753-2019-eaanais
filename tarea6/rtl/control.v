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
                
               output reg PCWriteCond,
               output reg PCWrite,IorD,MemRead,MemWrite,MemtoReg,IRWrite,RegWrite,RegDst,ALUSrcA,
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
    
    initial begin
    state <= fetch;
    end
    
    //creo la maquina de estados
    always@(posedge clk)
    if (rst)
    state <= 4'd0;
    else
    state <= nextState;
    
    //defino los estados
    always@*
        
    case(state)
    fetch: // IRWrite MemWrite MemRead PCWrite PCWriteCond  RegWrite 
        begin //IorD  MemtoReg RegWrite  RegDst ALUSrcA ALUSrcB ALUOp
        RegWrite=0;
        MemtoReg = 0;
        RegDst = 0;
        IorD = 0;
        ALUSrcA = 0;
        ALUSrcB = 2'b01;
        ALUOp = 2'b00;
        PCSource = 2'b00;
        IRWrite = 1;
        PCWrite = 1;
        MemRead = 1;
        MemWrite = 0;
        PCWriteCond = 0;
        nextState = decode;
        end
        
    decode: // IRWrite MemWrite MemRead PCWrite PCWriteCond  RegWrite 
    //IorD  MemtoReg RegWrite  RegDst ALUSrcA ALUSrcB ALUOp
        begin
        IorD = 0;
        MemtoReg = 0;
        RegDst = 0;
        IRWrite = 0;
        PCSource = 2'b00;
        RegWrite=0;
        MemRead = 1;
        MemWrite = 0;
        PCWriteCond = 0;
        PCWrite = 0;
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
        else
            nextState = fetch;
        end
        
    memAdr: // IRWrite MemWrite MemRead PCWrite PCWriteCond  RegWrite 
    //IorD  MemtoReg RegWrite  RegDst ALUSrcA ALUSrcB ALUOp
        begin
        IorD = 0;
        MemtoReg = 0;
        RegDst = 0;
        RegWrite=0;
        PCSource = 2'b00;
        IRWrite = 0;
        MemWrite = 0;
        MemRead = 1;
        ALUSrcA = 1;
        PCWrite = 0;
        PCWriteCond = 0;
        ALUSrcB = 2'b10;
        ALUOp = 2'b00;
        if(op == lw)
            nextState = memRead;
        else if (op == sw)
            nextState = memWrite;
        else 
            nextState = fetch;
        end
   
   memRead: // IRWrite MemWrite MemRead PCWrite PCWriteCond  RegWrite 
        begin
        MemtoReg = 0;
        IRWrite = 0;
        ALUOp = 2'b00;
        PCSource = 2'b00;
        ALUSrcB = 2'b10;
        ALUSrcA = 1;
        RegDst = 0;
        RegWrite=0;
        MemRead = 1;
        MemWrite = 0;
        PCWriteCond = 0;
        PCWrite = 0;
        IorD = 1;
        nextState = memWriteback;
        end
        
    memWriteback: // IRWrite MemWrite MemRead PCWrite PCWriteCond  RegWrite 
        begin
        IorD = 1;
        MemWrite = 0;
        MemRead = 1;
        PCSource = 2'b00;
        ALUOp = 2'b00;
        ALUSrcB = 2'b10;
        ALUSrcA = 1;
        IRWrite = 0;
        PCWrite = 0;
        PCWriteCond = 0;
        RegDst = 0;
        //IorD = 0;
        MemtoReg = 1;
        RegWrite = 1;
        nextState = fetch;
        end
        
    memWrite: // IRWrite MemWrite MemRead PCWrite PCWriteCond  RegWrite
        begin
        IRWrite = 0;
        MemtoReg = 0;
        RegDst = 0;
        ALUOp = 2'b00;
        PCSource = 2'b00;
        ALUSrcB = 2'b10;
        ALUSrcA = 1;
        PCWrite = 0;
        RegWrite=0;
        MemRead = 1;
        PCWriteCond = 0;
        IorD = 1;
        MemWrite = 1;
        nextState = fetch;
        end


    execute: // IRWrite MemWrite MemRead PCWrite PCWriteCond  RegWrite
        begin
        IRWrite = 0;
        MemRead = 1;
        IorD = 0;
        MemtoReg = 0;
        RegWrite=0;
        RegDst = 0;
        PCSource = 2'b00;
        MemWrite = 0;
        PCWrite = 0;
        PCWriteCond = 0;
        ALUSrcA =1;
        ALUSrcB = 2'b00;
        ALUOp = 2'b10;
        nextState = aluWriteback;
        end
        
 
     aluWriteback: // IRWrite MemWrite MemRead PCWrite PCWriteCond  RegWrite
        begin
        IRWrite = 0;
        MemWrite = 0;
        IorD = 0;
        ALUSrcA =1;
        ALUSrcB = 2'b00;
        PCSource = 2'b00;
        ALUOp = 2'b10;
        MemRead = 1;
        MemtoReg = 0;
        PCWrite = 0;
        PCWriteCond = 0;
        RegDst = 1;
        RegWrite = 1;
        nextState = fetch;
        end
        
    branch: // IRWrite MemWrite MemRead PCWrite PCWriteCond  RegWrite
        begin
        IRWrite = 0;
        MemtoReg = 0;
        MemWrite = 0;
        RegDst = 0;
        PCWrite = 0;
        IorD = 0;
        MemRead = 1;
        RegWrite=0;
        ALUSrcA = 1;
        ALUSrcB = 2'b00;
        ALUOp = 2'b01;
        PCSource = 2'b01;
        PCWriteCond = 1;
        nextState = fetch;
        end
       
        
    addiExecute: // IRWrite MemWrite MemRead PCWrite PCWriteCond  RegWrite
        begin
        IRWrite = 0;
        IorD = 0;
        MemWrite = 0;
        MemtoReg = 0;
        PCSource = 2'b00;
        MemRead = 1;
        RegDst = 0;
        PCWrite = 0;
        RegWrite=0;
        PCWriteCond = 0;
        ALUSrcA = 1;
        ALUSrcB = 2'b10;
        ALUOp = 2'b00;
        nextState = addiWriteback;
        end
                
        
     addiWriteback: // IRWrite MemWrite MemRead PCWrite PCWriteCond  RegWrite
        begin
        MemRead = 1;
        MemWrite = 0;
        ALUSrcA = 1;
        PCSource = 2'b00;
        ALUSrcB = 2'b10;
        ALUOp = 2'b00;
        IorD = 0;
        IRWrite = 0;
        PCWrite = 0;
        PCWriteCond = 0;
        RegDst = 0;
        MemtoReg = 0;
        RegWrite = 1;
        nextState = fetch;
        end
        
     jump:  // IRWrite MemWrite MemRead PCWrite PCWriteCond  RegWrite
        begin
        IRWrite = 0;
        MemRead = 1;
        IorD = 0;
        RegWrite=0;
        ALUSrcA = 0;
        ALUSrcB = 2'b11;
        ALUOp = 2'b00;
        RegDst = 0;
        MemtoReg = 0;        
        MemWrite = 0;
        PCWriteCond = 0;
        PCSource = 2'b10;
        PCWrite = 1;
        nextState = fetch;
        end
 
     branch_2: // IRWrite MemWrite MemRead PCWrite PCWriteCond  RegWrite
        begin
        IRWrite = 0;
        IorD = 0;
        MemtoReg = 0;
        MemWrite = 0;
        RegDst = 0;
        MemRead = 1;
        PCWrite = 0;
        ALUSrcA = 1;
        RegWrite=0;
        ALUSrcB = 2'b00;
        ALUOp = 2'b11;
        PCSource = 2'b01;
        PCWriteCond = 1;
        nextState = fetch;
        end
        
        
     default:
        begin
        PCWriteCond = 0;
        PCWrite=0;
        IorD=0;
        MemRead=1;
        MemWrite=0;
        MemtoReg=0;
        IRWrite=0;
        RegWrite=0;
        RegDst=0;
        ALUSrcA=0;
        PCSource=2'd0;
        ALUSrcB=2'd0;
        ALUOp=2'd0;
        nextState = fetch;
        end
        
        
    endcase

endmodule
