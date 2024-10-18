//========================================================================
// Prob05p02_comb_mux_1b_8to1_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       in0,
  input  logic       in1,
  input  logic       in2,
  input  logic       in3,
  input  logic       in4,
  input  logic       in5,
  input  logic       in6,
  input  logic       in7,
  input  logic [2:0] sel,
  output logic       out
);

  always @(*) begin
    case ( sel )
      3'd0 : out = in0;
      3'd1 : out = in1;
      3'd2 : out = in2;
      3'd3 : out = in3;
      3'd4 : out = in4;
      3'd5 : out = in5;
      3'd6 : out = in6;
      3'd7 : out = in7;
    endcase
  end

endmodule

