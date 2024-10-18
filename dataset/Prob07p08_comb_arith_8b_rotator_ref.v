//========================================================================
// Prob07p08_comb_arith_8b_rotator_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [7:0] in_,
  input  logic [2:0] amt,
  input  logic       op,
  output logic [7:0] out
);

  logic [15:0] temp;

  always @(*) begin
   if ( op == 1'd0 ) begin
     temp = { in_, in_ } << amt;
     out  = temp[15:8];
   end
   else begin
     temp = { in_, in_ } >> amt;
     out  = temp[7:0];
   end
  end

endmodule

