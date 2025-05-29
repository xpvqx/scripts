#!/usr/bin/env bash
IFS=$'\n'
declare -a pdfs
pdfs=($(du -a ~/docs/literature | grep ".pdf" | cut -f2-)) 

choice=$(printf "%s\n" "${pdfs[@]##*/}" | \
	dmenu -l 20 \
    -nb "#282828" -nf "#ebdbb2" \
    -sb "#458588" -sf "#282828" \
    -fn "monospace:size=10" \
    -p "pdf: " -i)

if [[ ! -z $choice ]]; then
	for i in "${!pdfs[@]}" ; do
		if [[ $choice == "${pdfs[$i]##*/}" ]] ; then
			_bookType="${pdfs[$i]%/*}"
            # uncomment these lines if libnotify is installed
			# notify-send "$(echo -e "${_bookType##*/}\n" \
            #     | tr '[:lower:]' '[:upper:]')" "$choice" \
			# 	-i "$(echo "${PWD}/pdf.png")"
			zathura "${pdfs[$i]}" &
			break
		fi
	done
fi
