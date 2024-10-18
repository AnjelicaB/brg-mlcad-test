//========================================================================
// Prob07p01_comb_arith_8b_add_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [7:0] in0,
  input  logic [7:0] in1,
  output logic [7:0] out
);

  assign out = in0 + in1;

endmodule

