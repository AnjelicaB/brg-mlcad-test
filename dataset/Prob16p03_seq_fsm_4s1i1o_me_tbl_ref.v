//========================================================================
// Prob16p03_seq_fsm_4s1i1o_me_tbl_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  input  logic       in_,
  output logic [1:0] state,
  output logic       out
);

  // State Encoding

  parameter A = 2'd0;
  parameter B = 2'd1;
  parameter C = 2'd2;
  parameter D = 2'd3;

  // State Register

  logic [1:0] state_next;

  always @( posedge clk ) begin
    if ( reset )
      state <= A;
    else
      state <= state_next;
  end

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

  always @(*) begin
    case ( state )
      A       : out = ( in_ == 0 ) ? 0 : 1;
      B       : out = ( in_ == 0 ) ? 1 : 0;
      C       : out = ( in_ == 0 ) ? 0 : 1;
      D       : out = ( in_ == 0 ) ? 0 : 0;
      default : out = 0;
    endcase
  end

endmodule

