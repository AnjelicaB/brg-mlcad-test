//========================================================================
// Prob10p01_seq_gates_1b_dff_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic clk,
  input  logic d,
  output logic q
);

  always @( posedge clk )
    q <= d;

endmodule

