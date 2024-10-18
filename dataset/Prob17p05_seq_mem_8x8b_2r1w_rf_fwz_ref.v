//========================================================================
// Prob17p05_seq_mem_8x8b_2r1w_rf_fwz_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic [2:0] read_addr0,
  output logic [7:0] read_data0,
  input  logic [2:0] read_addr1,
  output logic [7:0] read_data1,
  input  logic       write_en,
  input  logic [2:0] write_addr,
  input  logic [7:0] write_data
);

  // Memory

  reg [7:0] mem [8];

  // Read Port 0

  always @(*) begin
    if ( read_addr0 == 0 )
      read_data0 = 8'h00;
    else if ( write_en && ( write_addr == read_addr0 ) )
      read_data0 = write_data;
    else
      read_data0 = mem[read_addr0];
  end

  // Read Port 1

  always @(*) begin
    if ( read_addr1 == 0 )
      read_data1 = 8'h00;
    else if ( write_en && ( write_addr == read_addr1 ) )
      read_data1 = write_data;
    else
      read_data1 = mem[read_addr1];
  end

  // Write Port

  always @( posedge clk ) begin
    if ( write_en )
      mem[write_addr] <= write_data;
  end

endmodule

