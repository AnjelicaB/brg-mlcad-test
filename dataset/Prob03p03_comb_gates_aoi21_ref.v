//========================================================================
// Prob03p03_comb_gates_aoi21_ref
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

  assign out = ~((in0 & in1) | in2);

endmodule

