`timescale 1ns / 1ps 
module cpu_top ( 
    input  wire clk, 
    input  wire reset
); 

    wire [3:0] pc_out;
    wire [11:0] instr;

    wire [3:0] opcode;
    wire [3:0] op1;
    wire [3:0] op2;

    wire pc_en;

    wire mem_rd, mem_wr;
    wire [3:0] mem_addr, mem_wdata, mem_rdata;

    wire [3:0] alu_a, alu_b, alu_sel, alu_out;
    wire alu_cout;

    wire ram_csn = ~(mem_rd | mem_wr); 
    wire ram_rwn = mem_rd;             

    pc u_pc (
        .clk(clk),
        .reset(reset),
        .enable(pc_en),
        .pc_out(pc_out)
    );

    rom u_rom (
        .addr(pc_out),
        .instr(instr)
    );

    decoder u_dec (
        .instr(instr),
        .opcode(opcode),
        .op1(op1),
        .op2(op2)
    );

    fsm u_fsm ( 
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

    ram u_ram ( 
        .clk(clk), 
        .csn(ram_csn), 
        .rwn(ram_rwn), 
        .addr(mem_addr), 
        .datain(mem_wdata), 
        .dataout(mem_rdata) 
    ); 

    reg_alu u_alu ( 
        .clk(clk), 
        .reset(reset), 
        .a(alu_a), 
        .b(alu_b), 
        .sel(alu_sel), 
        .cin(1'b0), 
        .f(alu_out), 
        .cout(alu_cout) 
    ); 

endmodule
