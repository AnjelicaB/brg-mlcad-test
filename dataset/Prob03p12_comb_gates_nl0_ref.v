//========================================================================
// Prob03p12_comb_gates_nl0_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic in0,
  input  logic in1,
  input  logic in2,
  output logic out
);

  assign out = ~(in0 ^ in1) & in2;

endmodule

