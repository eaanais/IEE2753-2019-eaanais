`timescale 1ns / 1ps
module datapath (input 			clk , rst, 
                 input 	[1:0] 	PCSource, ALUSrcB, 
                 input 			ALUSrcA,RegWrite,RegDst,PCWriteCond,
                 input 			PCWrite,IorD,MemToReg,IRWrite,
                 input 	[3:0] 	ALUControl,
                 input [32-1:0] RD,
                 output [32-1:0] B,
                 output [32-1:0] Adr,
                 output  [31:0] 	instruction,
                 output 			overflow,
                 output wire [31:0] 	ALUOut
                );
                
  
  wire [32-1:0] PC;

  wire [32-1:0] A;
  wire [32-1:0] Instr;
  wire [32-1:0] Data;
  
  wire [5-1:0] A3;
  wire [32-1:0] WD3;
  
  wire [32-1:0] RD1;
  wire [32-1:0] RD2;
  
  wire [32-1:0] SrcA;
  wire [32-1:0] SrcB;
  
  wire [32-1:0] SignImm;
  wire [32-1:0] SignImm_shift2;
  
  wire [32-1:0] ALUResult;
  wire Zero;
  
  wire [32-1:0] PC_prima;
  wire PCEn;
  wire [31:0] ALUOut_aux;
  
  

  nextPCLogic PC_En (.zero(Zero),
                .branch(PCWriteCond),
            	.pcwrite(PCWrite),
            	.pcen(PCEn)
    );
  
  
  register registro_PC(.din(PC_prima), 
            .clk(clk), 
            .en(PCEn), 
            .rst(rst),
            .dout(PC)
    ); 
  mux2to1 #(32) mux_adr(.sel(IorD), .din0(PC), .din1(ALUOut_aux), .dout(Adr));
  

  
  register registro_Instr(.din(RD), 
            .clk(clk), 
            .en(IRWrite), 
            .rst(rst),
            .dout(Instr)
    );
  
  register registro_Data(.din(RD), 
            .clk(clk), 
            .en(1'b1), 
            .rst(rst),
            .dout(Data)
    );
    
   mux2to1 #(5) mux_a3 (
    .sel(RegDst),
    .din0(Instr[20:16]),
    .din1(Instr[15:11]),
    .dout(A3)
  );
  
  mux2to1 #(32) mux_wd3 (
    .sel(MemToReg),
    .din0(ALUOut),
    .din1(Data),
    .dout(WD3)
  );
  
  regfile RegisterFile (.dataWrite(WD3),
                        .addrReadReg1(Instr[25:21]),
            	        .addrReadReg2(Instr[20:16]),
          	            .addrWriteReg(A3),
          		        .regWrite(RegWrite), //enable
            	        .clk(clk),
            	        .rst(rst),
            	        .data1(RD1),
            	        .data2(RD2)
    );
    
   register registro_A(.din(RD1), 
            .clk(clk), 
            .en(1'b1), 
            .rst(rst),
            .dout(A)
    );
    
   register registro_B(.din(RD2), 
            .clk(clk), 
            .en(1'b1), 
            .rst(rst),
            .dout(B)
    ); 
    
    mux2to1 #(32) mux_PC_A (
    .sel(ALUSrcA),
    .din0(PC),
    .din1(A),
    .dout(SrcA)
  );
  
  signExtend Sign_Extend(.din(Instr[15:0]),
              .dout(SignImm)
                   );
                   
  shiftLeft2 shifLeft(.din(SignImm),
              .dout(SignImm_shift2)
                   );
  
  
  mux4to1 mux_SrcB (.sel(ALUSrcB), 
                              .din0(B),
                              .din1(32'd4), 
                              .din2(SignImm),
                              .din3(SignImm_shift2),
                              .dout(SrcB)
    );
    
  alu ALU (.aluInA(SrcA),
           .aluInB(SrcB),
           .aluControl(ALUControl),
           .aluResult(ALUResult),
           .aluZero(Zero), 
           .aluOverflow(overflow)
    );
    
    register reg_salida(.din(ALUResult), 
            .clk(clk), 
            .en(1'b1), 
            .rst(rst),
            .dout(ALUOut_aux)
    ); 
                            
   mux4to1 mux_ALU_final (.sel(PCSource), 
                              .din0(ALUResult),
                              .din1(ALUOut_aux), 
                              .din2({PC[31:28],Instr[25:0],2'b00}),
                              .din3(32'b0),
                              .dout(PC_prima)
    );
  
assign instruction = Instr; //utilice otro nombra, asi que lo asigno para no tener que cambiar todo
assign ALUOut=ALUOut_aux;
endmodule