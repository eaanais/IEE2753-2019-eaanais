// Suma las entradas de N bits y salida con N+1 bits
module adder #(parameter N = 1)(input [N-1:0] a,
                                input [N-1:0] b,
                                output[N:0] suma
    );

// Se suman las entradas y la salida ya contiene un bit extra para que no sature
  assign suma = a + b;

endmodule

