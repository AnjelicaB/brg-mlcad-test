//========================================================================
// Prob09p05_comb_param_enc_ref
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

      // if this is the first bit set to one then record the index to
      // potentially use as the output

      if ( !found && (in_[i] == 1) ) begin
        out   = i;
        found = 1;
      end

      // if there is more than one bit set to one then it is an invalid
      // input and we need to set the output to zero

      else if ( found && (in_[i] == 1) ) begin
        out = 0;
      end

    end

  end

endmodule

