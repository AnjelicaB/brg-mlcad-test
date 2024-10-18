//========================================================================
// Prob10p05_seq_gates_8b_dffre_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  input  logic       en,
  input  logic [7:0] d,
  output logic [7:0] q
);

  always @( posedge clk ) begin
    if ( reset )
      q <= 8'hff;
    else if ( en )
      q <= d;
  end

endmodule

