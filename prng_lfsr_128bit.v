module generator_LFSR_64bit 
//#(
//    parameter integer clk_n = 8
//)
(
    input i_clk,
    input i_rst,
    input [63:0] i_seed,
    output [63:0] o_lfsr,
    output o_keystream
);

wire lck_reg;
//wire [127:0] lfsr_reg;
//wire keystream_reg;

Division_clock  DIV (
    .i_clk(i_clk),
    .o_clk(lck_reg)
);

LFSR_64bit lfsr_64bit (
    .i_clk(lck_reg),
    .i_reset(i_rst),
    .i_seed(i_seed),
    .o_lfsr(o_lfsr),
    .o_keystream(o_keystream)
);

//assign o_lfsr = lfsr_reg;
//assign o_keystream = keystream_reg;

endmodule
