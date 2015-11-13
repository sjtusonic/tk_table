proc Widget_Attributes {w {out stdout}} {
   puts $out [format "-20s %-10s %s" Attribute Default Value]
   foreach item_list [$w configure] {
      foreach i $item_list {
         puts -nonewline $out [format "%-20s" $i] 
      }
      puts ""
      #puts $out [format "%-20s %-10s %s" \
      #[lindex $item 0] \
      #[lindex $item 3] \
      #[lindex $item 4]]  
   }
}
