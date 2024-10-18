//========================================================================
// Prob07p10_comb_arith_8b_smul_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [ 7:0] in0,
  input  logic [ 7:0] in1,
  output logic [15:0] out
);

  logic [ 7:0] in0_abs;
  logic [ 7:0] in1_abs;
  logic [15:0] out_unsigned;

  always @(*) begin

    // absolute values of inputs

    in0_abs = in0[7] ? (~in0 + 1) : in0;
    in1_abs = in1[7] ? (~in1 + 1) : in1;

    // unsigned multiplication

    out_unsigned = in0_abs * in1_abs;

    // adjust sign of the output

    if ( in0[7] != in1[7] )
      out = ~out_unsigned + 1;
    else
      out = out_unsigned;

  end

endmodule

