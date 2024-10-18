//========================================================================
// Prob07p11_comb_arith_8b_fxp_umul_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [7:0] in0,
  input  logic [7:0] in1,
  output logic [7:0] out,
  output logic       overflow
);

  // caclulate a Q8.8 result

  logic [15:0] temp;
  assign temp = in0 * in1;

  // check for overflow
  assign overflow = (temp[15:12] != 0);

  // shift and truncate to create Q4.4 output
  assign out = (overflow) ? 0 : temp >> 4;

endmodule

