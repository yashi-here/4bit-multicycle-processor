`timescale 1ns / 1ps

module tb_final;

    reg clk;
    reg reset;

    cpu_top DUT (
        .clk(clk),
        .reset(reset)
    );

    // Clock: 10 ns period
    always #5 clk = ~clk;

    initial begin
        clk   = 0;
        reset = 1;   // ? ASSERT RESET (active HIGH)

        // Hold reset for few cycles
        repeat (2) @(posedge clk);

        reset = 0;   // ? RELEASE RESET ? system starts

        // Run simulation
        repeat (150) @(posedge clk);

        $stop;
    end

endmodule
