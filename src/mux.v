`timescale 1ns / 1ns 

//SW[2:0] data inputs
//SW[9] select signals

//LEDR[0] output display

module mux(led, sw);
  input [9:0] sw;
  output [9:0] led;
  assign led[9:1] = 0;
  mux2to1 u0(
    .x(sw[0]),
    .y(sw[1]),
    .s(sw[9]),
    .m(led[0])
  );
endmodule

module mux2to1(x, y, s, m);
  input x; //select 0
  input y; //select 1
  input s; //select signal
  output m; //output
  
  //assign m = s & y | ~s & x;
  // OR
  assign m = s ? y : x;

endmodule
