//========================================================================
// Prob02p08_comb_wires_sext_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [ 7:0] in_,
  output logic [31:0] out
);

  assign out = { {24{in_[7]}}, in_ };

endmodule

