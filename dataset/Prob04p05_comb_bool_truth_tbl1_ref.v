//========================================================================
// Prob04p05_comb_bool_truth_tbl1_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic a,
  input  logic b,
  input  logic c,
  output logic f
);

  always @(*) begin
    case ({a,b,c})
      3'b000 : f = 1;
      3'b001 : f = 1;
      3'b010 : f = 1;
      3'b011 : f = 0;
      3'b100 : f = 1;
      3'b101 : f = 0;
      3'b110 : f = 0;
      3'b111 : f = 1;
    endcase
  end

endmodule

