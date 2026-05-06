`timescale 1ns / 1ps

module tb_reg_alu;

    reg clk;
    reg reset;
    reg  [3:0] a;
    reg  [3:0] b;
    reg  [3:0] sel;
    reg  cin;
    wire [3:0] f;
    wire cout;

    // DUT
    reg_alu dut (
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .sel(sel),
        .cin(cin),
        .f(f),
        .cout(cout)
    );

    // CLOCK
    always #5 clk = ~clk;

    // TEST
    initial begin

        clk   = 0;
        reset = 1;

        a   = 0;
        b   = 0;
        sel = 0;
        cin = 0;

        // Reset
        #12;
        reset = 0;

        // PASS A
        a = 4'b0101;
        b = 4'b0011;
        sel = 4'b0000;
        #10;
        // INC
        // 5 + 1 = 6
        a = 4'b0101;
        sel = 4'b0001;
        #10;
        // ADD
        // 5 + 3 = 8
        a = 4'b0101;
        b = 4'b0011;
        sel = 4'b0010;
        #10;
        // ADD WITH CARRY
        // 5 + 3 + 1 = 9
        a = 4'b0101;
        b = 4'b0011;
        sel = 4'b0011;
        #10;
        // A + ~B
        a = 4'b0101;
        b = 4'b0011;
        sel = 4'b0100;
        #10;
        // SUB
        // 5 - 3 = 2
        a = 4'b0101;
        b = 4'b0011;
        sel = 4'b0101;
        #10;
        // DEC
        // 5 - 1 = 4
        a = 4'b0101;
        sel = 4'b0110;
        #10;
        // PASS A
        a = 4'b1111;
        sel = 4'b0111;
        #10;
        // OR
        a = 4'b1100;
        b = 4'b1010;
        sel = 4'b1000;
        #10;
        // XOR
        a = 4'b1100;
        b = 4'b1010;
        sel = 4'b1001;
        #10;
        // AND
        a = 4'b1100;
        b = 4'b1010;
        sel = 4'b1010;
        #10;
        // NOT
        a = 4'b1100;
        sel = 4'b1011;
        #10;
        // NAND
        a = 4'b1100;
        b = 4'b1010;
        sel = 4'b1100;
        #10;
        // XNOR
        a = 4'b1100;
        b = 4'b1010;
        sel = 4'b1101;
        #10;
        // SHIFT LEFT
        a = 4'b0011;
        sel = 4'b1110;
        #10;
        // SHIFT RIGHT
        a = 4'b1100;
        sel = 4'b1111;
        #10;

        #20;
        $finish;

    end

endmodule