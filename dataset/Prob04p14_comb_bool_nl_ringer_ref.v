//========================================================================
// Prob04p14_comb_bool_nl_ringer_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  vibrate_mode,
  input  ring,
  output turn_on_ringer,
  output turn_on_motor
);

  assign turn_on_ringer = ~vibrate_mode & ring;
  assign turn_on_motor  =  vibrate_mode & ring;

endmodule

