//========================================================================
// Prob07p07_comb_arith_8b_sra_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [7:0] in_,
  input  logic [2:0] amt,
  output logic [7:0] out
);

  assign out = $signed(in_) >>> amt;

endmodule

