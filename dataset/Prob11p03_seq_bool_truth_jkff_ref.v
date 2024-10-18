//========================================================================
// Prob11p03_seq_bool_truth_jkff_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024
// This is a JK flip-flop.

module RefModule
(
  input  logic clk,
  input  logic a,   // J
  input  logic b,   // K
  output logic q
);

  always @( posedge clk ) begin
    case ({a,b})
      2'b00 : q <=  q; // hold
      2'b01 : q <=  0; // reset
      2'b10 : q <=  1; // set
      2'b11 : q <= ~q; // toggle
    endcase
  end

endmodule

