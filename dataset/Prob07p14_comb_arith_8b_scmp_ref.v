//========================================================================
// Prob07p14_comb_arith_8b_scmp_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [ 7:0] in0,
  input  logic [ 7:0] in1,
  output logic        lt,
  output logic        eq,
  output logic        gt
);

  assign lt = $signed(in0) < $signed(in1);
  assign eq = in0 == in1;
  assign gt = $signed(in0) > $signed(in1);

endmodule

