//========================================================================
// Prob17p03_seq_mem_8x8b_1r1w_rf_z_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic [2:0] read_addr,
  output logic [7:0] read_data,
  input  logic       write_en,
  input  logic [2:0] write_addr,
  input  logic [7:0] write_data
);

  // Memory

  reg [7:0] mem [8];

  // Read Port

  always @(*) begin
    if ( read_addr == 0 )
      read_data = 8'h00;
    else
      read_data = mem[read_addr];
  end

  // Write Port

  always @( posedge clk ) begin
    if ( write_en )
      mem[write_addr] <= write_data;
  end

endmodule

