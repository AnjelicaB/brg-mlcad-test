//========================================================================
// Prob18p02_seq_arith_4x1b_add_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic clk,
  input  logic reset,
  input  logic in0,
  input  logic in1,
  output logic out
);

  // Registers

  logic       carry, carry_next;
  logic [2:0] count, count_next;

  always @( posedge clk ) begin
    if ( reset ) begin
      carry <= 0;
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

    {carry_next,sum} = in0 + in1 + carry;

    // update counter

    count_next = count + 1;

    // clear counter and carry after four cycles

    if ( count == 3 ) begin
      carry_next = 0;
      count_next = 0;
    end

  end

  assign out = sum;

endmodule

