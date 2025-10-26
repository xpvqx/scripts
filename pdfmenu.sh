#!/usr/bin/env bash
IFS=$'\n'
declare -a pdfs
pdfs=($(du -a /home/karl/docs/nextcloud/hv/Literatur Literatur | grep ".pdf" | cut -f2-)) 

choice=$(printf "%s\n" "${pdfs[@]##*/}" | \
    dmenu -l 20 \
    -nb "#222222" -nf "#bbbbbb" \
    -sb "#444444" -sf "#ffffff" \
    -fn "terminus:size=12" \
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
