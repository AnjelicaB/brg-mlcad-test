//========================================================================
// Prob13p03_seq_count_3b_bin_dn_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  output logic [2:0] out
);

  // Counter register

  logic [2:0] counter;
  logic [2:0] counter_next;

  always @( posedge clk ) begin
    if ( reset )
      counter <= 7;
    else
      counter <= counter_next;
  end

  // Combinational logic

  assign counter_next = counter - 1;
  assign out = counter;

endmodule

