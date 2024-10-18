//========================================================================
// Prob09p07_comb_param_penc_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
#(
  parameter nbits
)(
  input  logic [        nbits-1:0] in_,
  output logic [$clog2(nbits)-1:0] out
);

  logic found;

  always @(*) begin

    out   = 0;
    found = 0;

    for ( int i = 0; i < nbits; i++ ) begin
      if ( !found && (in_[i] == 1) ) begin
        out   = i;
        found = 1;
      end
    end

  end

endmodule

