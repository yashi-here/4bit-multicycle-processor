`timescale 1ns / 1ps

module tb_fsm;

    reg clk;
    reg reset;

    reg  [3:0] opcode;
    reg  [3:0] op1;
    reg  [3:0] op2;

    wire mem_rd;
    wire mem_wr;
    wire [3:0] mem_addr;
    wire [3:0] mem_wdata;

    reg  [3:0] mem_rdata;

    wire [3:0] alu_a;
    wire [3:0] alu_b;
    wire [3:0] alu_sel;

    reg  [3:0] alu_out;

    wire pc_en;

    // DUT
    fsm dut (
        .clk(clk),
        .reset(reset),

        .opcode(opcode),
        .op1(op1),
        .op2(op2),

        .mem_rd(mem_rd),
        .mem_wr(mem_wr),
        .mem_addr(mem_addr),
        .mem_wdata(mem_wdata),
        .mem_rdata(mem_rdata),

        .alu_a(alu_a),
        .alu_b(alu_b),
        .alu_sel(alu_sel),
        .alu_out(alu_out),

        .pc_en(pc_en)
    );
    // CLOCK
    always #5 clk = ~clk;

    // TEST
    initial begin

        clk = 0;
        reset = 1;

        opcode   = 4'b0010; // ADD
        op1      = 4'b0101;
        op2      = 4'b0011;

        mem_rdata = 4'b0101; // RAM output
        alu_out   = 4'b1000; // 5 + 3 = 8

        // RESET
        #12;
        reset = 0;

        // RUN THROUGH MULTIPLE FSM CYCLES
        repeat (12)
            @(posedge clk);

        // CHANGE INSTRUCTION
        opcode    = 4'b0101; // SUB
        op2       = 4'b0001;

        mem_rdata = 4'b1000;
        alu_out   = 4'b0111;

        repeat (12)
            @(posedge clk);

        $finish;
    end

endmodule