#!/usr/bin/tclsh
set t set
$t q string
$t r incr
$t x index # pay attention this also works with $lindex making me call l$t in code
$t b "\$q equal \$c" 

$t d [gets stdin];$t d [split $d ""];$t l 0; $t h 0; $t m [lrepeat 30000 0];lappend k 0; for {$t h 0} {$h < [$q length $d]} {$r h} {$t y [l$x $m $l];$t v [l$x $d $h];switch $v {"+" {l$t m $l [expr ($y + 1)%256]} "-" {l$t m $l [expr ($y - 1)%256]} ">" {$r l} "<" {$r l -1} "." {puts -nonewline [format %c $y]} "[" {if {$y == 0} {$t g 1; while {$g} {$r h; $t c [$q $x $d $h];if {[$b{[} ]} {$r g} elseif {[$b{]}]} {$r g -1}}} else {lappend k [expr $h - 1];}} "]" {if {$y} {$t h [l$x $k end];}; $t k [lrange $k 0 end-1];} default {}}}