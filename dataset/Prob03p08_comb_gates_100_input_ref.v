//========================================================================
// Prob03p08_comb_gates_100_input_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [99:0] in_,
  output logic out_and,
  output logic out_nand,
  output logic out_or,
  output logic out_nor
);

  assign out_and  =  &in_;
  assign out_nand = ~&in_;
  assign out_or   =  |in_;
  assign out_nor  = ~|in_;

endmodule

