//========================================================================
// Prob02p06_comb_wires_4x2b_passthru_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [1:0] in0,
  input  logic [1:0] in1,
  input  logic [1:0] in2,
  input  logic [1:0] in3,
  output logic [1:0] out0,
  output logic [1:0] out1,
  output logic [1:0] out2,
  output logic [1:0] out3
);

  assign out0 = in0;
  assign out1 = in1;
  assign out2 = in2;
  assign out3 = in3;

endmodule

