//========================================================================
// Prob19p08_seq_pipe_minmax4_2stage_ref
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
  output logic [7:0] min,
  output logic [7:0] max
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

  logic [7:0] min01_X0;
  logic [7:0] max01_X0;

  assign min01_X0 = ( in0_X0 < in1_X0 ) ? in0_X0 : in1_X0;
  assign max01_X0 = ( in0_X0 > in1_X0 ) ? in0_X0 : in1_X0;

  logic [7:0] min23_X0;
  logic [7:0] max23_X0;

  assign min23_X0 = ( in2_X0 < in3_X0 ) ? in2_X0 : in3_X0;
  assign max23_X0 = ( in2_X0 > in3_X0 ) ? in2_X0 : in3_X0;

  //----------------------------------------------------------------------
  // stage 1
  //----------------------------------------------------------------------

  logic [7:0] min01_X1;
  logic [7:0] max01_X1;
  logic [7:0] min23_X1;
  logic [7:0] max23_X1;

  always @( posedge clk ) begin
    min01_X1 <= min01_X0;
    max01_X1 <= max01_X0;
    min23_X1 <= min23_X0;
    max23_X1 <= max23_X0;
  end

  assign min = ( min01_X1 < min23_X1 ) ? min01_X1 : min23_X1;
  assign max = ( max01_X1 > max23_X1 ) ? max01_X1 : max23_X1;

endmodule

