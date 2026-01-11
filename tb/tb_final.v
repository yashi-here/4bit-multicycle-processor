`timescale 1ns / 1ps

module tb_final;

    reg clk;
    reg reset_n;

    reg [3:0] opcode;
    reg [3:0] op1;
    reg [3:0] op2;

    cpu_top DUT (
        .clk     (clk),
        .reset_n (reset_n),
        .opcode  (opcode),
        .op1     (op1),
        .op2     (op2)
    );

    // Clock: 10 ns
    always #5 clk = ~clk;

    task run_instruction(
        input [3:0] inst,
        input [3:0] dest,
        input [3:0] val
    );
    begin
        @(posedge clk);
        opcode <= inst;
        op1    <= dest;
        op2    <= val;

        // 5-cycle instruction
        repeat (5) @(posedge clk);
    end
    endtask

    initial begin
        // Init
        clk     = 0;
        reset_n = 0;
        opcode  = 4'b0000;
        op1     = 4'b0000;
        op2     = 4'b0000;

        // Reset
        repeat (2) @(posedge clk);
        reset_n = 1;

        run_instruction(4'b0000, 4'd5, 4'd0); // PASS A
        run_instruction(4'b0001, 4'd5, 4'd0); // A + 1
        run_instruction(4'b0010, 4'd5, 4'd3); // A + B
        run_instruction(4'b0011, 4'd5, 4'd1); // A + B + 1
        run_instruction(4'b0100, 4'd5, 4'd2); // A + ~B
        run_instruction(4'b0101, 4'd5, 4'd1); // A - B
        run_instruction(4'b0110, 4'd5, 4'd0); // A - 1
        run_instruction(4'b0111, 4'd5, 4'd0); // PASS A

        run_instruction(4'b1000, 4'd5, 4'd3); // OR
        run_instruction(4'b1001, 4'd5, 4'd3); // XOR
        run_instruction(4'b1010, 4'd5, 4'd3); // AND
        run_instruction(4'b1011, 4'd5, 4'd0); // NOT A
        run_instruction(4'b1100, 4'd5, 4'd3); // NAND
        run_instruction(4'b1101, 4'd5, 4'd3); // XNOR

        run_instruction(4'b1110, 4'd5, 4'd0); // SHL
        run_instruction(4'b1111, 4'd5, 4'd0); // SHR


        repeat (3) @(posedge clk);
        $stop;
    end

endmodule
