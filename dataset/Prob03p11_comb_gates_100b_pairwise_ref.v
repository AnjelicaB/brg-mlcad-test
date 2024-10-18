//========================================================================
// Prob03p11_comb_gates_100b_pairwise_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [99:0] in_,
  output logic [98:0] out_and,
  output logic [98:0] out_or,
  output logic [98:0] out_xnor
);

  assign out_and  =    in_[98:0] & in_[99:1];
  assign out_or   =    in_[98:0] | in_[99:1];
  assign out_xnor = ~( in_[98:0] ^ in_[99:1] );

endmodule

