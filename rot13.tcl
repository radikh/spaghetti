#!/usr/bin/tclsh

set file [lindex $argv 0]

set input ""

set fp [open $file r]

set data ""
while { [gets $fp data] >= 0 } {
    append input $data
    append input "\n"
}

close $fp

set input [split $input ""]
set s 13
set output ""

foreach char $input {
    set a [scan $char %c]
    if {$a > 33 && $a < 127} {
        set a [expr {($a + 47 - 33) % 94 + 33}]
    }

    set char [format %c $a]

    append output $char
}

puts $output