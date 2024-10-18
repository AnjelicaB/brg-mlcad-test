//========================================================================
// Prob16p11_seq_fsm_pattern2_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic clk,
  input  logic reset,
  input  logic in_,
  output logic out
);

  // State Encoding

  parameter A = 3'd0;
  parameter B = 3'd1;
  parameter C = 3'd2;
  parameter D = 3'd3;
  parameter E = 3'd4;

  // State Register

  logic [2:0] state, state_next;

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
      B       : state_next = ( in_ == 0 ) ? A : C;
      C       : state_next = ( in_ == 0 ) ? A : D;
      D       : state_next = ( in_ == 0 ) ? E : D;
      E       : state_next = ( in_ == 0 ) ? A : B;
      default : state_next = 0;
    endcase
  end

  // State Output Logic

  always @(*) begin
    case ( state )
      A       : out = ( in_ == 0 ) ? 0 : 0;
      B       : out = ( in_ == 0 ) ? 0 : 0;
      C       : out = ( in_ == 0 ) ? 0 : 0;
      D       : out = ( in_ == 0 ) ? 1 : 0;
      E       : out = ( in_ == 0 ) ? 0 : 0;
      default : out = 0;
    endcase
  end

endmodule

