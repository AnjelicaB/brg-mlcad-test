//========================================================================
// Prob16p01_seq_fsm_4s1i1o_mo_tbl0_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  input  logic       in_,
  output logic [3:0] state,
  output logic       out
);

  // State Encoding

  parameter A = 4'b0001;
  parameter B = 4'b0010;
  parameter C = 4'b0100;
  parameter D = 4'b1000;

  // State Register

  logic [3:0] state_next;

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

