#!/usr/bin/tclsh
puts "=============== Running test.tcl ==============="
set code ""

set fp [open "./bf.tcl" r]

set data ""
while { [gets $fp data] >= 0 } {
    append code $data
    append code "\n"
}

close $fp

puts $code

puts [exec ./rot13.tcl < $code > result.txt]