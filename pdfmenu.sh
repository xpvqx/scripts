#!/usr/bin/env bash
IFS=$'\n'
declare -a pdfs
pdfs=($(du -a ~/docs/hv_local/Literatur | grep ".pdf" | cut -f2-)) 

choice=$(printf "%s\n" "${pdfs[@]##*/}" | \
    dmenu -l 20 \
    -nb "#282828" -nf "#ebdbb2" \
    -sb "#8dbf7c" -sf "#282828" \
    -fn "monospace:size=10" \
    -p "pdf: " -i)

if [[ ! -z $choice ]]; then
	for i in "${!pdfs[@]}" ; do
		if [[ $choice == "${pdfs[$i]##*/}" ]] ; then
			_bookType="${pdfs[$i]%/*}"
			zathura "${pdfs[$i]}" &
			break
		fi
	done
fi
