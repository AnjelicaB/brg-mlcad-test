//========================================================================
// Prob06p11_comb_codes_bin2ascii_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [ 3:0] in_,
  output logic [15:0] out
);
  // An ASCII value of 0x30 is the digit 0
  localparam  ASCII_ZERO = 8'h30;

  logic [7:0] ones;
  logic [7:0] tens;

  always @(*) begin

    if ( in_ < 10 ) begin
      ones = ASCII_ZERO + in_;
      tens = ASCII_ZERO;
    end
    else begin
      ones = ASCII_ZERO + in_ - 10;
      tens = ASCII_ZERO + 1;
    end

    // set the appropriate fields in output

    out[ 7:0] = ones;
    out[15:8] = tens;

  end

endmodule

