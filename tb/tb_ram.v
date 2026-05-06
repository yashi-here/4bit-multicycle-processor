`timescale 1ns / 1ps

module tb_ram;

    reg clk;
    reg csn;
    reg rwn;
    reg  [3:0] addr;
    reg  [3:0] datain;
    wire [3:0] dataout;

    // DUT
    ram dut (
        .clk(clk),
        .csn(csn),
        .rwn(rwn),
        .addr(addr),
        .datain(datain),
        .dataout(dataout)
    );

    // CLOCK
    always #5 clk = ~clk;

    // TEST
    initial begin

        clk = 0;

        csn    = 1;
        rwn    = 1;
        addr   = 0;
        datain = 0;

        #10;
        // WRITE MEM[5] = 9
        csn    = 0;
        rwn    = 0;
        addr   = 4'd5;
        datain = 4'd9;
        #10;
        // DISABLE
        csn = 1;
        #10;
        // READ MEM[5]
        csn  = 0;
        rwn  = 1;
        addr = 4'd5;
        #10;
        // READ MEM[2]
        addr = 4'd2;
        #10;
        // WRITE MEM[2] = 6
        rwn    = 0;
        addr   = 4'd2;
        datain = 4'd6;
        #10;
        // READ MEM[2]
        rwn  = 1;
        addr = 4'd2;
        #10;
        $finish;

    end

endmodule