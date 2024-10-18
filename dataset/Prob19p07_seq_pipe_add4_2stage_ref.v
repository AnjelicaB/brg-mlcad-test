//========================================================================
// Prob19p07_seq_pipe_add4_2stage_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  logic       clk,
  input  logic [7:0] in0,
  input  logic [7:0] in1,
  input  logic [7:0] in2,
  input  logic [7:0] in3,
  output logic [7:0] out01,
  output logic [7:0] out23,
  output logic [7:0] out
);

  //----------------------------------------------------------------------
  // stage 0
  //----------------------------------------------------------------------

  logic [7:0] in0_X0;
  logic [7:0] in1_X0;
  logic [7:0] in2_X0;
  logic [7:0] in3_X0;

  always @( posedge clk ) begin
    in0_X0 <= in0;
    in1_X0 <= in1;
    in2_X0 <= in2;
    in3_X0 <= in3;
  end

  logic [7:0] sum01_X0;
  logic [7:0] sum23_X0;

  assign sum01_X0 = in0_X0 + in1_X0;
  assign sum23_X0 = in2_X0 + in3_X0;

  assign out01 = sum01_X0;
  assign out23 = sum23_X0;

  //----------------------------------------------------------------------
  // stage 1
  //----------------------------------------------------------------------

  logic [7:0] sum01_X1;
  logic [7:0] sum23_X1;

  always @( posedge clk ) begin
    sum01_X1 <= sum01_X0;
    sum23_X1 <= sum23_X0;
  end

  assign out = sum01_X1 + sum23_X1;

endmodule

