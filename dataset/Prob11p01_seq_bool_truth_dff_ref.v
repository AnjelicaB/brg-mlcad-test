//========================================================================
// Prob11p01_seq_bool_truth_dff_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic clk,
  input  logic a,
  output logic q
);

  always @( posedge clk )
    q <= a;

endmodule

