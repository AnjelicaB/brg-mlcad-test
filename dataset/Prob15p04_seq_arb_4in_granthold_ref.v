//========================================================================
// Prob15p04_seq_arb_4in_granthold_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  input  logic [3:0] reqs,
  input  logic [3:0] holds,
  output logic [3:0] grants
);

  // Register for priority and last grant

  logic [3:0] priority_reg,   priority_reg_next;
  logic [3:0] last_grant_reg, last_grant_reg_next;

  always @( posedge clk ) begin
    if ( reset ) begin
      priority_reg   <= 4'b0001;
      last_grant_reg <= 4'b0000;
    end
    else begin
      priority_reg   <= priority_reg_next;
      last_grant_reg <= grants;
    end
  end

  // Combinational arbitration logic

  logic [3:0] hold;

  always @(*) begin
    grants = 4'b0000;
    case ( priority_reg )

      4'b0001: begin
        if      ( reqs[0] ) grants = 4'b0001;
        else if ( reqs[1] ) grants = 4'b0010;
        else if ( reqs[2] ) grants = 4'b0100;
        else if ( reqs[3] ) grants = 4'b1000;
      end

      4'b0010: begin
        if      ( reqs[1] ) grants = 4'b0010;
        else if ( reqs[2] ) grants = 4'b0100;
        else if ( reqs[3] ) grants = 4'b1000;
        else if ( reqs[0] ) grants = 4'b0001;
      end

      4'b0100: begin
        if      ( reqs[2] ) grants = 4'b0100;
        else if ( reqs[3] ) grants = 4'b1000;
        else if ( reqs[0] ) grants = 4'b0001;
        else if ( reqs[1] ) grants = 4'b0010;
      end

      4'b1000: begin
        if      ( reqs[3] ) grants = 4'b1000;
        else if ( reqs[0] ) grants = 4'b0001;
        else if ( reqs[1] ) grants = 4'b0010;
        else if ( reqs[2] ) grants = 4'b0100;
      end

      default:
        grants = 4'b0000;

    endcase

    // Override the grants if the winner from last cycle has its
    // corresponding bit of the holds input set high.

    hold = last_grant_reg & holds;
    if ( |hold ) begin
      grants = hold;
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

