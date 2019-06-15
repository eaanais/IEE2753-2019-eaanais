module nextPCLogic (input zero,
                input branch,
            	input pcwrite,
            	output wire pcen
    );
  
  assign pcen = (branch & zero) | pcwrite;
  
endmodule
