//========================================================================
// Prob08p04_comb_fsm_4s1i2o_mo_tbl_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [1:0] state,
  input  logic       in_,
  output logic [1:0] state_next,
  output logic       out0,
  output logic       out1
);

  // State Encoding

  parameter A = 2'd0;
  parameter B = 2'd1;
  parameter C = 2'd2;
  parameter D = 2'd3;

  // State Transition Logic

  always @(*) begin
    case ( state )
      A       : state_next = ( in_ == 0 ) ? A : B;
      B       : state_next = ( in_ == 0 ) ? C : B;
      C       : state_next = ( in_ == 0 ) ? A : D;
      D       : state_next = ( in_ == 0 ) ? C : B;
      default : state_next = 0;
    endcase
  end

  // State Output Logic

  logic [1:0] out;

  always @(*) begin
    case ( state )
      A       : out = 2'b00;
      B       : out = 2'b01;
      C       : out = 2'b01;
      D       : out = 2'b10;
      default : out = 2'b00;
    endcase
  end

  assign out0 = out[1];
  assign out1 = out[0];

endmodule

