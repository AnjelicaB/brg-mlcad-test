//========================================================================
// Prob07p05_comb_arith_100b_popcount_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [99:0] in_,
  output logic [ 6:0] out
);

  always @(*) begin
    out = 0;
    for ( int i = 0; i < 100; i++ )
      out = out + in_[i];
  end

endmodule

