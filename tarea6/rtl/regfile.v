module regfile (input [32-1:0] dataWrite,
                input [5-1:0] addrReadReg1,
            	input [5-1:0] addrReadReg2,
          	    input [5-1:0] addrWriteReg,
          		input regWrite, //enable
            	input clk,
            	input rst,
            	output wire [32-1:0] data1,
            	output wire [32-1:0] data2
    );
  
  reg [32-1:0] regfile_mem[32-1:0];
  
  //variable para el reset
  integer i;
  
  //en cada clock copia la info en la direccion que quiero
  
  always @(posedge clk)
    begin
    //si presiono el reset los registros los tiro a 0
    if (rst)
      for (i = 0; i < 32; i = i + 1) regfile_mem[i] <= 0;
    // si no, de acuerdo al enable copio la info en la memoria
  	else
    	if (regWrite) regfile_mem[addrWriteReg] <= dataWrite;
    end
  
  //la salida es la info de la direccion que quiero leer
  assign data1 = (addrReadReg1 != 0) ? regfile_mem[addrReadReg1] : 0;
  assign data2 = (addrReadReg2 != 0) ? regfile_mem[addrReadReg2] : 0;
  
  
  
endmodule