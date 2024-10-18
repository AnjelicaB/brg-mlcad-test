//========================================================================
// Prob17p06_seq_mem_8x8b_1s1w_cam_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic       write_en,
  input  logic [2:0] write_addr,
  input  logic [7:0] write_data,
  input  logic       search_en,
  input  logic [7:0] search_data,
  output logic [7:0] search_match
);

  // Memory

  reg [7:0] mem [8];

  // Write Port

  always @( posedge clk ) begin
    if ( write_en )
      mem[write_addr] <= write_data;
  end

  // Read Port

  always @(*) begin
    search_match = 8'b0;
    if ( search_en ) begin
      for ( int i = 0; i < 8; i++ )
        search_match[i] = ( mem[i] == search_data );
    end
  end

endmodule

