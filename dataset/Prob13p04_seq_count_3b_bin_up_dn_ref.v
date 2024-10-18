//========================================================================
// Prob13p04_seq_count_3b_bin_up_dn_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  input  logic       op,
  output logic [2:0] out
);

  // Counter register

  logic [2:0] counter;
  logic [2:0] counter_next;

  always @( posedge clk ) begin
    if ( reset )
      counter <= 0;
    else
      counter <= counter_next;
  end

  // Combinational logic

  always @(*) begin
    if ( op == 0 )
      counter_next = counter + 1;
    else
      counter_next = counter - 1;
  end

  assign out = counter;

endmodule

