module TestBench;

  reg clk;
  
  core uut(clk);
  
  initial repeat(25)#50 clk=~clk;
  initial clk=0;
endmodule

