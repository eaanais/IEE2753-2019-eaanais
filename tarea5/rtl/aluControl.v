`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2019 18:08:52
// Design Name: 
// Module Name: aluControl
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


module aluControl( input [1:0] aluOp,
                   input [5:0] inst,
                   output reg [3:0] aluControl
    );
    
    always@*
    casez({aluOp, inst})
        8'b00??????: aluControl = 4'b0010;
        8'b01??????: aluControl = 4'b0110;
        8'b10000101: aluControl = 4'b0100; //bne
        8'b10100000: aluControl = 4'b0010;
        8'b10100010: aluControl = 4'b0110;
        8'b10100100: aluControl = 4'b0000;
        8'b10100101: aluControl = 4'b0001;
        8'b10100111: aluControl = 4'b1100;
        default: aluControl = 4'b0010;
        
    endcase
    
    
endmodule
