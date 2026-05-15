`timescale 1ns / 1ps

module TopModule(
    input clk,
    input rst,
    input start,

    input loadA,
    input loadB,
    input [4:0] load_addr,
    input signed [15:0] Ain,
    input signed [15:0] Bin,

    output reg done,
    output reg [4:0] Y_n,
    output reg signed [31:0] Y
);

    wire signed [15:0] Aout;
    wire signed [15:0] Bout;
    wire signed [31:0] product;

    reg [4:0] addrA;
    reg [4:0] addrB;
    reg [4:0] calc_n;

    reg computing;
    reg wait_read;

    MemoryA memA (
        .Ain(Ain),
        .addr(loadA ? load_addr : addrA),
        .WE(loadA),
        .clk(clk),
        .rst(rst),
        .Aout(Aout)
    );

    MemoryB memB (
        .Bin(Bin),
        .addr(loadB ? load_addr : addrB),
        .WE(loadB),
        .clk(clk),
        .rst(rst),
        .Bout(Bout)
    );

    Multiplier mult (
        .A(Aout),
        .Bi(Bout),
        .product(product)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            done <= 1'b0;
            Y <= 32'sd0;
            Y_n <= 5'd0;
            addrA <= 5'd0;
            addrB <= 5'd0;
            calc_n <= 5'd0;
            computing <= 1'b0;
            wait_read <= 1'b0;
        end
        else begin
            if (start && !computing) begin
                done <= 1'b0;
                Y <= 32'sd0;
                Y_n <= 5'd0;
                addrA <= 5'd0;
                addrB <= 5'd0;
                calc_n <= 5'd0;
                computing <= 1'b1;
                wait_read <= 1'b1;
            end
            else if (computing) begin
                if (wait_read) begin
                    wait_read <= 1'b0;
                end
                else begin
                    Y <= product;
                    Y_n <= calc_n;

                    if (calc_n == 5'd30) begin
                        done <= 1'b1;
                        computing <= 1'b0;
                        wait_read <= 1'b0;
                    end
                    else begin
                        calc_n <= calc_n + 1'b1;
                        addrA <= calc_n + 1'b1;
                        addrB <= 5'd0;
                        wait_read <= 1'b1;
                    end
                end
            end
        end
    end

endmodule
