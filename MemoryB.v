`timescale 1ns / 1ps

module MemoryB(
    input [15:0] Bin, // data in
    input [4:0] addr, // address we write to (32 bits)
    input WE, // write enable 
    input clk,
    output reg [15:0] Bout // data out
    );


reg[15:0] B [0:31]; // Bin array Bin - 16 bits, we have 32 array locations available

always @(posedge clk) begin

if(WE == 1'b1) begin

 B[addr] <= Bin;
end
else begin

Bout <= B[addr];
end 

end
endmodule
