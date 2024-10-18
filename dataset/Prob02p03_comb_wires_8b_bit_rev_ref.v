//========================================================================
// Prob02p03_comb_wires_8b_bit_rev_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [7:0] in_,
  output logic [7:0] out
);

  assign out[0] = in_[7];
  assign out[1] = in_[6];
  assign out[2] = in_[5];
  assign out[3] = in_[4];
  assign out[4] = in_[3];
  assign out[5] = in_[2];
  assign out[6] = in_[1];
  assign out[7] = in_[0];

endmodule

