//========================================================================
// Prob07p16_comb_arith_2x8b_minmax_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [7:0] in0,
  input  logic [7:0] in1,
  output logic [7:0] min,
  output logic [7:0] max
);

  always @(*) begin
    if ( in0 < in1 ) begin
      min = in0;
      max = in1;
    end
    else begin
      min = in1;
      max = in0;
    end
  end

endmodule

