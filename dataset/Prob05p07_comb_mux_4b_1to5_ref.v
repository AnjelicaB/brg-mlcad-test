//========================================================================
// Prob05p07_comb_mux_4b_1to5_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [3:0] in_,
  input  logic [2:0] sel,
  output logic [3:0] out0,
  output logic [3:0] out1,
  output logic [3:0] out2,
  output logic [3:0] out3,
  output logic [3:0] out4
);

  always @(*) begin

    out0 = 4'b0;
    out1 = 4'b0;
    out2 = 4'b0;
    out3 = 4'b0;
    out4 = 4'b0;

    case ( sel )
      3'd0 : out0 = in_;
      3'd1 : out1 = in_;
      3'd2 : out2 = in_;
      3'd3 : out3 = in_;
      3'd4 : out4 = in_;
      // to avoid verilator warning
      default : out0 = 4'b0;
    endcase

  end

endmodule

