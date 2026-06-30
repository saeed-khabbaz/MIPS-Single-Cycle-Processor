//============================================================
// Module Name : data_memory
// Project     : MIPS Single-Cycle Processor
// Author      : Saeed Khabbaz Sirjani
// Description : Data memory used in the MIPS processor.
//============================================================

module data_memory (input MemRead , MemWrite , input [31:0] Address , DataWrite , output reg [31:0] DataRead);
  reg [7:0] data [127:0];
  
  always @(Address or MemRead or MemWrite)begin
    if ( MemRead ) DataRead = {data[Address+3] , data[Address+2] , data[Address+1] , data[Address]};
    if ( MemWrite ) begin
      {data[Address+3] , data[Address+2] , data[Address+1] , data[Address]} = DataWrite;
    end
  end
  initial begin
    {data[3] , data[2] , data[1] , data[0]} = 32'b00001001011001101000000011001001;
    {data[7] , data[6] , data[5] , data[4]} = 32'b01110001100011100111000110101010;  
  end
endmodule
