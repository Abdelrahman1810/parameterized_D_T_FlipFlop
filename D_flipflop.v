module D_flipflop #(
    parameter INPUT_WIDTH = 4
)(
    input [INPUT_WIDTH-1:0] d, rstn, clk,
    output reg [INPUT_WIDTH-1:0] q, [INPUT_WIDTH-1:0] qbar
);
    always @(posedge clk or negedge rstn) begin
        if (~rstn) q <= 0;
        else q <= d;
        assign qbar = ~q;
    end
endmodule