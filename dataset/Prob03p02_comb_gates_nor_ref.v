//========================================================================
// Prob03p02_comb_gates_nor_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic in0,
  input  logic in1,
  output logic out
);

  assign out = ~(in0 | in1);

endmodule

