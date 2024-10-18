//========================================================================
// Prob08p06_comb_fsm_6s2i2o_mo_tbl_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic [2:0] state,
  input  logic [1:0] in_,
  output logic [2:0] state_next,
  output logic       out0,
  output logic       out1
);

  // State Encoding

  parameter A = 3'd0;
  parameter B = 3'd1;
  parameter C = 3'd2;
  parameter D = 3'd3;
  parameter E = 3'd4;
  parameter F = 3'd5;

  // State Transition Logic

  task update_state
  (
    input logic [1:0] in,
    input logic [2:0] state_next_in_00,
    input logic [2:0] state_next_in_01,
    input logic [2:0] state_next_in_10,
    input logic [2:0] state_next_in_11
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
       A : update_state( in_,  A,     B,     A,     E    );
       B : update_state( in_,  C,     B,     A,     E    );
       C : update_state( in_,  A,     D,     A,     E    );
       D : update_state( in_,  C,     B,     A,     E    );
       E : update_state( in_,  F,     F,     A,     E    );
       F : update_state( in_,  A,     A,     A,     A    );
       default : state_next = 0;
    endcase
  end

  // State Output Logic

  logic [1:0] out;

  always @(*) begin
    case ( state )
      A       : out = 2'b00;
      B       : out = 2'b00;
      C       : out = 2'b00;
      D       : out = 2'b10;
      E       : out = 2'b01;
      F       : out = 2'b01;
      default : out = 2'b00;
    endcase
  end

  assign out0 = out[1];
  assign out1 = out[0];

endmodule

