//========================================================================
// Prob03p05_comb_gates_hadd_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic a,
  input  logic b,
  output logic sum,
  output logic cout
);

  assign sum  = a ^ b;
  assign cout = a & b;

endmodule

