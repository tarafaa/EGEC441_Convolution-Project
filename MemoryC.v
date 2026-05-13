`timescale 1ns / 1ps

module MemoryC(
    input [31:0] Cin,
    input [4:0] addr,
    input WE,
    input clk,
    output reg [31:0] Cout
    );
    
    reg [31:0] C [31:0];
    
    always @(posedge clk) begin
        if (WE == 1'b1) begin
            C[addr] <= Cin;
        end
        else begin
            Cout <= C[addr];
        end
    end
    
endmodule
