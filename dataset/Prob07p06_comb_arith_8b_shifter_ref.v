//========================================================================
// Prob07p06_comb_arith_8b_shifter_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [7:0] in_,
  input  logic [2:0] amt,
  input  logic       op,
  output logic [7:0] out
);

  always @(*) begin
    case ( op )
      1'd0 : out = in_ << amt;
      1'd1 : out = in_ >> amt;
    endcase
  end

endmodule

