//========================================================================
// Prob04p15_comb_bool_nl_thermostat_ref
//========================================================================
// SPDX-License-Identifier: MIT
// Author : Christopher Batten, NVIDIA
// Date   : May 20, 2024

module RefModule
(
  input  mode,
  input  too_cold,
  input  too_hot,
  input  fan_on,
  output heater,
  output aircon,
  output fan
);

  assign heater =  mode & too_cold;
  assign aircon = ~mode & too_hot;
  assign fan    = heater | aircon | fan_on;

endmodule

