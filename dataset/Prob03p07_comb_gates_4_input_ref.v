//========================================================================
// Prob03p07_comb_gates_4_input_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic in0,
  input  logic in1,
  input  logic in2,
  input  logic in3,
  output logic out_and,
  output logic out_nand,
  output logic out_or,
  output logic out_nor
);

  assign out_and  =    in0 & in1 & in2 & in3;
  assign out_nand = ~( in0 & in1 & in2 & in3 );
  assign out_or   =    in0 | in1 | in2 | in3;
  assign out_nor  = ~( in0 | in1 | in2 | in3 );

endmodule

