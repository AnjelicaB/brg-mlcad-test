//========================================================================
// Prob05p08_comb_mux_1b_128to1_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [127:0] in_,
  input  logic [  6:0] sel,
  output logic         out
);

  assign out = in_[sel];

endmodule

