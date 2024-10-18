//========================================================================
// Prob07p02_comb_arith_8b_add_carry_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [7:0] in0,
  input  logic [7:0] in1,
  input  logic       cin,
  output logic [7:0] out,
  output logic       cout
);

  assign {cout,out} = in0 + in1 + cin;

endmodule

