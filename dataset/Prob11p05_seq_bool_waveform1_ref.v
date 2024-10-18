//========================================================================
// Prob11p05_seq_bool_waveform1_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic clk,
  input  logic a,
  output logic f
);

  always @( posedge clk )
    f <= ~a;

endmodule

