//========================================================================
// Prob19p04_seq_pipe_add2_1stage_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic [7:0] in0,
  input  logic [7:0] in1,
  output logic [7:0] out
);

  // stage 0

  logic [7:0] in0_X0;
  logic [7:0] in1_X0;

  always @( posedge clk ) begin
    in0_X0 <= in0;
    in1_X0 <= in1;
  end

  assign out = in0_X0 + in1_X0;

endmodule

