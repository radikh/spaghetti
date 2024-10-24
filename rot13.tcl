#!/usr/bin/tclsh
set input [gets stdin]
set input [split $input ""]
set shift 13
set output ""

foreach char $input {
    puts $char
    set ascii [scan $char %c]
    puts $ascii
    if {$ascii >= 65 && $ascii <= 90} {
        set ascii [expr ($ascii - 65 + $shift) % 26 + 65]
    } elseif {$ascii >= 97 && $ascii <= 122} {
        set ascii [expr ($ascii - 97 + $shift) % 26 + 97]
    }

    set char [format %c $ascii]

    append output $char
}

puts $output