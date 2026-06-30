module core(input clk);
  wire [31:0] PCin , PCout,PC1,instruction,write_data,read_data1,read_data2,ALU_input2,ALU_result,extended,DataRead,BranchTarget,JumpAddress;
  wire RegWrite,zero,Branch,MemRead,MemWrite,ALUSrc,Jump,MemtoReg,RegDst;
  wire [4:0] write_register;
  wire [2:0]ALU_ctr,AluOp;
  wire [5:0] opcode ,funct ;
  wire [15:0] immediate;
  wire [6:0] rt,rd,rs;
  PC mips0(clk,PCin,PCout);
  inst_memory mips1(PCout,instruction);
  reg_file mips2(clk,RegWrite,instruction[25:21],instruction[20:16],write_register,write_data,read_data1,read_data2);
  ALU mips3(read_data1,ALU_input2,ALU_ctr,ALU_result, ,zero , );
  extension mips4(instruction[15:0],extended);
  control_unit mips5(instruction[31:26],Branch,MemRead,MemWrite,ALUSrc,RegWrite,Jump,MemtoReg,RegDst,AluOp);
  alu_control_unit mips6(AluOp,instruction[5:0],ALU_ctr);
  data_memory mips7(MemRead,MemWrite,ALU_result,read_data2,DataRead);
  InstructionParser mips8(instruction , opcode ,funct ,immediate,rt,rd,rs);

  
  
  
  assign write_data=MemtoReg?DataRead:ALU_result;
  assign write_register=RegDst?instruction[15:11]:instruction[20:16];
  assign PC1=PCout+4;
  assign PCin=Jump?JumpAddress:(Branch&&zero)?BranchTarget:PC1;
  assign ALU_input2=ALUSrc?extended:read_data2;
  assign BranchTarget=extended+PC1;
  assign JumpAddress={PC1[31:28],instruction[25:0],2'b00};
endmodule


