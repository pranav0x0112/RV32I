module riscvsingle(input logic clk, reset, input logic [31:0] Instr, ReadData, output logic MemWrite, output logic [31:0] PC, ALUResult, WriteData);
  
  logic ALUSrc, RegWrite, Jump, Zero, PCSrc;
  logic [1:0] ResultSrc, ImmSrc;
  logic [2:0] ALUControl;
  
  controller c(Instr[6:0], Instr[14:12], Instr[30], Zero, ResultSrc, MemWrite, PCSrc, ALUSrc, RegWrite, Jump, ImmSrc, ALUControl);
  
  datapath   dp(clk, reset, ResultSrc, PCSrc, ALUSrc, RegWrite, ImmSrc, ALUControl, Zero, PC, Instr, ALUResult, WriteData, ReadData);
  
endmodule