texas() {
   pdf_files=(*.pdf(N))
   if [[ ${#pdf_files[@]} -eq 0 ]]; then
      echo "Use in a directory with a .tex file."
   else
      latexmk -pdf -pvc &
      zathura *.pdf([1]) &
      zathura_pid=$!
      fg %latexmk
      kill -9 "$zathura_pid" 2>/dev/null
   fi
}
