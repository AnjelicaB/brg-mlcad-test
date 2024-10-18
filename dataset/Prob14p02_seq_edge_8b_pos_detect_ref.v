//========================================================================
// Prob14p02_seq_edge_8b_pos_detect_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic [7:0] in_,
  output logic [7:0] out
);

  // Register for previous cycle

  logic [7:0] prev_in_;

  always @( posedge clk )
    prev_in_ <= in_;

  // Check for transitions

  assign out = ~prev_in_ & in_;

endmodule

