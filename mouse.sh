#!/usr/local/bin/bash

getCoordinates () {
  str=$1 
  read -rsn1 key
  [[ $key != m ]] &&
  [[ $key != M ]] &&
  str+=$key &&
  getCoordinates $str ||
  x=$(( $(echo $str | cut -d ';' -f 1) - 1 ))
  y=$(( $(echo $str | cut -d ';' -f 2) - 1 ))
  tput cup $y $x && printf ' '
}

printf "\x1b[?1000;1006;1016h"
echo "mouse reporting enabled. press 'q' to quit."
tput setab 4 && tput civis

while true; do
  read -rsn1 key
  case $key in
    'q')
      reset && echo "quit" && exit 0
    ;;
    '[')
      read -rsn3 key
      if [[ $key == "<0;" ]]; then
        read -rsn 3 key
        getCoordinates $key
      fi
    ;;
  esac
done
