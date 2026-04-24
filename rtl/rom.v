module rom (
    input  wire [3:0] addr,
    output reg  [11:0] instr
);

always @(*) begin
    case (addr)

        // -------- INITIALIZE --------
        4'd0: instr = 12'b0000_0101_0000; // PASS MEM[5] (start from 0)

        // -------- INCREMENT --------
        4'd1: instr = 12'b0001_0101_0000; // MEM[5] = A + 1 ? 1
        4'd2: instr = 12'b0001_0101_0000; // ? 2

        // -------- ADD IMMEDIATE --------
        4'd3: instr = 12'b0010_0101_0010; // +2 ? 4
        4'd4: instr = 12'b0010_0101_0011; // +3 ? 7

        // -------- SUBTRACT --------
        4'd5: instr = 12'b0101_0101_0001; // -1 ? 6

        // -------- LOGIC OPS --------
        4'd6: instr = 12'b1000_0101_0011; // OR 3
        4'd7: instr = 12'b1001_0101_0010; // XOR 2
        4'd8: instr = 12'b1010_0101_0001; // AND 1

        // -------- NOT --------
        4'd9: instr = 12'b1011_0101_0000; // NOT

        // -------- SHIFT --------
        4'd10: instr = 12'b1110_0101_0000; // SHL
        4'd11: instr = 12'b1111_0101_0000; // SHR

        // -------- HOLD --------
        default: instr = 12'b0000_0000_0000;

    endcase
end

endmodule