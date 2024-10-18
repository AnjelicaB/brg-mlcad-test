//========================================================================
// Prob16p05_seq_fsm_4s2i1o_mo_tbl_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  input  logic [1:0] in_,
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

  task update_state
  (
    input logic [1:0] in,
    input logic [1:0] state_next_in_00,
    input logic [1:0] state_next_in_01,
    input logic [1:0] state_next_in_10,
    input logic [1:0] state_next_in_11
  );
    case ( in )
      2'b00 : state_next = state_next_in_00;
      2'b01 : state_next = state_next_in_01;
      2'b10 : state_next = state_next_in_10;
      2'b11 : state_next = state_next_in_11;
    endcase
  endtask

  always @(*) begin
    case ( state )
    // Current               ------- Next State --------
    // State                 in_=00 in_=01 in_=10 in_=11
       A : update_state( in_,  A,     B,     A,     D    );
       B : update_state( in_,  C,     B,     A,     D    );
       C : update_state( in_,  A,     D,     A,     D    );
       D : update_state( in_,  C,     B,     A,     D    );
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

