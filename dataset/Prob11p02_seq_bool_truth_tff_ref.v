//========================================================================
// Prob11p02_seq_bool_truth_tff_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024
// This is a toggle flip-flop with a reset input.

module RefModule
(
  input  logic clk,
  input  logic a,   // reset
  input  logic b,   // toggle
  output logic q
);

  always @( posedge clk ) begin
    case ({a,b})
      2'b00 : q <=  q; // hold
      2'b01 : q <= ~q; // toggle
      2'b10 : q <=  0; // reset
      2'b11 : q <=  0; // reset
    endcase
  end

endmodule

