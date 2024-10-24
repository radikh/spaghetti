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
    if {$a >= 65 && $a <= 90} {
        set a [expr ($a - 65 + $s) % 26 + 65]
    } elseif {$a >= 97 && $a <= 122} {
        set a [expr ($a - 97 + $s) % 26 + 97]
    } elseif {$a >= 48 && $a <= 57} {
        set a [expr ($a - 48 + $s) % 10 + 48]
    } elseif {$a >= 33 && $a <= 47} {
        set a [expr ($a - 33 + $s) % 15 + 33]
    } elseif {$a >= 58 && $a <= 64} {
        set a [expr ($a - 58 + $s) % 7 + 58]
    } elseif {$a >= 91 && $a <= 96} {
        set a [expr ($a - 91 + $s) % 6 + 91]
    } elseif {$a >= 123 && $a <= 126} {
        set a [expr ($a - 123 + $s) % 4 + 123]
    }

    set char [format %c $a]

    append output $char
}

puts $output