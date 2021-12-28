#!/bin/bash

rofi -show run -modi run -width 100 \
		 -lines 2 -line-margin 0 -line-padding 1 \
		 -separator-style none -font "JetBrainsMono Nerd Font Mono 16" -columns 9 -bw 0 \
		 -disable-history \
		 -hide-scrollbar \
		 -kb-row-select "Tab" -kb-row-tab "" \
     -show-icons \
     -icon-theme "Papirus" \
     -theme "gruvbox-dark-hard"
