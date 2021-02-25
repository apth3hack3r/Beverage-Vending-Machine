module testbench();
  
  reg d;
  reg[1:0] in;
  
  wire valid;
  wire clk;
  clock c(clk);
  
  BVM machine(valid, d, in, clk);
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
      d=1'b1;
      in=2'b11;
      #10
      d=1'b0;
      #110
      
      d=1'b1;
      in=2'b00;
      #10
      d=1'b0;
      #50
      
      d=1'b1;
      in=2'b10;
      #10
      d=1'b0;
      #110
      $finish;
    end
endmodule
