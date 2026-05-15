`timescale 1ns / 1ps

module TopModule_TB;

    reg clk = 0;
    reg rst = 0;
    reg start = 0;

    reg loadA = 0;
    reg loadB = 0;
    reg [4:0] load_addr = 0;

    reg signed [15:0] Ain = 0;
    reg signed [15:0] Bin = 0;

    wire done;
    wire [4:0] Y_n;
    wire signed [31:0] Y;

    integer i = 0;

    TopModule DUT (
        .clk(clk),
        .rst(rst),
        .start(start),
        .loadA(loadA),
        .loadB(loadB),
        .load_addr(load_addr),
        .Ain(Ain),
        .Bin(Bin),
        .done(done),
        .Y_n(Y_n),
        .Y(Y)
    );

    always #5 clk = ~clk;

    initial begin

        // RESET
        rst = 1;
        #20;
        rst = 0;

        // LOAD inputs A = 1..30
        for (i = 0; i < 32; i = i + 1) begin
            @(negedge clk);

            loadA = 1;
            loadB = 0;

            load_addr = i[4:0];
            Ain = i + 1;
        end

        @(negedge clk);
        loadA = 0;

        // LOAD impluse B = 2
        for (i = 0; i < 32; i = i + 1) begin
            @(negedge clk);

            loadA = 0;
            loadB = 1;

            load_addr = i[4:0];
            Bin = 16'd2;
        end

        @(negedge clk);
        loadB = 0;

        // ALLOW MEMORY TO SETTLE
        repeat(2) @(posedge clk);

        // START
        @(negedge clk);
        start = 1;

        @(negedge clk);
        start = 0;

    end

endmodule
