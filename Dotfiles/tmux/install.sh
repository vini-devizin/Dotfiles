#!/bin/bash

if command -v git &> /dev/null; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
	echo "Git não encontrado..."
