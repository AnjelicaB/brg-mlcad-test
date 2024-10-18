//========================================================================
// Prob07p17_comb_arith_4x8b_sorter_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024
// Implement a bitonic sorting network.
//
//         Stage S0      Stage S1    Stage S2
//         .-----.       .-----.
//  in0 -->| min |------>| min |--------------> out0
//  in1 -->| max |-.   .>| max |-.   .-----.
//         '-----'  \ /  '-----'  '->| min |--> out1
//                   X               |     |
//         .-----.  / \  .-----.  .->| max |--> out2
//  in2 -->| min |-'   '>| min |-'   '-----'
//  in3 -->| max |------>| max |--------------> out3
//         '-----'       '-----'

module RefModule
(
  input  logic [7:0] in0,
  input  logic [7:0] in1,
  input  logic [7:0] in2,
  input  logic [7:0] in3,
  output logic [7:0] out0,
  output logic [7:0] out1,
  output logic [7:0] out2,
  output logic [7:0] out3
);

  // Stage S0

  logic [7:0] min01;
  logic [7:0] max01;

  assign min01 = (in0 < in1) ? in0 : in1;
  assign max01 = (in0 < in1) ? in1 : in0;

  logic [7:0] min23;
  logic [7:0] max23;

  assign min23 = (in2 < in3) ? in2 : in3;
  assign max23 = (in2 < in3) ? in3 : in2;

  // Stage S1

  logic [7:0] min0123;
  logic [7:0] mid_top;

  assign min0123 = (min01 < min23) ? min01 : min23;
  assign mid_top = (min01 < min23) ? min23 : min01;

  logic [7:0] mid_bot;
  logic [7:0] max0123;

  assign mid_bot = (max01 < max23) ? max01 : max23;
  assign max0123 = (max01 < max23) ? max23 : max01;

  // Stage S2

  assign out0 = min0123;

  assign out1 = (mid_top < mid_bot) ? mid_top : mid_bot;
  assign out2 = (mid_top < mid_bot) ? mid_bot : mid_top;

  assign out3 = max0123;

endmodule
