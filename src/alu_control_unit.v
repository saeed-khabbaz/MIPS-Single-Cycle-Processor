module alu_control_unit(input [2:0] ALUopt,input [5:0] func,output  [2:0]  ALUctr);
  wire [2:0] ALUctr1;
  wire [4:0] m;
  and lm0(m[0],~func[3],func[2],~func[1]);
  and lm1(m[1],func[3],~func[2],func[1]);
  or l2(m[2],m[0],m[1]);
  and l3(m[4],func[5],~func[4],~func[0],m[2]);
  and l4 (m[3],func[5],~func[4],~func[3],func[2],~func[1],func[0]);
  or l5 (ALUctr1[1],m[4],m[3]);
  assign ALUctr1[2]=m[4];
  and l6(ALUctr1[0],func[5],~func[4],~func[2],func[1],~func[0]);
  assign ALUctr=ALUopt[2]?ALUctr1:ALUopt;
endmodule

