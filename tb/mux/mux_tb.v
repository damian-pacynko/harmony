`timescale 1ns / 1ns 
module mux_tb();
  reg [9:0] sw_vec;
  wire [9:0] led_vec;
  integer i, fail;
  parameter numVectors = 2;
  parameter numTests = 4;
  reg [9:0] testvectors [numVectors*numTests-1:0];
  reg [9:0] GoldenOut;  // LEDR golden output
  
  mux dut(
      .led(led_vec),
      .sw(sw_vec)
  );

  initial begin
    $readmemb("/home/damian/Documents/harmony/tb/mux/mux_testvector.tv", testvectors); 
    sw_vec = 0;
    fail = 0;
  end

  initial begin 
    for (i = 0; i < numTests * numVectors; i = i + numVectors) begin
      sw_vec <= testvectors[i];
      GoldenOut <= testvectors[i+1];
      #10;
      if (led_vec !== GoldenOut) begin
        $display("*** TEST %0d FAILED ***: led_vec: %0b GoldenOut: %0b", i / numVectors, led_vec, GoldenOut);
        fail = 1;
      end
      else begin
        $display("*** TEST %0d PASSED ***: led_vec: %0b GoldenOut: %0b", i / numVectors, led_vec, GoldenOut); 
      end
      #10;
    end 
    if (fail) begin
        $display("*** At least one test FAILED. PLS FIX BUGS!");
    end
  end

endmodule
