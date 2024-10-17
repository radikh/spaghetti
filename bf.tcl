#!/usr/bin/tclsh
set code [gets stdin]

set mem [lrepeat 30000 0]

set dp 0
set ip 0

set code [split $code ""]
set skip 0
set stack {}

for {set i 0} {$i < [llength $code]} {incr i} {
    set data [lindex $mem $dp]
    set cmd [lindex $code $i]

    switch $cmd {
        "+" {lset mem $dp [incr data]}
        "-" {lset mem $dp [incr data -1]}
        ">" {incr dp}
        "<" {incr dp -1}
        "." {puts [format "%c" $data]} 
        "\[" { 
            if {$data == 0} {
                set skip 1
            } else {
                lappend stack $i
            }
        }
        "\]" {
            if {$data == 0} {
                set skip 0
            } else {
                set i [lindex $stack end]
            }
        }
        default {error "unknown symbol $i"}
    
    }
}