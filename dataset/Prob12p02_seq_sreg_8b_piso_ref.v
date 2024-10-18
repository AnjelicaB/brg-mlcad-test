//========================================================================
// Prob12p02_seq_sreg_8b_piso_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  input  logic       en,
  input  logic       ld,
  input  logic [7:0] pin,
  output logic       sout
);

  logic [7:0] sreg;

  always @( posedge clk ) begin
    if ( reset )
      sreg <= 8'b0000_0000;
    else if ( ld )
      sreg <= pin;
    else if ( en )
      sreg <= { sreg[6:0], 1'b0 };
  end

  assign sout = sreg[7];

endmodule

