module parameterized_asyn_FlipFlop #(
    parameter FF_TYPE = "DFF"
    parameter INPUT_WIDTH = 4
) (
    input [INPUT_WIDTH-1:0] d, rstn , clk,
    output [INPUT_WIDTH-1:0] q, [INPUT_WIDTH-1:0] qbar
);
    generate
        if (FF_TYPE == "DFF") begin
            D_flipflop #(INPUT_WIDTH)tff(.t(d), .rstn(rstn), .clk(clk), .q(q), .qbar(qbar));
        end
        else if (FF_TYPE == "TFF") begin
            T_flipflop #(INPUT_WIDTH)dff(.d(d), .rstn(rstn), .clk(clk), .q(q), .qbar(qbar));
        end
    endgenerate
    assign qbar = ~q;
endmodule