//========================================================================
// Prob04p13_comb_bool_nl_lights_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  dark,
  input  movement,
  input  force_on,
  output turn_on_lights
);

 assign turn_on_lights = (dark & movement) | force_on;

endmodule

