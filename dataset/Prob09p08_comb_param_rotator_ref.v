//========================================================================
// Prob09p08_comb_param_rotator_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
#(
  parameter nbits
)(
  input  logic [        nbits-1:0] in_,
  input  logic [$clog2(nbits)-1:0] amt,
  input  logic                     op,
  output logic [        nbits-1:0] out
);

  logic [(2*nbits)-1:0] temp;

  always @(*) begin
   if ( op == 1'd0 ) begin
     temp = { in_, in_ } << amt;
     out  = temp[(2*nbits)-1:nbits];
   end
   else begin
     temp = { in_, in_ } >> amt;
     out  = temp[nbits-1:0];
   end
  end

endmodule

