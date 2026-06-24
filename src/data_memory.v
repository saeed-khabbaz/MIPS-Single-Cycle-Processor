module data_memory (input MemRead,MemWrite,input [31:0]Address,DataWrite,output reg[31:0]DataRead);
  reg [31:0] data [127:0];
  always @(Address or MemRead or MemWrite)begin
    if (MemRead)DataRead=data[Address];
    if( MemWrite) begin
      data[Address]=DataWrite;
    end
  end
  initial begin
    data[0]=32'b00001001011001101000000011001001;
    data[1]=32'b01110001100011100111000110101010;  
  end
endmodule

