mux() {
   tmux_sessions=$(tmux ls)
   if [[ "$tmux_sessions" == "failed to connect to server: No such file or directory" ]]; then
      echo "No active sessions."
   else
      chosen_session=$(echo "$tmux_sessions" | fzf)
      name=$(echo "$chosen_session" | rg --pcre2 -o -m 1 "([\w\W\b]+)(?=:\B)")
      tmux a -t "$name"
   fi
}
