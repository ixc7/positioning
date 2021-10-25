#!/usr/local/bin/bash

function arrowKeys () {
  rate=1
  esc=$(printf "\x1b")
  cup=$(printf "${esc}[${rate}")

  while true; do
    read -rsn1 key

    if [[ $key == $esc ]]; then
      read -rsn2 key
    fi

    case $key in
      '[A')
        printf "${cup}A"
      ;;
      '[B')
        printf "${cup}B"
      ;;
      '[C')
        printf "${cup}C"
      ;;
      '[D')
        printf "${cup}D"
      ;;
      'q')
        reset && exit 0
      ;;
      *)
        printf "${esc}[2K"
      ;;
    esac
  done
}
