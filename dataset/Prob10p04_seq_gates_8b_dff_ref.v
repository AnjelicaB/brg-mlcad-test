//========================================================================
// Prob10p04_seq_gates_8b_dff_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic [7:0] d,
  output logic [7:0] q
);

  always @( posedge clk )
    q <= d;

endmodule

