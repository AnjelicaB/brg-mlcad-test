//========================================================================
// Prob06p12_comb_codes_ascii2bin_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [15:0] in_,
  output logic [ 3:0] out
);
  // An ASCII value of 0x30 is the digit 0
  localparam  ASCII_ZERO = 8'h30;

  logic [7:0] ones;
  logic [7:0] tens;

  assign ones = in_[ 7:0] - ASCII_ZERO;
  assign tens = in_[15:8] - ASCII_ZERO;

  always @(*) begin

    if ( (tens == 0) && (ones < 10) )
      out = ones;
    else if ( (tens == 1) && (ones < 10) )
      out = 10 + ones;
    else
      out = 0;

  end

endmodule

