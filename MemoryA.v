`timescale 1ns / 1ps

module MemoryA(
    input [15:0] Ain,
    input [4:0] addr,
    input WE,
    input clk,
    output reg [15:0] Aout
    );
    
    reg[15:0] A [31:0];
    
    always @(posedge clk) begin
        if (WE == 1'b1) begin
            A[addr] <= Ain;
        end
        
        else begin
            Aout <= A[addr];
        end
    end
    
endmodule
