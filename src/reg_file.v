module reg_file(input clk,input RegWrite,input [4:0] read_register1,read_register2,write_register,input[31:0] write_data,output [31:0] read_data1,read_data2);
  reg [31:0] reg_file [31:0];
  integer i;
  initial begin
    reg_file[0]=0;
    reg_file[1]=1;
    for (i=2;i<32;i=i+1)reg_file[i]=0;
  end
  always@(posedge clk) if(RegWrite)reg_file[write_register]=write_data;
  assign read_data1=reg_file[read_register1];
  assign read_data2=reg_file[read_register2];
endmodule

