//========================================================================
// Prob13p09_seq_count_clock_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  input  logic       tick,
  input  logic       set_en,
  input  logic [3:0] set_hours,
  input  logic [5:0] set_mins,
  input  logic       set_pm,
  output logic [3:0] hours,
  output logic [5:0] mins,
  output logic       pm
);

  // Clock registers

  logic [3:0] clock_hours, clock_hours_next;
  logic [5:0] clock_mins,  clock_mins_next;
  logic       clock_pm,    clock_pm_next;

  always @( posedge clk ) begin
    if ( reset ) begin
      clock_hours <= 12;
      clock_mins  <= 0;
      clock_pm    <= 0;
    end
    else if ( set_en ) begin
      clock_hours <= set_hours;
      clock_mins  <= set_mins;
      clock_pm    <= set_pm;
    end
    else begin
      clock_hours <= clock_hours_next;
      clock_mins  <= clock_mins_next;
      clock_pm    <= clock_pm_next;
    end
  end

  // Combinational logic

  always @(*) begin

    clock_hours_next = clock_hours;
    clock_mins_next  = clock_mins;
    clock_pm_next    = clock_pm;

    if ( tick ) begin

      // 11:59xx -> 12:00yy (toggle am, pm)
      if (( clock_hours == 11 ) && ( clock_mins == 59 )) begin
        clock_hours_next = 12;
        clock_mins_next  = 0;
        clock_pm_next    = ~clock_pm;
      end

      // 12:59xx -> 01:00xx
      else if (( clock_hours == 12 ) && ( clock_mins == 59 )) begin
        clock_hours_next = 1;
        clock_mins_next  = 0;
      end

      // XX:59xx -> YY:00xx (increment hour)
      else if ( clock_mins == 59 ) begin
        clock_hours_next = clock_hours + 1;
        clock_mins_next  = 0;
      end

      // otherwise increment minute
      else begin
        clock_mins_next  = clock_mins + 1;
      end
    end

  end

  assign hours = clock_hours;
  assign mins  = clock_mins;
  assign pm    = clock_pm;

endmodule

