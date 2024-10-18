//========================================================================
// Prob02p07_comb_wires_5x3b_to_4x4b_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [2:0] in0,
  input  logic [2:0] in1,
  input  logic [2:0] in2,
  input  logic [2:0] in3,
  input  logic [2:0] in4,
  output logic [3:0] out0,
  output logic [3:0] out1,
  output logic [3:0] out2,
  output logic [3:0] out3
);

  logic [15:0] temp;
  assign temp = { 1'b1, in4, in3, in2, in1, in0 };

  assign out0 = temp[ 3: 0];
  assign out1 = temp[ 7: 4];
  assign out2 = temp[11: 8];
  assign out3 = temp[15:12];

endmodule

