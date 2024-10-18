//========================================================================
// Prob10p07_seq_gates_nl0
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic clk,
  input  logic in0,
  input  logic in1,
  output logic out
);

  // D flip-flops

  logic in0_dff;
  logic in1_dff;

  always @( posedge clk ) begin
    in0_dff <= in0;
    in1_dff <= in1;
  end

  // and gate

  assign out = in0_dff & in1_dff;

endmodule

