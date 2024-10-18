//========================================================================
// Prob05p03_comb_mux_1b_1to8_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       in_,
  input  logic [2:0] sel,
  output logic       out0,
  output logic       out1,
  output logic       out2,
  output logic       out3,
  output logic       out4,
  output logic       out5,
  output logic       out6,
  output logic       out7
);

  always @(*) begin

    out0 = 1'b0;
    out1 = 1'b0;
    out2 = 1'b0;
    out3 = 1'b0;
    out4 = 1'b0;
    out5 = 1'b0;
    out6 = 1'b0;
    out7 = 1'b0;

    case ( sel )
      3'd0 : out0 = in_;
      3'd1 : out1 = in_;
      3'd2 : out2 = in_;
      3'd3 : out3 = in_;
      3'd4 : out4 = in_;
      3'd5 : out5 = in_;
      3'd6 : out6 = in_;
      3'd7 : out7 = in_;
    endcase

  end

endmodule

