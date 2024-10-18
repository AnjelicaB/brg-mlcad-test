//========================================================================
// Prob19p05_seq_pipe_add2_2stage_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic [7:0] in0,
  input  logic [7:0] in1,
  output logic [3:0] out_lsn,
  output logic [7:0] out
);

  //----------------------------------------------------------------------
  // stage 0
  //----------------------------------------------------------------------

  logic [7:0] in0_X0;
  logic [7:0] in1_X0;

  always @( posedge clk ) begin
    in0_X0 <= in0;
    in1_X0 <= in1;
  end

  logic [3:0] out_lsn_X0;
  logic       out_lsn_cout_X0;

  assign {out_lsn_cout_X0,out_lsn_X0} = in0_X0[3:0] + in1_X0[3:0];

  assign out_lsn = out_lsn_X0;

  //----------------------------------------------------------------------
  // stage 1
  //----------------------------------------------------------------------

  logic [3:0] in0_msn_X1;
  logic [3:0] in1_msn_X1;
  logic [3:0] out_lsn_X1;
  logic       out_lsn_cout_X1;

  always @( posedge clk ) begin
    in0_msn_X1      <= in0_X0[7:4];
    in1_msn_X1      <= in1_X0[7:4];
    out_lsn_X1      <= out_lsn_X0;
    out_lsn_cout_X1 <= out_lsn_cout_X0;
  end

  logic [3:0] out_msn_X1;

  assign out_msn_X1 = in0_msn_X1 + in1_msn_X1 + out_lsn_cout_X1;

  assign out = { out_msn_X1, out_lsn_X1 };

endmodule

