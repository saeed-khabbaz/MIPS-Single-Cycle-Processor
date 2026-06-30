//============================================================
// Module Name : ALU
// Project     : MIPS Single-Cycle Processor
// Author      : Saeed Khabbaz Sirjani
// Description : 32-bit ALU  used in the MIPS processor.
//============================================================


module FullAdder(input A,B,Cin,output S,Cout);
  //CarryOut = a.b + a.CarryIn + b.CarryIn
  //Sum = (a XOR b) XOR CarryIn
  wire [2:0]h;
  and m0(h[0],A,B);
  and m1(h[1],A,CarryIn);
  and m2(h[2],B,CarryIn);
  or m3(Cout,h[0],h[1],h[2]);
  xor m4(S,A,B,Cin);
endmodule




module MUX4to1(input a,b,c,d,input[1:0]s,output f);
  // f = (a.s1'.s0') + (b.s1'.s0) + (c.s1.s0') + (d.s1.s0)
  // This code describes a 4-to-1 multiplexer.
  wire [3:0] k;
  and m5(k[0],a,~s[1],~s[0]);
  and m6(k[1],b,~s[1],s[0]);
  and m7(k[2],c,s[1],~s[0]);
  and m8(k[3],d,s[1],s[0]);
  or m9(f,k[3],k[2],k[1],k[0]);
  
endmodule




module ALU_Slice(input a,b,Less,Binvert,CarryIn,input [1:0] Operation,output Result,CarryOut);
  wire[3:0]h;
  assign h[3]=Binvert?~b:b;
  and j0(h[0],a,h[3]);
  or j1(h[1],a,h[3]);
  FullAdder j2(a,h[3],CarryIn,h[2],CarryOut);
  MUX4to1 j3(h[0],h[1],h[2],Less,Operation,Result);
  //The corresponding schematic diagram for this midule is available in the docs directory.
endmodule



module ALU_MSB_Slice(input a , b , Less , Binvert , CarryIn , input [1:0] Operation , output Result , CarryOut , Set , Overflow );
  wire[4:0]h;
  assign h[3]=Binvert?~b:b;
  and j0(h[0],a,h[3]);
  or j1(h[1],a,h[3]);
  FullAdder j2(a,h[3],CarryIn,h[2],h[4]);
  MUX4to1 j3(h[0],h[1],h[2],Less,Operation,Result);
  assign Set=h[2];
  assign Overflow = CarryIn ^ h[4];
  assign CarryOut = h[4];
  //The corresponding schematic diagram for this midule is available in the docs directory.
endmodule


module ALU32(input [31:0] a,b,input binvert,CarryIn,input [1:0] operation,output [31:0] result,output Overflow , CarryOut);
  wire [30:0] j1;
  wire set;
  ALU_Slice n0(a[0],b[0],set,binvert,CarryIn,operation,result[0],j1[0]);
  ALU_Slice n1(a[1],b[1],0,binvert,j1[0],operation,result[1],j1[1]);
  ALU_Slice n2(a[2],b[2],0,binvert,j1[1],operation,result[2],j1[2]);
  ALU_Slice n3(a[3],b[3],0,binvert,j1[2],operation,result[3],j1[3]);
  ALU_Slice n4(a[4],b[4],0,binvert,j1[3],operation,result[4],j1[4]);
  ALU_Slice n5(a[5],b[5],0,binvert,j1[4],operation,result[5],j1[5]);
  ALU_Slice n6(a[6],b[6],0,binvert,j1[5],operation,result[6],j1[6]);
  ALU_Slice n7(a[7],b[7],0,binvert,j1[6],operation,result[7],j1[7]);
  ALU_Slice n8(a[8],b[8],0,binvert,j1[7],operation,result[8],j1[8]);
  ALU_Slice n9(a[9],b[9],0,binvert,j1[8],operation,result[9],j1[9]);
  ALU_Slice n10(a[10],b[10],0,binvert,j1[9],operation,result[10],j1[10]);
  ALU_Slice n11(a[11],b[11],0,binvert,j1[10],operation,result[11],j1[11]);
  ALU_Slice n12(a[12],b[12],0,binvert,j1[11],operation,result[12],j1[12]);
  ALU_Slice n13(a[13],b[13],0,binvert,j1[12],operation,result[13],j1[13]);
  ALU_Slice n14(a[14],b[14],0,binvert,j1[13],operation,result[14],j1[14]);
  ALU_Slice n15(a[15],b[15],0,binvert,j1[14],operation,result[15],j1[15]);
  ALU_Slice n16(a[16],b[16],0,binvert,j1[15],operation,result[16],j1[16]);
  ALU_Slice n17(a[17],b[17],0,binvert,j1[16],operation,result[17],j1[17]);
  ALU_Slice n18(a[18],b[18],0,binvert,j1[17],operation,result[18],j1[18]);
  ALU_Slice n19(a[19],b[19],0,binvert,j1[18],operation,result[19],j1[19]);
  ALU_Slice n20(a[20],b[20],0,binvert,j1[19],operation,result[20],j1[20]);
  ALU_Slice n21(a[21],b[21],0,binvert,j1[20],operation,result[21],j1[21]);
  ALU_Slice n22(a[22],b[22],0,binvert,j1[21],operation,result[22],j1[22]);
  ALU_Slice n23(a[23],b[23],0,binvert,j1[22],operation,result[23],j1[23]);
  ALU_Slice n24(a[24],b[24],0,binvert,j1[23],operation,result[24],j1[24]);
  ALU_Slice n25(a[25],b[25],0,binvert,j1[24],operation,result[25],j1[25]);
  ALU_Slice n26(a[26],b[26],0,binvert,j1[25],operation,result[26],j1[26]);
  ALU_Slice n27(a[27],b[27],0,binvert,j1[26],operation,result[27],j1[27]);
  ALU_Slice n28(a[28],b[28],0,binvert,j1[27],operation,result[28],j1[28]);
  ALU_Slice n29(a[29],b[29],0,binvert,j1[28],operation,result[29],j1[29]);
  ALU_Slice n30(a[30],b[30],0,binvert,j1[29],operation,result[30],j1[30]);
  ALU_MSB_Slice n31(a[31],b[31],0,binvert,j1[30],operation,result[31],CarryOut , set,Overflow);
  //The corresponding schematic diagram for this midule is available in the docs directory.
endmodule
module ALU(input [31:0] a,b,input [2:0]ALU_ctr,output [31:0]Result,output CarryOut , Zero , Overflow);
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
  ALU32 uu0(a,b,binvert,CarryIn,operation,result1 , Overflow , CarryOut);
  assign Zero=~|(result1);
  assign Result=result1;
  //The corresponding schematic diagram for this midule is available in the docs directory.
endmodule


