//========================================================================
// Prob02p02_comb_wires_16b_split_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [7:0] in_,
  output logic [3:0] lo,
  output logic [3:0] hi
);

  assign lo = in_[3:0];
  assign hi = in_[7:4];

endmodule

