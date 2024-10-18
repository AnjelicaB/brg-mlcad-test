//========================================================================
// Prob10p09_seq_gates_nl2
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic clk,
  input  logic in0,
  input  logic in1,
  input  logic in2,
  input  logic in3,
  output logic out
);

  // D flip-flops

  logic in0_dff;
  logic in1_dff;
  logic in2_dff;
  logic in3_dff;

  always @( posedge clk ) begin
    in0_dff <= in0;
    in1_dff <= in1;
    in2_dff <= in2;
    in3_dff <= in3;
  end

  // combinational logic

  assign out = (~in0_dff | in1_dff) & (in2_dff | ~in3_dff);

endmodule

