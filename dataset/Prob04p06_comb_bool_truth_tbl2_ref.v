//========================================================================
// Prob04p06_comb_bool_truth_tbl2_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic a,
  input  logic b,
  input  logic c,
  input  logic d,
  output logic f
);

  always @(*) begin
    case ({a,b,c,d})
      4'b0000 : f = 1;
      4'b0001 : f = 1;
      4'b0010 : f = 0;
      4'b0011 : f = 0;
      4'b0100 : f = 1;
      4'b0101 : f = 1;
      4'b0110 : f = 0;
      4'b0111 : f = 0;
      4'b1000 : f = 1;
      4'b1001 : f = 0;
      4'b1010 : f = 1;
      4'b1011 : f = 0;
      4'b1100 : f = 0;
      4'b1101 : f = 1;
      4'b1110 : f = 0;
      4'b1111 : f = 1;
    endcase
  end

endmodule

