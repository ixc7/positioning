#!/usr/local/bin/bash

# TODO increment util
#      random spawn pos
#      multiple boxes in row
#      color picker (fg and bg)
#      tput setab

trap cleanup SIGINT

function cleanup () {
  tput cnorm
  tput sgr0
  exit 0
}

function fgcolors () {
  cur=255
  # cols=0
  # w=18

  tput civis

  while [ $cur -gt -1 ]
  do
    tput setaf $cur
    cur=$(( $cur - 1 ))

    # cols=$(( $cols + 1 ))

    # [[ $cols -ge $w ]] &&
      # cols=0
      # printf "\n"

    printf "
      ☠ ☠ ☠ ☠ ☠ ☠ ☠ ☠ ☠ 
      ☠               ☠
      ☠               ☠
      ☠       ☠       ☠
      ☠               ☠
      ☠               ☠
      ☠ ☠ ☠ ☠ ☠ ☠ ☠ ☠ ☠ 
    "

    sleep 0.05
  done
}


[[ ! -z $1 ]] &&
fgcolors | "${@}" ||
fgcolors
cleanup
