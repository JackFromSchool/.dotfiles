mov() {
   pick=$(find ~/Downloads/* -type f | fzf)
   mv $pick ./$(basename "$pick") 
}
