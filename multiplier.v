 module Multiplier (
    input  signed [15:0] A,
    input  signed [15:0] Bi,
    output signed [31:0] product
);

assign product = A * Bi;

endmodule
