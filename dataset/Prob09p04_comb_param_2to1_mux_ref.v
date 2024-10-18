//========================================================================
// Prob09p04_comb_param_2to1_mux_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
#(
  parameter nbits
)(
  input  logic [nbits-1:0] in0,
  input  logic [nbits-1:0] in1,
  input  logic             sel,
  output logic [nbits-1:0] out
);

  assign out = (sel) ? in1 : in0;

endmodule

