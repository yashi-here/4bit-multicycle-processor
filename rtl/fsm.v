`timescale 1ns / 1ps

module fsm (
    input  wire        clk,
    input  wire        reset_n,

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
    input  wire [3:0]  alu_out
);

    // State encoding

    parameter INIT      = 3'b000;
    parameter FETCH     = 3'b001;
    parameter WAIT_RD   = 3'b010;
    parameter EXECUTE   = 3'b011;
    parameter WAIT_ALU  = 3'b100;
    parameter STORE     = 3'b101;

    reg [2:0] state, next_state;
    reg [3:0] alu_result_reg;

    // State register

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            state <= INIT;
        else
            state <= next_state;
    end

    // Next-state logic

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

    // Latch ALU output

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            alu_result_reg <= 4'b0000;
        else if (state == WAIT_ALU)
            alu_result_reg <= alu_out;
    end

    // Output / control logic

    always @(*) begin
        // defaults
        mem_rd    = 1'b0;
        mem_wr    = 1'b0;
        mem_addr  = 4'b0000;
        mem_wdata = 4'b0000;

        alu_a     = 4'b0000;
        alu_b     = 4'b0000;
        alu_sel   = 4'b0000;

        case (state)

            FETCH: begin
                mem_rd   = 1'b1;
                mem_addr = op1;
            end

            EXECUTE: begin
                alu_a = mem_rdata;
                alu_b = op2;

                case (opcode)
                    4'b0001: alu_sel = 4'b0001;
                    4'b0010: alu_sel = 4'b0010;
                    4'b0011: alu_sel = 4'b0011;
                    4'b0100: alu_sel = 4'b0100;
                    4'b0101: alu_sel = 4'b0101;
                    4'b0110: alu_sel = 4'b0110;
                    4'b0111: alu_sel = 4'b0111;
                    4'b1000: alu_sel = 4'b1000;
                    4'b1001: alu_sel = 4'b1001;
                    4'b1010: alu_sel = 4'b1010;
                    4'b1011: alu_sel = 4'b1011;
                    4'b1100: alu_sel = 4'b1100;
                    4'b1101: alu_sel = 4'b1101;
                    4'b1110: alu_sel = 4'b1110;
                    4'b1111: alu_sel = 4'b1111;
                    default: alu_sel = 4'b0000;
                endcase
            end

            STORE: begin
                mem_wr    = 1'b1;
                mem_addr  = op1;
                mem_wdata = alu_result_reg; // ? FIXED
            end

        endcase
    end

endmodule
