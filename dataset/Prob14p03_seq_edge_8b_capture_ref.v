//========================================================================
// Prob14p03_seq_edge_8b_capture_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       clear,
  input  logic [7:0] in_,
  output logic [7:0] out
);

  // Registers

  logic [7:0] prev_in_;
  logic [7:0] out_reg;
  logic [7:0] out_reg_next;

  always @( posedge clk ) begin
    if ( clear ) begin
      prev_in_ <= 8'b0000_0000;
      out_reg  <= 8'b0000_0000;
    end
    else begin
      prev_in_ <= in_;
      out_reg  <= out_reg_next;
    end
  end

  // Combinational capture logic

  logic [7:0] rising_edge;
  assign rising_edge  = ~prev_in_ & in_;
  assign out_reg_next = out_reg | rising_edge;
  assign out          = out_reg_next;

endmodule

