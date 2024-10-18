//========================================================================
// Prob12p04_seq_sreg_8b_universal_ref
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
  input  logic       sin,
  output logic [7:0] pout,
  output logic       sout
);

  logic [7:0] sreg;

  always @( posedge clk ) begin
    if ( reset )
      sreg <= 8'b0000_0000;
    else if ( ld )
      sreg <= pin;
    else if ( en )
      sreg <= { sreg[6:0], sin };
  end

  assign pout = sreg;
  assign sout = sreg[7];

endmodule

