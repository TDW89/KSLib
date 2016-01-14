// This file is distributed under the terms of the MIT license, (c) the KSLib team

run once lib_rising_input.

set lex to rising_input_init(ship:control, 0.5).

set controls_to_check to list(
 "shift",
 "ctrl",
 "q",
 "w",
 "e",
 "a",
 "s",
 "d",
 "h",
 "n",
 "i",
 "j",
 "k",
 "l"
 ).


until false {
 set active to rising_input_check(lex, controls_to_check).
 if not active:empty{
  print active.
 }
}
