//========================================================================
// Prob07p04_comb_arith_8b_popcount_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [7:0] in_,
  output logic [3:0] out
);

  assign out =   in_[0] + in_[1] + in_[2] + in_[3]
               + in_[4] + in_[5] + in_[6] + in_[7];

endmodule

