module pc (
    input  wire clk,
    input  wire reset_n,
    input  wire enable,
    output reg  [3:0] pc_out
);

always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        pc_out <= 4'b0000;
    else if (enable)
        pc_out <= pc_out + 1;
end

endmodule