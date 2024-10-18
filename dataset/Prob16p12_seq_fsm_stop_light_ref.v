//========================================================================
// Prob16p12_seq_fsm_stop_light_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic clk,
  input  logic reset,
  input  logic starting_yellow,
  input  logic change,
  output logic green_on,
  output logic yellow_on,
  output logic red_on
);

  // State Encoding

  parameter GREEN   = 2'd0;
  parameter YELLOW1 = 2'd1;
  parameter RED     = 2'd2;
  parameter YELLOW2 = 2'd3;

  // State Register

  logic [1:0] state, state_next;

  always @( posedge clk ) begin
    if ( reset )
      state <= GREEN;
    else
      state <= state_next;
  end

  // State Transition Logic

  always @(*) begin
    if ( starting_yellow ) begin
      case ( state )
        GREEN   : state_next = ( change ) ? YELLOW1 : GREEN;
        YELLOW1 : state_next = ( change ) ? RED     : YELLOW1;
        RED     : state_next = ( change ) ? YELLOW2 : RED;
        YELLOW2 : state_next = ( change ) ? GREEN   : YELLOW2;
        default : state_next = 0;
      endcase
    end
    else begin
      case ( state )
        GREEN   : state_next = ( change ) ? YELLOW1 : GREEN;
        YELLOW1 : state_next = ( change ) ? RED     : YELLOW1;
        RED     : state_next = ( change ) ? GREEN   : RED;
        default : state_next = 0;
      endcase
    end
  end

  // State Output Logic

  always @(*) begin
    green_on  = ( state == GREEN );
    yellow_on = ( state == YELLOW1 ) || ( state == YELLOW2 );
    red_on    = ( state == RED );
  end

endmodule

