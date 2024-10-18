//========================================================================
// Prob18p01_seq_arith_4x1b_incr_ref
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

  // Registers

  logic       carry, carry_next;
  logic [2:0] count, count_next;

  always @( posedge clk ) begin
    if ( reset ) begin
      carry <= 1;
      count <= 0;
    end
    else begin
      carry <= carry_next;
      count <= count_next;
    end
  end

  logic sum;

  always @(*) begin

    // do bit-serial addition

    {carry_next,sum} = carry + in_;

    // update counter

    count_next = count + 1;

    // clear counter and carry after four cycles

    if ( count == 3 ) begin
      carry_next = 1;
      count_next = 0;
    end

  end

  assign out = sum;

endmodule

