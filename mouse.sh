#!/usr/local/bin/bash

getCoordinates () {
  str=$1 
  read -rsn1 key
  [[ $key != m ]] &&
  [[ $key != M ]] &&
  str+=$key &&
  getCoordinates $str ||
  echo "$str $key" | tr ';' ' '
}

printf "\x1b[?1000;1006;1016h"
echo "mouse reporting enabled. press 'q' to quit."

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
