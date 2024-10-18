//========================================================================
// Prob05p01_comb_mux_1b_2to1_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic in0,
  input  logic in1,
  input  logic sel,
  output logic out
);

  assign out = (sel) ? in1 : in0;

endmodule

