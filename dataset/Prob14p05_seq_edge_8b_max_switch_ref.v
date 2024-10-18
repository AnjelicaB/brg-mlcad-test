//========================================================================
// Prob14p05_seq_edge_8b_max_switch_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic [7:0] in_,
  output logic       max_switching
);

  // Register for previous cycle

  logic [7:0] prev_in_;

  always @( posedge clk )
    prev_in_ <= in_;

  // Check for worst case switching

  always @(*) begin
    max_switching = 0;
    if ( (prev_in_ == 8'b0101_0101) && (in_ == 8'b1010_1010) )
      max_switching = 1;
    if ( (prev_in_ == 8'b1010_1010) && (in_ == 8'b0101_0101) )
      max_switching = 1;
  end

endmodule

