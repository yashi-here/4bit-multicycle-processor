`timescale 1ns / 1ps

module tb_decoder;

    reg  [11:0] instr;

    wire [3:0] opcode;
    wire [3:0] op1;
    wire [3:0] op2;

    // DUT
    decoder dut (
        .instr(instr),
        .opcode(opcode),
        .op1(op1),
        .op2(op2)
    );

    initial begin

        // ADD
        // opcode = 2
        // op1 = 5
        // op2 = 3
  
        instr = 12'b0010_0101_0011;
        #10;

        // SUB
        instr = 12'b0101_0110_0001;
        #10;

        // XOR
        instr = 12'b1001_0011_1111;
        #10;

        // SHIFT LEFT
        instr = 12'b1110_0100_0001;
        #10;

        // NAND
        instr = 12'b1100_1010_0101;
        #10;

        $finish;

    end

endmodule