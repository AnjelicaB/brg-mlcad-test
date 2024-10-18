//========================================================================
// Prob03p09_comb_gates_bitwise_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [3:0] in0,
  input  logic [3:0] in1,
  output logic [3:0] out_and,
  output logic [3:0] out_nand,
  output logic [3:0] out_or,
  output logic [3:0] out_nor
);

  assign out_and  =    in0 & in1;
  assign out_nand = ~( in0 & in1 );
  assign out_or   =    in0 | in1;
  assign out_nor  = ~( in0 | in1 );

endmodule

