// This file is distributed under the terms of the MIT license, (c) the KSLib team

run once lib_rising_input.

set lex to rising_input_init(ship:control, 0.5).

set controls_to_check to list(
// "shift",                    //shift and ctrl are handled differently and are a bit buggy at the moment
// "ctrl", 
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


set step to 0.

clearscreen.

print "Type 'end' to exit" at(30,0).

until step >= 3 {
 set active to rising_input_check(lex, controls_to_check).
 if not active:empty{
  print active.
  print "Type 'end' to exit" at(30,0).
  print ship:liquidfuel.
 }
 if step = 0 and active:contains("e") {
  set step to 1.
 } else if step = 1 and active:contains("n") {
  set step to 2.
 } else if step = 2 and active:contains("d") {
  set step to 3.
 } else if not active:empty {
  set step to 0.
 } 
}
