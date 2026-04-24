`timescale 1ns / 1ps 
module cpu_top ( 
    input  wire clk, 
    input  wire reset_n
); 

    // =========================
    // Instruction path
    // =========================
    wire [3:0] pc_out;
    wire [11:0] instr;

    wire [3:0] opcode;
    wire [3:0] op1;
    wire [3:0] op2;

    wire pc_en;   // ? FIXED

    // =========================
    // Datapath signals
    // =========================
    wire        mem_rd; 
    wire        mem_wr; 
    wire [3:0]  mem_addr; 
    wire [3:0]  mem_wdata; 
    wire [3:0]  mem_rdata; 

    wire [3:0]  alu_a; 
    wire [3:0]  alu_b; 
    wire [3:0]  alu_sel; 
    wire [3:0]  alu_out; 
    wire        alu_cout; 

    // =========================
    // RAM control
    // =========================
    wire ram_csn = ~(mem_rd | mem_wr); 
    wire ram_rwn = mem_rd;             

    // =========================
    // PC
    // =========================
    pc u_pc (
        .clk     (clk),
        .reset_n (reset_n),
        .enable  (pc_en),     // ? FIXED (controlled increment)
        .pc_out  (pc_out)
    );

    // =========================
    // ROM
    // =========================
    rom u_rom (
        .addr  (pc_out),
        .instr (instr)
    );

    // =========================
    // Decoder
    // =========================
    decoder u_dec (
        .instr  (instr),
        .opcode (opcode),
        .op1    (op1),
        .op2    (op2)
    );

    // =========================
    // FSM
    // =========================
    fsm u_fsm ( 
        .clk        (clk), 
        .reset_n    (reset_n), 
        .opcode     (opcode), 
        .op1        (op1), 
        .op2        (op2), 
        .mem_rd     (mem_rd), 
        .mem_wr     (mem_wr), 
        .mem_addr   (mem_addr), 
        .mem_wdata  (mem_wdata), 
        .mem_rdata  (mem_rdata), 
        .alu_a      (alu_a), 
        .alu_b      (alu_b), 
        .alu_sel    (alu_sel), 
        .alu_out    (alu_out),
        .pc_en      (pc_en)   // ? FIXED
    ); 

    // =========================
    // RAM
    // =========================
    ram u_ram ( 
        .clk      (clk), 
        .csn      (ram_csn), 
        .rwn      (ram_rwn), 
        .addr     (mem_addr), 
        .datain   (mem_wdata), 
        .dataout  (mem_rdata) 
    ); 

    // =========================
    // ALU
    // =========================
    reg_alu u_alu ( 
        .clk      (clk), 
        .reset_n  (reset_n), 
        .a        (alu_a), 
        .b        (alu_b), 
        .sel      (alu_sel), 
        .cin      (1'b0), 
        .f        (alu_out), 
        .cout     (alu_cout) 
    ); 

endmodule
