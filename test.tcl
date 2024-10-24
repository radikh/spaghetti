#!/usr/bin/tclsh
puts "=============== Running test.tcl ==============="
set code {+[[->]-[-<]>-]>.>>>>.<<<<-.>>-.>.<<.>>>>-.<<<<<++.>>++.}
set result [exec tclsh final.tcl << $code]

puts "Result:"

puts $result

puts "=============== Done ===============\n\n"

