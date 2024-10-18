//========================================================================
// Prob07p15_comb_arith_8b_alu_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [7:0] in0,
  input  logic [7:0] in1,
  input  logic [2:0] op,
  output logic [7:0] out
);

  always @(*) begin
    case ( op )
      3'd0   : out = in0 +  in1;
      3'd1   : out = in0 -  in1;
      3'd2   : out = in0 << in1[2:0];
      3'd3   : out = in0 >> in1[2:0];
      3'd4   : out = in0 <  in1;
      3'd5   : out = in0 == in1;
      3'd6   : out = in0 >  in1;
      default: out = 0;
    endcase
  end

endmodule

