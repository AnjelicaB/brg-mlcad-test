//========================================================================
// Prob02p04_comb_wires_100b_bit_rev_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [99:0] in_,
  output logic [99:0] out
);

  always @(*) begin
    for ( int i = 0; i < 100; i++ ) begin
      out[i] = in_[99-i];
    end
  end

endmodule

