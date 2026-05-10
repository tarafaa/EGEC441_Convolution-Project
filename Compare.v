`timescale 1ns / 1ps

module CompareB(
    input [15:0] Bi, // Bi is the index of array B (impluse) 
    input clk,
    input rst,
    output reg [15:0] Bn, 
    output     [15:0] Btotal,
    output reg done
    );
 // reg means value that is stored and updated in an always block
reg [3:0] k; // this counts up to 16 (can be adjusted)

// at positive edge of the clock change the next state of k
// asynchronous reset
MemoryB u_bm0 ( 
.Bin(Bn),
.Bout(Btotal)
);

always @(posedge clk) begin

if (rst) begin

k <= 0;
Bn <= 0;
done <= 0;
            
end 

else if(Bi >= k) begin

Bn <= Bi - k;
k <= k + 1;
done <= 0;
           
end 

else begin 
            
 done <= 1;
 k <= k;
 Bn <= Bn;
 
 end
 
 end
 
 endmodule           

