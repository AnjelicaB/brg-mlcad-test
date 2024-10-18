//========================================================================
// Prob16p13_seq_fsm_ps2_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  input  logic [7:0] in_,
  output logic       done
);

  // State Encoding

  parameter A = 2'd0;
  parameter B = 2'd1;
  parameter C = 2'd2;

  // State Register

  logic [1:0] state, state_next;

  always @( posedge clk ) begin
    if ( reset )
      state <= A;
    else
      state <= state_next;
  end

  // State Transition Logic

  always @(*) begin
    case ( state )
      A       : state_next = ( in_[3] == 1 ) ? B : A;
      B       : state_next = C;
      C       : state_next = A;
      default : state_next = 0;
    endcase
  end

  // State Output Logic

  always @(*) begin
    case ( state )
      A       : done = 0;
      B       : done = 0;
      C       : done = 1;
      default : done = 0;
    endcase
  end

endmodule

