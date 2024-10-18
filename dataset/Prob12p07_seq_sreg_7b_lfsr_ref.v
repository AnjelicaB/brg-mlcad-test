//========================================================================
// Prob12p07_seq_sreg_7b_lfsr_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  output logic [6:0] out
);

  logic [6:0] sreg;

  always @( posedge clk ) begin
    if ( reset )
      sreg <= 7'b0000001;
    else begin
      sreg[0] <= sreg[1];
      sreg[1] <= sreg[2];
      sreg[2] <= sreg[3];
      sreg[3] <= sreg[4] ^ sreg[0];
      sreg[4] <= sreg[5] ^ sreg[0];
      sreg[5] <= sreg[6] ^ sreg[0];
      sreg[6] <= sreg[0];
    end
  end

  assign out = sreg;

endmodule

