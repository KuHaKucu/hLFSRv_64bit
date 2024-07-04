module LFSR_64bit (
    input  i_clk,
    input  i_reset,
    input  [63:0] i_seed,
    output  [63:0] o_lfsr,
    output  o_keystream
);

wire [63:0] lfsr_reg;
reg [63:0] lfsr_reg1;
wire msb_lfsr;
wire keystream_reg1;
reg keystream_reg2;

always @(posedge i_clk) begin
    if (i_reset) begin
        keystream_reg2 <= 0;
        lfsr_reg1 <= i_seed;
    end else begin
        lfsr_reg1 <= lfsr_reg;
        keystream_reg2 <= keystream_reg1;
    end
end
    assign keystream_reg1 = lfsr_reg1[0];
    assign msb_lfsr = lfsr_reg1[63] ^ lfsr_reg1[3] ^ lfsr_reg1[2] ^ lfsr_reg1[0];
    assign o_lfsr = lfsr_reg1;
    assign o_keystream = keystream_reg2;
    assign lfsr_reg = {msb_lfsr, lfsr_reg1[63:1]};
endmodule
