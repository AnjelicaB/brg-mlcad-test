//========================================================================
// Prob18p04_seq_arith_8b_accum_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  input  logic [7:0] in_,
  output logic [7:0] out
);

  // Registers

  logic [7:0] accum, accum_next;

  always @( posedge clk ) begin
    if ( reset )
      accum <= 0;
    else
      accum <= accum_next;
  end

  // Combinational logic

  assign accum_next = accum + in_;
  assign out        = accum_next;

endmodule

