// This file is distributed under the terms of the MIT license, (c) the KSLib team

@lazyglobal off.

function rising_input_init {
 parameter
  controls, //ship:control
  input_gap.
  
 local lex is lexicon().
 
 lex:add("controls",controls).
 lex:add("input_gap",input_gap).
 lex:add("last_input",0).
 lex:add("shift",false).
 lex:add("ctrl",false).
 lex:add("q",false).
 lex:add("w",false).
 lex:add("e",false).
 lex:add("a",false).
 lex:add("s",false).
 lex:add("d",false).
 lex:add("h",false).
 lex:add("n",false).
 lex:add("i",false).
 lex:add("j",false).
 lex:add("k",false).
 lex:add("l",false).
 
 
 return lex.
}.

function rising_input_check {
 parameter
  control_map, //whatever you set to rising_input_init
  controls_to_check. //list("shift", "ctrl", "q", "w", "e", "a", "s", "d", "h", "n", "i", "j", "k", "l")
 
 local active_controls is list().
 
 if controls_to_check:contains("shift") {
  if not (control_map["shift"]) and (control_map["controls"]:pilotmainthrottle > 0.5) {
   active_controls:add("shift").
   set control_map["shift"] to true.
  } else if (control_map["shift"]) and (time - control_map["last_input"] > control_map["input_gap"]) {
   set control_map["controls"]:pilotmainthrottle to 0.5.
   set control_map["shift"] to false.
  }
 }
 
 if controls_to_check:contains("ctrl") {
  if not (control_map["ctrl"]) and (control_map["controls"]:pilotmainthrottle < 0.5) {
   active_controls:add("ctrl").
   set control_map["ctrl"] to true.
  } else if (control_map["ctrl"]) and (time - control_map["last_input"] > control_map["input_gap"]) {
   set control_map["controls"]:pilotmainthrottle to 0.5.
   set control_map["ctrl"] to false.
  }
 }
 
 if controls_to_check:contains("q"){
  if not (control_map["q"]) and (control_map["controls"]:pilotroll < 0) {
   active_controls:add("q").
   set control_map["q"] to true.
  } else if (control_map["q"]) and ((time - control_map["last_input"] > control_map["input_gap"]) or not (control_map["controls"]:pilotroll < 0)) {
   set control_map["q"] to false.
  }
 }

 if controls_to_check:contains("w"){
  if not (control_map["w"]) and (control_map["controls"]:pilotpitch < 0) {
   active_controls:add("w").
   set control_map["w"] to true.
  } else if (control_map["w"]) and ((time - control_map["last_input"]) > (control_map["input_gap"]) or not (control_map["controls"]:pilotpitch < 0)) {
   set control_map["w"] to false.
  }
 }
 
 if controls_to_check:contains("e") {
  if not (control_map["e"]) and (control_map["controls"]:pilotroll > 0) {
   active_controls:add("e").
   set control_map["e"] to true.
  } else if (control_map["e"]) and ((time - control_map["last_input"] > control_map["input_gap"]) or not (control_map["controls"]:pilotroll > 0)) {
   set control_map["e"] to false.
  }
 }
 
 if controls_to_check:contains("a") {
  if not (control_map["a"]) and (control_map["controls"]:pilotyaw < 0) {
   active_controls:add("a").
   set control_map["a"] to true.
  } else if (control_map["a"]) and ((time - control_map["last_input"] > control_map["input_gap"]) or not (control_map["controls"]:pilotyaw < 0)) {
   set control_map["a"] to false.
  }
 }
 
 if controls_to_check:contains("s") {
  if not (control_map["s"]) and (control_map["controls"]:pilotpitch > 0) {
   active_controls:add("s").
   set control_map["s"] to true.
  } else if (control_map["s"]) and ((time - control_map["last_input"] > control_map["input_gap"]) or not (control_map["controls"]:pilotpitch > 0)) {
   set control_map["s"] to false.
  }
 }
 
 if controls_to_check:contains("d") {
  if not (control_map["d"]) and (control_map["controls"]:pilotyaw) > 0 {
   active_controls:add("d").
   set control_map["d"] to true.
  } else if (control_map["d"]) and ((time - control_map["last_input"] > control_map["input_gap"]) or not (control_map["controls"]:pilotyaw > 0)) {
   set control_map["d"] to false.
  }
 }
 
 if controls_to_check:contains("h") {
  if not (control_map["h"]) and (control_map["controls"]:pilotfore > 0) {
   active_controls:add("h").
   set control_map["h"] to true.
  } else if (control_map["h"]) and ((time - control_map["last_input"] > control_map["input_gap"]) or not (control_map["controls"]:pilotfore > 0)) {
   set control_map["h"] to false.
  }
 }

 if controls_to_check:contains("n") {
  if not (control_map["n"]) and (control_map["controls"]:pilotfore < 0) {
   active_controls:add("n").
   set control_map["n"] to true.
  } else if (control_map["n"]) and ((time - control_map["last_input"] > control_map["input_gap"]) or not (control_map["controls"]:pilotfore < 0)) {
   set control_map["n"] to false.
  }
 }
 
 if controls_to_check:contains("i"){
  if not (control_map["i"]) and (control_map["controls"]:pilottop < 0) {
   active_controls:add("i").
   set control_map["i"] to true.
  } else if (control_map["i"]) and ((time - control_map["last_input"] > control_map["input_gap"]) or not (control_map["controls"]:pilottop < 0)) {
   set control_map["i"] to false.
  }
 }
 
 if controls_to_check:contains("j"){
  if not (control_map["j"]) and (control_map["controls"]:pilotstarboard < 0) {
   active_controls:add("j").
   set control_map["j"] to true.
  } else if (control_map["j"]) and ((time - control_map["last_input"] > control_map["input_gap"]) or not (control_map["controls"]:pilotstarboard < 0)) {
   set control_map["j"] to false.
  }
 }
  
 if controls_to_check:contains("k"){
  if not (control_map["k"]) and (control_map["controls"]:pilottop > 0) {
   active_controls:add("k").
   set control_map["k"] to true.
  } else if (control_map["k"]) and ((time - control_map["last_input"] > control_map["input_gap"]) or not (control_map["controls"]:pilottop > 0)) {
   set control_map["k"] to false.
  }
 }
  
 if controls_to_check:contains("l"){
  if not (control_map["l"]) and (control_map["controls"]:pilotstarboard > 0) {
   active_controls:add("l").
   set control_map["l"] to true.
  } else if (control_map["l"]) and ((time - control_map["last_input"] > control_map["input_gap"]) or not (control_map["controls"]:pilotstarboard > 0) ){
   set control_map["l"] to false.
  }
 }
 
 if not active_controls:empty {
  set control_map["last_input"] to time.
 }
 
 return active_controls.
}
