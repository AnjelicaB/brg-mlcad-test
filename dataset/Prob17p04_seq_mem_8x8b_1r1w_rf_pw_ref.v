//========================================================================
// Prob17p04_seq_mem_8x8b_1r1w_rf_pw_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic [2:0] read_addr,
  output logic [7:0] read_data,
  input  logic [1:0] write_nibble_en,
  input  logic [2:0] write_addr,
  input  logic [7:0] write_data
);

  // Memory

  reg [7:0] mem [8];

  // Read Port

  assign read_data = mem[read_addr];

  // Write Port

  always @( posedge clk ) begin
    if ( write_nibble_en[0] )
      mem[write_addr][3:0] <= write_data[3:0];
    if ( write_nibble_en[1] )
      mem[write_addr][7:4] <= write_data[7:4];
  end

endmodule

