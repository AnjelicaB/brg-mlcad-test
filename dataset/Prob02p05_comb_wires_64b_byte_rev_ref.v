//========================================================================
// Prob02p05_comb_wires_64b_byte_rev_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [63:0] in_,
  output logic [63:0] out
);

  assign out[ 7: 0] = in_[63:56];
  assign out[15: 8] = in_[55:48];
  assign out[23:16] = in_[47:40];
  assign out[31:24] = in_[39:32];
  assign out[39:32] = in_[31:24];
  assign out[47:40] = in_[23:16];
  assign out[55:48] = in_[15: 8];
  assign out[63:56] = in_[ 7: 0];

endmodule

