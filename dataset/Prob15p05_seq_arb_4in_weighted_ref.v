//========================================================================
// Prob15p05_seq_arb_4in_weighted_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  input  logic       preset,
  input  logic [3:0] reqs,
  output logic [3:0] grants
);

  // Register for priority

  logic [3:0] priority_reg, priority_reg_next;

  always @( posedge clk ) begin
    if ( reset )
      priority_reg <= 4'b0001;
    else
      priority_reg <= priority_reg_next;
  end

  // Weighted counter registers

  logic [2:0] counter      [4];
  logic [2:0] counter_next [4];

  always @( posedge clk ) begin
    if ( reset || preset ) begin
      counter[0] <= 3;
      counter[1] <= 3;
      counter[2] <= 1;
      counter[3] <= 1;
    end
    else begin
      counter[0] <= counter_next[0];
      counter[1] <= counter_next[1];
      counter[2] <= counter_next[2];
      counter[3] <= counter_next[3];
    end
  end

  // Combinational logic to ignore requests if counter is zero

  logic [3:0] reqs_w;

  assign reqs_w[0] = ( counter[0] == 0 ) ? 0 : reqs[0];
  assign reqs_w[1] = ( counter[1] == 0 ) ? 0 : reqs[1];
  assign reqs_w[2] = ( counter[2] == 0 ) ? 0 : reqs[2];
  assign reqs_w[3] = ( counter[3] == 0 ) ? 0 : reqs[3];

  // Combinational arbitration logic

  always @(*) begin

    grants = 4'b0000;
    case ( priority_reg )

      4'b0001: begin
        if      ( reqs_w[0] ) grants = 4'b0001;
        else if ( reqs_w[1] ) grants = 4'b0010;
        else if ( reqs_w[2] ) grants = 4'b0100;
        else if ( reqs_w[3] ) grants = 4'b1000;
      end

      4'b0010: begin
        if      ( reqs_w[1] ) grants = 4'b0010;
        else if ( reqs_w[2] ) grants = 4'b0100;
        else if ( reqs_w[3] ) grants = 4'b1000;
        else if ( reqs_w[0] ) grants = 4'b0001;
      end

      4'b0100: begin
        if      ( reqs_w[2] ) grants = 4'b0100;
        else if ( reqs_w[3] ) grants = 4'b1000;
        else if ( reqs_w[0] ) grants = 4'b0001;
        else if ( reqs_w[1] ) grants = 4'b0010;
      end

      4'b1000: begin
        if      ( reqs_w[3] ) grants = 4'b1000;
        else if ( reqs_w[0] ) grants = 4'b0001;
        else if ( reqs_w[1] ) grants = 4'b0010;
        else if ( reqs_w[2] ) grants = 4'b0100;
      end

      default:
        grants = 4'b0000;

    endcase

  end

  // Combinational logic to update counters

  logic [1:0] idx;

  always @(*) begin
    counter_next[0] = counter[0];
    counter_next[1] = counter[1];
    counter_next[2] = counter[2];
    counter_next[3] = counter[3];
    idx = 0;

    if ( |grants ) begin

      case ( grants )
        4'b0001 : idx = 0;
        4'b0010 : idx = 1;
        4'b0100 : idx = 2;
        4'b1000 : idx = 3;
        default : idx = 0;
      endcase

      // Technically, should not have won grant if counter is 0!
      if ( counter_next[idx] != 0 )
        counter_next[idx] = counter[idx] - 1;

    end
  end

  // Combinational priority logic

  always @(*) begin
    priority_reg_next = priority_reg;
    if ( |grants ) begin
      priority_reg_next = { grants[2:0], grants[3] };
    end
  end

endmodule

