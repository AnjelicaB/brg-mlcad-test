//========================================================================
// Prob12p05_seq_sreg_8b_bidir_ref
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
  input  logic       op,
  output logic [7:0] pout
);

  logic [7:0] sreg;

  always @( posedge clk ) begin
    if ( reset )
      sreg <= 8'b0000_0000;
    else if ( ld )
      sreg <= pin;
    else if ( en ) begin
      if ( op == 0 )
        sreg <= { sreg[6:0], 1'b0 };
      else
        sreg <= { 1'b0, sreg[7:1] };
    end
  end

  assign pout = sreg;

endmodule

