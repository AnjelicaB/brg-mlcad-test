//========================================================================
// Prob07p12_comb_arith_8b_madd_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [ 7:0] in0,
  input  logic [ 7:0] in1,
  input  logic [15:0] in2,
  output logic [15:0] out
);

  assign out = (in0 * in1) + in2;

endmodule

