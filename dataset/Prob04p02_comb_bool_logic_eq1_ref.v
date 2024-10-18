//========================================================================
// Prob04p02_comb_bool_logic_eq1_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic a,
  input  logic b,
  input  logic c,
  output logic f
);

  assign f = (~a & b & ~c) | (a & b & c);

endmodule

