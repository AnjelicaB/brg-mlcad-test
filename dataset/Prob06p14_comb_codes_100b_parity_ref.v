//========================================================================
// Prob06p14_comb_codes_100b_parity_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [99:0] in_,
  output logic        out
);

  assign out = ^in_;

endmodule

