module FullAdder(input A,B,Cin,output S,Cout);
  wire [2:0]h;
  and m0(h[0],A,B);
  xor m1(h[1],A,B);
  xor m2(S,h[1],Cin);
  and m3(h[2],h[1],Cin);
  or m4(Cout,h[0],h[2]);
endmodule


module MUX4to1(input a,b,c,d,input[1:0]s,output f);
  wire [3:0] k;
  and m5(k[0],a,~s[1],~s[0]);
  and m6(k[1],b,~s[1],s[0]);
  and m7(k[2],c,s[1],~s[0]);
  and m8(k[3],d,s[1],s[0]);
  or m9(f,k[3],k[2],k[1],k[0]);
endmodule

module ALU_mamooli(input a,b,less,binvert,CarryIn,input [1:0] operation,output result,CarryOut);
  wire[3:0]h;
  assign h[3]=binvert?~b:b;
  and j0(h[0],a,h[3]);
  or j1(h[1],a,h[3]);
  FullAdder j2(a,h[3],CarryIn,h[2],CarryOut);
  MUX4to1 j3(h[0],h[1],h[2],less,operation,result);
endmodule
module ALU_akhar(input a,b,less,binvert,CarryIn,input [1:0] operation,output result,set);
    wire[3:0]h;
  assign h[3]=binvert?~b:b;
  and j0(h[0],a,h[3]);
  or j1(h[1],a,h[3]);
  FullAdder j2(a,h[3],CarryIn,h[2],);
  MUX4to1 j3(h[0],h[1],h[2],less,operation,result);
  assign set=h[2];
endmodule
module ALU32(input [31:0] a,b,input binvert,CarryIn,input [1:0] operation,output [31:0] result);
  wire [30:0] j1;
  wire set;
  ALU_mamooli n0(a[0],b[0],set,binvert,CarryIn,operation,result[0],j1[0]);
  ALU_mamooli n1(a[1],b[1],0,binvert,j1[0],operation,result[1],j1[1]);
  ALU_mamooli n2(a[2],b[2],0,binvert,j1[1],operation,result[2],j1[2]);
  ALU_mamooli n3(a[3],b[3],0,binvert,j1[2],operation,result[3],j1[3]);
  ALU_mamooli n4(a[4],b[4],0,binvert,j1[3],operation,result[4],j1[4]);
  ALU_mamooli n5(a[5],b[5],0,binvert,j1[4],operation,result[5],j1[5]);
  ALU_mamooli n6(a[6],b[6],0,binvert,j1[5],operation,result[6],j1[6]);
  ALU_mamooli n7(a[7],b[7],0,binvert,j1[6],operation,result[7],j1[7]);
  ALU_mamooli n8(a[8],b[8],0,binvert,j1[7],operation,result[8],j1[8]);
  ALU_mamooli n9(a[9],b[9],0,binvert,j1[8],operation,result[9],j1[9]);
  ALU_mamooli n10(a[10],b[10],0,binvert,j1[9],operation,result[10],j1[10]);
  ALU_mamooli n11(a[11],b[11],0,binvert,j1[10],operation,result[11],j1[11]);
  ALU_mamooli n12(a[12],b[12],0,binvert,j1[11],operation,result[12],j1[12]);
  ALU_mamooli n13(a[13],b[13],0,binvert,j1[12],operation,result[13],j1[13]);
  ALU_mamooli n14(a[14],b[14],0,binvert,j1[13],operation,result[14],j1[14]);
  ALU_mamooli n15(a[15],b[15],0,binvert,j1[14],operation,result[15],j1[15]);
  ALU_mamooli n16(a[16],b[16],0,binvert,j1[15],operation,result[16],j1[16]);
  ALU_mamooli n17(a[17],b[17],0,binvert,j1[16],operation,result[17],j1[17]);
  ALU_mamooli n18(a[18],b[18],0,binvert,j1[17],operation,result[18],j1[18]);
  ALU_mamooli n19(a[19],b[19],0,binvert,j1[18],operation,result[19],j1[19]);
  ALU_mamooli n20(a[20],b[20],0,binvert,j1[19],operation,result[20],j1[20]);
  ALU_mamooli n21(a[21],b[21],0,binvert,j1[20],operation,result[21],j1[21]);
  ALU_mamooli n22(a[22],b[22],0,binvert,j1[21],operation,result[22],j1[22]);
  ALU_mamooli n23(a[23],b[23],0,binvert,j1[22],operation,result[23],j1[23]);
  ALU_mamooli n24(a[24],b[24],0,binvert,j1[23],operation,result[24],j1[24]);
  ALU_mamooli n25(a[25],b[25],0,binvert,j1[24],operation,result[25],j1[25]);
  ALU_mamooli n26(a[26],b[26],0,binvert,j1[25],operation,result[26],j1[26]);
  ALU_mamooli n27(a[27],b[27],0,binvert,j1[26],operation,result[27],j1[27]);
  ALU_mamooli n28(a[28],b[28],0,binvert,j1[27],operation,result[28],j1[28]);
  ALU_mamooli n29(a[29],b[29],0,binvert,j1[28],operation,result[29],j1[29]);
  ALU_mamooli n30(a[30],b[30],0,binvert,j1[29],operation,result[30],j1[30]);
  ALU_akhar n31(a[31],b[31],0,binvert,j1[30],operation,result[31],set);
endmodule
module ALU(input [31:0] a,b,input [2:0]ALU_ctr,output [31:0]result,output zero);
  wire binvert,CarryIn;
  assign CarryIn=binvert;
  wire[1:0]operation;
  wire[3:0] v;
  wire [31:0]result1;
  and k0(v[3],~ALU_ctr[2],~ALU_ctr[1],ALU_ctr[0]);
  and k1(v[0],~ALU_ctr[2],ALU_ctr[1],~ALU_ctr[0]);
  and k2(v[1],ALU_ctr[2],ALU_ctr[1],ALU_ctr[0]);
  and k3(v[2],~ALU_ctr[2],~ALU_ctr[1]);
  or k4(operation[0],v[0],v[1]);
  or k5(operation[1],v[2],v[1]);
  or k6(binvert,v[3],v[1]);
  ALU32 uu0(a,b,binvert,CarryIn,operation,result1);
  assign zero=~|(result1);
  assign result=result1;
endmodule

