module control_unit(input [5:0] opcode,output Branch,MemRead,MemWrite,ALUSrc,RegWrite,Jump,MemtoReg,RegDst,output[2:0] AluOp);
  wire [7:0] l;
  and u0(l[0],~opcode[5],~opcode[4],opcode[3],~opcode[2],~opcode[1],~opcode[0]);
  and u1(l[1],~opcode[5],~opcode[4],~opcode[3],opcode[2],~opcode[1],~opcode[0]);
  and u2(l[2],opcode[5],~opcode[4],opcode[3],~opcode[2],opcode[1],opcode[0]);
  and u3(l[3],opcode[5],~opcode[4],~opcode[3],~opcode[2],opcode[1],opcode[0]);
  and u4(l[4],~opcode[5],~opcode[4],opcode[3],opcode[2],~opcode[1],opcode[0]);
  and u5(l[5],~opcode[5],~opcode[4],~opcode[3],~opcode[2],~opcode[1],~opcode[0]);
  or u6(RegWrite,l[5],l[4],l[3],l[0]);
  or u7(ALUSrc,l[4],l[3],l[2],l[0]); 
  assign RegDst=l[5];
  assign Branch=l[1];
  assign MemRead=l[3];
  assign MemWrite=l[2];
  assign AluOp[2]=l[5];
  assign AluOp[1]=l[4];
  assign AluOp[0]=l[1];
  and u9(l[6],~opcode[5],~opcode[4],~opcode[3],~opcode[2],opcode[1],opcode[0]);
  and u10(l[7],~opcode[5],~opcode[4],~opcode[3],~opcode[2],opcode[1],~opcode[0]);
  assign MemtoReg=l[3];
  or u11(Jump,l[6],l[7]);
endmodule

