//========================================================================
// Prob13p06_seq_count_3b_bin_var_dn_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       ld,
  input  logic [2:0] in_,
  output logic [2:0] out,
  output logic       done
);

  // Counter register

  logic [2:0] counter;
  logic [2:0] counter_next;

  always @( posedge clk ) begin
    if ( ld )
      counter <= in_;
    else
      counter <= counter_next;
  end

  // Combinational logic

  always @(*) begin
    if ( counter != 0 )
      counter_next = counter - 1;
    else
      counter_next = counter;
  end

  assign out  = counter;
  assign done = ( counter == 0 );

endmodule

