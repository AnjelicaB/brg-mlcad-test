//========================================================================
// Prob07p13_comb_arith_8b_ucmp_ref
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

  assign lt = in0 <  in1;
  assign eq = in0 == in1;
  assign gt = in0 >  in1;

endmodule

