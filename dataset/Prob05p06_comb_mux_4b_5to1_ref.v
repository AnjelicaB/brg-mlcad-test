//========================================================================
// Prob05p06_comb_mux_4b_5to1_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [3:0] in0,
  input  logic [3:0] in1,
  input  logic [3:0] in2,
  input  logic [3:0] in3,
  input  logic [3:0] in4,
  input  logic [2:0] sel,
  output logic [3:0] out
);

  always @(*) begin
    case ( sel )
      3'd0    : out = in0;
      3'd1    : out = in1;
      3'd2    : out = in2;
      3'd3    : out = in3;
      3'd4    : out = in4;
      default : out = 4'b0;
    endcase
  end

endmodule

