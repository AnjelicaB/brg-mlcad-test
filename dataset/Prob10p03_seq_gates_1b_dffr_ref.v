//========================================================================
// Prob10p03_seq_gates_1b_dffr_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic clk,
  input  logic reset,
  input  logic d,
  output logic q
);

  always @( posedge clk ) begin
    if ( reset )
      q <= 0;
    else
      q <= d;
  end

endmodule

