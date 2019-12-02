
# Tcl >= 8.4: Extend the auto_path to include critcl
if {![package vsatisfies [package provide Tcl] 8.4]} {return}
if {[lsearch -exact $::auto_path $dir] == -1} {
    lappend ::auto_path $dir
}

