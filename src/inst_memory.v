//============================================================
// Module Name : inst_memory
// Project     : MIPS Single-Cycle Processor
// Author      : Saeed Khabbaz Sirjani
// Description : Instruction memory used in the MIPS processor.
//============================================================

module inst_memory(input [31:0] Address,output[31:0] instruction);
  reg [7:0]data [127:0];
  assign instruction={data[Address+3],data[Address+2],data[Address+1],data[Address]};
  initial begin
    {data[3],data[2],data[1],data[0]}=32'b10001111111000110000000000000000;//LD R3 , MEM[0] 
    {data[7],data[6],data[5],data[4]}=32'b10001111111001000000000000000001;//LD R4 , MEM[1] 
    {data[11],data[10],data[9],data[8]}=32'b00000000011001000010100000100000;//ADD R5 , R3 , R4
    {data[15],data[14],data[13],data[12]}=32'b00010000000001000000000000000100;//BEQ R0 , R4 , Lable1
    {data[19],data[18],data[17],data[16]}=32'b00001000000000000000000000010110;//J  Lable2
    {data[23],data[22],data[21],data[20]}=32'b00110100011001100000000001111000;//ORI R6 , R3 , Imm
    {data[27],data[26],data[25],data[24]}=32'b10101100000000110000000000000010;//SW MEM[2] , R6
    {data[31],data[30],data[29],data[28]}=32'b00000000011001000011100000100100;//AND R7 , R3 , R4 
    {data[35],data[34],data[33],data[32]}=32'b00000000011001000100000000101010;//SLT R8 , R3 , R4
    {data[39],data[38],data[37],data[36]}=32'b00010000000000001111111111101110;//BEQ R0 , R4 , PC=5
  end
endmodule


