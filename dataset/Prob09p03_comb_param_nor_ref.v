//========================================================================
// Prob09p03_comb_param_nor_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
#(
  parameter nbits
)(
  input  logic [nbits-1:0] in_,
  output logic             out
);

  assign out = ~|in_;

endmodule

