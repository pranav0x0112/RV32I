module alu(input logic [31:0] a, b, input logic [3:0] alucontrol, output logic [31:0] result);

    logic [31:0] sum  = a + b;
    logic [31:0] diff = a - b;
    logic        slt  = ($signed(a) < $signed(b));
    logic        sltu = (a < b);

    always_comb
        case (alucontrol)
            4'b0000: result = sum;                       // ADD
            4'b0001: result = diff;                      // SUB
            4'b0010: result = a & b;                     // AND
            4'b0011: result = a | b;                     // OR
            4'b0100: result = a ^ b;                     // XOR
            4'b0101: result = {31'b0, slt};              // SLT (signed)
            4'b0110: result = {31'b0, sltu};             // SLTU (unsigned)
            4'b0111: result = a << b[4:0];               // SLL
            4'b1000: result = a >> b[4:0];               // SRL (logical)
            4'b1001: result = $signed(a) >>> b[4:0];     // SRA (arith)
            default: result = 32'hDEAD_BEEF;             // catch bugs
        endcase

endmodule