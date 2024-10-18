//========================================================================
// Prob18p03_seq_arith_2x4b_add_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       reset,
  input  logic [3:0] in0,
  input  logic [3:0] in1,
  output logic [3:0] out
);

  // Registers

  logic carry, carry_next;
  logic count, count_next;

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

  logic [3:0] sum;

  always @(*) begin

    // do bit-serial addition

    {carry_next,sum} = in0 + in1 + carry;

    // update counter

    count_next = count + 1;

    // clear counter and carry after four cycles

    if ( count == 1 ) begin
      carry_next = 0;
      count_next = 0;
    end

  end

  assign out = sum;

endmodule

