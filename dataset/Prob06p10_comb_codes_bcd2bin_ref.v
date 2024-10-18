//========================================================================
// Prob06p10_comb_codes_bcd2bin_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [7:0] in_,
  output logic [3:0] out
);

  logic [3:0] ones;
  logic [3:0] tens;

  assign ones = in_[3:0];
  assign tens = in_[7:4];

  always @(*) begin

    if ( (tens == 0) && (ones < 10) )
      out = ones;
    else if ( (tens == 1) && (ones < 10) )
      out = 10 + ones;
    else
      out = 0;

  end

endmodule

