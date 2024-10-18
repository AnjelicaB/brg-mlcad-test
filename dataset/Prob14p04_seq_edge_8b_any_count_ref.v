//========================================================================
// Prob14p04_seq_edge_8b_any_count_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  input  logic       clear,
  input  logic [7:0] in_,
  output logic [7:0] count
);

  // Register for previous cycle

  logic [7:0] prev_in_;

  always @( posedge clk ) begin
    if ( reset || clear )
      prev_in_ <= 0;
    else
      prev_in_ <= in_;
  end

  // Combinational logic for detecting transitions

  logic [7:0] transitions;
  assign transitions = prev_in_ ^ in_;

  // Counter

  logic [7:0] counter, counter_next;

  always @( posedge clk ) begin
    if ( reset || clear )
      counter <= 0;
    else
      counter <= counter_next;
  end

  // Combinational logic for counting transitions

  logic [7:0] transition_count;

  always @(*) begin

    transition_count = 0;
    for ( int i = 0; i < 8; i++ )
      transition_count = transition_count + transitions[i];

    counter_next = counter + transition_count;

  end

  assign count = counter;

endmodule

