//========================================================================
// Prob13p08_seq_count_timer_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  input  logic       restart,
  input  logic       tick,
  input  logic       run,
  output logic [5:0] mins,
  output logic [5:0] secs
);

  // Timer registers

  logic [5:0] timer_mins, timer_mins_next;
  logic [5:0] timer_secs, timer_secs_next;

  always @( posedge clk ) begin
    if ( reset ) begin
      timer_mins <= 0;
      timer_secs <= 0;
    end
    else if ( restart ) begin
      timer_mins <= 0;
      timer_secs <= 0;
    end
    else begin
      timer_mins <= timer_mins_next;
      timer_secs <= timer_secs_next;
    end
  end

  // Combinational logic

  always @(*) begin

    timer_mins_next = timer_mins;
    timer_secs_next = timer_secs;

    if ( tick && run ) begin
      if ( timer_secs != 59 ) begin
        timer_secs_next = timer_secs + 1;
      end
      else if ( timer_mins != 59 ) begin
        timer_secs_next = 0;
        timer_mins_next = timer_mins + 1;
      end
    end

  end

  assign mins = timer_mins;
  assign secs = timer_secs;

endmodule

