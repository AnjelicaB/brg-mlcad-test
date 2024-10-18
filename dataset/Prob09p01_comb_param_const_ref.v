//========================================================================
// Prob09p01_comb_param_const_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
#(
  parameter nbits,
  parameter value
)(
  output logic [nbits-1:0] out
);

  assign out = value;

endmodule

