//========================================================================
// Prob06p01_comb_codes_enc_4to2_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [3:0] in_,
  output logic [1:0] out
);

  always @(*) begin
    case ( in_ )
      4'b0001 : out = 2'd0;
      4'b0010 : out = 2'd1;
      4'b0100 : out = 2'd2;
      4'b1000 : out = 2'd3;
      default : out = 2'd0;
    endcase
  end

endmodule

