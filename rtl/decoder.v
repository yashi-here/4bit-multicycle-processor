module decoder (
    input  [11:0] instr,
    output [3:0] opcode,
    output [3:0] op1,
    output [3:0] op2
);

assign opcode = instr[11:8];
assign op1    = instr[7:4];
assign op2    = instr[3:0];

endmodule