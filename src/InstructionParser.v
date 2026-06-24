module InstructionParser(input [31:0] Instruction , output [5:0] opcode ,funct , output [15:0] immediate,output [6:0] rt,rd,rs);
  
  assign opcode = Instruction[31:26];
  assign funct = Instruction[5:0];
  assign immediate = Instruction[15:0];
  assign rt = Instruction[20:16];
  assign rd = Instruction[15:11];
  assign rs = Instruction[25:21];
  
endmodule
