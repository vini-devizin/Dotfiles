set -U fish_greeting " "
if status is-interactive
    # Commands to run in interactive sessions can go here
end

function rm
	command rm -i $argv
end

function mkdir
	command mkdir -p $argv
end

starship init fish | source

if not set -q TMUX
	clear
	fastfetch
end
