//========================================================================
// Prob16p02_seq_fsm_4s1i1o_mo_tbl1_ref
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
      A       : out = 0;
      B       : out = 0;
      C       : out = 0;
      D       : out = 1;
      default : out = 0;
    endcase
  end

endmodule

