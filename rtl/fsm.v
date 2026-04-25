`timescale 1ns / 1ps
module fsm (
    input  wire        clk,
    input  wire        reset,

    input  wire [3:0]  opcode,
    input  wire [3:0]  op1,
    input  wire [3:0]  op2,

    output reg         mem_rd,
    output reg         mem_wr,
    output reg  [3:0]  mem_addr,
    output reg  [3:0]  mem_wdata,
    input  wire [3:0]  mem_rdata,

    output reg  [3:0]  alu_a,
    output reg  [3:0]  alu_b,
    output reg  [3:0]  alu_sel,
    input  wire [3:0]  alu_out,

    output reg         pc_en
);

    parameter INIT      = 3'b000;
    parameter FETCH     = 3'b001;
    parameter WAIT_RD   = 3'b010;
    parameter EXECUTE   = 3'b011;
    parameter WAIT_ALU  = 3'b100;
    parameter STORE     = 3'b101;

    reg [2:0] state, next_state;
    reg [3:0] alu_result_reg;

    // STATE REGISTER
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= INIT;
        else
            state <= next_state;
    end

    // NEXT STATE
    always @(*) begin
        case (state)
            INIT:     next_state = FETCH;
            FETCH:    next_state = WAIT_RD;
            WAIT_RD:  next_state = EXECUTE;
            EXECUTE:  next_state = WAIT_ALU;
            WAIT_ALU: next_state = STORE;
            STORE:    next_state = FETCH;
            default:  next_state = INIT;
        endcase
    end

    // ALU RESULT REGISTER
    always @(posedge clk or posedge reset) begin
        if (reset)
            alu_result_reg <= 4'b0000;
        else if (state == WAIT_ALU)
            alu_result_reg <= alu_out;
    end

    // OUTPUT LOGIC
    always @(*) begin
        mem_rd    = 1'b0;
        mem_wr    = 1'b0;
        mem_addr  = 4'b0000;
        mem_wdata = 4'b0000;

        alu_a     = 4'b0000;
        alu_b     = 4'b0000;
        alu_sel   = 4'b0000;

        pc_en     = 1'b0;

        case (state)
            FETCH: begin
                mem_rd   = 1'b1;
                mem_addr = op1;
            end

            EXECUTE: begin
                alu_a = mem_rdata;
                alu_b = op2;
                alu_sel = opcode;
            end

            STORE: begin
                mem_wr    = 1'b1;
                mem_addr  = op1;
                mem_wdata = alu_result_reg;
                pc_en     = 1'b1;
            end
        endcase
    end

endmodule
