//========================================================================
// Prob13p05_seq_count_2b_bin_sat_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  input  logic       en,
  input  logic       op,
  output logic [1:0] out
);

  // Counter register

  logic [1:0] counter;
  logic [1:0] counter_next;

  always @( posedge clk ) begin
    if ( reset )
      counter <= 2;
    else if ( en )
      counter <= counter_next;
  end

  // Combinational logic

  always @(*) begin
    if (( op == 0 ) && ( counter != 3 ))
      counter_next = counter + 1;
    else if (( op == 1 ) && ( counter != 0 ))
      counter_next = counter - 1;
    else
      counter_next = counter;
  end

  assign out = counter;

endmodule

