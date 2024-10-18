//========================================================================
// Prob10p02_seq_gates_1b_dffe_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic clk,
  input  logic en,
  input  logic d,
  output logic q
);

  always @( posedge clk ) begin
    if ( en )
      q <= d;
  end

endmodule

