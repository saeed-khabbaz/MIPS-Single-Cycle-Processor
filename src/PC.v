module PC(input clk,input [31:0] PCin,output reg [31:0] PCout);
  initial PCout=0;
  always @(posedge clk)PCout=PCin;
endmodule

