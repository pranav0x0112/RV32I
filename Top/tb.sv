module testbench;

    logic clk;
    logic reset;
    logic [31:0] WriteData, DataAdr;
    logic MemWrite;

    top dut(.clk(clk), .reset(reset), .WriteData(WriteData), .DataAdr(DataAdr), .MemWrite(MemWrite));

    initial begin
        clk   = 0;
        reset = 1;
        #22;
        reset = 0;
    end

    always begin
        #5 clk = 1;
        #5 clk = 0;
    end

    always @(negedge clk) begin
        if (MemWrite) begin

            // success condition
            if ((DataAdr == 32'd100) && (WriteData == 32'd25)) begin
                $display("Simulation succeeded");
                $stop;
            end

            // failure condition (ignore the write to 96)
            else if (DataAdr != 32'd96) begin
                $display("Simulation failed");
                $display("Unexpected write: Addr=%0d Data=%0d", DataAdr, WriteData);
                $stop;
            end
        end
    end

endmodule