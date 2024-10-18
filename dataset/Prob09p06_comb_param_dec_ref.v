//========================================================================
// Prob09p06_comb_param_dec_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
#(
  parameter nbits
)(
  input  logic [$clog2(nbits)-1:0] in_,
  output logic [        nbits-1:0] out
);

  always @(*) begin

    // Carefully handle case where nbits is not a power of two

    out = 0;
    if ( in_ < nbits )
      out[in_] = 1;

  end

endmodule

