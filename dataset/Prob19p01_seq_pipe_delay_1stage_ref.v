//========================================================================
// Prob19p01_seq_pipe_delay_1stage_ref
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

  // stage 0

  logic [7:0] reg0;

  always @( posedge clk )
    reg0 <= in_;

  // connect output

  assign out = reg0;

endmodule

