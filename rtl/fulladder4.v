`timescale 1ns / 1ps

module fulladder4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire       cin,
    output wire [3:0] sum,
    output wire       cout
);

    wire c1, c2, c3;

    fulladder FA0 (
        .a   (a[0]),
        .b   (b[0]),
        .cin (cin),
        .sum (sum[0]),
        .cout(c1)
    );

    fulladder FA1 (
        .a   (a[1]),
        .b   (b[1]),
        .cin (c1),
        .sum (sum[1]),
        .cout(c2)
    );

    fulladder FA2 (
        .a   (a[2]),
        .b   (b[2]),
        .cin (c2),
        .sum (sum[2]),
        .cout(c3)
    );

    fulladder FA3 (
        .a   (a[3]),
        .b   (b[3]),
        .cin (c3),
        .sum (sum[3]),
        .cout(cout)

    );
endmodule
