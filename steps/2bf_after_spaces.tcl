#!/usr/bin/tclsh

set code [gets stdin]
set code [split $code ""]
set dp 0
set ip 0
set mem [lrepeat 30000 0]
lappend stack 0
for {set ip 0} {$ip < [string length $code]} {incr ip} {
set data [lindex $mem $dp]
set cmd [lindex $code $ip]
switch $cmd {
"+" {lset mem $dp [expr ($data + 1)%256]}
"-" {lset mem $dp [expr ($data - 1)%256]}
">" {incr dp}
"<" {incr dp -1}
"." {puts -nonewline [format %c $data]}
"[" {
if {$data == 0} {
set ignore 1
while {$ignore} {
incr ip
set c [string index $code $ip]
if {[string equal $c {[} ]} {
incr ignore
} elseif {[string equal $c {]}]} {
incr ignore -1
}
}
} else {
lappend stack [expr $ip - 1]
}
}
"]" {
if {$data} {
set ip [lindex $stack end]
}
set stack [lrange $stack 0 end-1]
}
default {}
}
}