#!/usr/local/bin/bash

printf "\x1b[?1000;1006;1016h"
echo "mouse reporting enabled. press 'q' to quit."

while true; do
  read -rsn12 key
  case $key in
    'q')
      reset && echo "done" && exit 0
    ;;
    *)
      echo "$key"
    ;;
  esac
done
