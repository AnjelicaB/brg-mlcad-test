//========================================================================
// Prob12p03_seq_sreg_8b_sipo_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  input  logic       en,
  input  logic       sin,
  output logic [7:0] pout
);

  logic [7:0] sreg;

  always @( posedge clk ) begin
    if ( reset )
      sreg <= 8'b0000_0000;
    else if ( en )
      sreg <= { sreg[6:0], sin };
  end

  assign pout = sreg;

endmodule

