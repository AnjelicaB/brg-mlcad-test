//========================================================================
// Prob19p03_seq_pipe_delay_3stage_ref
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

  // stage 1

  logic [7:0] reg1;

  always @( posedge clk )
    reg1 <= reg0;

  // stage 3

  logic [7:0] reg2;

  always @( posedge clk )
    reg2 <= reg1;

  // connect output

  assign out = reg2;

endmodule

