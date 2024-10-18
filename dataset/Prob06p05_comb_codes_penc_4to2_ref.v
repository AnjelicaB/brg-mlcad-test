//========================================================================
// Prob06p05_comb_codes_penc_4to2_ref
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
      4'b0011 : out = 2'd0;
      4'b0101 : out = 2'd0;
      4'b0111 : out = 2'd0;
      4'b1001 : out = 2'd0;
      4'b1011 : out = 2'd0;
      4'b1101 : out = 2'd0;
      4'b1111 : out = 2'd0;

      4'b0010 : out = 2'd1;
      4'b0110 : out = 2'd1;
      4'b1010 : out = 2'd1;
      4'b1110 : out = 2'd1;

      4'b0100 : out = 2'd2;
      4'b1100 : out = 2'd2;

      4'b1000 : out = 2'd3;

      4'b0000 : out = 2'd0;

    endcase
  end

endmodule

