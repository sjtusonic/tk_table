namespace import ::msgcat::mc
proc positionWindow w {
wm geometry $w +300+300
}

set widgetDemo 1
set font mainFont
image create photo ::img::refresh -format GIF -data {
    R0lGODlhEAAQAJEDAP///wAAACpnKv///yH5BAEAAAMALAAAAAAQABAAAAI63IKp
    xgcPH2ouwgBCw1HIxHCQ4F3hSJKmwZXqWrmWxj7lKJ2dndcon9EBUq+gz3brVXAR
    2tICU0gXBQA7
}

image create photo ::img::view -format GIF -data {
    R0lGODlhEAAQAKIHAP///wwMDAAAAMDAwNnZ2SYmJmZmZv///yH5BAEAAAcALAAA
    AAAQABAAAANMKLos90+ASamDRxJCgw9YVnlDOXiQBgRDBRgHKE6sW8QR3doPKK27
    yg33q/GIOhdg6OsEJzeZykiBSUcs06e56Xx6np8ScIkFGuhQAgA7
}

image create photo ::img::delete -format GIF -data {
    R0lGODlhEAAQAIABAIQAAP///yH5BAEAAAEALAAAAAAQABAAAAIjjI+pmwAc3HGy
    PUSvqYpuvWQg40FfSVacBa5nN6JYDI3mzRQAOw==
}

image create photo ::img::print -format GIF -data {
    R0lGODlhEAAQALMKAAAAAP///52VunNkl8C82Yl+qldBgq+pyrOzs1fYAP///wAA
    AAAAAAAAAAAAAAAAACH5BAEAAAoALAAAAAAQABAAAARGUMlJKwU4AztB+ODGeUiJ
    fGLlgeEYmGWQXmx7aXgmAUTv/74N4EAsGhOJg1DAbDqbwoJ0Sp0KB9isNis0eL/g
    ryhH5pgnEQA7
}

proc addSeeDismiss {w show {vars {}} {extra {}}} {
    ## See Code / Dismiss buttons
    ttk::frame $w
    ttk::separator $w.sep
    #ttk::frame $w.sep -height 2 -relief sunken
    grid $w.sep -columnspan 4 -row 0 -sticky ew -pady 2
    ttk::button $w.dismiss -text [mc "Dismiss"] \
	-image ::img::delete -compound left \
	-command [list destroy [winfo toplevel $w]]
    ttk::button $w.code -text [mc "See Code"] \
	-image ::img::view -compound left \
	-command [list showCode $show]
    set buttons [list x $w.code $w.dismiss]
    if {[llength $vars]} {
	ttk::button $w.vars -text [mc "See Variables"] \
	    -image ::img::view -compound left \
	    -command [concat [list showVars $w.dialog] $vars]
	set buttons [linsert $buttons 1 $w.vars]
    }
    if {$extra ne ""} {
	set buttons [linsert $buttons 1 [uplevel 1 $extra]]
    }
    grid {*}$buttons -padx 4 -pady 4
    grid columnconfigure $w 0 -weight 1
    if {[tk windowingsystem] eq "aqua"} {
	foreach b [lrange $buttons 1 end] {$b configure -takefocus 0}
	grid configure $w.sep -pady 0
	grid configure {*}$buttons -pady {10 12}
	grid configure [lindex $buttons 1] -padx {16 4}
	grid configure [lindex $buttons end] -padx {4 18}
    }
    return $w
}
