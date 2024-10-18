//========================================================================
// Prob10p06_seq_gates_8b_dff_byte_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic        clk,
  input  logic [ 1:0] en,
  input  logic [15:0] d,
  output logic [15:0] q
);

  always @( posedge clk ) begin
    if ( en[0] )
      q[7:0] <= d[7:0];
    if ( en[1] )
      q[15:8] <= d[15:8];
  end

endmodule

