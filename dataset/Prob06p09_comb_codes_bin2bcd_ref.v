//========================================================================
// Prob06p09_comb_codes_bin2bcd_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [3:0] in_,
  output logic [7:0] out
);

  logic [3:0] ones;
  logic [3:0] tens;

  always @(*) begin

    // calculate ones and tens values

    if ( in_ < 10 ) begin
      ones = in_;
      tens = 0;
    end
    else begin
      ones = in_ - 10;
      tens = 1;
    end

    // set the appropriate fields in output

    out[3:0] = ones;
    out[7:4] = tens;

  end

endmodule

