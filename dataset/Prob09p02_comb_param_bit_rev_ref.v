//========================================================================
// Prob09p02_comb_param_bit_rev_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
#(
  parameter nbits
)(
  input  logic [nbits-1:0] in_,
  output logic [nbits-1:0] out
);

  always @(*) begin
    for ( int i = 0; i < nbits; i++ ) begin
      out[i] = in_[nbits-1-i];
    end
  end

endmodule

