module ram( 
    input  wire clk, 
    input  wire csn,     // active-low 
    input  wire rwn,     // 1=read, 0=write 
    input  wire [3:0] addr, 
    input  wire [3:0] datain, 
    output reg  [3:0] dataout 
); 
    reg [3:0] mem [0:15]; 
    integer i;

initial begin
    for (i = 0; i < 16; i = i + 1)
        mem[i] = 4'b0000;
end

    always @(posedge clk) begin 
        if (!csn) begin 
            if (!rwn) begin 
                // WRITE 
                mem[addr] <= datain; 
            end else begin 
                // READ 
                dataout <= mem[addr]; 
            end 
        end 
    end 
endmodule 