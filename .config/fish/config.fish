set -U fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
    oh-my-posh init fish --config "~/.config/ohmyposh.json" | source
end
