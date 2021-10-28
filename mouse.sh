#!/usr/local/bin/bash

source utils.sh

getCoordinates () {
  str=$1 
  read -rsn1 key

  [[ $key != m ]] &&
  [[ $key != M ]] &&
  str+=$key &&
  getCoordinates $str ||

  x=$(( $(echo $str | cut -d ';' -f 1) - 1 ))
  y=$(( $(echo $str | cut -d ';' -f 2) - 1 ))

  [[ $key == M ]] && 
    tput setab 4 ||
    tput setab 6
    
  tput cup $y $x && printf ' '
}

printf "\x1b[?1000;1006;1016h"
# echo "mouse reporting enabled. press 'q' to quit."
header "mouse reporting enabled. press 'q' to quit."
tput civis

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
