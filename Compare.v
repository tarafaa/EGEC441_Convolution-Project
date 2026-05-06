`timescale 1ns / 1ps



module CompareB(
    input [15:0] Bi, // Bi is the index of array B (impluse)
    input k, // counter k 
    input clk,
    input rst,
    output [15:0] Bn, 
    output [15:0] Btotal
    );
endmodule

wire kstate;
wire clk;
wire rst; 
wire Bn;
// at positive edge of the clock change the next state of k
// asynchronous reset
always @(posedge clk)  begin

if (!rst) begin 
Bi > 0 then 
for(k = 0, k > 0, k++){
kstate <= k + 1; // let n be the index value of k 
if (k - B(i) > 0){ // if k - B(index value) is less 
Bn <= B(i) - k(n); // calcualte the i - k 


module Bmemory ( 
.Bin(Bn),
.Bout(Btotal)
);

end module;
}
else 

disable loop;
}

end;

// not done but pseduocode  
