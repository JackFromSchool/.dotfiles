function template() {
   chosen_template=$(find ~/Projects/templates/* -type f | fzf )
   cp $chosen_template ./$(basename "$chosen_template")
}
