//========================================================================
// Prob04p07_comb_bool_kmap0_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic a,
  input  logic b,
  output logic f
);

  always @(*) begin
    case ({a,b})
      2'b00 : f = 1;
      2'b01 : f = 1;
      2'b10 : f = 1;
      2'b11 : f = 0;
    endcase
  end

endmodule

