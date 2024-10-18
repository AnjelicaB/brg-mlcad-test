//========================================================================
// Prob13p07_seq_count_4b_dec_up_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  output logic [3:0] out
);

  // Counter register

  logic [3:0] counter;
  logic [3:0] counter_next;

  always @( posedge clk ) begin
    if ( reset )
      counter <= 0;
    else
      counter <= counter_next;
  end

  // Combinational logic

  always @(*) begin
    if ( counter != 9 )
      counter_next = counter + 1;
    else
      counter_next = 0;
  end

  assign out = counter;

endmodule

