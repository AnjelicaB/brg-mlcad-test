//========================================================================
// Prob03p10_comb_gates_4b_pairwise_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [3:0] in_,
  output logic [2:0] out_and,
  output logic [2:0] out_or,
  output logic [2:0] out_xnor
);

  // AND operation on consecutive pairs

  assign out_and[0]  = in_[0] & in_[1];
  assign out_and[1]  = in_[1] & in_[2];
  assign out_and[2]  = in_[2] & in_[3];

  // OR operation on consecutive pairs

  assign out_or[0]   = in_[0] | in_[1];
  assign out_or[1]   = in_[1] | in_[2];
  assign out_or[2]   = in_[2] | in_[3];

  // XNOR operation on consecutive pairs

  assign out_xnor[0] = ~(in_[0] ^ in_[1]);
  assign out_xnor[1] = ~(in_[1] ^ in_[2]);
  assign out_xnor[2] = ~(in_[2] ^ in_[3]);

endmodule

