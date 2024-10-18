//========================================================================
// Prob06p03_comb_codes_dec_2to4_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [1:0] in_,
  output logic [3:0] out
);

  always @(*) begin
    case ( in_ )
      2'd0: out = 4'b0001;
      2'd1: out = 4'b0010;
      2'd2: out = 4'b0100;
      2'd3: out = 4'b1000;
    endcase
  end

endmodule

