//========================================================================
// Prob12p06_seq_sreg_5b_lfsr_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  output logic [4:0] out
);

  logic [4:0] sreg;

  always @( posedge clk ) begin
    if ( reset )
      sreg <= 5'b0001;
    else begin
      sreg[0] <= sreg[1];
      sreg[1] <= sreg[2];
      sreg[2] <= sreg[3] ^ sreg[0];
      sreg[3] <= sreg[4];
      sreg[4] <= sreg[0];
    end
  end

  assign out = sreg;

endmodule

