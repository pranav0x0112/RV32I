module alu(input logic [31:0] a, b,
           input logic [2:0] alucontrol,
           output logic [31:0] result,
           output logic zero);

    logic slt;

    // signed comparison
    assign slt = ($signed(a) < $signed(b));

    always_comb begin
        unique case (alucontrol)
            3'b000: result = a + b;      // ADD, ADDI, LW, SW
            3'b001: result = a - b;      // SUB, BEQ
            3'b010: result = a & b;      // AND
            3'b011: result = a | b;      // OR
            3'b101: result = {31'b0, slt}; // SLT, SLTI
            default: result = 32'bx;
        endcase
    end

    assign zero = (result == 32'd0);

endmodule