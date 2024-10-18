//========================================================================
// Prob05p09_comb_mux_1b_1to128_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic         in_,
  input  logic [  6:0] sel,
  output logic [127:0] out
);

  always @(*) begin
    out = 128'b0;
    out[sel] = in_;
  end

endmodule

