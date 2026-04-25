`timescale 1ns / 1ps 
module reg_alu( 
    input  wire clk, 
    input  wire reset,    
    input  wire [3:0] a, 
    input  wire [3:0] b, 
    input  wire [3:0] sel, 
    input  wire cin, 
    output reg  [3:0] f, 
    output reg  cout 
); 

    reg  [3:0] f_comb; 
    reg  cout_comb; 
    reg  [3:0] add_b; 
    reg  add_cin; 

    wire [3:0] add_sum; 
    wire add_cout; 
    
    fulladder4 uadd ( 
        .a(a), 
        .b(add_b), 
        .cin(add_cin), 
        .sum(add_sum), 
        .cout(add_cout) 
    ); 

    wire [3:0] w_and  = a & b; 
    wire [3:0] w_or   = a | b; 
    wire [3:0] w_xor  = a ^ b; 
    wire [3:0] w_not  = ~a; 
    wire [3:0] w_nand = ~(a & b); 
    wire [3:0] w_xnor = ~(a ^ b); 
    wire [3:0] w_shl  = a << 1; 
    wire [3:0] w_shr  = a >> 1; 

    always @(*) begin 
        f_comb   = 4'b0000; 
        cout_comb = 1'b0; 
        add_b    = 4'b0000; 
        add_cin  = cin; 

        case (sel) 
            4'b0000: f_comb = a;

            4'b0001: begin // INC
                add_cin = 1'b1; 
                f_comb = add_sum; 
                cout_comb = add_cout;
            end 

            4'b0010: begin // ADD
                add_b = b; 
                f_comb = add_sum; 
                cout_comb = add_cout; 
            end        

            4'b0011: begin // ADDC
                add_b = b; 
                add_cin = 1'b1; 
                f_comb = add_sum; 
                cout_comb = add_cout; 
            end 

            4'b0100: begin // A + ~B
                add_b = ~b; 
                f_comb = add_sum; 
                cout_comb = add_cout; 
            end 

            4'b0101: begin // SUB
                add_b = ~b; 
                add_cin = 1'b1; 
                f_comb = add_sum; 
                cout_comb = add_cout; 
            end  

            4'b0110: begin // DEC
                add_b = 4'b1111; 
                f_comb = add_sum; 
                cout_comb = add_cout; 
            end  

            4'b0111: f_comb = a;

            4'b1000: f_comb = w_or; 
            4'b1001: f_comb = w_xor; 
            4'b1010: f_comb = w_and; 
            4'b1011: f_comb = w_not; 
            4'b1100: f_comb = w_nand; 
            4'b1101: f_comb = w_xnor; 
            4'b1110: f_comb = w_shl; 
            4'b1111: f_comb = w_shr; 
        endcase 
    end 

    always @(posedge clk or posedge reset) begin 
        if (reset) begin
            f    <= 4'b0000; 
            cout <= 1'b0; 
        end else begin 
            f    <= f_comb; 
            cout <= cout_comb; 
        end 
    end 

endmodule
